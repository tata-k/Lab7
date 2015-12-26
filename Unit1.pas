unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Registry;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject); //Добавление в реестр
var RegIni: TRegIniFile ;
begin
RegIni:=TRegIniFile.Create('Soft');
RegIni.WriteString('hello','Param',Edit1.Text);
//Если нет папки 'Software\Hello', то вывести 'Добавлено'
    Label1.Caption:=RegIni.ReadString('hello','Param','Добавлено');
RegIni.Free;
end;

procedure TForm1.Button2Click(Sender: TObject); //Удаление из реестра
var RegIni: TRegistry ;
begin
RegIni:=TRegistry.Create;
RegIni.RootKey:=HKEY_CURRENT_USER;
if RegIni.DeleteKey('Soft\hello') then
  label1.Caption:='удалено';
RegIni.Free;
end;

end.



