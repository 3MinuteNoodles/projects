unit Login_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, System.UITypes, System.Math;

type
  TfrmLogin = class(TForm)
    pnlLoginType: TPanel;
    lblChooseLoginType: TLabel;
    btnTeacher: TButton;
    btnStudent: TButton;
    btnHelp: TButton;
    btnSignUp: TButton;
    pnlTeacherLogin: TPanel;
    edtTName: TEdit;
    edtTSurname: TEdit;
    edtTPassword: TEdit;
    lblTName: TLabel;
    lblTSurname: TLabel;
    lblTPassword: TLabel;
    btnTHelp: TButton;
    btnTLogin: TButton;
    lblTLogin: TLabel;
    pnlSLogin: TPanel;
    lblSName: TLabel;
    lblSSurname: TLabel;
    lblSPassword: TLabel;
    lblSLogin: TLabel;
    edtSName: TEdit;
    edtSSurname: TEdit;
    edtSPassword: TEdit;
    btnSHelp: TButton;
    btnSLogin: TButton;
    btnSBack: TButton;
    btnTBack: TButton;
    pnlCreateUser: TPanel;
    lblcName: TLabel;
    lblCSurname: TLabel;
    lblcPassword: TLabel;
    lblSignUp: TLabel;
    edtCreateName: TEdit;
    edtCreateSurname: TEdit;
    edtCreatePassword: TEdit;
    btncHelp: TButton;
    btnCreate: TButton;
    btnCBack: TButton;
    lblAccountType: TLabel;
    cmbAccountType: TComboBox;
    lblConfirmPassword: TLabel;
    edtCreateCPassword: TEdit;
    btnShowcPassword: TButton;
    btnShowccPassword: TButton;
    btnShowsPassword: TButton;
    btnShowTPassword: TButton;
    lblWelcome: TLabel;
    redHelp: TRichEdit;
    btnUnderstood: TButton;
    pnlSubjects: TPanel;
    lblpage: TLabel;
    chk1: TCheckBox;
    lblSubject1: TLabel;
    chk2: TCheckBox;
    lblSubject2: TLabel;
    lblSelectSubs: TLabel;
    btnNext: TButton;
    lblSubject5: TLabel;
    lblSubject4: TLabel;
    chk4: TCheckBox;
    lblSubject3: TLabel;
    chk3: TCheckBox;
    chk5: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure btnTeacherClick(Sender: TObject);
    procedure btnStudentClick(Sender: TObject);
    procedure btnTBackClick(Sender: TObject);
    procedure btnSBackClick(Sender: TObject);
    procedure btnSLoginClick(Sender: TObject);
    procedure btnTLoginClick(Sender: TObject);
    procedure btnCreateClick(Sender: TObject);
    procedure btnSignUpClick(Sender: TObject);
    procedure btnShowcPasswordMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnShowcPasswordMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnShowccPasswordMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnShowccPasswordMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnShowsPasswordMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnShowsPasswordMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnShowTPasswordMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnShowTPasswordMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnCBackClick(Sender: TObject);
    procedure btnSHelpClick(Sender: TObject);
    procedure btnUnderstoodClick(Sender: TObject);
    procedure btncHelpClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure btnTHelpClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
  private
    { Private declarations }
    iSubjects, iPage, iPages : integer;
    arrSubjects : array of integer;
  public
    { Public declarations }
    iUserNumber : integer;
  end;

var
  frmLogin: TfrmLogin;

implementation
Uses
  dmEducation_u, StudentHome_u, teacherHome_u;
{$R *.dfm}

procedure TfrmLogin.btnCBackClick(Sender: TObject);
begin
  //Changing panels
  pnlCreateUser.Visible := false;
  pnlCreateUser.Enabled := false;
  pnlLoginType.visible  := True;
  pnlLogintype.enabled  := true;
end;

procedure TfrmLogin.btncHelpClick(Sender: TObject);
begin
  redHelp.visible := true;
  btnUnderstood.visible := true;
end;

procedure TfrmLogin.btnCreateClick(Sender: TObject);
var
 bValid, bExists : boolean;
