program Project2020_p;

uses
  Vcl.Forms,
  Project2020_u in 'Project2020_u.pas' {FrmWhosApp};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmWhosApp, FrmWhosApp);
  Application.Run;
end.
