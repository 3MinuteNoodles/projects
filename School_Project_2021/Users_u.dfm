object frmUsers: TfrmUsers
  Left = 754
  Top = 77
  Caption = 'Manage Users'
  ClientHeight = 866
  ClientWidth = 414
  Color = 4536114
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlManageUsers: TPanel
    Left = 8
    Top = 48
    Width = 401
    Height = 810
    BevelOuter = bvNone
    TabOrder = 0
    object lblUserKeywordMatches: TLabel
      Left = 5
      Top = 398
      Width = 113
      Height = 13
      Caption = 'User keyword matches:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblSelectUser: TLabel
      Left = 8
      Top = 13
      Width = 57
      Height = 13
      Caption = 'Select user:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblSort: TLabel
      Left = 243
      Top = 13
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
    object cmbSelectUser: TComboBox
      Left = 8
      Top = 37
      Width = 385
      Height = 21
      Hint = 'Select a user to view here'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnChange = cmbSelectUserChange
    end
    object btnToggleEnabled: TButton
      Left = 8
      Top = 763
      Width = 385
      Height = 46
      Hint = 'Click here to change whether the user is enabled or disabled'
      Caption = 'Enable/Disable user'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnToggleEnabledClick
    end
    object redUsersKeywordMatches: TRichEdit
      Left = 8
      Top = 427
      Width = 385
      Height = 330
      Hint = 'Messages containing keywords from this user are displayed here'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ScrollBars = ssVertical
      ShowHint = True
      TabOrder = 2
      Zoom = 100
    end
    object pnlUserID: TPanel
      Left = 8
      Top = 64
      Width = 385
      Height = 41
      BevelKind = bkFlat
      Caption = 'UserID: '
      Color = 4536114
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
    end
    object pnlFirst_name: TPanel
      Left = 8
      Top = 111
      Width = 385
      Height = 41
      BevelKind = bkFlat
      Caption = 'First name:'
      Color = 4601906
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 4
    end
    object pnlSurname: TPanel
      Left = 8
      Top = 158
      Width = 385
      Height = 41
      BevelKind = bkFlat
      Caption = 'Surname:'
      Color = 4536114
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 5
    end
    object pnlPassword: TPanel
      Left = 8
      Top = 205
      Width = 385
      Height = 41
      BevelKind = bkFlat
      Caption = 'Password:'
      Color = 4601906
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 6
    end
    object pnlDisabled: TPanel
      Left = 8
      Top = 252
      Width = 385
      Height = 41
      BevelKind = bkFlat
      Caption = 'Enabled: '
      Color = 4536114
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 7
    end
    object pnlType: TPanel
      Left = 8
      Top = 299
      Width = 385
      Height = 41
      BevelKind = bkFlat
      Caption = 'User type: '
      Color = 4601906
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 8
    end
    object cmbSort: TComboBox
      Left = 288
      Top = 10
      Width = 105
      Height = 21
      TabOrder = 9
      OnChange = cmbSortChange
      Items.Strings = (
        'UserID'
        'First_name'
        'Surname')
    end
    object pnlBirthday: TPanel
      Left = 8
      Top = 346
      Width = 385
      Height = 41
      BevelKind = bkFlat
      Caption = 'Date of birth:'
      Color = 4667697
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 10
    end
  end
  object btnLogout: TButton
    Left = 8
    Top = 8
    Width = 118
    Height = 34
    Hint = 'Click here to return to admin home'
    Caption = #11013#65039' Home'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4536114
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnLogoutClick
  end
  object btnHelp: TBitBtn
    Left = 328
    Top = 8
    Width = 81
    Height = 33
    Hint = 'Click here if you are in need of assistance'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = bkHelp
    NumGlyphs = 2
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnHelpClick
  end
  object redHelpUsers: TRichEdit
    Left = 0
    Top = 0
    Width = 412
    Height = 873
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'General:'
      ''
      'Click the home button to go back to the admin home.'
      ''
      'Selecting a user:'
      ''
      
        'Use the select user combo box to choose a user to display inform' +
        'ation'
      
        'about. You can use the sort combo box above to help you find a u' +
        'ser'
      'more easily.'
      ''
      'Displaying info:'
      ''
      
        'Once you have selected a user all the information about the user' +
        's will be'
      'displayed on the panels below.'
      ''
      'Messages:'
      ''
      
        'The messages sent and received by the selected user are also dis' +
        'played '
      
        'if they contain any keywords. The weight of the keyword( which c' +
        'an be'
      
        'used as a method of telling how severe the message is ) is also ' +
        'displayed'
      'based on which keywords are found and their weight.'
      ''
      'Enable/Disable:'
      ''
      
        'you can use the button at the bottom of the screen to disable th' +
        'e selected'
      'user if you are unhappy with them or their messages.')
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    Visible = False
    Zoom = 100
  end
  object btnNotHelp: TButton
    Left = 168
    Top = 811
    Width = 75
    Height = 25
    Caption = 'I understand'
    Enabled = False
    TabOrder = 4
    Visible = False
    OnClick = btnNotHelpClick
  end
end
