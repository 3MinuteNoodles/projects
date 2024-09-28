unit tNotes_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Login_u, dmEducation_u, System.UITypes;

type
  TfrmtNotes = class(TForm)
    btnHome: TButton;
    btnHelp: TButton;
    pnlCreateNotes: TPanel;
    redCreateNote: TRichEdit;
    pnlEdit: TPanel;
    btnSubmit: TButton;
    edtTitle: TEdit;
    cmbSubject: TComboBox;
    lblEnterTitle: TLabel;
    lblChooseSubect: TLabel;
    lblTypeNotes: TLabel;
    pnlEditNotes: TPanel;
    cmbChooseNotes: TComboBox;
    lblChooseEdit: TLabel;
    redEditNotes: TRichEdit;
    btnChange: TButton;
    btnBack: TButton;
    redHelp: TRichEdit;
    btnUnderstood: TButton;
    procedure FormShow(Sender: TObject);
    procedure pnlEditClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnHomeClick(Sender: TObject);
    procedure btnSubmitClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure cmbChooseNotesChange(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure btnUnderstoodClick(Sender: TObject);
  private
    { Private declarations }
    procedure ComboBoxes;
  public
    { Public declarations }
  end;

var
  frmtNotes: TfrmtNotes;

implementation
Uses
 TeacherHOme_u;

{$R *.dfm}

procedure TfrmtNotes.btnBackClick(Sender: TObject);
begin
  //switches to a different panel
  pnleditnotes.enabled := false;
  pnlEditNotes.visible := false;
  pnlCreateNotes.bringtofront;
  pnlCreateNOtes.visible := true;
  pnlCreateNotes.enabled := True;
end;

procedure TfrmtNotes.btnChangeClick(Sender: TObject);
var
tNote : textfile;
bFound : boolean;
begin
  //rewrites the textfile that contains the note that the teacher is editing
  with dmEducation do
    begin
      if redEditNotes.text = '' then
        begin
          showmessage('Your note cannot be blank, please type your note in the rich edit above');
          redEditNotes.setfocus;
          Exit;
        end;
      tblNotes.open;
      tblNotes.first;
      bFound := False;

      while not(bFOund) do
        begin
          if tblNotes['Title'] = cmbChooseNotes.items[cmbChooseNotes.itemindex] then
            begin
              bFOund := true;
            end
            else
            begin
              tblNotes.next;
            end;
        end;

      assignFile(tNote, tblNotes['Textfile']);
      rewrite(tNote);
      Write(tNote, redEditNotes.text);
      CloseFile(tNote);
      showmessage('Note successfully edited');
    end;
end;

procedure TfrmtNotes.btnHelpClick(Sender: TObject);
begin
  btnUnderstood.show;
  redHelp.show;
  redHelp.bringtofront;
  btnUnderstood.bringtofront;
end;

procedure TfrmtNotes.btnHomeClick(Sender: TObject);
begin
  frmtNotes.hide;
  frmTeacherHome.show;
end;

procedure TfrmtNotes.btnSubmitClick(Sender: TObject);
var
sTitle : string;
iSubject : integer;
bValid,bFound : boolean;
tNote : textfile;
  i: Integer;
begin
  //fetches the subject and title of the notes from the relevant components
 if NOT(messageDlg('Are you sure you would like to create a new note?', MtConfirmation, [mbYes, mbNo], 0) = MrYes) then
   begin
     Showmessage('Cancelled');
     Exit;
   end;

 sTitle := edtTitle.text;

 for i := 1 to Length(sTitle) do     // \/:*?"<>|
  begin
    if Charinset(sTitle[i], ['\','/',':','*','?','"','<','>','|']) then
     begin
       showmessage('Your note title can not contain the following characters: \/:*?"<>|');
       edtTitle.setfocus;
       Exit;
     end;

  end;

 if cmbSubject.itemindex < 0 then
  begin
    showmessage('Please select a subject for your note');
    cmbSubject.setfocus;
    Exit;
  end;

 if sTitle = '' then
  begin
    showmessage('The title cannot be blank');
    edtTitle.setfocus;
    Exit;
  end;

 if redCreateNote.text = '' then
   begin
     showmessage('You cannot create a blank note, type your note in the rich edit above');
     redCreateNote.setfocus;
     Exit;
   end;


with dmEducation do
  begin
    tblSubjects.open;
    tblSubjects.first;
    bFOund := false;
    while not(bFound) do
      Begin
        if tblSubjects['SubjectName'] = cmbSubject.items[cmbSubject.itemindex] then
          begin
            bFOund := true;
          end
          else
          begin
            tblSubjects.next;
          end;
      End;
      iSubject := tblSubjects['SubjectID'];
      tblSubjects.close;


    tblNotes.open;
    tblNotes.first;
    bValid := True;
    while not(tblNotes.eof) do
      begin    //Validation to make sure there aren't notes with the same name
        if tblNotes['Title'] = sTitle then
          begin
            Showmessage('A note with this title already exists, please enter a unique title');
            bValid := false;
          end;
        tblNotes.next;
      end;

    if bValid then
      begin    //Creates a note by writing a text file and then referencing it in a database
        AssignFile(tNote, sTitle + 'N.txt');
        rewrite(tNote);
        write(tNote, redCreateNote.text);

        tblNotes.last;
        tblNotes.insert;
        tblNotes['Title'] := sTitle;
        tblNotes['SubjectID'] := iSubject;
        tblNotes['TeacherID'] := frmLogin.iUserNumber;
        tblNotes['Date'] := now;
        tblNotes['Textfile'] := sTitle + 'N.txt';
        tblNotes.post;

        closeFile(tNote);

        comboBoxes;

        Showmessage('Note successfully created');

        redCreateNote.clear;
        edtTitle.clear;
        cmbSubject.itemindex := -1;
      end;
  end;
end;

procedure TfrmtNotes.btnUnderstoodClick(Sender: TObject);
begin
  redHelp.hide;
  btnUnderstood.hide;
end;

procedure TfrmtNotes.cmbChooseNotesChange(Sender: TObject);            //Add to IPO tables still
var
bFound : boolean;
tFile : textfile;
sLine : string;
begin
  with dmEducation do
    begin
      redEditNotes.clear;
      tblNotes.open;
      tblNotes.first;
      bFound := false;
      while not(tblNotes.eof) AND not(bFound) do
        begin
          if tblNotes['Title'] = cmbChooseNotes.text then
            begin
              assignFIle(tFIle, tblNotes['TextFile']);
              bFound := true;
            end;
          tblNotes.next;
        end;

      reset(tFile);
      while not(eof(tFIle)) do
        begin
          readln(tFile, sLIne);
          redEditNotes.lines.add(sLine);
        end;
    end;
    redEditNotes.readonly := false;
    btnChange.enabled := true;
    closefile(tFIle);
end;

procedure TfrmtNotes.ComboBoxes;
begin
  //Populates comboboxes (cmbSubjects and cmbChoosenotes From tblSubjects and tblNotes respectively)
  cmbSubject.items.clear;
  cmbChoosenotes.items.clear;
  with dmEducation do
  Begin
    tblSubjects.open;
    tblSubjects.first;


    while not tblSubjects.eof do
      begin
        cmbSubject.items.add(tblSubjects['SubjectName']);
        tblSubjects.next;
      end;
    tblSubjects.close;

    tblNotes.open;
    tblNotes.first;

    while not(tblNotes.eof) do
      begin
        cmbChoosenotes.items.add(tblNotes['Title']);
        tblNotes.next;
      end;

    tblNotes.close;
  End;
end;

procedure TfrmtNotes.FormShow(Sender: TObject);
begin
  cmbChooseNotes.style := csDropdownlist;
  redEditNotes.readonly := true;
  btnChange.enabled := false;
  redhelp.Hide;
  redHelp.ReadOnly := true;
  btnUnderstood.Hide;
  //Makes Correct Panel Visible
  pnleditnotes.enabled := false;
  pnlEditNotes.visible := false;
  pnlCreateNotes.bringtofront;
  pnlCreateNOtes.visible := true;
  pnlCreateNotes.enabled := True;
  cmbSubject.style := csDropDownList;


  ComboBoxes;     //Populates Combo Boxes
end;

procedure TfrmtNotes.pnlEditClick(Sender: TObject);
begin
  //Switching Panels
  pnlEditNotes.enabled := true;
  pnlEditNotes.visible := True;
  pnlEditNotes.bringtofront;
  pnlCreateNotes.visible := false;
  pnlCreateNotes.enabled := false;
end;

end.
