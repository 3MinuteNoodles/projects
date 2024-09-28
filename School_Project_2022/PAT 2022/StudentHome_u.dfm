object frmStudentHome: TfrmStudentHome
  Left = 309
  Top = 372
  Caption = 'Student Home'
  ClientHeight = 410
  ClientWidth = 425
  Color = 4601906
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlNotes: TPanel
    Left = 223
    Top = 45
    Width = 193
    Height = 145
    BevelInner = bvRaised
    BevelWidth = 5
    Caption = 'Notes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = pnlNotesClick
  end
  object pnlTests: TPanel
    Left = 8
    Top = 205
    Width = 408
    Height = 145
    BevelInner = bvRaised
    BevelWidth = 5
    Caption = 'Tests'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = pnlTestsClick
  end
  object pnlsMarks: TPanel
    Left = 8
    Top = 45
    Width = 193
    Height = 145
    BevelInner = bvRaised
    BevelWidth = 5
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = pnlsMarksClick
    object lblMarks: TLabel
      Left = 52
      Top = 32
      Width = 84
      Height = 78
      Alignment = taCenter
      Caption = 'View Marks'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
      OnClick = lblMarksClick
    end
  end
  object btnSignOut: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Sign Out'
    TabOrder = 3
    OnClick = btnSignOutClick
  end
  object btnHelp: TButton
    Left = 341
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Help'
    TabOrder = 4
    OnClick = btnHelpClick
  end
  object btnMessages: TButton
    Left = 8
    Top = 356
    Width = 408
    Height = 45
    Caption = 'Open Messages'
    TabOrder = 5
    OnClick = btnMessagesClick
  end
  object btnEditProfile: TButton
    Left = 173
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Edit Profile'
    TabOrder = 6
    OnClick = btnEditProfileClick
  end
  object redHelp: TRichEdit
    Left = 8
    Top = 8
    Width = 409
    Height = 394
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'This form is the main navigaion form for the student profile.'
      ''
      
        'If you wish to make changes to your profile click the "edit prof' +
        'ile" button and'
      
        'and you will be taken to the relevant form where you can change ' +
        'your details'
      'and edit what subjects you take.'
      ''
      
        'Click the "view marks" button and you will be taken to a form wh' +
        'ere you can view'
      'all the marks of tests you have previously taken.'
      ''
      
        'Click the "notes" button and you will be taken to a form where y' +
        'ou can select'
      'and view notes that teacher have created.'
      ''
      
        'Click the "tests" button and you will be taken to a form where y' +
        'ou can select'
      'and take tests that teachers have created.'
      ''
      
        'Click the "Open messages" button and you will be taken to a form' +
        ' where you can'
      'message other students and teachers.')
    ParentFont = False
    TabOrder = 7
    Zoom = 100
  end
  object btnUnderstood: TButton
    Left = 173
    Top = 344
    Width = 75
    Height = 25
    Caption = 'I Understand'
    TabOrder = 8
    OnClick = btnUnderstoodClick
  end
end
