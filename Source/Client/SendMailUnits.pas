unit SendMailUnits;

interface
uses
  SysUtils, Classes;

  //
  // 目前只是用于OutLook
  //
  // 发送到邮件:
  // Mail.Values['to'] : 收件人的地址
  // Mail.Values['subject'] : 主题
  // Mail.Values['body'] : 内容
  // Mail.Values['attachment0'] : 附件
  // SendEmail(Application.Handle,mail);  发送的动作
  //
  function SendEmail(Handle: THandle; Mail: TStrings):   Cardinal;

implementation
uses
  Mapi; //邮件发送API;

function SendEmail(Handle: THandle; Mail: TStrings):   Cardinal;
type
  TAttachAccessArray   =   array   [0..0]   of   TMapiFileDesc;
  PAttachAccessArray   =   ^TAttachAccessArray;
var
  MapiMessage   :   TMapiMessage;
  Receip        :   TMapiRecipDesc;
  Attachments   :   PAttachAccessArray;
  AttachCount   :   Integer;
  iCount        :   Integer;
  FileName      :   string;
begin
  FillChar(MapiMessage,   SizeOf(MapiMessage),   #0);
  Attachments   :=   nil;
  FillChar(Receip,SizeOf(Receip),   #0);
  if Mail.Values['to'] <> '' then
  begin
    Receip.ulReserved   :=   0;
    Receip.ulRecipClass   :=   MAPI_TO;
    Receip.lpszName   :=   StrNew(PChar(Mail.Values['to']));
    Receip.lpszAddress   :=   StrNew(PChar('SMTP:'   +   Mail.Values['to']));
    Receip.ulEIDSize   :=   0;
    MapiMessage.nRecipCount   :=   1;
    MapiMessage.lpRecips   :=   @Receip;
  end;

  //附件处理
  AttachCount := 0;
  for iCount := 0 to MaxInt do
  begin
    if Mail.Values['attachment'+IntToStr(iCount)] = ''then
      Break;
    AttachCount := AttachCount+1;
  end;

  if AttachCount > 0 then
  begin
    GetMem(Attachments,SizeOf(TMapiFileDesc) * AttachCount);
    for iCount:=0 to (AttachCount -1) do
    begin
      FileName := Mail.Values['attachment'   +   IntToStr(iCount)];
      Attachments[iCount].ulReserved   :=   0;
      Attachments[iCount].flFlags      :=   0;
      Attachments[iCount].nPosition    :=   $FFFFFFFF;  //这个是什么?
      Attachments[iCount].lpszPathName :=   StrNew(PChar(FileName));
      Attachments[iCount].lpszFileName :=   StrNew(PChar(ExtractFileName(FileName)));      Attachments[iCount].lpFileType   :=   nil;
    end;
    MapiMessage.nFileCount   :=   AttachCount;
    MapiMessage.lpFiles   :=   @Attachments^;
  end;

  if Mail.Values['subject']<> '' then
     MapiMessage.lpszSubject   :=  StrNew(PChar(Mail.Values['subject']));
  if Mail.Values['body'] <> ''then
     MapiMessage.lpszNoteText := StrNew(PChar(Mail.Values['body']));
   Result := MapiSendMail(0,Handle,MapiMessage,
      MAPI_DIALOG*Ord(Handle   <>   0) OR MAPI_LOGON_UI OR MAPI_NEW_SESSION,0);

  for iCount:= 0 to (AttachCount - 1) do
  begin
    strDispose(Attachments[iCount].lpszPathName);
    strDispose(Attachments[iCount].lpszFileName);
  end;

  if Assigned(MapiMessage.lpszSubject) then
    strDispose(MapiMessage.lpszSubject);
  if  Assigned(MapiMessage.lpszNoteText) then
    strDispose(MapiMessage.lpszNoteText);
  if Assigned(Receip.lpszAddress) then
    strDispose(Receip.lpszAddress);
  if Assigned(Receip.lpszName) then
    strDispose(Receip.lpszName);
end;

end.
