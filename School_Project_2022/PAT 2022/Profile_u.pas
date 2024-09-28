unit Profile_u;                      //was about to code changing your subjects here

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.UITypes, Math,
  Vcl.ComCtrls;

type
  TfrmProfile = class(TForm)
    btnHome: TButton;
    btnHelp: TButton;
    pnlUser: TPanel;
    lblSurname: TLabel;
    lblName: TLabel;
    lblPassword: TLabel;
    lblEdit: TLabel;
    edtName: TEdit;
    edtSurname: TEdit;
    edtPassword: TEdit;
    btnSubmit: TButton;
    btnSubjects: TButton;
    pnlSubjects: TPanel;
    lblpage: TLabel;
    lblSubject1: TLabel;
    lblSubject2: TLabel;
    lblSelectSubs: TLabel;
    lblSubject5: TLabel;
    lblSubject4: TLabel;
    lblSubject3: TLabel;
    chk1: TCheckBox;
    chk2: TCheckBox;
    btnNext: TButton;
    chk4: TCheckBox;
    chk3: TCheckBox;
    chk5: TCheckBox;
    btnBack: TButton;
    lblConfirmPassword: TLabel;
    edtConfirmPassword: TEdit;
    btnShowPasswords: TButton;
    redHelp: TRichEdit;
    btnUnderstood: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnSubmitClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnSubjectsClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnHomeClick(Sender: TObject);
    procedure btnShowPasswordsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnShowPasswordsMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnUnderstoodClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    { Private declarations }
    arrSubjects : array of integer;
    iPage, ipages, iSubjects, iID : integer;
  public
    { Public declarations }
  end;

var
  frmProfile: TfrmProfile;

implementation
Uses
 dmEducation_u, Login_u, StudentHome_u, TeacherHome_u;

{$R *.dfm}

procedure TfrmProfile.btnBackClick(Sender: TObject);
begin
  pnlSubjects.hide;
  pnlUser.show;
end;

procedure TfrmProfile.btnHelpClick(Sender: TObject);
begin
  redHelp.show;
  btnUnderstood.show;
end;

procedure TfrmProfile.btnHomeClick(Sender: TObject);
var
 bFound : boolean;
begin
  frmProfile.hide;
  bFound := False;
  with dmEducation do
    begin
      tblUsers.open;
      tblUsers.first;
      while not(tblUsers.eof) and NOT(bFOund) do
        begin
          if tblUsers['UserID'] = frmLogin.iUserNumber then
            begin
              bFound := true;
            end
            else
            begin
              tblUsers.next;
            end;
        end;

          if tblUsers['IsTeacher'] then
            begin
              frmTeacherHOme.show;
            end
            else
            begin
              frmStudentHome.show;
            end;

      tblUsers.close;
    end;
end;

procedure TfrmProfile.btnNextClick(Sender: TObject);
var
 i : integer;
begin
//saves which subjects are checked into an array
   if chk1.checked then
        begin
          Setlength(arrSubjects, length(arrSubjects) + 1);
          arrSubjects[length(arrSubjects) - 1] := (iPage - 1) * 5 + 1;
        end;

      if chk2.checked then
        begin
          Setlength(arrSubjects, length(arrSubjects) + 1);
          arrSubjects[length(arrSubjects) -1 ] := (iPage - 1) * 5 + 2;
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
      for i := 1 to (ipage - 1)* 5 do //goes to next subject to check
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
      pnlUser.show;
      //Checks that the user has selected a subject
      with dmEducation do
        begin
          iID := frmLogin.iUserNumber; //gets the ID of the current user

          //Deletes the old subjects that the user had previously chosen
          qryStudentSubjects.sql.clear;
          qryStudentSubjects.sql.add(' DELETE FROM tblStudentSubjects WHERE StudentID = ' + inttostr(iID));
          qryStudentSubjects.ExecSQL;
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

          showmessage('Subjects successfully changed');    //Helpful confirmation message
        end;
    end;
end;

procedure TfrmProfile.btnShowPasswordsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtPassword.passwordchar := #0;
  edtConfirmPassword.passwordchar := #0;
end;

procedure TfrmProfile.btnShowPasswordsMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtPassword.passwordchar := '*';
  edtConfirmPassword.passwordchar := '*';
end;

procedure TfrmProfile.btnSubjectsClick(Sender: TObject);
begin
  //brings up interface for student to choose which subjects they want to take
  With dmEducation do
    Begin
          pnlSubjects.visible := true;
          pnlSubjects.bringtofront;
          tblSubjects.open;
          tblSubjects.last;
          //sets the check boxes to not be checkede
          chk1.checked := false;
          chk2.checked := false;
          chk3.checked := false;
          chk4.checked := false;
          chk5.checked := false;

          iSubjects := tblSubjects['SubjectID'];      //gets number of subjects
          iPage := 1;
          iPages := ceil(iSubjects / 5);            //checks how many pages of 5 subjects there are
          lblPage.Caption := 'Page 1/' + inttostr(iPages);   //displays current page
          tblSubjects.first;
          //populates labels with the first five subjects and makes them visible
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
          pnlUser.visible := false;  //hides current panel
          SetLength(arrSubjects, 0);
    End;
