unit FileEditNotefrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFileEditNote = class(TForm)
    Label1: TLabel;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private

  public

  end;


  function ShowFileEditNote(AFileName:String;var ANote:String):Boolean;

implementation

{$R *.dfm}

  function ShowFileEditNote(AFileName:String;var ANote:String):Boolean;
  begin
    with TFileEditNote.Create(nil) do
    try
      Memo1.Lines.Text := ANote;
      Result := ShowModal =mrOK;
      if Result then
        ANote := Memo1.Lines.Text;
    finally
      free;
    end;
  end;

end.
