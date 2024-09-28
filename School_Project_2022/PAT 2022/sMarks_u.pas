unit sMarks_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, System.UITypes, Vcl.ComCtrls;

type
  TfrmsMarks = class(TForm)
    dbgMarks: TDBGrid;
    btnHome: TButton;
    btnHelp: TButton;
    lblMarks: TLabel;
    pnlSort: TPanel;
    lblSort: TLabel;
    btnRecent: TButton;
    btnPercent: TButton;
    btnSubject: TButton;
    pnlFilters: TPanel;
    lblFilter: TLabel;
    btnAboveAv: TButton;
    btnBelowAv: TButton;
    btnbelowValue: TButton;
    lblSubject: TLabel;
    cmbSubjects: TComboBox;
    btnAboveValue: TButton;
    lblCurrentFilter: TLabel;
    lblCurrentSort: TLabel;
    btnOld: TButton;
    btnNoSort: TButton;
    btnNoFilter: TButton;
    redHelp: TRichEdit;
    btnUnderstood: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnHomeClick(Sender: TObject);
    procedure btnRecentClick(Sender: TObject);
    procedure btnOldClick(Sender: TObject);
    procedure btnPercentClick(Sender: TObject);
    procedure btnSubjectClick(Sender: TObject);
    procedure btnAboveAvClick(Sender: TObject);
    procedure btnbelowValueClick(Sender: TObject);
    procedure btnAboveValueClick(Sender: TObject);
    procedure btnBelowAvClick(Sender: TObject);
    procedure btnNoSortClick(Sender: TObject);
    procedure btnNoFilterClick(Sender: TObject);
    procedure cmbSubjectsChange(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure btnUnderstoodClick(Sender: TObject);
  private
    { Private declarations }
    cSort : char;
    sFilter : string;
    bDoValue, bCancelled : boolean;
    rValue : real;
    iLengthTitle, iLengthSubName : integer;
    Procedure LoadGrid;
    Procedure LoadSort;
    Procedure LoadFilter;
  public
    { Public declarations }
  end;

var
  frmsMarks: TfrmsMarks;

implementation
Uses
 dmEducation_u, Login_u, StudentHome_u;

{$R *.dfm}
//Start of code to change filter
procedure TfrmsMarks.btnAboveAvClick(Sender: TObject);
begin
  sFilter := 'VAA';
  lblCurrentFilter.caption := 'Current Filter: Only showing marks above average';
  LoadGrid;
end;

procedure TfrmsMarks.btnAboveValueClick(Sender: TObject);
begin
  sFilter := 'VAV';
  bDoValue := True;
  LoadGrid;
  if NOT(bCancelled) then
  Begin
    lblCurrentFilter.caption := 'Current Filter: Only showing marks above ' + floattostr(rValue) + ' percent';
  End;
  bCancelled := False;
end;

procedure TfrmsMarks.btnBelowAvClick(Sender: TObject);
begin
  sFilter := 'VBA';
  bDoValue := True;
  lblCurrentFilter.caption := 'Current Filter: Only showing marks below average';
  LoadGrid;
end;

procedure TfrmsMarks.btnbelowValueClick(Sender: TObject);
begin
  sFilter := 'VBV';
  bDoValue := True;
  LoadGrid;
  if NOT(bCancelled) then
  Begin
    lblCurrentFilter.caption := 'Current Filter: Only showing marks below ' + floattostr(rValue) + ' percent';
  End;
  bCancelled := False;
end;

procedure TfrmsMarks.btnHelpClick(Sender: TObject);
begin
  redHelp.show;
  btnUnderstood.show;
end;

procedure TfrmsMarks.btnHomeClick(Sender: TObject);
begin
  frmsMarks.hide;
  frmStudentHome.show;
end;
procedure TfrmsMarks.btnNoFilterClick(Sender: TObject);
begin
  sFilter := 'None';
  LoadGrid;
  lblCurrentFilter.caption := 'Current Filter: None';
end;
//End of code to change filter

//Start of buttons to change how it sorts
procedure TfrmsMarks.btnNoSortClick(Sender: TObject);
begin
  cSort := '0';
  lblCurrentSort.caption := 'Current Sort: None';
  LoadGrid;
end;

procedure TfrmsMarks.btnOldClick(Sender: TObject);
begin
  cSort := 'O';                                      //sets the variable used to check how it should sort
  lblCurrentSort.caption := 'Current Sort: Oldest First';   //Display how it is sorting
  LoadGrid;                                          //Prodedure to Display and sort and filter the dbGrid
end;

procedure TfrmsMarks.btnPercentClick(Sender: TObject);
begin
  cSort := 'P';
  lblCurrentSort.caption := 'Current Sort: Percentage';
  LoadGrid;
end;

procedure TfrmsMarks.btnRecentClick(Sender: TObject);
begin
  cSort := 'N';
  lblCurrentSort.caption := 'Current Sort: Newest First';
  LoadGrid;
end;

procedure TfrmsMarks.btnSubjectClick(Sender: TObject);
begin
  cSort := 'S';
  lblCurrentSort.Caption := 'Current Sort: Subject';
  LoadGrid;
end;

procedure TfrmsMarks.btnUnderstoodClick(Sender: TObject);
begin
  btnUnderstood.hide;
  redHelp.hide;
end;

procedure TfrmsMarks.cmbSubjectsChange(Sender: TObject);
begin
  LoadGrid;
end;

//End of buttons to change how it sorts

procedure TfrmsMarks.FormShow(Sender: TObject);
begin
  redHelp.hide;
  btnUnderstood.hide;
  redHelp.readonly := true;
  dbgMarks.readonly := true;
  bCancelled := False;
  lblCurrentFilter.caption := 'Current Filter: None';     //Displays that there is no current filter
  lblCurrentSort.caption := 'Current Sort: None';         //Displays that there is no current Sort
  cSort := '0';
  sFilter := 'None';
  with dmEducation do
    begin      //Populating a combobox with all the subjects in it
      cmbSubjects.items.clear;
      cmbSubjects.style := csDropDownlist;
      tblSubjects.open;
      tblSubjects.first;
      cmbSubjects.items.add('All');
      cmbSubjects.Itemindex := 0;       //Sets the default for the combobox to display all subjects
      while not(tblSubjects.eof) do
        begin
          cmbSubjects.items.add(tblSubjects['SubjectName']);
          tblSubjects.next;
        end;
    end;

  With dmEducation do
    begin    //Gets the number of character in the longest subjectName and test Title so that the width of the columns can be set in the dbGrid
      qryMarks.sql.clear;
      qryMarks.sql.add('SELECT MAX(LEN(tblTests.Title)) AS [MAX] FROM tblTests');
      qryMarks.open;
      iLengthTitle := qryMarks.FieldByName('MAX').AsInteger;
      qryMarks.sql.clear;
      qryMarks.sql.add('SELECT MAX(LEN(tblSubjects.SubjectName)) AS [MAX] FROM tblSubjects');
      qryMarks.open;
      iLengthSubName := qryMarks.FieldByName('MAX').AsInteger;
    end;

  LoadGrid;
end;
procedure TfrmsMarks.LoadFilter;
var
 sValue, sCheckPoints : string;
 bValid : boolean;
  i: integer;
begin
  if sFilter = 'None' then
    begin
      Exit;
    end;
  With dmEducation do
   begin     //This procdure enters the filter that will be used into the SQL statement in qryMarks
     if sFilter = 'VAA' then
       begin
         qryMarks.sql.add(' AND tblMarks.percent >= ROUND((SELECT AVG(tblMarks.Percent) FROM tblMarks WHERE tblMarks.testID = tblTests.TestID), 2)');   //Applies a WHERE statement so only values above the average will be shown
       end
       Else if sFilter = 'VBA' then
       begin
         qryMarks.sql.add(' AND tblMarks.percent <= ROUND((SELECT AVG(tblMarks.Percent) FROM tblMarks WHERE tblMarks.testID = tblTests.TestID), 2)');  //Applies a Filter where only values below the average will be shown
       end
       Else if ((sFilter = 'VAV') OR (sFilter = 'VBV')) AND (bDoValue) then
       begin
       {/////////////}
         Repeat
         bValid := True;
         sValue := InputBox('Enter a percent', 'Enter a real number:', '');   //Lets the user enter a value so that either the marks above or below that can be displayed
         //Start of validation
         if sValue = '' then   //Presence check
          Begin
            bValid := False;
            IF NOT(messageDlg('The value you have entered is blank, would you like to try enter a new value?', MtConfirmation, [mbYes, mbNo], 0) = MrYes) Then
              begin
                bCancelled := true;
                Showmessage('Cancelled');
                Exit;
              end;
          End;

          if bValid then
          Begin
          for i := 1 to Length(sValue) do
            begin   //Checks to see that all characters are numbers or points
              if NOT(CharInSet(sValue[i], ['0'..'9', '.'])) then
                begin
                  if bValid then
                  Begin
                    bValid := false;
                    showmessage('The entered percent must be a number, if you have a decimal you must use a "."');
                  End;
                end;
            end;
          End;

          if (bValid) And (sValue[Length(sValue)] = '.') then
          begin                                 //checks that the last character is not a decimal point
            bValid := false;
            showmessage('The entered percent can not end with a "."');
          end;

          if (Length(sValue) - pos('.', sValue) > 2) AND NOT(pos('.', sValue) <= 0) AND (bValid) then
           begin          //checks that there are only up to two numbers after the decimal point
             showmessage('You may only have up to two decimal places in your entered value');
             bValid := false;
           end;

           sCheckPoints := sValue;
           if (pos('.', sCheckPOints) > 0) and (bValid) then
            begin      //Checks that there is only one decimal point
              Delete(sCheckPOints, 1, pos('.', sCheckPOints));
              if pos('.', sCheckPOints) > 0 then
                begin
                  showmessage('There can only be one decimal point in the entered value');
                  bValid := false;
                end;
            end;

          if bValid then
          Begin
          rValue := strtoFloat(sValue);  //Saves the entered and validated value into a real variable

          if (rValue > 100) OR (rValue < 0) then
            begin
              showmessage('Value must be between 0 and 100');
              bValid := false;
            end;
          End;

          //End of validation

         Until bValid;
       {//////////}
         bDoValue := false;

       end;

     if (sFilter = 'VAV') Then
         begin
           qryMarks.SQL.add(' AND tblMarks.percent >= ' + floattostr(rValue));   //Filters to it only displays values above the entered value
         end
         Else if sFilter = 'VBV' then
         begin
           qrymarks.SQL.add(' AND tblMarks.percent <= ' + floattostr(rValue));   //Filters to it only displays values below the entered value
         end;
   end;
end;

procedure TfrmsMarks.LoadGrid;
begin
  with dmEducation do
    begin

      qryMarks.sql.clear;
      qryMarks.sql.add('SELECT tblTests.title, tblSubjects.subjectName, tblMarks.mark, tblMarks.percent, ROUND((SELECT AVG(tblMarks.Percent) FROM tblMarks WHERE tblMarks.testID = tblTests.TestID), 2) AS [Average Percent] ');       //Field that should display
      qryMarks.sql.add('FROM (tblTests INNER JOIN tblSubjects ON tblSubjects.SubjectID = tblTests.SubjectID) INNER JOIN tblMarks ON tblTests.TestID = tblMarks.TestID');                                       //Tables from which the fields should come being linked together
      qryMarks.sql.add('WHERE tblMarks.StudentID = ' + inttostr(frmLogin.iUserNumber));                                                                                                                        //Makes sure it only displays info for the signed in user
      if cmbSubjects.Text <> 'All' then
       Begin
         qryMarks.sql.add('AND tblSubjects.SubjectName = ' + quotedStr(cmbSubjects.Text));   //Makes the qry only display for the selected subject if the user has selected one
       End;
      LoadFilter;             //Loads the selected filter into the sql statement
      LoadSort;               //Loads the selected sort into the sql statement
      qryMarks.open;
      //Sets the width of the Title and SubjectName columns in the db Grid
      dbgMarks.columns[0].width := iLengthTitle * 9;
      dbgMarks.columns[1].width := iLengthSubName * 9;
    end;
end;

procedure TfrmsMarks.LoadSort;
begin
with dmEducation do
Begin                            //Applies the sort to the SQL statement
  if cSort = 'O' then
    begin
      qryMarks.sql.add(' ORDER BY tblMarks.DateTaken ASC') ;
    end
    else if cSort = 'N' then
    begin
      qryMarks.sql.add(' ORDER BY tblMarks.DateTaken DESC');
    end
    Else if cSort = 'P' then
    begin
      qryMarks.sql.add(' ORDER BY tblMarks.Percent DESC')  ;
    end
    Else if cSort = 'S' then
    begin
      qryMarks.sql.add(' ORDER BY tblSubjects.SubjectName');
    end;

End;
end;

end.