end;

procedure TfrmProfile.btnSubmitClick(Sender: TObject);
var
 bFound, bValid, bExists : boolean;
begin
  //Saves any changes that the user has made to their account into the database
  if (messageDlg('Are you sure you would like to make these changes to your account?', MtConfirmation, [mbYes, mbNo], 0) = MrYes) then //Confirms that user would like to make changes
    Begin
     with dmEducation do
     Begin
      tblUsers.open;

      bFound := false;

      //Start of validation
      bValid := true;
       if (edtName.text = '') OR (Length(edtName.text) > 32) then
         begin
           bValid := False;
           showmessage('Your name must be 1-32 characters long');
         end
       Else if (edtName.text[1] = ' ') OR (edtNAME.text[Length(edtName.text)] = ' ') then
         begin
           bValid := False;
           showmessage('Your name can not start or end with a space');
         end
       Else if (edtSurname.text = '') OR (Length(edtSurname.text) > 32) then
         begin
           bValid := False;
           showmessage('Your surname must be 1-32 characters long');
         end
       Else if (edtsurname.text[1] = ' ') OR (edtSURNAME.text[Length(edtsurname.text)] = ' ') then
         begin
           bValid := False;
           showmessage('Your surname can not start or end with a space');
         end
       Else if (edtPassword.text = '') OR (Length(edtPassword.text) > 32) then
         begin
           bValid := False;
           showmessage('Your password must be 1-32 characters long');
         end
       Else if (edtPassword.text[1] = ' ') OR (edtPassword.text[Length(edtPassword.text)] = ' ') then
         begin
           bValid := False;
           showmessage('Your password can not start or end with a space');
         end
       Else if edtConfirmPassword.text <> edtPassword.text then
         begin
           bValid := false;
           Showmessage('Your passwords do not match');
         end
       Else
        Begin
         tblUsers.first;
         bExists := false;
         while not(tblUsers.eof) AND not(bExists) do
           begin
             if (Uppercase(edtName.text) = Uppercase(tblUsers['UserName'])) AND (Uppercase(edtSurname.text) = Uppercase(tblUsers['UserSurname'])) AND (tblUsers['UserID'] <> frmLogin.iUSerNumber) then
               begin
                 bExists := true;
                 bValid := false;
               end;
             tblUsers.next;
           end;

         if bExists then
          begin
            Showmessage('An account with this name and surname already exists, therefore the changes were not made');
          end;
         End;

         //end of validation
      if bValid then
      Begin
            tblUsers.first;
            while not(tblUsers.eof) and not(bFound) do
        Begin     //Loops through until at the record of the current user
          if tblUsers['UserID'] = frmLogin.iUserNumber then
            Begin
              bFound := true;
            End
            Else
            begin
              tblUsers.next;
            end;
        End;
      tblUsers.edit;       //edits the record of the current user to contain the new info
      tblUsers['UserName'] := edtName.text;
      tblUsers['UserSurname'] := edtSurname.text;
      tblUsers['Password'] := edtPassword.text;
      tblUsers.post;
      showmessage('User Succesfully Updated');
      End;
     End;
    End;
end;

procedure TfrmProfile.btnUnderstoodClick(Sender: TObject);
begin
 redHelp.hide;
 btnUnderstood.hide;
end;

procedure TfrmProfile.FormShow(Sender: TObject);
var
 bFound : boolean;
begin
  pnlSubjects.hide;
  redHelp.hide;
  redHelp.readonly := true;
  btnUnderstood.hide;
  pnlUser.show;
  with dmEducation do
    begin
      tblUsers.open;
      tblUsers.first;
      bFOund := false;
      while not(tblUsers.eof) and not(bFound) do
        Begin   //goes to the current user in the database
          if tblUsers['UserID'] = frmLogin.iUserNumber then
            Begin
              bFound := true;
            End
            Else
            begin
              tblUsers.next;
            end;
        End;
      //fetches the info about the user and displays it on the edit boxes
      edtName.text := tblUsers['UserName'];
      edtSurname.text := tblUsers['UserSurname'];
      edtPassword.text := tblUsers['Password'];
      edtConfirmPassword.text := tblUsers['Password'];
      //Makes it so students can see a button to let them edit their subjects but teachers can't
      if tblUsers['IsTeacher'] then
        Begin
          btnSubjects.visible := false;
        End
        Else
        Begin
          btnSubjects.visible := True;
        End;
      tblUsers.close;
    end;
end;

end.
