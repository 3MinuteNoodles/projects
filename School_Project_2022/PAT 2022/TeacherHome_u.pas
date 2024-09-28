unit TeacherHome_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, tCourse_u, tNotes_u, tTest_u, tViewStudents_u,
  System.UITypes, Vcl.ComCtrls;

type
  TfrmTeacherHome = class(TForm)
    pnlNotes: TPanel;
    pnlTests: TPanel;
    pnlStudents: TPanel;
    btnSignOut: TButton;
    btnHelp: TButton;
    btnMessages: TButton;
    lblStudents: TLabel;
    btnEditProfile: TButton;
    btnSubject: TButton;
    redHelp: TRichEdit;
    btnUnderstood: TButton;
    procedure pnlNotesClick(Sender: TObject);
    procedure pnlTestsClick(Sender: TObject);
    procedure pnlStudentsClick(Sender: TObject);
    procedure btnSignOutClick(Sender: TObject);
    procedure btnMessagesClick(Sender: TObject);
    procedure lblStudentsClick(Sender: TObject);
    procedure btnEditProfileClick(Sender: TObject);
    procedure btnSubjectClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnUnderstoodClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTeacherHome: TfrmTeacherHome;


implementation
  Uses
  Login_u, Messages_u, Profile_u, dmEducation_u;

{$R *.dfm}

procedure TfrmTeacherHome.btnEditProfileClick(Sender: TObject);
begin
 frmTeacherHome.hide;
 frmProfile.show;
end;

procedure TfrmTeacherHome.btnHelpClick(Sender: TObject);
begin
  btnUnderstood.show;
  redHelp.show;
end;

procedure TfrmTeacherHome.btnMessagesClick(Sender: TObject);
begin
  frmTeacherHome.hide;
  frmMessages.show;
end;

procedure TfrmTeacherHome.btnSignOutClick(Sender: TObject);
begin
  frmTeacherHome.hide;
  frmLogin.show;
end;

procedure TfrmTeacherHome.btnSubjectClick(Sender: TObject);   //Lets the user add new subjects
var
 sName : string;
 bFound : boolean;
begin
  sName := InputBox('Subject Name', 'Enter the name of the new subject(up to 64 characters)', ''); //Gets the name of the new subject
  if sName = '' then    //makes sure that the name is not blank
    begin
      showmessage('Subject Name cannot be an empty string');
      Exit;
    end;

  if messageDlg('Are you sure you would to add a new subject with the name "' + sName + '"?', MtConfirmation, [mbYes, mbNo], 0) = MrYes then  //Checks that the user is sure they want to add the new subject with the entered name
    begin
      with dmEducation do
        begin
          tblSubjects.open;
          tblSubjects.first;
          bFound := false;
          //Loop to check that there is no existing subject with the entered name
          while not(tblSubjects.eof) and Not(bFound) do
            begin
              if Uppercase(tblSubjects['SubjectName']) = uppercase(sName) then
                begin
                  bFound := True;
                end;
              tblSubjects.next;
            end;

          if length(sName) > 64 then
            begin
              bFound := true;
            end;

          if not(bFound) then
            begin //If there is no existing subject with the entered name then inserts a new record into tblSubjects with the new name
              tblSubjects.last;
              tblSubjects.insert;
              tblSubjects['SubjectName'] := sName;
              tblSubjects.post;
              tblSubjects.close;
              showmessage('Subject successfully added');
            end
            else
            begin
              Showmessage('There is already a subject with this name, or the subject name you entered is longer than 64 characters'); //Shows this if there is a subject with the same name found
            end;
        end;
    end
    Else
    begin
      showmessage('Cancelled');    //If the user selected not to add the new subject then displays this
    end;
end;

procedure TfrmTeacherHome.btnUnderstoodClick(Sender: TObject);
begin
  redHelp.hide;
  btnUnderstood.hide;
end;

procedure TfrmTeacherHome.FormShow(Sender: TObject);
begin
  redHelp.hide;
  btnUnderstood.hide;
  redHelp.readonly := true;
end;

procedure TfrmTeacherHome.lblStudentsClick(Sender: TObject);
begin
  pnlStudentsClick(lblStudents);
end;

procedure TfrmTeacherHome.pnlNotesClick(Sender: TObject);
begin
  frmTeacherHome.hide;
  frmtNotes.show;
end;

procedure TfrmTeacherHome.pnlStudentsClick(Sender: TObject);
begin
  frmTeacherHOme.hide;
  frmViewStudents.show;
end;

procedure TfrmTeacherHome.pnlTestsClick(Sender: TObject);
begin
  frmTeacherHOme.hide;
  frmtTest.show;
end;

end.
