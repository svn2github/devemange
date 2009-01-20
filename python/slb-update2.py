#!/usr/bin/env python
#coding=utf-8


db_hostname = 'localhost'
db_username = 'sa'
db_password = '7895123'
db_database = 'BFSS'


######## CONFIGURATION ENDS HERE ########

print '开发管理系统 - 开始读取SVN服务器' 

import adodbapi as dbapi
import sys, pysvn, time
from string import Template

def get_login(realm,username,may_save):
    print username
    username = 'mrlong'
    password = 'mrlonga'
    retcode  =1
    save =1
    return retcode,username,password,save


def clear_null(value):
    if value is None: return ' '
    return value

def clear_nullbyint(value):
    if value is None: return 0
    return value


def get_changes(paths):
    """Converts pysvn.PysvnLog['changed_paths'] value to a compatible tuple for
       adding into the database."""

    changes = []
    for path in paths:
        copyfrom_rev = None
        if path['copyfrom_revision'] is not None:
            copyfrom_rev = path['copyfrom_revision'].number
        changes += [(path['action'], path['path'], path['copyfrom_path'], copyfrom_rev)]
    return changes

def insert_commit(db, cursor, guid, log):
    """Adds a pysvn.PysvnLog entry into the svnLogBrowser database."""
    
    revision = log['revision'].number
    date = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(log['date']))
    commit_table  = 'TB_SVN_COMMITS'
    changes_table = 'TB_SVN_CHANGES'
    changes = [(guid,revision, action, path, copy_path, copy_rev) for
               (action, path, copy_path, copy_rev) in get_changes(log['changed_paths'])]

    try:
        if log.has_key('author'):
            mysql = "INSERT INTO " + commit_table + " (ZSVN_GUID,ZVERSION,ZAUTHOR,ZDATE,ZMESSAGE) VALUES ('%s',%s, '%s', '%s', '%s')" % \
                    (guid,revision, clear_null(log['author']),date,unicode(clear_null(log['message']),'UTF-8')) 

        else:
            mysql = "INSERT INTO " + commit_table + " (ZSVN_GUID,ZVERSION,ZAUTHOR,ZDATE,ZMESSAGE) VALUES ('%s',%s, '%s', '%s', '%s')" % \
                    (guid,revision, '',date, unicode(clear_null(log['message']),'UTF-8'))
            print mysql
        cursor.execute(mysql)
    except:
        print 'commit error'
        db.rollback()
        return
    
    # If the above was added successfully, we'll add the changed paths now.
    
    try:
        #executemany
        for v in changes:

            mysql = "INSERT INTO " + changes_table + \
            " (ZSVN_GUID,ZVERSION, ZACTION, ZPATH, ZCOPY_PATH, ZCOPY_VERSION) VALUES ('%s',%s, '%s', '%s', '%s', %s)" % \
            (v[0],v[1],v[2],unicode(v[3],'UTF-8'), clear_null(v[4]),clear_nullbyint(v[5]))

            cursor.execute(mysql)
            #cursor.executemany("INSERT INTO " + changes_table + " (ZSVN_GUID,ZVERSION, ZACTION, ZPATH, ZCOPY_PATH, ZCOPY_VERSION) VALUES ('%s',%s, '%s', '%s', '%s', %s)", changes)
    except:
        print 'changes error'
        db.rollback()
        return
    
    db.commit()


# Connect to the database.
try:
    """
    db = pymssql.connect(host      = db_hostname,
                         user      = db_username,
                         password  = db_password,
                         database  = db_database)
    """

    db = dbapi.connect("Provider=SQLOLEDB.1;Persist Security Info=True;Password=%s;User ID=%s;Initial Catalog=%s;Data Source=%s" % \
                       (db_password,db_username,db_database,db_hostname))

    cursor = db.cursor()

    # Pull the configuration from the database.
    cursor.execute('SELECT ZGUID, ZNAME, ZSVN_LATEST_VERSION, ZSVN_URL FROM TB_ANT')
    changelogs = cursor.fetchall()

    if len(changelogs) < 1:
        print 'There are no changelogs setup, please run configuration first.'
        sys.exit(1)

except:
    print 'Error initializing database:'
    sys.exit(1)

# Startup our SVN client.
client = pysvn.Client()
client.exception_style = 1
client.callback_get_login = get_login

# Main changelog loop.
for cl in changelogs:
    (guid, name, latest_revision, svn_url) = cl

    if svn_url is None: continue
    if svn_url =='':continue

    print 'Changelog: %s' % name
    print 'Last Update: %d' % latest_revision
    try:
        entry = client.info2(svn_url, revision =
                             pysvn.Revision(pysvn.opt_revision_kind.head),
                             recurse = False)
    except pysvn.ClientError, (e_msg, e):
        for error_message, code in e:
            print 'Error: #%d - %s' % (code, error_message)
        continue

    if len(entry) < 1:
        print 'Error retrieving information from the SVN repository.'
        continue

    (root_path, svn_info) = entry[0]
    print 'Current Revision: %d' % svn_info['rev'].number


    
    if svn_info['rev'].number == latest_revision:
        print "No commits since last update, we're done here."
        continue

    # We split up the workload to only grab 100 revisions at a time.
    # This should be less stressful on the SVN server, and give us a way to
    # show the current progress.
    log_ranges = []
    latest_revision += 1
    while latest_revision + 99 < svn_info['rev'].number:
        log_ranges += [(latest_revision, latest_revision + 99)]
        latest_revision += 100
    log_ranges += [(latest_revision, svn_info['rev'].number)]

    for (start_rev, end_rev) in log_ranges:

        print 'Retrieving revisions %d through %d.' % (start_rev, end_rev)

        try:
            messages = client.log( svn_url,
                revision_start = pysvn.Revision(pysvn.opt_revision_kind.number, start_rev),
                revision_end = pysvn.Revision(pysvn.opt_revision_kind.number, end_rev),
                discover_changed_paths = True, strict_node_history = True, limit = 0 )
        except pysvn.ClientError, (e_msg, e):
            fatal_error = True
            for error_message, code in e:
                print 'Code:' , code , 'Message:' , error_message
                if code == 195012: fatal_error = False
            if not fatal_error:
                continue
            sys.exit(1)

        for log in messages:
            insert_commit(db, cursor, guid, log)

        cursor.execute("UPDATE TB_ANT SET ZSVN_LATEST_VERSION = %s WHERE ZGUID = '%s'" % (end_rev, guid))
        db.commit()
db.close()

