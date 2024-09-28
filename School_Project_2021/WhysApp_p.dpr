program WhysApp_p;

uses
  Vcl.Forms,
  Login_u in 'Login_u.pas' {frmLogin},
  AdminHome_u in 'AdminHome_u.pas' {frmAdminHome},
  NormalHome_u in 'NormalHome_u.pas' {frmNormalHome},
  KeywordMatches_u in 'KeywordMatches_u.pas' {frmKeywordMatches},
  Users_u in 'Users_u.pas' {frmUsers},
  Keywords_u in 'Keywords_u.pas' {frmManageKeywords},
  dmdbWhysapp_u in 'dmdbWhysapp_u.pas' {dmdbWhysapp: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmAdminHome, frmAdminHome);
  Application.CreateForm(TfrmNormalHome, frmNormalHome);
  Application.CreateForm(TfrmKeywordMatches, frmKeywordMatches);
  Application.CreateForm(TfrmUsers, frmUsers);
  Application.CreateForm(TfrmManageKeywords, frmManageKeywords);
  Application.CreateForm(TdmdbWhysapp, dmdbWhysapp);
  Application.Run;
end.
