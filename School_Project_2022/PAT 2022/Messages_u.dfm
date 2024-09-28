object frmMessages: TfrmMessages
  Left = 353
  Top = 233
  Caption = 'Messages'
  ClientHeight = 540
  ClientWidth = 498
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
  object btnHome: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Home'
    TabOrder = 0
    OnClick = btnHomeClick
  end
  object btnHelp: TButton
    Left = 417
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Help'
    TabOrder = 1
    OnClick = btnHelpClick
  end
  object pnlDisplay: TPanel
    Left = 8
    Top = 43
    Width = 484
    Height = 339
    TabOrder = 2
    object lblSelect: TLabel
      Left = 8
      Top = 5
      Width = 147
      Height = 13
      Caption = 'Select a conversation to open:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object redConversation: TRichEdit
      Left = 8
      Top = 51
      Width = 468
      Height = 278
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        'redConversation')
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
      Zoom = 100
    end
    object cmbUsers: TComboBox
      Left = 8
      Top = 24
      Width = 145
      Height = 21
      TabOrder = 1
      OnChange = cmbUsersChange
    end
  end
  object pnlMessage: TPanel
    Left = 8
    Top = 388
    Width = 484
    Height = 146
    TabOrder = 3
    object lblMessage: TLabel
      Left = 8
      Top = 5
      Width = 299
      Height = 13
      Caption = 'Enter a message to send to the  conversation selected above:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object memMessage: TMemo
      Left = 8
      Top = 24
      Width = 468
      Height = 57
      Lines.Strings = (
        'memMessage')
      MaxLength = 255
      TabOrder = 0
    end
    object btnSend: TButton
      Left = 8
      Top = 87
      Width = 468
      Height = 34
      Caption = 'Send'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnSendClick
    end
  end
  object redHelp: TRichEdit
    Left = 8
    Top = 8
    Width = 484
    Height = 526
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'On this form you can send and receive messages from other users.'
      ''
      
        'Select a user from the combobox near the top of the screen to st' +
        'art messaging them.'
      ''
      
        'You can type the message in the memo near the bottom and send it' +
        ' using the "send" button.')
    ParentFont = False
    TabOrder = 4
    Zoom = 100
  end
  object btnUnderstood: TButton
    Left = 208
    Top = 475
    Width = 75
    Height = 25
    Caption = 'I Understand'
    TabOrder = 5
    OnClick = btnUnderstoodClick
  end
end