begin
  With dmEducation do
   begin
     tblUsers.open;
     bValid := True;
     //Validation:
       if (edtCreateName.text = '') OR (Length(edtCreateName.text) > 32) then
         begin
           bValid := False;
           showmessage('Your name must be 1-32 characters long');
         end
       Else if (edtCreateName.text[1] = ' ') OR (edtCreateNAME.text[Length(edtCreateName.text)] = ' ') then
         begin
           bValid := False;
           showmessage('Your name can not start or end with a space');
         end
       Else if (edtCreateSurname.text = '') OR (Length(edtCreateSurname.text) > 32) then
         begin
           bValid := False;
           showmessage('Your surname must be 1-32 characters long');
         end
       Else if (edtCreatesurname.text[1] = ' ') OR (edtCreateSURNAME.text[Length(edtCreatesurname.text)] = ' ') then
         begin
           bValid := False;
           showmessage('Your surname can not start or end with a space');
         end
       Else if (edtCreatePassword.text = '') OR (Length(edtCreatePassword.text) > 32) then
         begin
           bValid := False;
           showmessage('Your password must be 1-32 characters long');
         end
       Else if (edtCreatePassword.text[1] = ' ') OR (edtCreatePassword.text[Length(edtCreatePassword.text)] = ' ') then
         begin
           bValid := False;
           showmessage('Your password can not start or end with a space');
         end
       Else if edtCreatePassword.text <> edtCreateCPassword.text then
         begin
           bValid := false;
           showmessage('Passwords do not match');
         end
       Else if cmbAccountType.itemindex = -1 then
        Begin
          bValid := false;
          showmessage('Please select an account type');
        End
       Else
        Begin
         tblUsers.first;
         bExists := false;
         while not(tblUsers.eof) AND not(bExists) do
           begin
             if (Uppercase(edtCreateName.text) = Uppercase(tblUsers['UserName'])) AND (Uppercase(edtCreateSurname.text) = Uppercase(tblUsers['UserSurname'])) then
               begin
                 bExists := true;
                 bValid := false;
               end;
             tblUsers.next;
           end;

         if bExists then
          begin
            Showmessage('An account with this name and surname already exists, go to the login screen if you have already created an account. If you still wish to create this account then consider adding some numbers to the end of your name')
          end;
         End;
     //End of Validation


     if (BValid) AND (messageDlg('Are you sure you would like to create a new acount?', MtConfirmation, [mbYes, mbNo], 0) = MrYes) then
       Begin
        //If user confirms and validation is successful then creates new user by inserting into database
        tblUsers.last;
        tblUsers.insert;
        tblUsers['UserName'] := edtCreateName.text;
        tblUsers['UserSurname'] := edtCreateSurname.text;
        tblUsers['Password'] := edtCreatePassword.text;

        //Checking which type of user is being created
        if cmbAccountType.itemindex = 0 then
         begin
            tblUsers['IsTeacher'] := True;
         end
         else if cmbAccountType.itemIndex = 1 then
         begin
          tblUsers['IsTeacher'] := False;
          //brings up interface for student to choose which subjects they want to take
          pnlSubjects.visible := true;
          pnlSubjects.bringtofront;

          tblSubjects.open;
          tblSubjects.last;

          iSubjects := tblSubjects['SubjectID'];      //gets number of subjects
          iPage := 1;
          iPages := ceil(iSubjects / 5);            //checks how many pages of 5 subjects there are
          lblPage.Caption := 'Page 1/' + inttostr(iPages);   //displays current page
          tblSubjects.first;
          //populates labels with the first five subjects
          lblSubject1.Visible := true;
          lblSubject2.Visible := true;
          lblSubject3.Visible := true;
          lblSubject4.Visible := true;
          lblSubject5.Visible := true;
          chk1.visible := True;
          chk2.visible := True;
          chk3.visible := True;
          chk4.visible := True;
          chk5.visible := True;
          chk1.checked := false;
          chk2.checked := false;
          chk3.checked := false;
          chk4.checked := false;
          chk5.checked := false;

          lblSubject1.caption := tblSubjects['SubjectName'];
          tblSubjects.next;
          lblSubject2.caption := tblSubjects['SubjectName'];
          tblSubjects.next;
          lblSubject3.caption := tblSubjects['SubjectName'];
          tblSubjects.next;
          lblSubject4.caption := tblSubjects['SubjectName'];
          tblSubjects.next;
          lblSubject5.caption := tblSubjects['SubjectName'];
          tblSubjects.close;
          SetLength(arrSubjects, 0);
         end;

          tblUsers.post;
          pnlCreateUser.visible := false;  //hides current panel
          pnlLoginType.show;
          edtCreatecPassword.text := '';
          edtCreateName.text := '';
          edtCreatePassword.text := '';
          edtCreateSurname.text := '';
          cmbAccountType.itemIndex := 1;


       if cmbAccountType.itemindex = 0 then
         Begin
          btnCBackClick(btnCreate);  //goes back to the login type panel
         End;
       End;


   end;
end;

procedure TfrmLogin.btnHelpClick(Sender: TObject);
begin
  redHelp.visible := true;
  btnUnderstood.visible := true;
end;

procedure TfrmLogin.btnNextClick(Sender: TObject);
var
  i, iID: Integer;
