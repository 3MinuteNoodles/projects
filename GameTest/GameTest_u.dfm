object Form1: TForm1
  Left = 293
  Top = 526
  Caption = 'Form1'
  ClientHeight = 468
  ClientWidth = 1176
  Color = clAqua
  TransparentColorValue = clBlue
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 512
    Top = 368
    Width = 65
    Height = 65
    Brush.Color = clRed
    Shape = stCircle
  end
  object pnlFloor: TPanel
    Left = 0
    Top = 432
    Width = 1177
    Height = 41
    BevelOuter = bvNone
    Color = clGrayText
    ParentBackground = False
    TabOrder = 0
  end
  object btnKey: TButton
    Left = 1304
    Top = 200
    Width = 25
    Height = 25
    TabOrder = 1
    OnKeyDown = btnKeyKeyDown
    OnKeyUp = btnKeyKeyUp
  end
  object Panel1: TPanel
    Left = 440
    Top = 183
    Width = 305
    Height = 90
    BevelKind = bkFlat
    BevelWidth = 3
    Caption = 'START'
    Color = clGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -85
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
    OnClick = Panel1Click
  end
  object pnlCannon: TPanel
    Left = 537
    Top = 352
    Width = 17
    Height = 41
    Color = clBlack
    ParentBackground = False
    TabOrder = 3
  end
  object pnlScore: TPanel
    Left = 1056
    Top = 0
    Width = 121
    Height = 41
    Caption = 'Score:'
    Color = clAppWorkSpace
    ParentBackground = False
    TabOrder = 4
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10
    OnTimer = Timer1Timer
    Left = 1336
    Top = 200
  end
  object Timer2: TTimer
    Enabled = False
    OnTimer = Timer2Timer
    Left = 1336
    Top = 264
  end
end
