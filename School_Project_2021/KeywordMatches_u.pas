
unit KeywordMatches_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, dmdbWhysapp_u, keywords_u,
  Vcl.Buttons;

type
  TfrmKeywordMatches = class(TForm)
    redKeywordMatches: TRichEdit;
    btnBack: TButton;
    btnHelp: TBitBtn;
    redHelpKeywordMatches: TRichEdit;
    btnNotHelp: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnNotHelpClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    { Private declarations }
    var
    iUser1, iUser2, iLetter : integer;
    ArrKeywords : Array[1..256] of string;
    ArrFound : Array[1..256] of boolean;
    ArrWeight : Array[1..256] of integer;
    Function Decrypt(sMessage : string) : string;
  public
    { Public declarations }
  end;

var
  frmKeywordMatches: TfrmKeywordMatches;

implementation

Uses
AdminHome_u;

{$R *.dfm}

procedure TfrmKeywordMatches.btnBackClick(Sender: TObject);
begin
  frmAdminHome.show;
  frmKeywordMatches.hide;
end;

procedure TfrmKeywordMatches.btnHelpClick(Sender: TObject);
begin
  redHelpKeywordMatches.Enabled  := True;
  redhelpKeywordMatches.Visible  := True;
  btnNotHelp.Visible             := True;
  btnNothelp.Enabled             := True;
  redHelpKeywordMatches.readonly := True;
end;

procedure TfrmKeywordMatches.btnNotHelpClick(Sender: TObject);
begin
  redHelpKeywordMatches.Enabled  := False;
  redhelpKeywordMatches.Visible  := False;
  btnNotHelp.Visible             := False;
  btnNothelp.Enabled             := False;
end;

function TfrmKeywordMatches.Decrypt(sMessage: string): string;
var
sName1, sName2, sKey, sDecrypted : string;
iLetterKey : integer;
begin

  //Initialize some variables
  sName1 := '';
  sName2 := '';
  sDecrypted := '';
  iLetterKey := 0;

  with dmdbWHysapp do
    begin
      tblusers.open;
      tblusers.First;
      //Fetches name of one user
      while not(tblusers.eof) and (sName1 = '')do
        begin
          if (tblUsers['UserID'] = iUser1) or (tblUsers['UserID'] = iUser2) then
            begin
              sName1 := tblUsers['First_name'];
            end;
          tblUsers.next;
        end;
       //fetches name of other user
       while not(tblusers.eof) and (sName2 = '') do
        begin
          if (tblUsers['UserID'] = iUser1)  or (tblUsers['UserID'] = iuser2) then
            begin
              sName2 := tblUsers['First_name'];
            end;
          tblUsers.next;
        end;

        //Makes keyword from first 3 letter of each name (With validation for names that are shorter than 3 letters that uses less letters)
        if (Length(sName1) > 2) then
          begin
            if Length(sName2) > 2 then
            begin
              sKey := Copy(sName1, 1, 3) + Copy(sName2, 1, 3);
            end
            else
            begin
              sKey := Copy(sName1, 1, 3) + sName2;
            end;

          end
          else
          begin
            if Length(sName2) > 2 then
            begin
              sKey := sName1 + Copy(sName1, 1, 3);
            end
           else
             begin
              sKey := sName1 + sName2;
              end;
          end;

          //uses key to Decrypt message
         while sMessage <> '' do
           Begin
             inc(iLetterKey);     //controls letter used from key

             if iLetterKey > length(sKey) then
              begin
                iLetterKey := 1; //resets letter if the position is higher than length of key
              end;

             iLetter := strtoint(copy(sMessage, 1, pos(' ', sMessage) - 1)); //Fetches letter from Message
             Delete(sMessage, 1, pos(' ', sMessage));   //Deletes letter from message after it has been fetched
             iLetter := iLetter - ord(sKey[iLetterKey]); //subtracts key letter from message letter to get decrypted message letter
             sDecrypted := sDecrypted + chr(iLetter);      //Saves decrypted letter into decrypted message

           end;




    end;

    Result := sDecrypted;     //output of decrypt function

end;

procedure TfrmKeywordMatches.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Application.Terminate;
end;

