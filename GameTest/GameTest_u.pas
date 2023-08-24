unit GameTest_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Math;

type
    TForm1 = class(TForm)
    pnlFloor: TPanel;
    Shape1: TShape;
    Timer1: TTimer;
    btnKey: TButton;
    Timer2: TTimer;
    Panel1: TPanel;
    pnlCannon: TPanel;
    pnlScore: TPanel;
    procedure Timer1Timer(Sender: TObject);
    procedure btnKeyKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnKeyKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Timer2Timer(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
  private
    { Private declarations }
    bW, bA, bS, bD, bShort : boolean;

    iJump, iGun, iDifficulty, iCheck, iscore  : integer;

    Fall1, Fall2, Fall3, Fall4, Fall5, Fall6, Fall7, Fall8, Fall9, Fall10, Fall11, Fall12, Fall13, Fall14, Fall15, Fall16, Fall17, Fall18, Fall19, Fall20, Blt1, Blt2, Blt3, Blt4 : TShape;

    arrFall : Array[1..20] of boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



procedure TForm1.btnKeyKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
  cKey : Char;
begin
  cKEy := CHar(key);
  case cKey of
    'A' : bA := False;
    'D' : bD := False;
  end;
end;

procedure TForm1.btnKeyKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
  cKey : Char;
begin
  cKEy := CHar(key);


  case cKey of
    'W' : if shape1.top + shape1.height = 433 then Begin bW := True; iJump := 30; End;
    'A' : bA := True;

    'D' : bD := True;
  end;
end;

procedure TForm1.Panel1Click(Sender: TObject);
var
 i : integer;
begin
    btnKey.setfocus;
  for i := 1 to 20 do
    begin
      arrFall[i] := False;
    end;

     bShort := false;

     timer1.enabled := True;
     timer2.enabled := True;

     panel1.visible := False;
     panel1.enabled := False;

     iGun := 1;
     idifficulty := 10;
     iCheck := 0;
     iScore := 0;
     pnlScore.caption := 'Score: 0';

      blt1 := Tshape.create(Form1); blt1.Parent := Form1; blt1.visible := False;
      blt2 := Tshape.create(Form1); blt2.Parent := Form1; blt2.visible := False;
      blt3 := Tshape.create(Form1); blt3.Parent := Form1; blt3.visible := False;
      blt4 := Tshape.create(Form1); blt4.Parent := Form1; blt4.visible := False;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  i, idle : integer;
  bDead   : boolean;
begin
 btnKey.setfocus;
 bDead := False;
 inc(idle);

 if idle > 10000 then
  begin
    idle := 0;
  end;

  if bW then
    begin
       if iJump > 20 then
         Begin
          shape1.top := shape1.top - 6;
          pnlCannon.top := pnlCannon.top - 6;
          dec(iJump);
         End;

       if (iJump > 0) and (iJump < 21) then
         begin
           shape1.top := shape1.top + 3;
           pnlCannon.top := pnlCannon.top + 3;
           dec(iJump);
         end;

       if iJump = 0 then
         begin
           bW := False;
         end;
    end;


  if bA then
    begin
      if shape1.left > 3 then
       Begin
         shape1.Left := shape1.left - 3;
         pnlCannon.left := pnlCannon.left - 3;
       End
       Else
        begin
          shape1.left    := 0;
          pnlCannon.left := 25;
        end;
    end;

  if bD then
    begin
       if Shape1.left + Shape1.width < 1177 then
         Begin
           shape1.Left    := shape1.left + 3;
           pnlCannon.left := pnlCannon.left + 3;
         End;
    end;

  form1.updateactions;

  if not(bD) and not(bW) and not(bA) and not(bShort) and (idle MOD 7 = 0) then
    begin
      shape1.height := shape1.height - 5;
      shape1.top    := shape1.top    + 5;
      bShort := True;
    end
    Else if (bShort) and (idle MOD 7 = 0)then
         begin
           shape1.height := shape1.height + 5;
           shape1.top    := shape1.top    - 5;
           bShort := False;
         end;

  form1.updateactions;

  for i := 1 to 10 do
    begin
      if arrFall[i] then
        begin
          case i of
            1 : Begin if (Fall1.Top  + Fall1.Height  > 432) Then Begin Fall1.Free;  arrFall[i] := False; Break; End Else Begin Fall1.top  := Fall1.Top  + 1; form1.refresh; End;  IF Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - Fall1.top)  + Sqr((Shape1.Left + (Shape1.Width/2)) - Fall1.left))  < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall1.top  + Fall1.Height))  + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall1.Left  + Fall1.Width)))   < 32.5 then Begin bDead := True; Break; End; {} If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall1.top))  + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall1.Left  + Fall1.Width)))   < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall1.top  + Fall1.Height))  + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall1.Left)))   < 32.5 then Begin bDead := True; Break; End; End;
            2 : Begin if (Fall2.Top  + Fall2.Height  > 432) Then Begin Fall2.Free;  arrFall[i] := False; Break; End Else Begin Fall2.top  := Fall2.Top  + 2; form1.refresh; End;  IF Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - Fall2.top)  + Sqr((Shape1.Left + (Shape1.Width/2)) - Fall2.left))  < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall2.top  + Fall2.Height))  + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall2.Left  + Fall2.Width)))   < 32.5 then Begin bDead := True; Break; End; {} If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall2.top))  + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall2.Left  + Fall2.Width)))   < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall2.top  + Fall2.Height))  + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall2.Left)))   < 32.5 then Begin bDead := True; Break; End; End;
            3 : Begin if (Fall3.Top  + Fall3.Height  > 432) Then Begin Fall3.Free;  arrFall[i] := False; Break; End Else Begin Fall3.top  := Fall3.Top  + 3; form1.refresh; End;  IF Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - Fall3.top)  + Sqr((Shape1.Left + (Shape1.Width/2)) - Fall3.left))  < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall3.top  + Fall3.Height))  + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall3.Left  + Fall3.Width)))   < 32.5 then Begin bDead := True; Break; End; {} If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall3.top))  + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall3.Left  + Fall3.Width)))   < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall3.top  + Fall3.Height))  + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall3.Left)))   < 32.5 then Begin bDead := True; Break; End; End;
            4 : Begin if (Fall4.Top  + Fall4.Height  > 432) Then Begin Fall4.Free;  arrFall[i] := False; Break; End Else Begin Fall4.top  := Fall4.Top  + 4; form1.refresh; End;  IF Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - Fall4.top)  + Sqr((Shape1.Left + (Shape1.Width/2)) - Fall4.left))  < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall4.top  + Fall4.Height))  + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall4.Left  + Fall4.Width)))   < 32.5 then Begin bDead := True; Break; End; {} If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall4.top))  + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall4.Left  + Fall4.Width)))   < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall4.top  + Fall4.Height))  + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall4.Left)))   < 32.5 then Begin bDead := True; Break; End; End;
            5 : Begin if (Fall5.Top  + Fall5.Height  > 432) Then Begin Fall5.Free;  arrFall[i] := False; Break; End Else Begin Fall5.top  := Fall5.Top  + 5; form1.refresh; End;  IF Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - Fall5.top)  + Sqr((Shape1.Left + (Shape1.Width/2)) - Fall5.left))  < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall5.top  + Fall5.Height))  + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall5.Left  + Fall5.Width)))   < 32.5 then Begin bDead := True; Break; End; {} If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall5.top))  + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall5.Left  + Fall5.Width)))   < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall5.top  + Fall5.Height))  + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall5.Left)))   < 32.5 then Begin bDead := True; Break; End; End;
            6 : Begin if (Fall6.Top  + Fall6.Height  > 432) Then Begin Fall6.Free;  arrFall[i] := False; Break; End Else Begin Fall6.top  := Fall6.Top  + 6; form1.refresh; End;  IF Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - Fall6.top)  + Sqr((Shape1.Left + (Shape1.Width/2)) - Fall6.left))  < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall6.top  + Fall6.Height))  + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall6.Left  + Fall6.Width)))   < 32.5 then Begin bDead := True; Break; End; {} If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall6.top))  + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall6.Left  + Fall6.Width)))   < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall6.top  + Fall6.Height))  + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall6.Left)))   < 32.5 then Begin bDead := True; Break; End; End;
            7 : Begin if (Fall7.Top  + Fall7.Height  > 432) Then Begin Fall7.Free;  arrFall[i] := False; Break; End Else Begin Fall7.top  := Fall7.Top  + 7; form1.refresh; End;  IF Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - Fall7.top)  + Sqr((Shape1.Left + (Shape1.Width/2)) - Fall7.left))  < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall7.top  + Fall7.Height))  + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall7.Left  + Fall7.Width)))   < 32.5 then Begin bDead := True; Break; End; {} If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall7.top))  + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall7.Left  + Fall7.Width)))   < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall7.top  + Fall7.Height))  + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall7.Left)))   < 32.5 then Begin bDead := True; Break; End; End;
            8 : Begin if (Fall8.Top  + Fall8.Height  > 432) Then Begin Fall8.Free;  arrFall[i] := False; Break; End Else Begin Fall8.top  := Fall8.Top  + 7; form1.refresh; End;  IF Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - Fall8.top)  + Sqr((Shape1.Left + (Shape1.Width/2)) - Fall8.left))  < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall8.top  + Fall8.Height))  + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall8.Left  + Fall8.Width)))   < 32.5 then Begin bDead := True; Break; End; {} If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall8.top))  + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall8.Left  + Fall8.Width)))   < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall8.top  + Fall8.Height))  + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall8.Left)))   < 32.5 then Begin bDead := True; Break; End; End;
            9 : Begin if (Fall9.Top  + Fall9.Height  > 432) Then Begin Fall9.Free;  arrFall[i] := False; Break; End Else Begin Fall9.top  := Fall9.Top  + 7; form1.refresh; End;  IF Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - Fall9.top)  + Sqr((Shape1.Left + (Shape1.Width/2)) - Fall9.left))  < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall9.top  + Fall9.Height))  + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall9.Left  + Fall9.Width)))   < 32.5 then Begin bDead := True; Break; End; {} If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall9.top))  + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall9.Left  + Fall9.Width)))   < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall9.top  + Fall9.Height))  + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall9.Left)))   < 32.5 then Begin bDead := True; Break; End; End;
            10: Begin if (Fall10.Top + Fall10.Height > 432) Then Begin Fall10.Free; arrFall[i] := False; Break; End Else Begin Fall10.top := Fall10.Top + 7; form1.refresh; End;  IF Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - Fall10.top) + Sqr((Shape1.Left + (Shape1.Width/2)) - Fall10.left)) < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall10.top + Fall10.Height)) + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall10.Left + Fall10.Width)))  < 32.5 then Begin bDead := True; Break; End; {} If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall10.top)) + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall10.Left + Fall10.Width)))  < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall10.top + Fall10.Height)) + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall10.Left)))  < 32.5 then Begin bDead := True; Break; End; End;
            11: Begin if (Fall11.Top + Fall11.Height > 432) Then Begin Fall11.Free; arrFall[i] := False; Break; End Else Begin Fall11.top := Fall11.Top + 7; form1.refresh; End;  IF Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - Fall11.top) + Sqr((Shape1.Left + (Shape1.Width/2)) - Fall11.left)) < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall11.top + Fall11.Height)) + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall11.Left + Fall11.Width)))  < 32.5 then Begin bDead := True; Break; End; {} If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall11.top)) + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall11.Left + Fall11.Width)))  < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall11.top + Fall11.Height)) + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall11.Left)))  < 32.5 then Begin bDead := True; Break; End; End;
            12: Begin if (Fall12.Top + Fall12.Height > 432) Then Begin Fall12.Free; arrFall[i] := False; Break; End Else Begin Fall12.top := Fall12.Top + 7; form1.refresh; End;  IF Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - Fall12.top) + Sqr((Shape1.Left + (Shape1.Width/2)) - Fall12.left)) < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall12.top + Fall12.Height)) + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall12.Left + Fall12.Width)))  < 32.5 then Begin bDead := True; Break; End; {} If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall12.top)) + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall12.Left + Fall12.Width)))  < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall12.top + Fall12.Height)) + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall12.Left)))  < 32.5 then Begin bDead := True; Break; End; End;
            13: Begin if (Fall13.Top + Fall13.Height > 432) Then Begin Fall13.Free; arrFall[i] := False; Break; End Else Begin Fall13.top := Fall13.Top + 7; form1.refresh; End;  IF Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - Fall13.top) + Sqr((Shape1.Left + (Shape1.Width/2)) - Fall13.left)) < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall13.top + Fall13.Height)) + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall13.Left + Fall13.Width)))  < 32.5 then Begin bDead := True; Break; End; {} If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall13.top)) + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall13.Left + Fall13.Width)))  < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall13.top + Fall13.Height)) + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall13.Left)))  < 32.5 then Begin bDead := True; Break; End; End;
            14: Begin if (Fall14.Top + Fall14.Height > 432) Then Begin Fall14.Free; arrFall[i] := False; Break; End Else Begin Fall14.top := Fall14.Top + 7; form1.refresh; End;  IF Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - Fall14.top) + Sqr((Shape1.Left + (Shape1.Width/2)) - Fall14.left)) < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall14.top + Fall14.Height)) + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall14.Left + Fall14.Width)))  < 32.5 then Begin bDead := True; Break; End; {} If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall14.top)) + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall14.Left + Fall14.Width)))  < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall14.top + Fall14.Height)) + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall14.Left)))  < 32.5 then Begin bDead := True; Break; End; End;
            15: Begin if (Fall15.Top + Fall15.Height > 432) Then Begin Fall15.Free; arrFall[i] := False; Break; End Else Begin Fall15.top := Fall15.Top + 7; form1.refresh; End;  IF Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - Fall15.top) + Sqr((Shape1.Left + (Shape1.Width/2)) - Fall15.left)) < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall15.top + Fall15.Height)) + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall15.Left + Fall15.Width)))  < 32.5 then Begin bDead := True; Break; End; {} If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall15.top)) + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall15.Left + Fall15.Width)))  < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall15.top + Fall15.Height)) + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall15.Left)))  < 32.5 then Begin bDead := True; Break; End; End;
            16: Begin if (Fall16.Top + Fall16.Height > 432) Then Begin Fall16.Free; arrFall[i] := False; Break; End Else Begin Fall16.top := Fall16.Top + 7; form1.refresh; End;  IF Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - Fall16.top) + Sqr((Shape1.Left + (Shape1.Width/2)) - Fall16.left)) < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall16.top + Fall16.Height)) + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall16.Left + Fall16.Width)))  < 32.5 then Begin bDead := True; Break; End; {} If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall16.top)) + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall16.Left + Fall16.Width)))  < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall16.top + Fall16.Height)) + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall16.Left)))  < 32.5 then Begin bDead := True; Break; End; End;
            17: Begin if (Fall17.Top + Fall17.Height > 432) Then Begin Fall17.Free; arrFall[i] := False; Break; End Else Begin Fall17.top := Fall17.Top + 7; form1.refresh; End;  IF Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - Fall17.top) + Sqr((Shape1.Left + (Shape1.Width/2)) - Fall17.left)) < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall17.top + Fall17.Height)) + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall17.Left + Fall17.Width)))  < 32.5 then Begin bDead := True; Break; End; {} If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall17.top)) + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall17.Left + Fall17.Width)))  < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall17.top + Fall17.Height)) + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall17.Left)))  < 32.5 then Begin bDead := True; Break; End; End;
            18: Begin if (Fall18.Top + Fall18.Height > 432) Then Begin Fall18.Free; arrFall[i] := False; Break; End Else Begin Fall18.top := Fall18.Top + 7; form1.refresh; End;  IF Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - Fall18.top) + Sqr((Shape1.Left + (Shape1.Width/2)) - Fall18.left)) < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall18.top + Fall18.Height)) + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall18.Left + Fall18.Width)))  < 32.5 then Begin bDead := True; Break; End; {} If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall18.top)) + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall18.Left + Fall18.Width)))  < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall18.top + Fall18.Height)) + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall18.Left)))  < 32.5 then Begin bDead := True; Break; End; End;
            19: Begin if (Fall19.Top + Fall19.Height > 432) Then Begin Fall19.Free; arrFall[i] := False; Break; End Else Begin Fall19.top := Fall19.Top + 7; form1.refresh; End;  IF Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - Fall19.top) + Sqr((Shape1.Left + (Shape1.Width/2)) - Fall19.left)) < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall19.top + Fall19.Height)) + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall19.Left + Fall19.Width)))  < 32.5 then Begin bDead := True; Break; End; {} If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall19.top)) + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall19.Left + Fall19.Width)))  < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall19.top + Fall19.Height)) + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall19.Left)))  < 32.5 then Begin bDead := True; Break; End; End;
            20: Begin if (Fall20.Top + Fall20.Height > 432) Then Begin Fall20.Free; arrFall[i] := False; Break; End Else Begin Fall20.top := Fall20.Top + 7; form1.refresh; End;  IF Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - Fall20.top) + Sqr((Shape1.Left + (Shape1.Width/2)) - Fall20.left)) < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall20.top + Fall20.Height)) + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall20.Left + Fall20.Width)))  < 32.5 then Begin bDead := True; Break; End; {} If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall20.top)) + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall20.Left + Fall20.Width)))  < 32.5 then Begin bDead := True; Break; End; If Sqrt(Sqr((Shape1.Top + (Shape1.Height/2)) - (Fall20.top + Fall20.Height)) + Sqr((Shape1.Left + (Shape1.Width/2)) - (Fall20.Left)))  < 32.5 then Begin bDead := True; Break; End; End;
          end;
        end;
    end;
  form1.update;

  blt1.top := blt1.top - 2;
  blt2.top := blt2.top - 2;
  blt3.top := blt3.top - 2;
  blt4.top := blt4.top - 2;

  for i := 1 to 20 do
    begin
      if arrFall[i] then
        Begin
          case i of
            1  : Begin if (blt1.visible) and (blt1.Left > Fall1.left)  and (blt1.left < Fall1.left  + Fall1.width)  and (blt1.top > Fall1.top)  and (blt1.top < Fall1.top  + Fall1.height)  then Begin Fall1.free;  arrFall[i] := False; blt1.visible := False; inc(iScore); End; End;
            2  : Begin if (blt1.visible) and (blt1.Left > Fall2.left)  and (blt1.left < Fall2.left  + Fall2.width)  and (blt1.top > Fall2.top)  and (blt1.top < Fall2.top  + Fall2.height)  then Begin Fall2.free;  arrFall[i] := False; blt1.visible := False; inc(iScore); End; End;
            3  : Begin if (blt1.visible) and (blt1.Left > Fall3.left)  and (blt1.left < Fall3.left  + Fall3.width)  and (blt1.top > Fall3.top)  and (blt1.top < Fall3.top  + Fall3.height)  then Begin Fall3.free;  arrFall[i] := False; blt1.visible := False; inc(iScore); End; End;
            4  : Begin if (blt1.visible) and (blt1.Left > Fall4.left)  and (blt1.left < Fall4.left  + Fall4.width)  and (blt1.top > Fall4.top)  and (blt1.top < Fall4.top  + Fall4.height)  then Begin Fall4.free;  arrFall[i] := False; blt1.visible := False; inc(iScore); End; End;
            5  : Begin if (blt1.visible) and (blt1.Left > Fall5.left)  and (blt1.left < Fall5.left  + Fall5.width)  and (blt1.top > Fall5.top)  and (blt1.top < Fall5.top  + Fall5.height)  then Begin Fall5.free;  arrFall[i] := False; blt1.visible := False; inc(iScore); End; End;
            6  : Begin if (blt1.visible) and (blt1.Left > Fall6.left)  and (blt1.left < Fall6.left  + Fall6.width)  and (blt1.top > Fall6.top)  and (blt1.top < Fall6.top  + Fall6.height)  then Begin Fall6.free;  arrFall[i] := False; blt1.visible := False; inc(iScore); End; End;
            7  : Begin if (blt1.visible) and (blt1.Left > Fall7.left)  and (blt1.left < Fall7.left  + Fall7.width)  and (blt1.top > Fall7.top)  and (blt1.top < Fall7.top  + Fall7.height)  then Begin Fall7.free;  arrFall[i] := False; blt1.visible := False; inc(iScore); End; End;
            8  : Begin if (blt1.visible) and (blt1.Left > Fall8.left)  and (blt1.left < Fall8.left  + Fall8.width)  and (blt1.top > Fall8.top)  and (blt1.top < Fall8.top  + Fall8.height)  then Begin Fall8.free;  arrFall[i] := False; blt1.visible := False; inc(iScore); End; End;
            9  : Begin if (blt1.visible) and (blt1.Left > Fall9.left)  and (blt1.left < Fall9.left  + Fall9.width)  and (blt1.top > Fall9.top)  and (blt1.top < Fall9.top  + Fall9.height)  then Begin Fall9.free;  arrFall[i] := False; blt1.visible := False; inc(iScore); End; End;
            10 : Begin if (blt1.visible) and (blt1.Left > Fall10.left) and (blt1.left < Fall10.left + Fall10.width) and (blt1.top > Fall10.top) and (blt1.top < Fall10.top + Fall10.height) then Begin Fall10.free; arrFall[i] := False; blt1.visible := False; inc(iScore); End; End;
            11 : Begin if (blt1.visible) and (blt1.Left > Fall11.left) and (blt1.left < Fall11.left + Fall11.width) and (blt1.top > Fall11.top) and (blt1.top < Fall11.top + Fall11.height) then Begin Fall11.free; arrFall[i] := False; blt1.visible := False; inc(iScore); End; End;
            12 : Begin if (blt1.visible) and (blt1.Left > Fall12.left) and (blt1.left < Fall12.left + Fall12.width) and (blt1.top > Fall12.top) and (blt1.top < Fall12.top + Fall12.height) then Begin Fall12.free; arrFall[i] := False; blt1.visible := False; inc(iScore); End; End;
            13 : Begin if (blt1.visible) and (blt1.Left > Fall13.left) and (blt1.left < Fall13.left + Fall13.width) and (blt1.top > Fall13.top) and (blt1.top < Fall13.top + Fall13.height) then Begin Fall13.free; arrFall[i] := False; blt1.visible := False; inc(iScore); End; End;
            14 : Begin if (blt1.visible) and (blt1.Left > Fall14.left) and (blt1.left < Fall14.left + Fall14.width) and (blt1.top > Fall14.top) and (blt1.top < Fall14.top + Fall14.height) then Begin Fall14.free; arrFall[i] := False; blt1.visible := False; inc(iScore); End; End;
            15 : Begin if (blt1.visible) and (blt1.Left > Fall15.left) and (blt1.left < Fall15.left + Fall15.width) and (blt1.top > Fall15.top) and (blt1.top < Fall15.top + Fall15.height) then Begin Fall15.free; arrFall[i] := False; blt1.visible := False; inc(iScore); End; End;
            16 : Begin if (blt1.visible) and (blt1.Left > Fall16.left) and (blt1.left < Fall16.left + Fall16.width) and (blt1.top > Fall16.top) and (blt1.top < Fall16.top + Fall16.height) then Begin Fall16.free; arrFall[i] := False; blt1.visible := False; inc(iScore); End; End;
            17 : Begin if (blt1.visible) and (blt1.Left > Fall17.left) and (blt1.left < Fall17.left + Fall17.width) and (blt1.top > Fall17.top) and (blt1.top < Fall17.top + Fall17.height) then Begin Fall17.free; arrFall[i] := False; blt1.visible := False; inc(iScore); End; End;
            18 : Begin if (blt1.visible) and (blt1.Left > Fall18.left) and (blt1.left < Fall18.left + Fall18.width) and (blt1.top > Fall18.top) and (blt1.top < Fall18.top + Fall18.height) then Begin Fall18.free; arrFall[i] := False; blt1.visible := False; inc(iScore); End; End;
            19 : Begin if (blt1.visible) and (blt1.Left > Fall19.left) and (blt1.left < Fall19.left + Fall19.width) and (blt1.top > Fall19.top) and (blt1.top < Fall19.top + Fall19.height) then Begin Fall19.free; arrFall[i] := False; blt1.visible := False; inc(iScore); End; End;
            20 : Begin if (blt1.visible) and (blt1.Left > Fall20.left) and (blt1.left < Fall20.left + Fall20.width) and (blt1.top > Fall20.top) and (blt1.top < Fall20.top + Fall20.height) then Begin Fall20.free; arrFall[i] := False; blt1.visible := False; inc(iScore); End; End;
          end;

          case i of
            1  : Begin if (blt2.visible) and (blt2.Left > Fall1.left)  and (blt2.left < Fall1.left  + Fall1.width)  and (blt2.top > Fall1.top)  and (blt2.top < Fall1.top  + Fall1.height)  then Begin Fall1.free;  arrFall[i] := False; blt2.visible := False; inc(iScore); End; End;
            2  : Begin if (blt2.visible) and (blt2.Left > Fall2.left)  and (blt2.left < Fall2.left  + Fall2.width)  and (blt2.top > Fall2.top)  and (blt2.top < Fall2.top  + Fall2.height)  then Begin Fall2.free;  arrFall[i] := False; blt2.visible := False; inc(iScore); End; End;
            3  : Begin if (blt2.visible) and (blt2.Left > Fall3.left)  and (blt2.left < Fall3.left  + Fall3.width)  and (blt2.top > Fall3.top)  and (blt2.top < Fall3.top  + Fall3.height)  then Begin Fall3.free;  arrFall[i] := False; blt2.visible := False; inc(iScore); End; End;
            4  : Begin if (blt2.visible) and (blt2.Left > Fall4.left)  and (blt2.left < Fall4.left  + Fall4.width)  and (blt2.top > Fall4.top)  and (blt2.top < Fall4.top  + Fall4.height)  then Begin Fall4.free;  arrFall[i] := False; blt2.visible := False; inc(iScore); End; End;
            5  : Begin if (blt2.visible) and (blt2.Left > Fall5.left)  and (blt2.left < Fall5.left  + Fall5.width)  and (blt2.top > Fall5.top)  and (blt2.top < Fall5.top  + Fall5.height)  then Begin Fall5.free;  arrFall[i] := False; blt2.visible := False; inc(iScore); End; End;
            6  : Begin if (blt2.visible) and (blt2.Left > Fall6.left)  and (blt2.left < Fall6.left  + Fall6.width)  and (blt2.top > Fall6.top)  and (blt2.top < Fall6.top  + Fall6.height)  then Begin Fall6.free;  arrFall[i] := False; blt2.visible := False; inc(iScore); End; End;
            7  : Begin if (blt2.visible) and (blt2.Left > Fall7.left)  and (blt2.left < Fall7.left  + Fall7.width)  and (blt2.top > Fall7.top)  and (blt2.top < Fall7.top  + Fall7.height)  then Begin Fall7.free;  arrFall[i] := False; blt2.visible := False; inc(iScore); End; End;
            8  : Begin if (blt2.visible) and (blt2.Left > Fall8.left)  and (blt2.left < Fall8.left  + Fall8.width)  and (blt2.top > Fall8.top)  and (blt2.top < Fall8.top  + Fall8.height)  then Begin Fall8.free;  arrFall[i] := False; blt2.visible := False; inc(iScore); End; End;
            9  : Begin if (blt2.visible) and (blt2.Left > Fall9.left)  and (blt2.left < Fall9.left  + Fall9.width)  and (blt2.top > Fall9.top)  and (blt2.top < Fall9.top  + Fall9.height)  then Begin Fall9.free;  arrFall[i] := False; blt2.visible := False; inc(iScore); End; End;
            10 : Begin if (blt2.visible) and (blt2.Left > Fall10.left) and (blt2.left < Fall10.left + Fall10.width) and (blt2.top > Fall10.top) and (blt2.top < Fall10.top + Fall10.height) then Begin Fall10.free; arrFall[i] := False; blt2.visible := False; inc(iScore); End; End;
            11 : Begin if (blt2.visible) and (blt2.Left > Fall11.left) and (blt2.left < Fall11.left + Fall11.width) and (blt2.top > Fall11.top) and (blt2.top < Fall11.top + Fall11.height) then Begin Fall11.free; arrFall[i] := False; blt2.visible := False; inc(iScore); End; End;
            12 : Begin if (blt2.visible) and (blt2.Left > Fall12.left) and (blt2.left < Fall12.left + Fall12.width) and (blt2.top > Fall12.top) and (blt2.top < Fall12.top + Fall12.height) then Begin Fall12.free; arrFall[i] := False; blt2.visible := False; inc(iScore); End; End;
            13 : Begin if (blt2.visible) and (blt2.Left > Fall13.left) and (blt2.left < Fall13.left + Fall13.width) and (blt2.top > Fall13.top) and (blt2.top < Fall13.top + Fall13.height) then Begin Fall13.free; arrFall[i] := False; blt2.visible := False; inc(iScore); End; End;
            14 : Begin if (blt2.visible) and (blt2.Left > Fall14.left) and (blt2.left < Fall14.left + Fall14.width) and (blt2.top > Fall14.top) and (blt2.top < Fall14.top + Fall14.height) then Begin Fall14.free; arrFall[i] := False; blt2.visible := False; inc(iScore); End; End;
            15 : Begin if (blt2.visible) and (blt2.Left > Fall15.left) and (blt2.left < Fall15.left + Fall15.width) and (blt2.top > Fall15.top) and (blt2.top < Fall15.top + Fall15.height) then Begin Fall15.free; arrFall[i] := False; blt2.visible := False; inc(iScore); End; End;
            16 : Begin if (blt2.visible) and (blt2.Left > Fall16.left) and (blt2.left < Fall16.left + Fall16.width) and (blt2.top > Fall16.top) and (blt2.top < Fall16.top + Fall16.height) then Begin Fall16.free; arrFall[i] := False; blt2.visible := False; inc(iScore); End; End;
            17 : Begin if (blt2.visible) and (blt2.Left > Fall17.left) and (blt2.left < Fall17.left + Fall17.width) and (blt2.top > Fall17.top) and (blt2.top < Fall17.top + Fall17.height) then Begin Fall17.free; arrFall[i] := False; blt2.visible := False; inc(iScore); End; End;
            18 : Begin if (blt2.visible) and (blt2.Left > Fall18.left) and (blt2.left < Fall18.left + Fall18.width) and (blt2.top > Fall18.top) and (blt2.top < Fall18.top + Fall18.height) then Begin Fall18.free; arrFall[i] := False; blt2.visible := False; inc(iScore); End; End;
            19 : Begin if (blt2.visible) and (blt2.Left > Fall19.left) and (blt2.left < Fall19.left + Fall19.width) and (blt2.top > Fall19.top) and (blt2.top < Fall19.top + Fall19.height) then Begin Fall19.free; arrFall[i] := False; blt2.visible := False; inc(iScore); End; End;
            20 : Begin if (blt2.visible) and (blt2.Left > Fall20.left) and (blt2.left < Fall20.left + Fall20.width) and (blt2.top > Fall20.top) and (blt2.top < Fall20.top + Fall20.height) then Begin Fall20.free; arrFall[i] := False; blt2.visible := False; inc(iScore); End; End;
          end;

          case i of
            1  : Begin if (blt3.visible) and (blt3.Left > Fall1.left)  and (blt3.left < Fall1.left  + Fall1.width)  and (blt3.top > Fall1.top)  and (blt3.top < Fall1.top  + Fall1.height)  then Begin Fall1.free;  arrFall[i] := False; blt3.visible := False; inc(iScore); End; End;
            2  : Begin if (blt3.visible) and (blt3.Left > Fall2.left)  and (blt3.left < Fall2.left  + Fall2.width)  and (blt3.top > Fall2.top)  and (blt3.top < Fall2.top  + Fall2.height)  then Begin Fall2.free;  arrFall[i] := False; blt3.visible := False; inc(iScore); End; End;
            3  : Begin if (blt3.visible) and (blt3.Left > Fall3.left)  and (blt3.left < Fall3.left  + Fall3.width)  and (blt3.top > Fall3.top)  and (blt3.top < Fall3.top  + Fall3.height)  then Begin Fall3.free;  arrFall[i] := False; blt3.visible := False; inc(iScore); End; End;
            4  : Begin if (blt3.visible) and (blt3.Left > Fall4.left)  and (blt3.left < Fall4.left  + Fall4.width)  and (blt3.top > Fall4.top)  and (blt3.top < Fall4.top  + Fall4.height)  then Begin Fall4.free;  arrFall[i] := False; blt3.visible := False; inc(iScore); End; End;
            5  : Begin if (blt3.visible) and (blt3.Left > Fall5.left)  and (blt3.left < Fall5.left  + Fall5.width)  and (blt3.top > Fall5.top)  and (blt3.top < Fall5.top  + Fall5.height)  then Begin Fall5.free;  arrFall[i] := False; blt3.visible := False; inc(iScore); End; End;
            6  : Begin if (blt3.visible) and (blt3.Left > Fall6.left)  and (blt3.left < Fall6.left  + Fall6.width)  and (blt3.top > Fall6.top)  and (blt3.top < Fall6.top  + Fall6.height)  then Begin Fall6.free;  arrFall[i] := False; blt3.visible := False; inc(iScore); End; End;
            7  : Begin if (blt3.visible) and (blt3.Left > Fall7.left)  and (blt3.left < Fall7.left  + Fall7.width)  and (blt3.top > Fall7.top)  and (blt3.top < Fall7.top  + Fall7.height)  then Begin Fall7.free;  arrFall[i] := False; blt3.visible := False; inc(iScore); End; End;
            8  : Begin if (blt3.visible) and (blt3.Left > Fall8.left)  and (blt3.left < Fall8.left  + Fall8.width)  and (blt3.top > Fall8.top)  and (blt3.top < Fall8.top  + Fall8.height)  then Begin Fall8.free;  arrFall[i] := False; blt3.visible := False; inc(iScore); End; End;
            9  : Begin if (blt3.visible) and (blt3.Left > Fall9.left)  and (blt3.left < Fall9.left  + Fall9.width)  and (blt3.top > Fall9.top)  and (blt3.top < Fall9.top  + Fall9.height)  then Begin Fall9.free;  arrFall[i] := False; blt3.visible := False; inc(iScore); End; End;
            10 : Begin if (blt3.visible) and (blt3.Left > Fall10.left) and (blt3.left < Fall10.left + Fall10.width) and (blt3.top > Fall10.top) and (blt3.top < Fall10.top + Fall10.height) then Begin Fall10.free; arrFall[i] := False; blt3.visible := False; inc(iScore); End; End;
            11 : Begin if (blt3.visible) and (blt3.Left > Fall11.left) and (blt3.left < Fall11.left + Fall11.width) and (blt3.top > Fall11.top) and (blt3.top < Fall11.top + Fall11.height) then Begin Fall11.free; arrFall[i] := False; blt3.visible := False; inc(iScore); End; End;
            12 : Begin if (blt3.visible) and (blt3.Left > Fall12.left) and (blt3.left < Fall12.left + Fall12.width) and (blt3.top > Fall12.top) and (blt3.top < Fall12.top + Fall12.height) then Begin Fall12.free; arrFall[i] := False; blt3.visible := False; inc(iScore); End; End;
            13 : Begin if (blt3.visible) and (blt3.Left > Fall13.left) and (blt3.left < Fall13.left + Fall13.width) and (blt3.top > Fall13.top) and (blt3.top < Fall13.top + Fall13.height) then Begin Fall13.free; arrFall[i] := False; blt3.visible := False; inc(iScore); End; End;
            14 : Begin if (blt3.visible) and (blt3.Left > Fall14.left) and (blt3.left < Fall14.left + Fall14.width) and (blt3.top > Fall14.top) and (blt3.top < Fall14.top + Fall14.height) then Begin Fall14.free; arrFall[i] := False; blt3.visible := False; inc(iScore); End; End;
            15 : Begin if (blt3.visible) and (blt3.Left > Fall15.left) and (blt3.left < Fall15.left + Fall15.width) and (blt3.top > Fall15.top) and (blt3.top < Fall15.top + Fall15.height) then Begin Fall15.free; arrFall[i] := False; blt3.visible := False; inc(iScore); End; End;
            16 : Begin if (blt3.visible) and (blt3.Left > Fall16.left) and (blt3.left < Fall16.left + Fall16.width) and (blt3.top > Fall16.top) and (blt3.top < Fall16.top + Fall16.height) then Begin Fall16.free; arrFall[i] := False; blt3.visible := False; inc(iScore); End; End;
            17 : Begin if (blt3.visible) and (blt3.Left > Fall17.left) and (blt3.left < Fall17.left + Fall17.width) and (blt3.top > Fall17.top) and (blt3.top < Fall17.top + Fall17.height) then Begin Fall17.free; arrFall[i] := False; blt3.visible := False; inc(iScore); End; End;
            18 : Begin if (blt3.visible) and (blt3.Left > Fall18.left) and (blt3.left < Fall18.left + Fall18.width) and (blt3.top > Fall18.top) and (blt3.top < Fall18.top + Fall18.height) then Begin Fall18.free; arrFall[i] := False; blt3.visible := False; inc(iScore); End; End;
            19 : Begin if (blt3.visible) and (blt3.Left > Fall19.left) and (blt3.left < Fall19.left + Fall19.width) and (blt3.top > Fall19.top) and (blt3.top < Fall19.top + Fall19.height) then Begin Fall19.free; arrFall[i] := False; blt3.visible := False; inc(iScore); End; End;
            20 : Begin if (blt3.visible) and (blt3.Left > Fall20.left) and (blt3.left < Fall20.left + Fall20.width) and (blt3.top > Fall20.top) and (blt3.top < Fall20.top + Fall20.height) then Begin Fall20.free; arrFall[i] := False; blt3.visible := False; inc(iScore); End; End;
          end;

          case i of
            1  : Begin if (blt4.visible) and (blt4.Left > Fall1.left)  and (blt4.left < Fall1.left  + Fall1.width)  and (blt4.top > Fall1.top)  and (blt4.top < Fall1.top  + Fall1.height)  then Begin Fall1.free;  arrFall[i] := False; blt4.visible := False; inc(iScore); End; End;
            2  : Begin if (blt4.visible) and (blt4.Left > Fall2.left)  and (blt4.left < Fall2.left  + Fall2.width)  and (blt4.top > Fall2.top)  and (blt4.top < Fall2.top  + Fall2.height)  then Begin Fall2.free;  arrFall[i] := False; blt4.visible := False; inc(iScore); End; End;
            3  : Begin if (blt4.visible) and (blt4.Left > Fall3.left)  and (blt4.left < Fall3.left  + Fall3.width)  and (blt4.top > Fall3.top)  and (blt4.top < Fall3.top  + Fall3.height)  then Begin Fall3.free;  arrFall[i] := False; blt4.visible := False; inc(iScore); End; End;
            4  : Begin if (blt4.visible) and (blt4.Left > Fall4.left)  and (blt4.left < Fall4.left  + Fall4.width)  and (blt4.top > Fall4.top)  and (blt4.top < Fall4.top  + Fall4.height)  then Begin Fall4.free;  arrFall[i] := False; blt4.visible := False; inc(iScore); End; End;
            5  : Begin if (blt4.visible) and (blt4.Left > Fall5.left)  and (blt4.left < Fall5.left  + Fall5.width)  and (blt4.top > Fall5.top)  and (blt4.top < Fall5.top  + Fall5.height)  then Begin Fall5.free;  arrFall[i] := False; blt4.visible := False; inc(iScore); End; End;
            6  : Begin if (blt4.visible) and (blt4.Left > Fall6.left)  and (blt4.left < Fall6.left  + Fall6.width)  and (blt4.top > Fall6.top)  and (blt4.top < Fall6.top  + Fall6.height)  then Begin Fall6.free;  arrFall[i] := False; blt4.visible := False; inc(iScore); End; End;
            7  : Begin if (blt4.visible) and (blt4.Left > Fall7.left)  and (blt4.left < Fall7.left  + Fall7.width)  and (blt4.top > Fall7.top)  and (blt4.top < Fall7.top  + Fall7.height)  then Begin Fall7.free;  arrFall[i] := False; blt4.visible := False; inc(iScore); End; End;
            8  : Begin if (blt4.visible) and (blt4.Left > Fall8.left)  and (blt4.left < Fall8.left  + Fall8.width)  and (blt4.top > Fall8.top)  and (blt4.top < Fall8.top  + Fall8.height)  then Begin Fall8.free;  arrFall[i] := False; blt4.visible := False; inc(iScore); End; End;
            9  : Begin if (blt4.visible) and (blt4.Left > Fall9.left)  and (blt4.left < Fall9.left  + Fall9.width)  and (blt4.top > Fall9.top)  and (blt4.top < Fall9.top  + Fall9.height)  then Begin Fall9.free;  arrFall[i] := False; blt4.visible := False; inc(iScore); End; End;
            10 : Begin if (blt4.visible) and (blt4.Left > Fall10.left) and (blt4.left < Fall10.left + Fall10.width) and (blt4.top > Fall10.top) and (blt4.top < Fall10.top + Fall10.height) then Begin Fall10.free; arrFall[i] := False; blt4.visible := False; inc(iScore); End; End;
            11 : Begin if (blt4.visible) and (blt4.Left > Fall11.left) and (blt4.left < Fall11.left + Fall11.width) and (blt4.top > Fall11.top) and (blt4.top < Fall11.top + Fall11.height) then Begin Fall11.free; arrFall[i] := False; blt4.visible := False; inc(iScore); End; End;
            12 : Begin if (blt4.visible) and (blt4.Left > Fall12.left) and (blt4.left < Fall12.left + Fall12.width) and (blt4.top > Fall12.top) and (blt4.top < Fall12.top + Fall12.height) then Begin Fall12.free; arrFall[i] := False; blt4.visible := False; inc(iScore); End; End;
            13 : Begin if (blt4.visible) and (blt4.Left > Fall13.left) and (blt4.left < Fall13.left + Fall13.width) and (blt4.top > Fall13.top) and (blt4.top < Fall13.top + Fall13.height) then Begin Fall13.free; arrFall[i] := False; blt4.visible := False; inc(iScore); End; End;
            14 : Begin if (blt4.visible) and (blt4.Left > Fall14.left) and (blt4.left < Fall14.left + Fall14.width) and (blt4.top > Fall14.top) and (blt4.top < Fall14.top + Fall14.height) then Begin Fall14.free; arrFall[i] := False; blt4.visible := False; inc(iScore); End; End;
            15 : Begin if (blt4.visible) and (blt4.Left > Fall15.left) and (blt4.left < Fall15.left + Fall15.width) and (blt4.top > Fall15.top) and (blt4.top < Fall15.top + Fall15.height) then Begin Fall15.free; arrFall[i] := False; blt4.visible := False; inc(iScore); End; End;
            16 : Begin if (blt4.visible) and (blt4.Left > Fall16.left) and (blt4.left < Fall16.left + Fall16.width) and (blt4.top > Fall16.top) and (blt4.top < Fall16.top + Fall16.height) then Begin Fall16.free; arrFall[i] := False; blt4.visible := False; inc(iScore); End; End;
            17 : Begin if (blt4.visible) and (blt4.Left > Fall17.left) and (blt4.left < Fall17.left + Fall17.width) and (blt4.top > Fall17.top) and (blt4.top < Fall17.top + Fall17.height) then Begin Fall17.free; arrFall[i] := False; blt4.visible := False; inc(iScore); End; End;
            18 : Begin if (blt4.visible) and (blt4.Left > Fall18.left) and (blt4.left < Fall18.left + Fall18.width) and (blt4.top > Fall18.top) and (blt4.top < Fall18.top + Fall18.height) then Begin Fall18.free; arrFall[i] := False; blt4.visible := False; inc(iScore); End; End;
            19 : Begin if (blt4.visible) and (blt4.Left > Fall19.left) and (blt4.left < Fall19.left + Fall19.width) and (blt4.top > Fall19.top) and (blt4.top < Fall19.top + Fall19.height) then Begin Fall19.free; arrFall[i] := False; blt4.visible := False; inc(iScore); End; End;
            20 : Begin if (blt4.visible) and (blt4.Left > Fall20.left) and (blt4.left < Fall20.left + Fall20.width) and (blt4.top > Fall20.top) and (blt4.top < Fall20.top + Fall20.height) then Begin Fall20.free; arrFall[i] := False; blt4.visible := False; inc(iScore); End; End;
          end;

        End;
    end;

  if bDead then
    begin
      for i := 1 to 20 do
        begin
          if arrFall[i] then
            begin
              case i of
                1  : Begin Fall1.free;  End;
                2  : Begin Fall2.free;  End;
                3  : Begin Fall3.free;  End;
                4  : Begin Fall4.free;  End;
                5  : Begin Fall5.free;  End;
                6  : Begin Fall6.free;  End;
                7  : Begin Fall7.free;  End;
                8  : Begin Fall8.free;  End;
                9  : Begin Fall9.free;  End;
                10 : Begin Fall10.free; End;
                11 : Begin Fall11.free; End;
                12 : Begin Fall12.free; End;
                13 : Begin Fall13.free; End;
                14 : Begin Fall14.free; End;
                15 : Begin Fall15.free; End;
                16 : Begin Fall16.free; End;
                17 : Begin Fall17.free; End;
                18 : Begin Fall18.free; End;
                19 : Begin Fall19.free; End;
                20 : Begin Fall20.free; End;
              end;
            end;

          arrFall[i] := false;
        end;

      blt1.free;
      blt2.free;
      blt3.free;
      blt4.free;


      ba    := False;
      bd    := False;
      iJump := 0;

      Shape1.left := 512;
      shape1.top  := 368;
      shape1.height := 65;
      shape1.width := 65;
      pnlCannon.left := 537;
      pnlCannon.Top  := 352;

      timer1.enabled := False;
      timer2.enabled := False;
      panel1.visible := True;
      panel1.enabled := True;
    end;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
