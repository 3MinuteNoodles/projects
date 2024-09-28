unit AdminHome_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls, dmdbWhysapp_u, KeywordMatches_u, Users_u, Keywords_u,
  Vcl.Buttons;

type
  TfrmAdminHome = class(TForm)
    pnlAdminTask: TPanel;
    lblSelectAdminTask: TLabel;
    btnViewMatches: TButton;
    btnManageUsers: TButton;
    btnEditKeywords: TButton;
    btnLogout: TButton;
    btnHelp: TBitBtn;
    redHelpAdminHome: TRichEdit;
    btnNotHelp: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnViewMatchesClick(Sender: TObject);
    procedure btnEditKeywordsClick(Sender: TObject);
    procedure btnManageUsersClick(Sender: TObject);
    procedure btnLogoutClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure btnNotHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdminHome: TfrmAdminHome;

implementation

{$R *.dfm}

Uses Login_u;

procedure TfrmAdminHome.btnEditKeywordsClick(Sender: TObject);
begin
  frmManageKeywords.show;
  frmAdminHome.hide;
end;

procedure TfrmAdminHome.btnHelpClick(Sender: TObject);
begin
  redHelpAdminHome.Enabled  := True;
  redHelpAdminHome.Visible  := True;
  btnNotHelp.Visible        := True;
  btnNotHelp.Enabled        := True;
  redHelpAdminHome.ReadOnly := True;
end;

procedure TfrmAdminHome.btnLogoutClick(Sender: TObject);
begin
  frmAdminHome.hide;
  frmLogin.show;
end;

procedure TfrmAdminHome.btnManageUsersClick(Sender: TObject);
begin
  frmUsers.show;
  frmAdminHome.hide;
end;

procedure TfrmAdminHome.btnNotHelpClick(Sender: TObject);
begin
  redHelpAdminHome.Enabled  := False;
  redHelpAdminHome.Visible  := False;
  btnNotHelp.Visible        := False;
  btnNotHelp.Enabled        := False;
end;

procedure TfrmAdminHome.btnViewMatchesClick(Sender: TObject);
begin
  frmKeywordmatches.show;
  frmAdminHome.hide;
end;

procedure TfrmAdminHome.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

//Each of these buttons just switch to other forms
end.
