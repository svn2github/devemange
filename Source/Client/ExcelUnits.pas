unit ExcelUnits;

interface
uses
  Graphics,Classes;

const
  glExcelColCount = 26 ; //列总数为26 不包括序号
  gcExcelVersion  = 1  ; //文件版本

type


  //单元格
  TExcelCell = Class
  public
    fColor    : TColor;
    fbgColor  : TColor;
    fText     : String;     //内容
    fAlignent : TAlignment; //水平方向
    fFont     : TFont;      //字体

    constructor Create;
    destructor Destroy; override;

    procedure Savetowriter(AWriter:TWriter);
    function  LoadfromReader(AReader:TReader;Aver:integer):Boolean;
  end;

  //行
  TExcelRow = Class
  public
    fHight  : integer;
    fCells  : array of TExcelCell;

    constructor Create;
    destructor Destroy; override;

    procedure Savetowriter(AWriter:TWriter);
    function  LoadfromReader(AReader:TReader;AVer:integer):Boolean;
  end;

  //列固定的26列,主要用于保存属性，
  TExcelCol = Class
  public
    fWidht : integer;

    constructor Create;
    destructor Destroy; override;

    procedure Savetowriter(AWriter:TWriter);
    function  LoadfromReader(AReader:TReader;AVer:integer):Boolean;
  end;

  TExcelFile = Class
  private
    fRows : TList;

    function GetCells(Col, Row: integer): TExcelCell;
    function GetColCount: integer;
    function GetRowCount: integer;

    procedure ClearRows;
    function getRows(Aindex:integer): TExcelRow;
  public
    fmodify : Boolean;
    fCols : array of TExcelCol;

    fFixedCols : integer;
    fFixedRow  : integer;

    constructor Create;
    destructor Destroy; override;

    procedure SaveToStream(AStream:TStream);
    function LoadfromStream(AStream:TStream):Boolean;

    procedure AddRow();
    procedure InsertRow(Aindex:integer);
    procedure MoveCol(ACurIndex,AnewIndex:integer); // 移动行

    property RowCount : integer read GetRowCount;
    property ColCount : integer read GetColCount;
    property Cells[Col:integer;Row:integer] : TExcelCell read GetCells;
    property Rows[Aindex:integer]: TExcelRow read getRows;

  end;

implementation

{ TCell }

constructor TExcelCell.Create;
begin
  fColor   := clBlack;
  fbgColor := clWhite;
  fFont := TFont.Create;
  fFont.Name := '宋体';
  fFont.Size := 12;
  fAlignent  := taLeftJustify;
end;

destructor TExcelCell.Destroy;
begin
  fFont.Free;
  inherited;
end;

{ TExcelCol }

constructor TExcelRow.Create;
var
  i : integer;
begin
  fHight := 21;
  Setlength(fCells,glExcelColCount);

  for i:=0 to glExcelColCount -1 do
    fCells[i] := TExcelCell.Create;
end;

destructor TExcelRow.Destroy;
var
  i : integer;
begin
  for i:=0 to glExcelColCount -1 do
    fCells[i].Free;
  SetLength(fCells,0);
  inherited;
end;

{ TExcelCol }

constructor TExcelCol.Create;
begin
  fWidht := 64;  
end;

destructor TExcelCol.Destroy;
begin

  inherited;
end;

function TExcelCol.LoadfromReader(AReader: TReader;
  AVer: integer): Boolean;
begin
  Result := False;
  fWidht := AReader.ReadInteger;
  Result := True;
end;

procedure TExcelCol.Savetowriter(AWriter: TWriter);
begin
  Awriter.writeinteger(fWidht);
end;

{ TExcelFile }

procedure TExcelFile.AddRow;
var
  myRow : TExcelRow;
begin
  myRow := TExcelRow.Create;
  fRows.Add(myRow);
end;

procedure TExcelFile.ClearRows;
var
  i : integer;
  myRow : TExcelRow;
begin
  for i:=0 to Self.fRows.Count -1 do
  begin
    myRow := fRows[i];
    myRow.Free;
  end;
  fRows.Clear;
end;

constructor TExcelFile.Create;
var
  i : integer;
  myRow : TExcelRow;
begin
  SetLength(fCols,glExcelColCount);
  for i :=0 to glExcelColCount -1 do
    fCols[i] := TExcelCol.Create;
  fFixedCols := 0;
  fFixedRow  := 0;
  fRows := TList.Create;
  fmodify := False;
  for i:=0 to 99 do
  begin
    myRow := TExcelRow.Create;
    fRows.Add(myRow);
  end;
end;

destructor TExcelFile.Destroy;
var
  i : integer;
begin
  for i :=0 to glExcelColCount -1 do
    fCols[i].Free;

  SetLength(fCols,0);
  ClearRows;
  fRows.Free;
  inherited;
end;

function TExcelFile.GetCells(Col, Row: integer): TExcelCell;
var
  myRow : TExcelRow;
begin
  Result := nil;
  if (Row >=0) and (Row<fRows.Count) and
     (Col >=0) and (Col<glExcelColCount) then
  begin
    myRow := fRows[Row];
    Result := myRow.fCells[Col];
  end;
end;

function TExcelFile.GetColCount: integer;
begin
  Result := glExcelColCount;
end;

function TExcelFile.GetRowCount: integer;
begin
  Result := fRows.Count;
end;

function TExcelFile.getRows(Aindex:integer): TExcelRow;
begin
  Result := nil;
  if (Aindex >=0) and (Aindex<fRows.Count) then
    Result := fRows[Aindex];
end;