var
 bYes : boolean;
 i: integer;
begin
  Randomize;
  for i := 1 to 20 do
    begin
      bYes := false;
      if arrFall[i] = False then
        Begin
          arrFall[i] := boolean(random(iDifficulty) = 0);
          bYes := True;
        End;

      if arrFall[i] and bYes then
        begin
          case i of
            1 : Begin Fall1  := TShape.create(Form1); Fall1.Parent  := Form1; Fall1.Shape  := stRectangle; Fall1.Brush.color  := clPurple; Fall1.Height  := random(50) + 20; Fall1.Width  := random(50) + 20; Fall1.Top  := 0 - Fall1.Height;  Fall1.Left  := Random(form1.width) - 10; End;
            2 : Begin Fall2  := TShape.create(Form1); Fall2.Parent  := Form1; Fall2.Shape  := stRectangle; Fall2.Brush.color  := clPurple; Fall2.Height  := random(50) + 20; Fall2.Width  := random(50) + 20; Fall2.Top  := 0 - Fall2.Height;  Fall2.Left  := Random(form1.width) - 10; End;
            3 : Begin Fall3  := TShape.create(Form1); Fall3.Parent  := Form1; Fall3.Shape  := stRectangle; Fall3.Brush.color  := clPurple; Fall3.Height  := random(50) + 20; Fall3.Width  := random(50) + 20; Fall3.Top  := 0 - Fall3.Height;  Fall3.Left  := Random(form1.width) - 10; End;
            4 : Begin Fall4  := TShape.create(Form1); Fall4.Parent  := Form1; Fall4.Shape  := stRectangle; Fall4.Brush.color  := clPurple; Fall4.Height  := random(50) + 20; Fall4.Width  := random(50) + 20; Fall4.Top  := 0 - Fall4.Height;  Fall4.Left  := Random(form1.width) - 10; End;
            5 : Begin Fall5  := TShape.create(Form1); Fall5.Parent  := Form1; Fall5.Shape  := stRectangle; Fall5.Brush.color  := clPurple; Fall5.Height  := random(50) + 20; Fall5.Width  := random(50) + 20; Fall5.Top  := 0 - Fall5.Height;  Fall5.Left  := Random(form1.width) - 10; End;
            6 : Begin Fall6  := TShape.create(Form1); Fall6.Parent  := Form1; Fall6.Shape  := stRectangle; Fall6.Brush.color  := clPurple; Fall6.Height  := random(50) + 20; Fall6.Width  := random(50) + 20; Fall6.Top  := 0 - Fall6.Height;  Fall6.Left  := Random(form1.width) - 10; End;
            7 : Begin Fall7  := TShape.create(Form1); Fall7.Parent  := Form1; Fall7.Shape  := stRectangle; Fall7.Brush.color  := clPurple; Fall7.Height  := random(50) + 20; Fall7.Width  := random(50) + 20; Fall7.Top  := 0 - Fall7.Height;  Fall7.Left  := Random(form1.width) - 10; End;
            8 : Begin Fall8  := TShape.create(Form1); Fall8.Parent  := Form1; Fall8.Shape  := stRectangle; Fall8.Brush.color  := clPurple; Fall8.Height  := random(50) + 20; Fall8.Width  := random(50) + 20; Fall8.Top  := 0 - Fall8.Height;  Fall8.Left  := Random(form1.width) - 10; End;
            9 : Begin Fall9  := TShape.create(Form1); Fall9.Parent  := Form1; Fall9.Shape  := stRectangle; Fall9.Brush.color  := clPurple; Fall9.Height  := random(50) + 20; Fall9.Width  := random(50) + 20; Fall9.Top  := 0 - Fall9.Height;  Fall9.Left  := Random(form1.width) - 10; End;
            10: Begin Fall10 := TShape.create(Form1); Fall10.Parent := Form1; Fall10.Shape := stRectangle; Fall10.Brush.color := clPurple; Fall10.Height := random(50) + 20; Fall10.Width := random(50) + 20; Fall10.Top := 0 - Fall10.Height; Fall10.Left := Random(form1.width) - 10; End;
            11: Begin Fall11 := TShape.create(Form1); Fall11.Parent := Form1; Fall11.Shape := stRectangle; Fall11.Brush.color := clPurple; Fall11.Height := random(50) + 20; Fall11.Width := random(50) + 20; Fall11.Top := 0 - Fall11.Height; Fall11.Left := Random(form1.width) - 10; End;
            12: Begin Fall12 := TShape.create(Form1); Fall12.Parent := Form1; Fall12.Shape := stRectangle; Fall12.Brush.color := clPurple; Fall12.Height := random(50) + 20; Fall12.Width := random(50) + 20; Fall12.Top := 0 - Fall12.Height; Fall12.Left := Random(form1.width) - 10; End;
            13: Begin Fall13 := TShape.create(Form1); Fall13.Parent := Form1; Fall13.Shape := stRectangle; Fall13.Brush.color := clPurple; Fall13.Height := random(50) + 20; Fall13.Width := random(50) + 20; Fall13.Top := 0 - Fall13.Height; Fall13.Left := Random(form1.width) - 10; End;
            14: Begin Fall14 := TShape.create(Form1); Fall14.Parent := Form1; Fall14.Shape := stRectangle; Fall14.Brush.color := clPurple; Fall14.Height := random(50) + 20; Fall14.Width := random(50) + 20; Fall14.Top := 0 - Fall14.Height; Fall14.Left := Random(form1.width) - 10; End;
            15: Begin Fall15 := TShape.create(Form1); Fall15.Parent := Form1; Fall15.Shape := stRectangle; Fall15.Brush.color := clPurple; Fall15.Height := random(50) + 20; Fall15.Width := random(50) + 20; Fall15.Top := 0 - Fall15.Height; Fall15.Left := Random(form1.width) - 10; End;
            16: Begin Fall16 := TShape.create(Form1); Fall16.Parent := Form1; Fall16.Shape := stRectangle; Fall16.Brush.color := clPurple; Fall16.Height := random(50) + 20; Fall16.Width := random(50) + 20; Fall16.Top := 0 - Fall16.Height; Fall16.Left := Random(form1.width) - 10; End;
            17: Begin Fall17 := TShape.create(Form1); Fall17.Parent := Form1; Fall17.Shape := stRectangle; Fall17.Brush.color := clPurple; Fall17.Height := random(50) + 20; Fall17.Width := random(50) + 20; Fall17.Top := 0 - Fall17.Height; Fall17.Left := Random(form1.width) - 10; End;
            18: Begin Fall18 := TShape.create(Form1); Fall18.Parent := Form1; Fall18.Shape := stRectangle; Fall18.Brush.color := clPurple; Fall18.Height := random(50) + 20; Fall18.Width := random(50) + 20; Fall18.Top := 0 - Fall18.Height; Fall18.Left := Random(form1.width) - 10; End;
            19: Begin Fall19 := TShape.create(Form1); Fall19.Parent := Form1; Fall19.Shape := stRectangle; Fall19.Brush.color := clPurple; Fall19.Height := random(50) + 20; Fall19.Width := random(50) + 20; Fall19.Top := 0 - Fall19.Height; Fall19.Left := Random(form1.width) - 10; End;
            20: Begin Fall20 := TShape.create(Form1); Fall20.Parent := Form1; Fall20.Shape := stRectangle; Fall20.Brush.color := clPurple; Fall20.Height := random(50) + 20; Fall20.Width := random(50) + 20; Fall20.Top := 0 - Fall20.Height; Fall20.Left := Random(form1.width) - 10; End;
          end;
        end;
    end;
  Form1.updateactions;

  if iGun < 4 then
    begin
      inc(iGun);
    end
    else
    begin
      iGun := 1;
    end;

  case iGUn of
   1 : Begin blt1.visible := True; blt1.Shape := stCircle; blt1.Brush.color := clGray; blt1.Height := 7; blt1.width := 7; blt1.Left := pnlCannon.Left + 5; blt1.top := pnlCannon.top + 7; End;
   2 : Begin blt2.visible := True; blt2.Shape := stCircle; blt2.Brush.color := clGray; blt2.Height := 7; blt2.width := 7; blt2.Left := pnlCannon.Left + 5; blt2.top := pnlCannon.top + 7; End;
   3 : Begin blt3.visible := True; blt3.Shape := stCircle; blt3.Brush.color := clGray; blt3.Height := 7; blt3.width := 7; blt3.Left := pnlCannon.Left + 5; blt3.top := pnlCannon.top + 7; End;
   4 : Begin blt4.visible := True; blt4.Shape := stCircle; blt4.Brush.color := clGray; blt4.Height := 7; blt4.width := 7; blt4.Left := pnlCannon.Left + 5; blt4.top := pnlCannon.top + 7; End;
  end;

  inc(iCheck);
  if icheck Mod 10 = 0 then
    begin
      if idifficulty > 0 then
        begin
          inc(idifficulty, -1);
        end;
    end;

  if icheck Mod 2 = 0 then
    begin
      inc(iScore);
      pnlScore.Caption := 'Score: ' + inttostr(iScore);
    end;

  if icheck > 50000 then
    begin
      icheck := 0;
    end;
end;

end.
