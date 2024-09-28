﻿unit Login_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, dmdbWhysapp_u, NormalHome_u, AdminHome_u,
  Vcl.WinXPickers, DateUtils, Vcl.ComCtrls, Vcl.Buttons;

type
  TfrmLogin = class(TForm)
    pnlLogin: TPanel;
    edtName: TEdit;
    lblFirstName: TLabel;
    edtSurname: TEdit;
    edtPassword: TEdit;
    lblSurname: TLabel;
    lblPassword: TLabel;
    btnLogin: TButton;
    btnCreateNewUser: TButton;
    btnLightMode: TButton;
    btnShowPassword: TButton;
    dtpBirthday: TDatePicker;
    btnHelp: TBitBtn;
    redHelpLogin: TRichEdit;
    btnNotHelp: TButton;
    procedure btnCreateNewUserClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnLightModeClick(Sender: TObject);
    procedure btnShowPasswordMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnShowPasswordMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnHelpClick(Sender: TObject);
    procedure btnNotHelpClick(Sender: TObject);
  private
    { Private declarations }
    lblConfirmPassword:Tlabel;
    edtConfirmPassword:TEdit;
    btnShowConfirmPassword:TButton;
    lblDateOfBirth:TLabel;
    procedure ShowConfirmPassword(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure HideConfirmPassword(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  public
    { Public declarations }
    iloggedinID : integer;
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.btnCreateNewUserClick(Sender: TObject);
begin

 if btnLogin.Caption = 'Login' then
  Begin
    //creating dynamic components
  lblConfirmpassword     := TLabel.create(frmLogin);
  edtConfirmPassword     := TEdit.Create(frmLogin);
  btnShowConfirmPassword := TButton.create(frmLogin);
  lblDateofBirth         := Tlabel.create(frmLogin);

    //setting dynamic component properties
  With lblConfirmPassword do
    Begin
      Parent       := pnlLogin;
      Name         := 'lblConfirmPassword';
      Caption      := 'Confirm password:';
      Left         := 6;
      Top          := 100;
      Height       := 13;
      Font.color   := clWindow;
      Color        := $00463832;
    End;

  with edtConfirmPassword do
    Begin
      Parent       := pnlLogin;
      Name         := 'edtConfirmPassword';
      text         := '';
      Left         := 98;
      Top          := 97;
      Height       := 21;
      Width        := 287;
      Color        := clWindow;
      Maxlength    := 32;
      PasswordChar := '*';
      font.color   := clBlack;
      showhint     := True;
      hint         := 'Confirm your password here, it must match the password entered above';
    End;

  with btnShowConfirmPassword do
    Begin
      Parent       := pnlLogin;
      Name         := 'btnShowConfirmPassword';
      Caption      := '👁';
      Left         := 384;
      Top          := 97;
      Height       := 21;
      Width        := 27;
      font.color   := clBlack;
      showhint     := True;
      hint         := 'Click to reveal passowrd';
      OnMouseDown  := ShowConfirmPassword;
      OnMouseUp    := HideConfirmPassword;
    End;

  With lblDateOfBirth do
    begin
      Parent       := pnlLogin;
      Name         := 'lblDateOfBirth';
      Caption      := 'Date of birth:';
      Left         := 6;
      Top          := 134;
      Height       := 13;
      Font.color   := clWindow;
      Color        := $00463832;
    end;

    dtpBirthday.visible := True;
    dtpBirthday.Enabled := True;
    //changeing btnlogin caption so user can see what they are doing
    btnLogin.Caption := 'Create new user';
    btnCreateNewUser.Caption := '⬅️ Back';

  End
  Else if btnLogin.Caption = 'Create new user' then
    Begin
      //releaseing dynamic components because they are not need for login
      lblConfirmPassword.Free;
      edtConfirmPassword.Free;
      btnShowConfirmPassword.Free;
      lblDateOfBirth.Free;
      dtpBirthday.Enabled := false;
      dtpBirthday.visible := False;
      dtpBirthday.date := strtodate('1900/01/01');
      //changeing button text back to indicate what will happen on click
      btnCreateNewUser.Caption := 'Create new user';
      btnLogin.Caption         := 'Login';
    End;

end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
var
 iLastID : integer;
 bFound, bContinue  : boolean;
 sString, sDate, sYear, sMonth, sDay : string;
Const
 sNumbers = '0123456789';
begin
   //Validation
   if (edtName.text = '') or (edtSurname.text = '') or (edtPassword.text = '') then
     begin
       showmessage('Please enter a name and password');
       Exit;
     end;

   if (edtName.text[1] = ' ') or (edtName.Text[Length(edtName.Text)] = ' ') then
     Begin
       Showmessage('Name cannot start or end in a space');
       Exit;
     End;

   if (edtsurname.text[1] = ' ') or (edtsurname.Text[Length(edtsurname.Text)] = ' ') then
     Begin
       Showmessage('Surname cannot start or end in a space');
       Exit;
     End;


  if btnLogin.Caption = 'Create new user' then
    Begin
     if edtPassword.Text = edtConfirmpassword.text then      //validating that user has correctly entered the passowrd they want
      Begin
       with dmdbWhysapp do
        Begin
             //Checks that you are old enough
          if dtpBirthday.Date > incYear(now, -12) then
           begin
            showmessage('You are too young to use this program');
            Exit;
           end;

          if edtPassword.text <> edtConfirmPassword.text then
            begin
              Showmessage('Passowrds must be the same');
              Exit;
            end;

          //Adding record for new user to tblUsers
          tblusers.open;
          tblusers.Last;
          iLastID := tblusers['UserID'];
          tblUsers.Insert;
          tblUsers['UserID'] := iLastID + 1;
          tblUsers['First_name'] := edtName.Text;
          tblusers['Surname'] := edtSurname.Text;
          tblUsers['Password'] := edtPassword.Text;
          tblUsers['IsDisabled'] := False;
          tblUsers['UserType'] := 'Normal';
          tblUsers['DateOfBirth'] := dtpbirthday.date;
          tblUsers.Post;


          showmessage('User successfully created');
          edtConfirmPassword.free;
          lblConfirmPassword.free;
          btnShowConfirmPassword.free;
          lblDateOfBirth.free;
          dtpBirthday.Enabled := false;
          dtpBirthday.visible := False;
          dtpBirthday.date := strtodate('1900/01/01');

          btnCreateNewUser.Caption := 'Create new user';
          btnLogin.Caption := 'Login';
        End;
      End
      Else if edtPassword.Text <> edtConfirmpassword.text Then
      Begin
        //If passwords don't match set focus on edtpassword so user can correct it
        showmessage('Passwords do not match');
        edtPassword.SetFocus;
        Exit;
      End;
    End
    Else if btnLogin.Caption = 'Login' then
         Begin
           with dmdbWhysapp do
             Begin
              tblUsers.Open;
              tblUsers.First;
               while Not(tblUsers.Eof) do
                 Begin
                    //finding what user matches entered login details
                    if (Uppercase(tblUsers['First_name']) = Uppercase(edtName.text)) And (Uppercase(tblusers['Surname']) = Uppercase(edtSurname.Text)) And (tblUsers['Password'] = edtPassword.Text) Then
                      Begin
                        if tblUsers['IsDisabled'] = False then
                         Begin
                          iLoggedinID := tblusers['UserID'];
                          if tblUsers['UserType'] = 'Normal' then
                            Begin
                             frmNormalHome.Show;
                            End
                           Else if tblUsers['UserType'] = 'Admin' then
                             Begin
                               frmAdminHome.Show;
                             End;

                          edtName.clear;
                          edtSurname.clear;
                          edtPassword.clear;

                          frmLogin.Hide;
                          Exit;
                         End
                         Else
                         Begin
                         showmessage('This user has been disabled');
                         End;

                         edtName.setfocus;
                      End;
                  tblusers.Next;
                 End

             End;
             //displaying error if the user is not found
             Showmessage('Entered details do not match existing user, please check that the details you have entered are correct or consider creating a new user if you do not have one');
             edtname.SetFocus;
         End;
end;
procedure TfrmLogin.btnNotHelpClick(Sender: TObject);
begin
  redHelpLogin.Enabled := False;
  redHelpLogin.Visible := False;
  btnNothelp.Enabled   := False;
  btnNothelp.Visible   := False;
end;

//So you can see password when you press button (2 procedures below)
procedure TfrmLogin.btnShowPasswordMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtPassword.PasswordChar := #0;
end;

procedure TfrmLogin.btnShowPasswordMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtPassword.passwordchar := '*';
end;

procedure TfrmLogin.btnHelpClick(Sender: TObject);
begin
  redHelpLogin.Visible  := True;
  redHelpLogin.Enabled  := True;
  btnNotHelp.enabled    := True;
  btnNotHelp.Visible    := True;
  redHelpLogin.readonly := true;
end;

procedure TfrmLogin.btnLightModeClick(Sender : TObject);
begin
  //This light mode button is fake because no one would want to use light mode
  Showmessage('NO');
  Showmessage('Real programmers always use dark mode');
end;


procedure TfrmLogin.FormShow(Sender: TObject);
begin
  //clearing everything if you go back to login screen
  edtPassword.clear;
  edtName.clear;
  edtSurname.clear;
  edtName.setfocus;
  dtpBirthday.Enabled := False;
  dtpBirthday.visible := False;
  dtpBirthday.maxyear := strtoint(copy(datetostr(now), 1, 4));
end;
//So you can see password when you press button (2 procedures below)
procedure TfrmLogin.HideConfirmPassword;
begin
  edtConfirmPassword.Passwordchar := '*';
end;

procedure TfrmLogin.ShowConfirmPassword;
begin
  edtConfirmPassword.PasswordChar := #0;
end;

end.
