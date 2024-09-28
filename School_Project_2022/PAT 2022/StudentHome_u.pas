unit StudentHome_u;        //This form is just for navigation

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmStudentHome = class(TForm)
    pnlNotes: TPanel;
    pnlTests: TPanel;
    pnlsMarks: TPanel;
    lblMarks: TLabel;
    btnSignOut: TButton;
    btnHelp: TButton;
    btnMessages: TButton;
    btnEditProfile: TButton;
    redHelp: TRichEdit;
    btnUnderstood: TButton;
    procedure btnSignOutClick(Sender: TObject);
    procedure pnlNotesClick(Sender: TObject);
    procedure pnlTestsClick(Sender: TObject);
    procedure pnlsMarksClick(Sender: TObject);
    procedure btnMessagesClick(Sender: TObject);
    procedure btnEditProfileClick(Sender: TObject);
    procedure lblMarksClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnUnderstoodClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStudentHome: TfrmStudentHome;

implementation
Uses
 Login_u, sMarks_u, sNotes_u, Profile_u, sTest_u, Messages_u;

{$R *.dfm}

procedure TfrmStudentHome.btnEditProfileClick(Sender: TObject);
begin
  frmStudentHome.hide;
  frmProfile.show;
end;

procedure TfrmStudentHome.btnHelpClick(Sender: TObject);
begin
  redHelp.show;
  btnUnderstood.show;
end;

procedure TfrmStudentHome.btnMessagesClick(Sender: TObject);
begin
  frmStudentHome.hide;
  frmMessages.show;
end;

procedure TfrmStudentHome.btnSignOutClick(Sender: TObject);
begin
  frmStudentHome.hide;
  frmLogin.show;
end;

procedure TfrmStudentHome.btnUnderstoodClick(Sender: TObject);
begin
  redHelp.hide;
  btnUnderstood.hide;
end;

procedure TfrmStudentHome.FormShow(Sender: TObject);
begin
  redHelp.hide;
  redHelp.readonly := true;
  btnUnderstood.hide;
end;

procedure TfrmStudentHome.lblMarksClick(Sender: TObject);
begin
  pnlsMarksClick(lblMarks)
end;

procedure TfrmStudentHome.pnlNotesClick(Sender: TObject);
begin
  frmStudentHome.hide;
  frmsNotes.show;
end;

procedure TfrmStudentHome.pnlsMarksClick(Sender: TObject);
begin
  frmStudentHome.hide;
  frmsMarks.show;
end;

procedure TfrmStudentHome.pnlTestsClick(Sender: TObject);
begin
  frmStudentHome.hide;
  frmsTests.show;
end;

end.
