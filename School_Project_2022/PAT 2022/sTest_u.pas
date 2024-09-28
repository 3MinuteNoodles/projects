﻿unit sTest_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, dmEducation_u, Login_u, clsTest_u,
  Vcl.ComCtrls, math;

type
  TfrmsTests = class(TForm)
    btnHome: TButton;
    btnHelp: TButton;
    pnlSelectTest: TPanel;
    pnlSearch: TPanel;
    lblTests: TLabel;
    cmbTests: TComboBox;
    edtSearch: TEdit;
    lblSearch: TLabel;
    lblFilters: TLabel;
    btnTitle: TButton;
    btnDate: TButton;
    btnTeacher: TButton;
    chkSubject: TCheckBox;
    lblSubjects: TLabel;
    lblSSubject: TLabel;
    cmbSubjects: TComboBox;
    btnSearch: TButton;
    btnTakeTest: TButton;
    pnltest: TPanel;
    lblQuestion: TLabel;
    lblA1: TLabel;
    lblA2: TLabel;
    lblA3: TLabel;
    lblA4: TLabel;
    lblA5: TLabel;
    btnSubmit: TButton;
    chk1: TCheckBox;
    lblSelect: TLabel;
    chk2: TCheckBox;
    chk3: TCheckBox;
    chk4: TCheckBox;
    chk5: TCheckBox;
    pnlResults: TPanel;
    redResults: TRichEdit;
    btnMenu: TButton;
    lblScore: TLabel;
    memQuestion: TMemo;
    memOption1: TMemo;
    memOption2: TMemo;
    memOption3: TMemo;
    memOption4: TMemo;
    memOption5: TMemo;
    redHelp: TRichEdit;
    btnUnderstood: TButton;
    procedure FormShow(Sender: TObject);
    procedure cmbSubjectsChange(Sender: TObject);
    procedure btnTitleClick(Sender: TObject);
    procedure btnTeacherClick(Sender: TObject);
    procedure btnDateClick(Sender: TObject);
    procedure chkSubjectClick(Sender: TObject);
    procedure edtSearchEnter(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnTakeTestClick(Sender: TObject);
    procedure btnSubmitClick(Sender: TObject);
    procedure btnMenuClick(Sender: TObject);
    procedure btnHomeClick(Sender: TObject);
    procedure btnUnderstoodClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    { Private declarations }
    Test : TTest;
    iCurrent, iMax, iO, iTest : integer;
    arrSubjects : array of String;
    arrStudentSubjects : array of integer;
    bchkChange : boolean;
    arrTitles : array of String;
    arrTestID : array of integer;
    arrSubjID : array of integer;
    arrTextFL : array of String;
    arrTchrID : array of integer;
    arrinclude : array of boolean;
    Procedure LoadArrays;
    Procedure PopulateNextQ;

  public
    { Public declarations }
  end;

var
  frmsTests: TfrmsTests;

implementation
Uses
 StudentHome_u;

{$R *.dfm}

procedure TfrmsTests.btnDateClick(Sender: TObject);
var
 i, j, iTemp : integer;
 sTemp : string;
begin
  //Sets the tops so that the selected one is lower than the rest
  btnTeacher.Top := 54;
  btnDate.top := 51;
  btnTitle.top := 54;

  //Sorts the parrallel arrays by TestID (This achieves the same thing as sorting by date would)
  for i := 1 to Length(arrTitles) do
    begin
      for j := i to Length(arrTitles) - 1do
        begin
          if arrTestID[i - 1] < arrTestID[j] then
            begin
              sTemp := arrTitles[i - 1];
              arrTitles[i -1] := arrTitles[j];
              arrTitles[j] := sTemp;

              iTemp := arrTestID[i - 1];
              arrTestID[i -1] := arrTestID[j];
              arrTestID[j] := iTemp;

              iTemp := arrSubjID[i - 1];
              arrSubjID[i -1] := arrSubjID[j];
              arrSubjID[j] := iTemp;

              sTemp := arrTextFL[i - 1];
              arrTextFL[i -1] := arrTextFL[j];
              arrTextFL[j] := sTemp;

              iTemp := arrTchrID[i - 1];
              arrTchrID[i -1] := arrTchrID[j];
              arrTchrID[j] := iTemp;
            end;
        end;
    end;

    LoadArrays
end;

procedure TfrmsTests.btnHelpClick(Sender: TObject);
begin
  redHelp.show;
  btnUnderstood.show;
end;

procedure TfrmsTests.btnHomeClick(Sender: TObject);
begin
  //Goes back to the student home
  frmSTests.hide;
  frmStudentHome.show;

  //Showing forms for when user joins back
  pnlSelectTest.show;
  pnlSearch.show;
end;

procedure TfrmsTests.btnMenuClick(Sender: TObject);
begin                            //Goes back to the place where you can search and select a test to take
  pnlResults.hide;
  pnlSelectTest.show;
  pnlSearch.show;
  cmbTests.itemindex := -1;
end;

procedure TfrmsTests.btnSearchClick(Sender: TObject);
begin
  LoadArrays;                  //Loads the tests into the combobox again, now taking into account whatever has been entered in edtSearch
end;

procedure TfrmsTests.btnSubmitClick(Sender: TObject);    //This///////////////////////////////////////////////////////////////////////////////////////////////
var
  sCorrect, sSelected : string;
begin

  sCorrect := Test.getCorrect(iCurrent);       //gets which answers are correct for the current question
  sSelected := '';

  if NOT((chk1.Checked) OR (chk2.checked) OR (chk3.checked) OR (chk4.checked) OR (chk5.checked)) then    //Validates that at least one answer has been selected as correct
    begin
      showmessage('At least one answer must be checked');
      Exit;
    end;

  if chk1.Checked then
    Begin
      sSelected := sSelected + '1' + ',';     //Adds the selected option into a string that holds all the selected options
    End;

  if chk2.Checked then
    Begin
      sSelected := sSelected + '2' + ',';
    End;

  if chk3.Checked then
    Begin
      sSelected := sSelected + '3' + ',';
    End;

  if chk4.Checked then
    Begin
      sSelected := sSelected + '4' + ',';
    End;

  if chk5.Checked then
    Begin
      sSelected := sSelected + '5' + ',';
    End;


  if sSelected = sCorrect then                    //checks that the selected options are the same as the correct options
    begin
      Test.incScore(Test.GetPoints(iCurrent));   //if they are the same then increases the users score by however much the question was worth
    end;
  inc(iCurrent); //Sets the current question to the next one

  //resets all the checkboxes
  chk1.checked := false;
  chk2.checked := false;
  chk3.checked := false;
  chk4.checked := false;
  chk5.checked := false;

  //writes info about how the user is doing onto redResults so that the user can see a breakdown of how they did at the end
  redResults.lines.add('Correct Options: ' + copy(sCorrect, 1, Length(sCorrect) - 1));
  redResults.lines.add('Selected Options: ' + copy(sSelected, 1, length(sSelected) - 1));
  redResults.lines.add('Score After This Question: ' + inttostr(Test.getScore) + '/' + inttostr(Test.getCumulativePoints(iCurrent - 1)) + #13);

 if btnSubmit.Caption = 'Next question' then   //Checks where this is the last question
 Begin
    if iCurrent = iMax then
    begin
      btnSubmit.caption := 'View Results';    //Checks if the next question is the last one and changes the caption of btnSubmit if it is
    end;
  PopulateNextQ;       //Loads the question and answers for the next question into the relevant components so that the user can see them
 End
 Else
 Begin     //If this question was the last one then do this
  lblScore.caption := 'You scored: ' +  inttostr(Test.getScore) + '/' + inttostr(Test.GetCumulativePOints(iCurrent - 1)) + '. View the detailed breakdown below';    //sets this label to display the final score

  //goes to the results panel
  pnlTest.hide;
  pnlResults.visible := true;
  pnlResults.bringtofront;
  lblA3.visible := false;
  lblA4.visible := false;
  lblA5.visible := false;
  memOption3.visible := false;
  memOption4.visible := false;
  memOption5.visible := false;
  chk3.visible := false;
  chk4.visible := false;
  chk5.visible := false;

  //Saves the results of the tests into the database
  with dmEducation do
    begin
      tblMArks.open;
      tblMarks.last;
      tblMarks.insert;
      tblMarks['TestID'] := arrTestID[iTest];
      tblMarks['StudentID'] := frmLogin.iUserNumber;
      tblMarks['Mark'] := inttostr(Test.GetScore) + '/' + inttostr(Test.GetCumulativePOints(iCurrent - 1));
      tblmarks['Percent'] := (Test.getScore / Test.GetCumulativePOints(iCurrent - 1)) * 100;
      tblmarks['DateTaken'] := Now;
      tblMarks.post;
    end;
 End;
end;

procedure TfrmsTests.btnTakeTestClick(Sender: TObject);   //This
begin
  btnSubmit.caption := 'Next question';
  //Checks that an option was selected for which test to take
  if cmbTests.ItemINdex = -1 then
    begin
      showmessage('Please select a test to take');
      Exit;
    end;

  iTest := -1;
  repeat
    inc(iTest);
  until (arrTitles[iTest] = cmbTests.text);       //Find the test in the arrays that has the name of the on selected in cmbTests


  Test.Free;
  Test := tTest.create(arrTextFL[iTest]);  //Loads the test into my object class

  //goes to the panel where you take the test
  pnlSelectTest.hide;
  pnlSearch.hide;
  pnlTest.show;
  pnlTest.bringtofront;


  iO := Test.GetNumAnswers;


  //Makes only the labels visible that are needed to display the answers to the questions
  case iO of
    3 : begin lblA3.visible := true; lblA3.Enabled := true; chk3.visible := True; chk3.enabled := true; memOption3.visible := true; end;
    4 : begin lblA3.visible := true; lblA3.Enabled := true; chk3.visible := True; chk3.enabled := true; memOption3.visible := true; lblA4.visible := true; lblA4.Enabled := true; chk4.visible := True; chk4.enabled := true; memOption4.visible := true; end;
    5 : begin lblA3.visible := true; lblA3.Enabled := true; chk3.visible := True; chk3.enabled := true; memOption3.visible := true; lblA4.visible := true; lblA4.Enabled := true; chk4.visible := True; chk4.enabled := true; memOption4.visible := true; lblA5.visible := true; lblA5.Enabled := true; chk5.visible := True; chk5.enabled := true; memOption5.visible := true; end;
  end;

  iCurrent := 0;          //sets the current question to 0
  iMax := Test.getNumQuestions;      //gets the total number of questions
  redResults.lines.clear;
  PopulateNextQ;//loads the next question onto the memos


end;

procedure TfrmsTests.btnTeacherClick(Sender: TObject);      //Sorts the tests so that tests by the same teacher are next to one another
var
 i, j, iTemp : integer;
 sTemp : string;
begin
  btnTeacher.Top := 51;
  btnDate.top := 54;
  btnTitle.top := 54;

  for i := 1 to Length(arrTitles) do
    begin
      for j := i to Length(arrTitles) - 1do
        begin
          if arrTchrID[i - 1] > arrTchrID[j] then
            begin
              sTemp := arrTitles[i - 1];
              arrTitles[i -1] := arrTitles[j];
              arrTitles[j] := sTemp;

              iTemp := arrTestID[i - 1];
              arrTestID[i -1] := arrTestID[j];
              arrTestID[j] := iTemp;

              iTemp := arrSubjID[i - 1];
              arrSubjID[i -1] := arrSubjID[j];
              arrSubjID[j] := iTemp;

              sTemp := arrTextFL[i - 1];
              arrTextFL[i -1] := arrTextFL[j];
              arrTextFL[j] := sTemp;

              iTemp := arrTchrID[i - 1];
              arrTchrID[i -1] := arrTchrID[j];
              arrTchrID[j] := iTemp;
            end;
        end;
    end;

    LoadArrays;
end;

procedure TfrmsTests.btnTitleClick(Sender: TObject);          //Sorts the tests by title(Alphabetically)
var
  i, j, iTemp: Integer;
  sTemp : string;
begin
  btnTeacher.Top := 54;
  btnDate.top := 54;
  btnTitle.top := 51;

  for i := 1 to Length(arrTitles) do
    begin
      for j := i to Length(arrTitles) - 1do
        begin
          if arrTitles[i - 1] > arrTitles[j] then
            begin
              sTemp := arrTitles[i - 1];
              arrTitles[i -1] := arrTitles[j];
              arrTitles[j] := sTemp;

              iTemp := arrTestID[i - 1];
              arrTestID[i -1] := arrTestID[j];
              arrTestID[j] := iTemp;

              iTemp := arrSubjID[i - 1];
              arrSubjID[i -1] := arrSubjID[j];
              arrSubjID[j] := iTemp;

              sTemp := arrTextFL[i - 1];
              arrTextFL[i -1] := arrTextFL[j];
              arrTextFL[j] := sTemp;

              iTemp := arrTchrID[i - 1];
              arrTchrID[i -1] := arrTchrID[j];
              arrTchrID[j] := iTemp;
            end;
        end;
    end;

  LoadArrays;
end;

procedure TfrmsTests.btnUnderstoodClick(Sender: TObject);
begin
  btnUnderstood.hide;
  redHelp.hide;
end;

procedure TfrmsTests.chkSubjectClick(Sender: TObject);
begin
  if chkSubject.checked then
    begin
      cmbSubjects.ItemIndex := 0;
    end;
  bchkChange := true;
  LoadArrays;
end;

procedure TfrmsTests.cmbSubjectsChange(Sender: TObject);
begin
  if cmbSubjects.text <> 'All' then
    begin
      chkSubject.checked := false;
    end;
    if NOT(bchkChange) then
      Begin
        LoadArrays;
        bchkChange := false;
      End;
end;

procedure TfrmsTests.edtSearchEnter(Sender: TObject);
begin
  LoadArrays;
end;

procedure TfrmsTests.FormShow(Sender: TObject);
var
i : integer;
bFound, bError : boolean;
bByte : byte;
begin
  btnTeacher.Top := 54;
  btnDate.top := 54;
  btnTitle.top := 54;

  bchkChange := false;

  redHelp.hide;
  redHelp.readonly := True;
  btnUnderstood.hide;

  btnSubmit.caption := 'Next question';     //Gets the submit button ready because the text is used to check whether it is on the last question
  redResults.readonly := True;
  cmbSubjects.style := csDropDownList;
  cmbTests.style := csDropDownList;
  //Goes to the panel where you can take the test
  pnlResults.hide;
  pnlTest.hide;

  With dmEducation do
    begin
      tblSubjects.open;
      tblSubjects.last;
      bByte := tblSubjects['SubjectID'];
      setlength(arrSubjects, bByte);   //Sets the length of the array holding the subjects to be equal to the number of subjects
      tblSubjects.first;
      cmbSubjects.items.clear;
      cmbSubjects.items.add('All');
      i := 0;
      while not(tblSubjects.eof)do
        begin
          cmbSubjects.items.add(tblSubjects['SubjectName']);   //Loads the subjects from the database into smbSubjects
          arrSubjects[i] := tblSubjects['SubjectName'];        //Also saves the subjects into an array
          inc(i);
          tblSubjects.next;
        end;
      tblSubjects.close;
      cmbSubjects.itemindex := 0;     //sets the default subject to 'All' where none of the subjects are filtered out

      tblStudentSubjects.open;
      tblStudentSubjects.first;
      Setlength(arrStudentSubjects, 1);
      i := 0;
      while not tblStudentSubjects.eof do
      Begin
      if tblStudentSubjects['StudentID'] = frmLogin.iUserNumber then      //Checks if the current user is taking a subject
        begin
          arrStudentSubjects[i] := tblStudentSubjects['SubjectID'];         //Loads all the subjects the current user is taking into an array
          SetLength(arrStudentSubjects, Length(arrStudentSubjects) + 1);    //Makes sure the array is long enough to hold another record in it
          inc(i)
        end;
        tblStudentSubjects.next;
      End;
      SetLength(arrStudentSubjects, Length(arrStudentSubjects) - 1);
      tblStudentSubjects.close;

      bFound := False;

      //initialises the length of all the arrays to 0
      SetLength(arrTestID, 0);
      setLength(arrTitles, 0);
      SetLength(arrSubjID, 0);
      SetLEngth(arrTextFL, 0);
      SetLength(arrTchrID, 0);

      tblTests.open;
      tblTests.first;
      bError := false;
      cmbTests.items.clear;
      while not tblTests.eof do
        begin
          //makes sure the arrays can hold the next record
          setLength(arrTestID, Length(arrTestID) + 1);
          setLength(arrTitles, Length(arrTitles) + 1);
          setLength(arrSubjID, Length(arrSubjID) + 1);
          setLength(arrTextFL, Length(arrTextFL) + 1);
          setLength(arrTchrID, Length(arrTchrID) + 1);

          //Loads the next record into the arrays
          arrTestID[Length(arrTestID) - 1] := tblTests['TestID'];
          arrTitles[Length(arrTitles) - 1] := tblTests['Title'];
          arrSubjID[Length(arrSubjID) - 1] := tblTests['SubjectID'];
          arrTextFL[Length(arrTextFL) - 1] := tblTests['TextFile'];
          arrTchrID[Length(arrTchrID) - 1] := tblTests['TeacherID'];

          if Length(arrStudentSubjects) > 0 then     //checks that the user takes subjects
          Begin
          for i := 0 to Length(ArrSubjects) - 1 do
            begin
              if tblTests['SubjectID'] = arrStudentSubjects[i] then   //checks that the student takes the subject that the test matches with, because by default the program is set to only display subjects the user takes
                begin
                  bFound := True;
                end;
            end;

          if bFound then
            begin
              cmbtests.items.add(tblTests['Title']);  //loads the test into the combobox
            end;
          End
          Else
          begin
            bError := true;
          end;
          tblTests.next;
        end;

        if bError then
          begin
            showmessage('You currently take no subjects, therefore no tests will be displayed when only displaying your subjects');
          end;


      tblTests.close;

     //initialises the labels, checkboxes and memos to not be visible
     lblA3.Visible := false;
     chk3.visible := false;
     memOption3.visible := false;


     lblA4.Visible := false;
     chk4.visible := false;
     memOption4.visible := false;

     lblA5.Visible := false;
     chk5.visible := false;
     memOption5.visible := false;
    end;


end;

procedure TfrmsTests.LoadArrays;
var
 iMax, i, j : integer;
 bFound, bSubject, bEmpty : boolean;
begin
  cmbTests.itemindex := -1;
  cmbtests.items.clear;
  iMax := Length(arrTitles) - 1;    //sets the limit of all the loops that loop throught the arrays
  SetLength(arrInclude, iMax + 1);  //sets the length of an array that says whether each record should be included in the combo box

  for i := 0 to iMax do
    begin
      arrInclude[i] := True;              //by default all record are included
    end;

  if edtSearch.text <> '' then       //if the search edit box is not empty then sets all tests that do not contain the search term in their title to not be included
    begin
      for i := 0 to iMax do
        begin
          if not(pos(Uppercase(edtSearch.text), Uppercase(arrTitles[i])) > 0) then
            begin
              arrInclude[i] := False;
            end;
        end;
    end;
  bEmpty := false;
  if chkSubject.checked then          //If it is set to only display tests for subjects this user takes then sets the program to not include all tests for subjects that the user doesn't take
    begin
      if Length(arrStudentSubjects) = 0 then
        begin
          showmessage('You currently take no subjects, therefore no tests will be displayed when only displaying your subjects');
          bEmpty := true;
        end
        Else
        Begin
        for i := 0 to iMax do
          begin
            bSubject := False;
            for j := 0 to Length(arrStudentSubjects) do
              Begin
                if arrSubjID[i] = arrStudentSubjects[j] then
                  begin
                    bSubject := True;
                  end;
              End;

             if not(bSubject) then
              begin
                arrInclude[i] := False;
              end;
          end;
        End;

    end;

  if cmbSubjects.itemindex <> 0 then   //If a specific subject is selected then checks that the subject of the test matches the one selected otherwise sets it to not include that test
    begin
      for i := 0 to iMax do
        begin
          if not(arrSubjID[i] = cmbSubjects.itemIndex) then
            begin
              arrInclude[i] := False;
            end;
        end;

    end;

  bFound := false;
  for i := 0 to iMax do        //checks that at least one test matches all the above criteria
    begin
      if arrInclude[i] then
        begin
          bFound := True;
        end;
    end;

  if not(bFound) and not(bEmpty) then
    begin
      showmessage('There are no tests that match your search criteria');      //message if no tests match the criteria
      Exit;
    end;

  for i := 0 to iMax do
    begin
      if arrInclude[i] then
        begin
          cmbTests.items.add(arrTitles[i]);        //displays all the tests that should be included in the combo box
        end;
    end;

  pnlTest.hide;

end;

procedure TfrmsTests.PopulateNextQ;        //This after btnTakeTest
var
 iPos : integer;
 sAnswers : string;
begin    //All this loads the next question and answers onto the memos
  if iCurrent <= iMax then
  Begin
   //Loads the question onto the question memo
   MemQuestion.text := Test.GetQuestion(iCurrent);

   //Prepares the results edit so that at the end it will hold all the necessary info
   redResults.lines.add('Question ' + inttostr(iCurrent + 1) + ':');
   redResults.lines.add(memQuestion.text);

   redResults.lines.add('Options:');
   //gets the answers to the next question (they are one string with a character to seperate the different answers)
   sAnswers := Test.GetAnswers(iCurrent);

   //Loads each of the answers into a memo
   iPos := pos('ǝ', sAnswers);
   memOption1.text := copy(sAnswers, 1, ipos - 1);
   redResults.lines.add('1. ' + memOption1.text);
   delete(sAnswers, 1, ipos);

   iPos := pos('ǝ', sAnswers);
   memOption2.text := copy(sAnswers, 1, ipos - 1);
   redResults.lines.add('2. ' + memOption2.text);
   delete(sAnswers, 1, ipos);

   //because there may be only 2 questions checks that there are still more questions to do before displaying on the next few labels
   if lblA3.Visible then
     begin
       iPos := pos('ǝ', sAnswers);
       memOption3.text := copy(sAnswers, 1, ipos - 1);
       redResults.lines.add('3. ' + memOption3.text);
       delete(sAnswers, 1, ipos);
     end;

   if lblA4.Visible then
     begin
       iPos := pos('ǝ', sAnswers);
       memOption4.text := copy(sAnswers, 1, ipos - 1);
       redResults.lines.add('4. ' + memOption4.text);
       delete(sAnswers, 1, ipos);
     end;

   if lblA5.Visible then
     begin
       iPos := pos('ǝ', sAnswers);
       memOption5.text := copy(sAnswers, 1, ipos - 1);
       redResults.lines.add('5. ' + memOption5.text);
       delete(sAnswers, 1, ipos);
     end;

  end;
end;

end.
