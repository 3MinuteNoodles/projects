unit sNotes_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmsNotes = class(TForm)
    pnlSubsOrSearch: TPanel;
    btnHome: TButton;
    btnHelp: TButton;
    lblSearch: TLabel;
    edtSearch: TEdit;
    lblSubjects: TLabel;
    cmbSubjects: TComboBox;
    Label2: TLabel;
    pnlNotes: TPanel;
    lblNotes: TLabel;
    cmbNotes: TComboBox;
    btnEnter: TButton;
    btnOpen: TButton;
    pnlNoteView: TPanel;
    btnBack: TButton;
    redNote: TRichEdit;
    redHelp: TRichEdit;
    btnUnderstood: TButton;
    procedure FormShow(Sender: TObject);
    procedure edtSearchEnter(Sender: TObject);
    procedure btnEnterClick(Sender: TObject);
    procedure cmbSubjectsChange(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure btnHomeClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnUnderstoodClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    { Private declarations }
    procedure DoNotes;
  public
    { Public declarations }
  end;

var
  frmsNotes: TfrmsNotes;

implementation
Uses
 dmEducation_u, StudentHome_u;

{$R *.dfm}


procedure TfrmsNotes.btnBackClick(Sender: TObject);
begin
  pnlNoteView.hide;
  pnlSubsOrSearch.show;
  pnlNotes.show;
end;

procedure TfrmsNotes.btnEnterClick(Sender: TObject);
begin
  DoNotes; //Loads the notes so that the search term is taken into account
end;

procedure TfrmsNotes.btnHelpClick(Sender: TObject);
begin
  redHelp.show;
  btnUnderstood.show;
end;

procedure TfrmsNotes.btnHomeClick(Sender: TObject);
begin
  frmsNotes.hide;
  frmStudentHome.show;
end;

procedure TfrmsNotes.btnOpenClick(Sender: TObject);
var
 sLine : string;
 bFound : boolean;
 tNote : textfile;
begin
  //Switches to the note view panel
  pnlNoteview.visible := true;
  pnlNoteview.bringtofront;
  pnlSubsOrSearch.visible := false;
  pnlNotes.visible := false;
  redNote.lines.clear;


  with dmEducation do
    begin
      tblNotes.open;
      tblNotes.first;

      bFound := false;

      //loops through until it finds a note with the Title that was selected in cmbNotes
      while not(tblNotes.eof) AND not(bFound) do
        begin
          if tblNotes['Title'] = cmbNotes.items[cmbNotes.itemindex] then
            begin
              bFound := True;
            end
            else
            begin
              tblNotes.next;
            end;
        end;

      AssignFile(tNote, tblNotes['TextFile']);
      redNote.scrollbars := ssVertical;
      reset(tNote);
      //Loop through each line and display it on the redNote rich edit
      while not(EOF(tNote)) do
        begin
          readln(tNote, sLine);
          redNote.lines.add(sLine);
        end;
    end;
end;

procedure TfrmsNotes.btnUnderstoodClick(Sender: TObject);
begin
  redHelp.hide;
  btnUnderstood.hide;
end;

procedure TfrmsNotes.cmbSubjectsChange(Sender: TObject);
begin
  DoNotes;
end;

procedure TfrmsNotes.DoNotes;
begin
  cmbNotes.itemIndex := -1;
  cmbNotes.items.clear;
  with dmEducation do
    begin
      tblNotes.open;
      tblNotes.first;
      while not(tblNotes.eof) do
        begin //if the note subject is the same as the selected one or there is no selected one    //And if the search term is in the note title or there is no search term
          if ((tblNotes['SubjectID'] = cmbSubjects.itemIndex) OR (cmbSubjects.itemIndex = 0)) AND ((pos(Uppercase(edtSearch.text), uppercase(tblNotes['Title'])) > 0) OR (edtSearch.text = '')) then
             begin
               cmbNotes.items.add(tblNotes['Title']);        //Adds it to list that user can choose from
             end;
          tblNotes.next;
        end;
      tblNotes.close;
    end;
end;

procedure TfrmsNotes.edtSearchEnter(Sender: TObject);
begin
  DoNotes; //Loads the notes so that the search term is taken into account
end;

procedure TfrmsNotes.FormShow(Sender: TObject);
begin
 pnlNotes.show;
 pnlSubsOrSearch.show;
 pnlNoteView.hide;
 redHelp.hide;
 redHelp.readonly := true;
 btnUnderstood.hide;
 redNote.readonly := true;
 cmbNotes.style := csDropDownList;
 cmbSubjects.style := csDropdownlist;
 with dmEducation do
   begin
     tblSubjects.open;
     tblSubjects.first;
     cmbSubjects.items.clear;
     cmbSubjects.items.add('All');  //adds this so that by default notes for all subjects are displayed
     while not(tblSubjects.eof) do
      begin
        cmbSubjects.items.add(tblSubjects['SubjectName']); //Adds each subject to cmbSubjects
        tblSubjects.next;
      end;
     tblSubjects.close;

     tblNotes.open;
     tblNotes.first;
     cmbNotes.items.clear;
     while not(tblNotes.eof) do
      begin
        cmbNotes.items.add(tblNotes['Title']);   //adds each note to cmbNotes
        tblNotes.next;
      end;
     tblNotes.close;

     cmbSubjects.itemIndex := 0;   //Sets all subjects to the default
   end;
end;

end.
