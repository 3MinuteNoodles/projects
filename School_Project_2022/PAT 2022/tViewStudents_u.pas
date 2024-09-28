unit tViewStudents_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, dmEducation_u,
  Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmViewStudents = class(TForm)
    btnHelp: TButton;
    btnHome: TButton;
    dbgStudents: TDBGrid;
    lblSInfo: TLabel;
    lblSubjects: TLabel;
    dbgSubjects: TDBGrid;
    dbgMarks: TDBGrid;
    lblMarks: TLabel;
    redHelp: TRichEdit;
    btnUnderstood: TButton;
    procedure FormShow(Sender: TObject);
    procedure dbgStudentsCellClick(Column: TColumn);
    procedure btnHomeClick(Sender: TObject);
    procedure btnUnderstoodClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmViewStudents: TfrmViewStudents;

implementation
Uses
  TeacherHome_u;
{$R *.dfm}

procedure TfrmViewStudents.btnHelpClick(Sender: TObject);
begin
  redHelp.show;
  btnUnderstood.show;
end;

procedure TfrmViewStudents.btnHomeClick(Sender: TObject);
begin
  //switches back to the student home form
  frmTeacherHome.show;
  frmViewStudents.hide;
end;

procedure TfrmViewStudents.btnUnderstoodClick(Sender: TObject);
begin
  redHelp.hide;
  btnUnderstood.hide;
end;

procedure TfrmViewStudents.dbgStudentsCellClick(Column: TColumn);
var
 iID, iIndex, i : integer;
 bFound : boolean;
begin
  With dmEducation do
    begin
      //gets the ID selected in dbgStudents
      iID := qryUsers['UserID'];
      //Displays info about that student in dbgSubjects and dbgMarks
      qrySubjects.Sql.clear;
      qrySubjects.sql.add('SELECT SubjectName FROM tblStudentSubjects, tblSubjects WHERE tblStudentSubjects.StudentID = ' + inttostr(iID) + ' AND tblStudentSubjects.SubjectID = tblSubjects.SubjectID ');
      qrySubjects.open;

      qryMarks.sql.clear;
      qryMarks.sql.add('SELECT tblTests.TestID, tblTests.Title, tblMarks.Mark, tblMarks.Percent FROM tblTests, tblMarks WHERE tblMarks.StudentID = ' + inttostr(iID) + ' AND tblMarks.TestID = tblTests.TestID ');
      qryMarks.open;
    end;
end;

procedure TfrmViewStudents.FormShow(Sender: TObject);
begin
 //Displays all the Students UserID, Username and Usersurname on a DBGrid so that the teacher can select one and view more info
 With dmEducation do
   begin
     qryUsers.sql.clear;
     qryUsers.SQL.add('SELECT UserID, UserSurname, UserName FROM tblUsers WHERE tblUsers.IsTeacher = False');
     qryUsers.open;
   end;

 dbgStudents.readonly := true;
 dbgSubjects.readonly := true;
 dbgMarks.readonly := true;

 dbgStudents.titlefont.color := clBlack;
 dbgSubjects.titlefont.color := clBlack;
 dbgMarks.titlefont.color := clBlack;

 redHelp.hide;
 btnUnderstood.hide;
end;

end.