procedure TfrmKeywordMatches.FormShow(Sender: TObject);
var
tKeywords : textFile;
iNumKeywords, icurrentKeyword, i, iWeight : integer;
bFound, bFoundTotal : boolean;
sMessage, sKeywords, sKeyword, sTemp : string;
begin

  //initialization of variables and gets ready to display on rich edit
  redKeywordmatches.lines.clear;
  iNumKeywords := 0;
  bFOund := False;
  bFoundTotal := false;
  redKeywordMatches.lines.add('Keyword Matches:' + #13 + '___________________________________' + #13);

  //Fetches keywords from textfile
  assignFile(tKeywords, 'Keywords.txt');
  if fileExists('Keywords.txt') then
    begin
      Reset(tKeywords);
      while not EOF(tKEywords) do
        begin
          inc(iNumKeywords);
          readln(tKEywords, arrKeywords[iNumKeywords]);  //reads keyword (the keyword is encrypted)
        end;
    end
    Else
    begin
      showmessage('Error finding keyword file');
      Exit;
    end;

  Closefile(tKeywords);

    //check that keywords were actually found
    if arrKeywords[1] = '' then
      begin
        redKeywordMatches.lines.add('You currently have no keywords to match with');
        iNumKeywords := 0;
        Exit;
      end;


  with dmdbWHysapp do
   Begin
     tblMessages.open;
     tblMessages.first;

     while not tblMessages.eof do
      begin
        bFound := false;
        iCurrentKeyword := 1;

        //finds which two users were messageing each other (used in decryption of messages)
        iUser1 := tblMessages['SenderID'];
        iUser2 := tblMessages['ReceiverID'];

        //Gets decrypted message
        sMessage := Decrypt(tblMessages['Message']);

        //Sets array to false that tells which keywords were found
        for i := 1 to iNumKeywords do
          begin
            arrFound[i] := False;

            sTemp := frmManageKeywords.Decryptkeyword(ArrKeywords[i]);

            arrWeight[i] :=  strtoint(COPY(sTemp, pos('�', sTemp) + 1, 2));
          end;

          //checks if each keyword can be found in the message
        for iCurrentKeyword := 1 to iNumKeywords do
          begin
            if pos(UpperCase(COPY(frmManageKeywords.Decryptkeyword(arrKeywords[iCurrentKeyword]), 1, pos('�', frmManageKeywords.Decryptkeyword(arrKeywords[iCurrentKeyword])) - 1)), UpperCase(sMessage)) > 0 then
            Begin
              bFound := true;
              bFoundTotal := true;

              arrFound[iCurrentKeyword] := True;
            End;
          end;



         if bFound then  //if any keywords were found in the message then displays
          begin

              sKeywords := '';
              iWeight := 0;

              //Makes a string that holds all keywords that were found
              for i := 1 to iNumKeywords do
                begin
                  if arrFound[i] = True then
                    begin
                      sKeyword := FrmManageKeywords.Decryptkeyword(ArrKeywords[i]);

                      sKeywords := sKeywords + COPY(sKeyword, 1, pos('�', sKeyword) - 1) + ', ';     //Puts all found keywords into a string to display to user

                      iWeight := iWeight + arrWeight[i];
                    end;
                end;

               Delete(sKeywords, Length(sKeywords) - 1, 2);  //Deletes comma at end of string



              //Displays Messages
              redKeywordMatches.lines.add('Sent by user: ' + inttostr(tblMessages['SenderID']));
              redKeywordMatches.lines.add('Received by user: ' + inttostr(tblMessages['ReceiverID']));
              redKeywordMatches.lines.add('Date: ' + Datetostr(tblMessages['DateSent']));
              redKeywordMatches.lines.add('Keywords found: ' + sKeywords);
              redKeywordMatches.lines.add('Weight of keywords found: ' + inttostr(iWeight));
              redKeywordMatches.lines.add('Message ' + inttostr(tblMessages['MessageNo']) + ': ' + sMessage);
              redKeywordMatches.lines.add('----------------');

          end;

        tblMessages.next;
      end;
   End;

   if not(bFoundTotal) then
    begin
      redKeywordmatches.lines.add('There are no messages containing keywords');
    end;


    redKeywordMatches.selstart := 0;
    redKeywordMatches.readonly := True;
end;

end.
