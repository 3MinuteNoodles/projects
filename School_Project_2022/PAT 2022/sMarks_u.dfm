object frmsMarks: TfrmsMarks
  Left = 309
  Top = 326
  Caption = 'Marks'
  ClientHeight = 524
  ClientWidth = 407
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
  object lblMarks: TLabel
    Left = 8
    Top = 45
    Width = 57
    Height = 13
    Caption = 'Your marks:'
    Color = 4667697
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object dbgMarks: TDBGrid
    Left = 8
    Top = 71
    Width = 391
    Height = 161
    DataSource = dmEducation.dsrMarks
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnHome: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Home'
    TabOrder = 1
    OnClick = btnHomeClick
  end
  object btnHelp: TButton
    Left = 316
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Help'
    TabOrder = 2
    OnClick = btnHelpClick
  end
  object pnlSort: TPanel
    Left = 8
    Top = 238
    Width = 391
    Height = 113
    TabOrder = 3
    object lblSort: TLabel
      Left = 8
      Top = 8
      Width = 39
      Height = 13
      Caption = 'Sort by:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblCurrentSort: TLabel
      Left = 8
      Top = 86
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnRecent: TButton
      Left = 8
      Top = 32
      Width = 85
      Height = 45
      Caption = 'Newest first'
      TabOrder = 0
      OnClick = btnRecentClick
    end
    object btnPercent: TButton
      Left = 202
      Top = 32
      Width = 85
      Height = 45
      Caption = 'Percentage (high to low)'
      TabOrder = 1
      WordWrap = True
      OnClick = btnPercentClick
    end
    object btnSubject: TButton
      Left = 298
      Top = 32
      Width = 85
      Height = 45
      Caption = 'Subjects (Alphabetical)'
      TabOrder = 2
      WordWrap = True
      OnClick = btnSubjectClick
    end
    object btnOld: TButton
      Left = 106
      Top = 32
      Width = 85
      Height = 45
      Caption = 'Oldest first'
      TabOrder = 3
      OnClick = btnOldClick
    end
    object btnNoSort: TButton
      Left = 298
      Top = 83
      Width = 85
      Height = 25
      Caption = 'Remove Sort'
      TabOrder = 4
      OnClick = btnNoSortClick
    end
  end
  object pnlFilters: TPanel
    Left = 8
    Top = 357
    Width = 391
    Height = 159
    TabOrder = 4
    object lblFilter: TLabel
      Left = 8
      Top = 8
      Width = 200
      Height = 13
      Caption = 'Filters:  (only one can be active at a time)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblSubject: TLabel
      Left = 8
      Top = 115
      Width = 112
      Height = 13
      Caption = 'Only show this subject:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblCurrentFilter: TLabel
      Left = 8
      Top = 86
      Width = 96
      Height = 13
      Caption = 'Current Filter: None'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnAboveAv: TButton
      Left = 8
      Top = 27
      Width = 85
      Height = 46
      Caption = 'Only show values above average'
      TabOrder = 0
      WordWrap = True
      OnClick = btnAboveAvClick
    end
    object btnBelowAv: TButton
      Left = 106
      Top = 27
      Width = 85
      Height = 46
      Caption = 'Only show marks below average'
      TabOrder = 1
      WordWrap = True
      OnClick = btnBelowAvClick
    end
    object btnbelowValue: TButton
      Left = 298
      Top = 27
      Width = 85
      Height = 46
      Caption = 'Only show values below an entered value'
      TabOrder = 2
      WordWrap = True
      OnClick = btnbelowValueClick
    end
    object cmbSubjects: TComboBox
      Left = 150
      Top = 112
      Width = 233
      Height = 21
      TabOrder = 3
      OnChange = cmbSubjectsChange
    end
    object btnAboveValue: TButton
      Left = 202
      Top = 27
      Width = 85
      Height = 46
      Caption = 'Only show values above an entered value'
      TabOrder = 4
      WordWrap = True
      OnClick = btnAboveValueClick
    end
    object btnNoFilter: TButton
      Left = 298
      Top = 81
      Width = 85
      Height = 25
      Caption = 'Remove Filter'
      TabOrder = 5
      OnClick = btnNoFilterClick
    end
  end
  object redHelp: TRichEdit
    Left = 8
    Top = 8
    Width = 391
    Height = 508
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      
        'On this form you can view the marks of all the tests you have ta' +
        'ken.'
      ''
      
        'In the "Sort by" panel you can select the order you would like y' +
        'our marks to'
      'display in.'
      ''
      
        'In the filters panel you can filter the marks that are displayed' +
        ' so you can see'
      'specific marks.'
      ''
      
        'If you choose to only display marks above or below a certain val' +
        'ue, then you'
      
        'will be asked to enter a real number between 0 and 100. Marks th' +
        'at are equal'
      'to the value you entered will also be displayed.')
    ParentFont = False
    TabOrder = 5
    Zoom = 100
  end
  object btnUnderstood: TButton
    Left = 158
    Top = 467
    Width = 75
    Height = 25
    Caption = 'I Understand'
    TabOrder = 6
    OnClick = btnUnderstoodClick
  end
end
