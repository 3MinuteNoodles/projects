object frmAdminHome: TfrmAdminHome
  Left = 820
  Top = 187
  Caption = 'Admin Home'
  ClientHeight = 375
  ClientWidth = 314
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
  PixelsPerInch = 96
  TextHeight = 13
  object pnlAdminTask: TPanel
    Left = 8
    Top = 48
    Width = 297
    Height = 321
    BevelOuter = bvNone
    TabOrder = 0
    object lblSelectAdminTask: TLabel
      Left = 8
      Top = 8
      Width = 41
      Height = 13
      Caption = 'Options:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnViewMatches: TButton
      Left = 8
      Top = 35
      Width = 281
      Height = 78
      Hint = 
        'Click here to view messages for all users that contain keywords ' +
        'from your list'
      Caption = 'View Keyword Matches'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4536114
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnViewMatchesClick
    end
    object btnManageUsers: TButton
      Left = 8
      Top = 218
      Width = 281
      Height = 78
      Hint = 'Click here to manage users'
      Caption = 'Manage Users'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4536114
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnManageUsersClick
    end
    object btnEditKeywords: TButton
      Left = 8
      Top = 127
      Width = 281
      Height = 78
      Hint = 'Click here to edit your list of keywords'
      Caption = 'Edit Keyword List'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4536114
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnEditKeywordsClick
    end
  end
  object btnLogout: TButton
    Left = 8
    Top = 8
    Width = 118
    Height = 34
    Hint = 'Click here to return to login screen'
    Caption = #11013#65039' Sign out'
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
    Left = 224
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
  object redHelpAdminHome: TRichEdit
    Left = 0
    Top = 0
    Width = 314
    Height = 377
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'General:'
      ''
      'Select what you want to do as an admin by clicking one'
      'of the buttons. Use the "Sign out" button to go back to the'
      'login screen.'
      ''
      'Buttons:'
      ''
      'Click the "View keyword matches" button to go and view all'
      'messages between all users that contain keywords.'
      ''
      'Click the "edit keyword list" button to view all the keywords'
      'you have saved. You can also add and delete keywords.'
      ''
      'Click the "Manage Users" button to view information about the'
      'users and their messages that contain keywords. If you are'
      'unhappy with a user you can also disable them.')
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    Visible = False
    Zoom = 100
  end
  object btnNotHelp: TButton
    Left = 120
    Top = 319
    Width = 75
    Height = 25
    Caption = 'I understand'
    Enabled = False
    TabOrder = 4
    Visible = False
    OnClick = btnNotHelpClick
  end
end