begin
      //Checks which subjects have been selected and saves them into an array
      if chk1.checked then
        begin
          Setlength(arrSubjects, length(arrSubjects) + 1);
          arrSubjects[length(arrSubjects)-1] := (iPage - 1) * 5 + 1;
        end;

      if chk2.checked then
        begin
          Setlength(arrSubjects, length(arrSubjects) + 1);
          arrSubjects[length(arrSubjects)-1] := (iPage - 1) * 5 + 2;
        end;

      if chk3.checked then
        begin
          Setlength(arrSubjects, length(arrSubjects) + 1);
          arrSubjects[length(arrSubjects)-1] := (iPage - 1) * 5 + 3;
        end;

      if chk4.checked then
        begin
          Setlength(arrSubjects, length(arrSubjects) + 1);
          arrSubjects[length(arrSubjects)-1] := (iPage - 1) * 5 + 4;
        end;

      if chk5.checked then
        begin
          Setlength(arrSubjects, length(arrSubjects) + 1);
          arrSubjects[length(arrSubjects)-1] := (iPage - 1) * 5 + 5;
        end;
   //goes to next page and repopulates all the labels that have the subject names on them with the next set of subjects
  if iPage < iPages then
    begin

      inc(iPage);
      lblPage.caption := 'Page ' + inttostr(iPage) + '/' + inttostr(iPages);
      // clearing checkboxes
      chk1.checked := false;
      chk2.checked := false;
      chk3.checked := false;
      chk4.checked := false;
      chk5.checked := false;

      with dmEducation do
      Begin
      tblSUbjects.open;
      tblSubjects.first;
      for i := 1 to (ipage-1) * 5 do //goes to next subject to check
        begin
          tblSubjects.next;
        end;
      lblSubject1.caption := tblSubjects['SubjectName'];        //populates first label
      tblSubjects.next;

      //Checks if each of the next 4 labels need to be populated and hides them if they don't
      if 2 + 5 * (ipage - 1) <= iSubjects then
        begin
          lblSubject2.caption := tblSubjects['SubjectName'];
          tblSubjects.next;
        end
        else
        begin
          chk2.visible := false;
          lblSubject2.visible := false;
        end;

      if 3 + 5 * (ipage - 1) <= iSubjects then
        begin
          lblSubject3.caption := tblSubjects['SubjectName'];
          tblSubjects.next;
        end
        else
        begin
          chk3.visible := false;
          lblSubject3.visible := false;
        end;

      if 4 + 5 * (ipage - 1) <= iSubjects then
        begin
          lblSubject4.caption := tblSubjects['SubjectName'];
          tblSubjects.next;
        end
        else
        begin
          chk4.visible := false;
          lblSubject4.visible := false;
        end;

      if 5 + 5 * (ipage - 1) <= iSubjects then
        begin
          lblSubject5.caption := tblSubjects['SubjectName'];
        end
        else
        begin
          chk5.visible := false;
          lblSubject5.visible := false;
        end;
        tblSubjects.close;
      End;
    end
    else
    begin
      pnlSubjects.hide;
      with dmEducation do
        begin
          tblUsers.open;
          tblUsers.last;
          iID := tblusers['UserID']; //gets the userID of the account that was just created
          tblUsers.close;

          //writes all the selected subjects to tblStudentSubjects
          for i := 0 to length(arrSubjects) - 1 do
            Begin
              tblStudentSUbjects.open;
              tblStudentSubjects.last;
              tblStudentSubjects.insert;
              tblStudentSUbjects['StudentID'] := iID;
              tblStudentSubjects['SubjectID'] := arrSubjects[i];
              tblStudentSubjects.post;
              tblStudentSubjects.close;
            End;
        end;
    end;
end;

procedure TfrmLogin.btnSBackClick(Sender: TObject);
begin
  //Switching panels
  pnlsLogin.visible    := False;
  pnlsLogin.Enabled    := False;
  pnlLoginType.visible := True;
  pnlLogintype.enabled := True;
end;

procedure TfrmLogin.btnSHelpClick(Sender: TObject);
begin      //goes to the help page
  redHelp.visible := true;
  btnUnderstood.visible := true;
end;

//Start of code to make password change between visible and not visible
procedure TfrmLogin.btnShowccPasswordMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtCreateCPassword.passwordChar := #0;
end;

procedure TfrmLogin.btnShowccPasswordMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
edtCreateCPassword.passwordChar := '*';
end;

procedure TfrmLogin.btnShowcPasswordMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtCreatePassword.passwordChar := #0;
end;

procedure TfrmLogin.btnShowcPasswordMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtCreatePassword.PasswordChar := '*';
end;

procedure TfrmLogin.btnShowsPasswordMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtsPassword.passwordChar := #0;
end;

procedure TfrmLogin.btnShowsPasswordMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtsPassword.passwordChar := '*';
end;
//end of code to change password between visible and not visible

procedure TfrmLogin.btnSignUpClick(Sender: TObject);
begin
  //switching panels to go to the create user panel
  pnlCreateUser.enabled := True;
  pnlCreateUser.visible := True;
  pnlLoginType.visible  := False;
