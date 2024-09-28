object frmsNotes: TfrmsNotes
  Left = 0
  Top = 0
  Caption = 'Notes'
  ClientHeight = 368
  ClientWidth = 524
  Color = 4601906
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlSubsOrSearch: TPanel
    Left = 9
    Top = 87
    Width = 507
    Height = 148
    TabOrder = 0
    object lblSearch: TLabel
      Left = 24
      Top = 56
      Width = 112
      Height = 13
      Caption = 'Enter a term to search:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblSubjects: TLabel
      Left = 24
      Top = 96
      Width = 80
      Height = 13
      Caption = 'Select a subject:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 40
      Top = 16
      Width = 419
      Height = 13
      Caption = 
        'To look for a specific set of notes, enter a search term below o' +
        'r select a specfic subject'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtSearch: TEdit
      Left = 176
      Top = 53
      Width = 264
      Height = 21
      TabOrder = 0
      OnEnter = edtSearchEnter
    end
    object cmbSubjects: TComboBox
      Left = 176
      Top = 93
      Width = 313
      Height = 21
      TabOrder = 1
      OnChange = cmbSubjectsChange
    end
    object btnEnter: TButton
      Left = 443
      Top = 53
      Width = 46
      Height = 21
      Caption = 'Enter'
      TabOrder = 2
      OnClick = btnEnterClick
    end
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
    Left = 440
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Help'
    TabOrder = 2
    OnClick = btnHelpClick
  end
  object pnlNotes: TPanel
    Left = 9
    Top = 241
    Width = 507
    Height = 85
    TabOrder = 3
    object lblNotes: TLabel
      Left = 24
      Top = 20
      Width = 146
      Height = 13
      Caption = 'Selects a set of notes to view:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cmbNotes: TComboBox
      Left = 176
      Top = 17
      Width = 313
      Height = 21
      TabOrder = 0
    end
    object btnOpen: TButton
      Left = 201
      Top = 48
      Width = 75
      Height = 25
      Caption = 'Open'
      TabOrder = 1
      OnClick = btnOpenClick
    end
  end
  object pnlNoteView: TPanel
    Left = 8
    Top = 39
    Width = 508
    Height = 321
    TabOrder = 4
    object btnBack: TButton
      Left = 8
      Top = 9
      Width = 41
      Height = 33
      Caption = #55358#56340
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnBackClick
    end
    object redNote: TRichEdit
      Left = 8
      Top = 49
      Width = 492
      Height = 265
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Zoom = 100
    end
  end
  object redHelp: TRichEdit
    Left = 8
    Top = 8
    Width = 508
    Height = 352
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      
        'On this form you can select notes that teachers have made and vi' +
        'ew them.'
      ''
      
        'You can select a note to view in the lowest combobox, if you can' +
        ' not find the note you'
      
        'are looking for, then you can search for the note either by ente' +
        'ring a term to search for'
      'in the name or by filtering to only display a specific subject.'
      ''
      
        'Once you are viewing a note you can go back to the select note s' +
        'creen by clicking the button'
      'with the left arrow on it.')
    ParentFont = False
    TabOrder = 5
    Zoom = 100
  end
  object btnUnderstood: TButton
    Left = 224
    Top = 312
    Width = 75
    Height = 25
    Caption = 'I Understand'
    TabOrder = 6
    OnClick = btnUnderstoodClick
  end
end
