object frmtTest: TfrmtTest
  Left = 309
  Top = 279
  Caption = 'tTest'
  ClientHeight = 439
  ClientWidth = 546
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
  object btnHelp: TButton
    Left = 462
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Help'
    TabOrder = 0
    OnClick = btnHelpClick
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
  object pnlOptions: TPanel
    Left = 8
    Top = 39
    Width = 529
    Height = 234
    BevelOuter = bvNone
    TabOrder = 2
    object lblTitle: TLabel
      Left = 24
      Top = 58
      Width = 130
      Height = 13
      Caption = 'Enter the title of your test:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblSubject: TLabel
      Left = 24
      Top = 90
      Width = 154
      Height = 13
      Caption = 'Select the subject for your test:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblQuestions: TLabel
      Left = 24
      Top = 122
      Width = 291
      Height = 13
      Caption = 'Select how many questions you would like your test to have:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblNumOptions: TLabel
      Left = 24
      Top = 154
      Width = 288
      Height = 13
      Caption = 'Select how many options there should be for each question:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblTestCustomisation: TLabel
      Left = 188
      Top = 16
      Width = 127
      Height = 13
      Caption = 'Customise your test below'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtTitle: TEdit
      Left = 208
      Top = 55
      Width = 313
      Height = 21
      MaxLength = 250
      TabOrder = 0
    end
    object cmbSubjects: TComboBox
      Left = 208
      Top = 87
      Width = 313
      Height = 21
      TabOrder = 1
    end
    object sedNumQ: TSpinEdit
      Left = 341
      Top = 119
      Width = 180
      Height = 22
      MaxValue = 50
      MinValue = 1
      TabOrder = 2
      Value = 1
    end
    object sedNumO: TSpinEdit
      Left = 341
      Top = 151
      Width = 180
      Height = 22
      MaxValue = 5
      MinValue = 2
      TabOrder = 3
      Value = 2
    end
    object btnCreate: TButton
      Left = 188
      Top = 192
      Width = 127
      Height = 25
      Caption = 'Create New Test'
      TabOrder = 4
      OnClick = btnCreateClick
    end
  end
  object pnlCreation: TPanel
    Left = 6
    Top = 39
    Width = 532
    Height = 392
    BevelOuter = bvNone
    TabOrder = 3
    object lblQuestion: TLabel
      Left = 27
      Top = 16
      Width = 99
      Height = 13
      Caption = 'Enter your question:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblCorrect: TLabel
      Left = 179
      Top = 306
      Width = 164
      Height = 13
      Caption = 'Check the correct option(s) above'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtQuestion: TEdit
      Left = 160
      Top = 13
      Width = 326
      Height = 21
      MaxLength = 150
      TabOrder = 0
    end
    object btnNext: TButton
      Left = 226
      Top = 325
      Width = 75
      Height = 29
      Caption = 'Next Question'
      TabOrder = 1
      OnClick = btnNextClick
    end
  end
  object redhelp: TRichEdit
    Left = 5
    Top = 8
    Width = 533
    Height = 423
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      
        'On this form you can create multiple choice tests for users to t' +
        'ake.'
      ''
      
        'Enter the details of your tests and then click "create new test"' +
        ' and you will be taken to an interace'
      
        'where you can enter each question and the answers for that quest' +
        'ion. Questions must have a correct'
      
        'answer. Tests may not have duplicate titles. All of the answers ' +
        'to a question may be correct if you'
      
        'so choose. A student will have to select all correct answers and' +
        ' only the correct answers to get'
      'the marks for the question.')
    ParentFont = False
    TabOrder = 4
    Zoom = 100
  end
  object btnUnderstood: TButton
    Left = 232
    Top = 364
    Width = 75
    Height = 25
    Caption = 'I Understand'
    TabOrder = 5
    OnClick = btnUnderstoodClick
  end
end
