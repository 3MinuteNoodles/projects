object frmLogin: TfrmLogin
  Left = 780
  Top = 166
  Caption = 'Login/Create New User'
  ClientHeight = 336
  ClientWidth = 425
  Color = 4536114
  DoubleBuffered = True
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
  object pnlLogin: TPanel
    Left = 0
    Top = 8
    Width = 425
    Height = 329
    BevelOuter = bvNone
    BevelWidth = 1324
    Color = 4536114
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object lblFirstName: TLabel
      Left = 6
      Top = 19
      Width = 54
      Height = 13
      Caption = 'First name:'
      Color = 4667697
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lblSurname: TLabel
      Left = 6
      Top = 46
      Width = 46
      Height = 13
      Caption = 'Surname:'
      Color = 4601906
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lblPassword: TLabel
      Left = 6
      Top = 73
      Width = 50
      Height = 13
      Caption = 'Password:'
      Color = 4601906
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object edtName: TEdit
      Left = 98
      Top = 16
      Width = 313
      Height = 21
      Hint = 'Enter your first name here'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4536114
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 32
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object edtSurname: TEdit
      Left = 98
      Top = 43
      Width = 313
      Height = 21
      Hint = 'Enter your surname here'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4536114
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 32
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object edtPassword: TEdit
      Left = 98
      Top = 70
      Width = 287
      Height = 21
      Hint = 'Enter your password here'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4536114
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 32
      ParentFont = False
      ParentShowHint = False
      PasswordChar = '*'
      ShowHint = True
      TabOrder = 2
    end
    object btnLogin: TButton
      Left = 6
      Top = 163
      Width = 405
      Height = 46
      Hint = 'Click here to login to your user'
      Caption = 'Login'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btnLoginClick
    end
    object btnCreateNewUser: TButton
      Left = 6
      Top = 215
      Width = 405
      Height = 50
      Hint = 
        'Click here to switch to create mode if you do not have a user ye' +
        't'
      Caption = 'Create new user'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      WordWrap = True
      OnClick = btnCreateNewUserClick
    end
    object btnLightMode: TButton
      Left = 168
      Top = 285
      Width = 81
      Height = 33
      Hint = 'Click here to switch to light mode?'
      Caption = 'Light mode'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = btnLightModeClick
    end
    object btnShowPassword: TButton
      Left = 384
      Top = 70
      Width = 27
      Height = 21
      Hint = 'Click to reveal password'
      Caption = #55357#56385
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnMouseDown = btnShowPasswordMouseDown
      OnMouseUp = btnShowPasswordMouseUp
    end
    object dtpBirthday: TDatePicker
      Left = 98
      Top = 124
      Hint = 'Enter Date of birth here'
      Date = 2.000000000000000000
      DateFormat = 'yyyy/MM/dd'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ShowHint = True
      TabOrder = 7
    end
    object btnHelp: TBitBtn
      Left = 6
      Top = 285
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
      TabOrder = 8
      OnClick = btnHelpClick
    end
  end
  object redHelpLogin: TRichEdit
    Left = 0
    Top = 0
    Width = 425
    Height = 337
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'LOGIN:'
      ''
      
        'To login first enter your first name in the top edit box, then e' +
        'nter your'
      
        'surname in the 2nd edit box from the top. In the 3rd Edit box fr' +
        'om the'
      
        'top enter your Password and then click the login button to sign ' +
        'into your'
      'user.'
      ''
      'Create New User:'
      ''
      
        'To create a new user please click the "Create new user" button. ' +
        'The progrm'
      
        'will then allow you to confirm your password to make sure there ' +
        'are no'
      
        'mistakes. You must also input your date of birth. If you are les' +
        's than twelve'
      
        'years old you may not make an account. Only normal accounts can ' +
        'be created'
      ''
      'General:'
      ''
      
        'Please use the eye symbol to see your password and make sure it ' +
        'is correct'
      
        'when you enter it. The light mode button doesn'#39't work and that i' +
        's intended'
      
        'behaviour as light mode has been blocked for the safety of your ' +
        'eyes.')
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    Visible = False
    Zoom = 100
  end
  object btnNotHelp: TButton
    Left = 168
    Top = 293
    Width = 75
    Height = 25
    Caption = 'I understand'
    Enabled = False
    TabOrder = 2
    Visible = False
    OnClick = btnNotHelpClick
  end
end
