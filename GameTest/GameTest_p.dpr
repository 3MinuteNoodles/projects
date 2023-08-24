program GameTest_p;

uses
  Vcl.Forms,
  GameTest_u in 'GameTest_u.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