end;

procedure TfrmLogin.btnSLoginClick(Sender: TObject);
var
 bFound : boolean;
begin
  bFound := false;
  //Logging you in as a student
  with dmEducation do
    begin
      tblUSers.open;
      tblUsers.first;
      while not (tblUsers.eof) AND not(bFOund) do  //Looping through the database to find a matching user
        begin
          if (Uppercase(edtSName.text) = Uppercase(tblUSers['UserName'])) AND (uppercase(edtSSurname.text) = uppercase(tblUsers['UserSurname'])) AND (edtSPassword.text = tblUsers['Password']) AND (tblUsers['IsTeacher'] = False) Then
           begin
             //When user is found then switch to the student home and save the userID into a variable
             frmLogin.hide;
             frmStudentHome.Show;
             bFound := true;
             iUserNumber := tblUsers['UserID'];
           end;

           if NOT(bFound) then
             Begin
               //goes to the next record if it didn't match the current record in the database
               tblUsers.next;
             End;
        end;

      if NOT(bFound) then
        begin    //If no matching user was found then displays helpful error message
          showmessage('Your name, surname or password is incorrect. Or you are trying to sign into the wrong type of account');
        end;
    end;
end;

procedure TfrmLogin.btnStudentClick(Sender: TObject);
begin
  //Switching to the student login panel
  pnlSlogin.enabled := True;
  pnlSLogin.visible := True;
  pnlLoginType.enabled := false;
  pnlLogintype.visible := false;
end;

procedure TfrmLogin.btnTBackClick(Sender: TObject);
begin
  //Going back to the panel where you choose login type
  pnlTeacherLogin.visible := False;
  pnlTeacherLogin.Enabled := False;
  pnlLoginType.visible := True;
  pnlLogintype.enabled := True;
end;

procedure TfrmLogin.btnTeacherClick(Sender: TObject);
begin
  //going to the teacher login panel
  pnlTeacherlogin.enabled := True;
  pnlTeacherLogin.visible := True;
  pnlLoginType.enabled := false;
  pnlLogintype.visible := false;
end;

procedure TfrmLogin.btnTHelpClick(Sender: TObject);
begin
  redHelp.visible := true;
  btnUnderstood.visible := true;
end;

procedure TfrmLogin.btnTLoginClick(Sender: TObject);
var
 bFound : boolean;
begin
  bFound := false;
  //Logging in as a teacher
  with dmEducation do
    begin
      tblUSers.open;
      tblUsers.first;
      while not tblUsers.eof and NOT(bFound) do       //loops through to find a record in the database that matches entered info
        begin
          if (uppercase(edtTName.text) = uppercase(tblUSers['UserName'])) AND (uppercase(edtTSurname.text) = uppercase(tblUsers['UserSurname'])) AND (edtTPassword.text = tblUsers['Password']) AND (tblUsers['IsTeacher'] = True) Then
           begin
             //Switches forms and saves the userID into a variable if there is a matching user in the database
             frmLogin.hide;
             frmTeacherHome.Show;
             bFound := true;
             iUserNumber := tblUsers['UserID'];
           end;

           if NOT(bFound) then
             Begin              //goes to the next record if no matching user was found
               tblUsers.next;
             End;
        end;

      if NOT(bFound) then
        begin      //Displays a helpful message if no matching user was found in the whole database
          showmessage('Your name, surname or password is incorrect. Or you are trying to sign into the wrong type of account');
        end;
    end;
end;

procedure TfrmLogin.btnUnderstoodClick(Sender: TObject);
begin
  redHelp.visible := false;
  btnUnderStood.visible := false;
end;

//More changing password between visible and invisible
procedure TfrmLogin.btnShowTPasswordMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  edttPassword.passwordChar := #0;
end;

procedure TfrmLogin.btnShowTPasswordMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  edtTPassword.PasswordChar := '*'
end;
//End of changing password between visible and invisible

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  //Clearing fields
  edtTname.text := '';
  edtTSurname.text := '';
  edtTPassword.text := '';
  edtSName.text := '';
  edtSSurname.text := '';
  edtSPassword.text := '';
  edtCreateName.text := '';
  edtCreateSurname.text := '';
  edtCreatePassword.text := '';
  edtCreateCPassword.text := '';

  //making correct panels visible when you open the form
  pnlSLogin.visible       := False;
  pnlSLogin.Enabled       := False;
  pnlTeacherLogin.Visible := False;
  pnlTeacherLogin.Enabled := False;
  pnlCreateUser.visible   := false;
  pnlCreateUser.enabled   := false;
  pnlLoginType.visible    := true;
  pnlLoginType.enabled    := true;

  cmbAccountType.style := csDropDownList;
  redHelp.readonly := true;
end;


end.