procedure TExcelFile.InsertRow(Aindex: integer);
var
  myRow : TExcelRow;
begin
  if (Aindex >=0) and (AIndex < fRows.Count) then
  begin
    myRow := TExcelRow.Create;
    fRows.Insert(Aindex,myRow);
  end;
end;

function TExcelFile.LoadfromStream(AStream: TStream): Boolean;
var
  i,mycount : integer;
  myReader : TReader;
  myCol  : TExcelCol;
  myRow  : TExcelRow;
  myver : integer;
begin
  Result := False;
  myReader := TReader.Create(AStream,$ff);
  try
    myver := myReader.ReadInteger;

    fFixedCols := myReader.ReadInteger;
    fFixedRow  := myReader.ReadInteger;

    myCount := High(fCols);
    for i:=0 to mycount -1 do
    begin
      myCol := fCols[i];
      myCol.Free;
    end;

    mycount := myReader.ReadInteger;
    SetLength(fCols,mycount);
    for i:=0 to myCount -1 do
      fCols[i] := TExcelCol.Create;
    for i:=0 to myCount -1 do
    begin
      if not fCols[i].LoadfromReader(myReader,myver) then
        Exit;
    end;

    ClearRows;
    mycount := myReader.ReadInteger;
    for i:=0 to myCount -1 do
    begin
      myRow := TExcelRow.Create;
      if not myRow.LoadfromReader(myReader,myver) then
        Exit;
      fRows.Add(myRow);
    end;

  finally
    myReader.Free;
  end;
  Result := True;
end;

procedure TExcelFile.MoveCol(ACurIndex, AnewIndex: integer);
var
  i :integer;
  myRow : TExcelRow;
  myCell : TExcelCell;
begin
  if (ACurIndex >=0) and (ACurIndex <glExcelColCount) and
     (AnewIndex >=0) and (AnewIndex <glExcelColCount) and
     (AnewIndex <> ACurIndex) then
  begin
    for i:=0 to fRows.Count -1 do
    begin
      myRow := fRows[i];
      myCell := myRow.fCells[AnewIndex];
      myRow.fCells[AnewIndex] := myRow.fCells[ACurIndex];
      myRow.fCells[ACurIndex] := myCell;
    end;
  end;
end;

function TExcelCell.LoadfromReader(AReader: TReader;Aver:integer): Boolean;
var
  c : integer;
begin
  Result     := False;
  fColor     := AReader.ReadInteger;
  fbgColor   := AReader.ReadInteger;
  fText      := AReader.ReadString;
  fAlignent  := TAlignment(AReader.ReadInteger);
  fFont.Name := AReader.ReadString;
  fFont.Size := AReader.ReadInteger;

  c := AReader.ReadInteger;
  fFont.Style := [];
  if c and $1 = $1 then fFont.Style := fFont.Style + [fsBold];
  if c and $2 = $2 then fFont.Style := fFont.Style + [fsItalic];
  if c and $4 = $4 then fFont.Style := fFont.Style + [fsUnderline];
  if c and $8 = $8 then fFont.Style := fFont.Style + [fsStrikeOut];

  Result := True;
end;

procedure TExcelCell.Savetowriter(AWriter: TWriter);
var
  c : integer;
begin
  AWriter.writeinteger(fColor);
  AWriter.writeinteger(fbgColor);
  AWriter.WriteString(fText);
  AWriter.writeinteger(Ord(fAlignent));
  AWriter.WriteString(fFont.Name);
  AWriter.writeinteger(fFont.Size);

  c := $0;
  if fsBold in fFont.Style then
    c := c + $1;
   if fsItalic in fFont.Style then
    c := c + $2;
  if fsUnderline in fFont.Style then
    c := c + $4;
  if fsStrikeOut in fFont.Style then
    c := c + $8;
  AWriter.writeinteger(c);
end;

function TExcelRow.LoadfromReader(AReader: TReader;AVer:integer): Boolean;
var
  i : integer;
  mycount : integer;
  myCell : TExcelCell;
begin
  Result := False;
  fHight := AReader.ReadInteger;
  myCount := AReader.ReadInteger;

  for i:=0 to High(fCells) do
    fCells[i].Free;

  SetLength(fCells,myCount);
  for i:= 0 to myCount-1 do
  begin
    fCells[i] := TExcelCell.Create;
    if not fCells[i].LoadfromReader(AReader,Aver) then
      Exit;
  end;
  Result := True;
end;

procedure TExcelRow.Savetowriter(AWriter: TWriter);
var
  i : integer;
begin
  AWriter.writeinteger(fHight);

  AWriter.writeinteger(High(fCells)+1);
  for i:= 0 to High(fCells) do
  begin
    fCells[i].Savetowriter(AWriter);
  end;

end;

procedure TExcelFile.SaveToStream(AStream: TStream);
var
  i,mycount : integer;
  myWriter : TWriter;
  myRow  : TExcelRow;
begin
  myWriter := TWriter.Create(AStream,$ff);
  try
    myWriter.writeinteger(gcExcelVersion);

    myWriter.writeinteger(fFixedCols);
    myWriter.writeinteger(fFixedRow);

    mycount := High(fCols)+1;
    mywriter.writeinteger(mycount);
    for i:=0 to myCount -1 do
    begin
      fCols[i].Savetowriter(myWriter);
    end;

    mycount := fRows.Count;
    mywriter.writeinteger(mycount);
    for i:=0 to myCount -1 do
    begin
      myRow := fRows[i];
      myRow.Savetowriter(myWriter);
    end;

    myWriter.FlushBuffer;
  finally
    myWriter.Free;
  end;
end;

end.
