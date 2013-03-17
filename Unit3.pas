unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Label2: TLabel;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

Const
probel:set of char = [' '];
big: set of char = ['�'..'�' , '�','�'..'�'];
BukvKir: set of char = ['�'..'�' , '�','�'..'�' ,'�'..'�' , '�' ];
small: set of char = ['�'..'�','�'];
BukvLat: set of char = ['A'..'Z','a'..'z'];


  Function Prov(const s: string): byte;
Var
  Nom: byte; // ����� ��������
  i,Len: word; // ������� ������ � ����� ������
Begin
  Nom:=0; len:= Length(S);
  If Len=0 then Nom:=1
  Else
    Begin
      i:=1;
      while (i<=Len) and (Nom=0) do
      begin
        if Not ((S[i] in Probel) or (S[i] in BukvKir) or (S[i] in BukvLat)) then Nom:=2;
        Inc(i);
      end;
    End;
  Prov:=Nom;
End;

  Procedure Sort(var s:string);
Var 
  i, z, len: Word;
  flag: Boolean;
  ch: char;
Begin
  len:=length(s);
  Z:=1;
  Repeat
    flag:=true;
    for i:=1 to (len-Z) do
      if (s[i] in probel) and ((s[i+1] in BukvKir) or (s[i+1] in BukvLat)) or
         ((s[i] in BukvLat) and (s[i+1] in BukvKir))  or
         (s[i] in small)  and (s[i+1]in big) and (s[i]='�') or
         (s[i] in small)  and (s[i+1]in big) and (ansiuppercase(s[i])=s[i+1]) or
         (s[i]in BukvKir) and (s[i+1] in BukvKir)  and ((s[i+1]='�') and (ansiuppercase(s[i])>'�') or
         (s[i]in BukvKir) and (s[i+1] in BukvKir)  and (ansiuppercase(s[i+1])<'�') and ((s[i]='�'))  or
         (s[i]in BukvKir) and (s[i+1] in BukvKir)  and (ansiuppercase(s[i+1])<ansiuppercase(s[i])) and (ansiuppercase(s[i+1])>'�'  )  or
         (s[i]in BukvKir) and (s[i+1] in BukvKir)  and (s[i+1]='�') and (ansiuppercase(s[i])>'�') or
         (s[i]in BukvKir) and (s[i+1] in BukvKir)  and  (s[i]='�') and (s[i+1]='�') or
         (s[i]in BukvKir) and (s[i+1] in BukvKir)  and (ansiuppercase(s[i+1])<'�') and ((s[i]='�'))  or
         (s[i]in BukvKir) and (s[i+1] in BukvKir)  and (ansiuppercase(s[i+1])<ansiuppercase(s[i])) and ((s[i+1])>'�') )


                       then
      begin
        ch:=s[i]; s[i]:=s[i+1]; s[i+1]:=ch; flag:= false;
          if (s[i]='�') and ( s[i+1]='�') then begin
  ch:=s[i];
          s[i]:=s[i+1];
          s[i+1]:=ch;
          end;

      end;
       INC(Z)
         Until flag;


End;

procedure TForm3.Button1Click(Sender: TObject);
var s: string; Nom: byte;
begin
  s:=Edit1.Text;  // ���� ������ S
  // ��������
  Nom:= Prov(s);
  Case Nom of
    1: Label2.Caption := '������ ������';
    2: Label2.Caption := '������������ �������';
    else
     begin // ����������
       Sort(s);
       Label2.Caption:='"'+s+'"';  // ����� ������ S
     end; {else}
  End;
  end; {case}





procedure TForm3.Button2Click(Sender: TObject);
begin
close;
end;
end.
