object frmtNotes: TfrmtNotes
  Left = 309
  Top = 279
  Caption = 'Notes'
  ClientHeight = 644
  ClientWidth = 451
  Color = 4601906
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindow
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object btnHome: TButton
    Left = 8
    Top = 9
    Width = 75
    Height = 25
    Caption = 'Home'
    TabOrder = 0
    OnClick = btnHomeClick
  end
  object btnHelp: TButton
    Left = 370
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Help'
    TabOrder = 1
    OnClick = btnHelpClick
  end
  object pnlCreateNotes: TPanel
    Left = 12
    Top = 40
    Width = 433
    Height = 593
    BevelOuter = bvNone
    TabOrder = 2
    object lblEnterTitle: TLabel
      Left = 143
      Top = 485
      Width = 79
      Height = 19
      Caption = 'Enter Title:'
      Color = 4864814
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lblChooseSubect: TLabel
      Left = 0
      Top = 485
      Width = 115
      Height = 19
      Caption = 'Choose Subject:'
      Color = 4733488
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lblTypeNotes: TLabel
      Left = 0
      Top = 17
      Width = 124
      Height = 19
      Caption = 'Type Notes Here:'
      Color = 4799279
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object redCreateNote: TRichEdit
      Left = 0
      Top = 44
      Width = 433
      Height = 436
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
      Zoom = 100
    end
    object pnlEdit: TPanel
      Left = 0
      Top = 540
      Width = 433
      Height = 41
      BevelInner = bvRaised
      BevelWidth = 2
      Caption = 'Edit previous notes'
      TabOrder = 1
      OnClick = pnlEditClick
    end
    object btnSubmit: TButton
      Left = 339
      Top = 507
      Width = 94
      Height = 28
      Caption = 'Create Notes'
      TabOrder = 2
      OnClick = btnSubmitClick
    end
    object edtTitle: TEdit
      Left = 143
      Top = 507
      Width = 194
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 64
      ParentFont = False
      TabOrder = 3
    end
    object cmbSubject: TComboBox
      Left = 0
      Top = 507
      Width = 137
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
  end
  object pnlEditNotes: TPanel
    Left = 4
    Top = 40
    Width = 444
    Height = 593
    BevelOuter = bvNone
    TabOrder = 3
    object lblChooseEdit: TLabel
      Left = 8
      Top = 30
      Width = 151
      Height = 19
      Caption = 'Choose notes to edit:'
    end
    object cmbChooseNotes: TComboBox
      Left = 185
      Top = 27
      Width = 252
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = cmbChooseNotesChange
    end
    object redEditNotes: TRichEdit
      Left = 8
      Top = 57
      Width = 429
      Height = 436
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 1
      Zoom = 100
    end
    object btnChange: TButton
      Left = 8
      Top = 499
      Width = 429
      Height = 25
      Caption = 'Submit Changes'
      TabOrder = 2
      OnClick = btnChangeClick
    end
    object btnBack: TButton
      Left = 8
      Top = 5
      Width = 41
      Height = 22
      Caption = #55358#56340
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnBackClick
    end
  end
  object redHelp: TRichEdit
    Left = 5
    Top = 4
    Width = 440
    Height = 641
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'On this form you can create notes for students to view and '
      'edit notes that have'
      'already been created.'
      ''
      'When you created a note, type your note into the rich edit, '
      'enter your title'
      'and select a subject for your note. Once you have done all '
      'that click the create'
      'note button and your note will created. Notes can not have '
      'duplicate titles.'
      ''
      'If you wish to edit a note that has already been created, click '
      'the "edit previous'
      'notes" button. You will be taken to a menu where you can '
      'choose from the existing'
      'notes in a combo box. Once you have chosen a note, it will '
      'be displayed and you can'
      'make your desired changes. Submit the changes once you '
      'are done and they will'
      'be added.')
    ParentFont = False
    TabOrder = 4
    Zoom = 100
  end
  object btnUnderstood: TButton
    Left = 173
    Top = 570
    Width = 100
    Height = 25
    Caption = 'I Understand'
    TabOrder = 5
    OnClick = btnUnderstoodClick
  end
end
