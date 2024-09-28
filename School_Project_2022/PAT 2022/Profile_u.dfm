object frmProfile: TfrmProfile
  Left = 397
  Top = 372
  Caption = 'Edit Profile'
  ClientHeight = 319
  ClientWidth = 413
  Color = 4667697
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
    Left = 325
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Help'
    TabOrder = 1
    OnClick = btnHelpClick
  end
  object pnlUser: TPanel
    Left = 8
    Top = 48
    Width = 393
    Height = 257
    BevelOuter = bvNone
    TabOrder = 2
    object lblSurname: TLabel
      Left = 24
      Top = 80
      Width = 46
      Height = 13
      Caption = 'Surname:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblName: TLabel
      Left = 24
      Top = 48
      Width = 31
      Height = 13
      Caption = 'Name:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblPassword: TLabel
      Left = 24
      Top = 112
      Width = 50
      Height = 13
      Caption = 'Password:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblEdit: TLabel
      Left = 48
      Top = 17
      Width = 255
      Height = 13
      Caption = 'Make the changes you want to the information below'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblConfirmPassword: TLabel
      Left = 3
      Top = 142
      Width = 90
      Height = 13
      Caption = 'Confirm Password:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtName: TEdit
      Left = 104
      Top = 45
      Width = 255
      Height = 21
      MaxLength = 32
      TabOrder = 0
    end
    object edtSurname: TEdit
      Left = 104
      Top = 77
      Width = 255
      Height = 21
      MaxLength = 32
      TabOrder = 1
    end
    object edtPassword: TEdit
      Left = 104
      Top = 109
      Width = 255
      Height = 21
      MaxLength = 32
      PasswordChar = '*'
      TabOrder = 2
    end
    object btnSubmit: TButton
      Left = 152
      Top = 192
      Width = 91
      Height = 25
      Caption = 'Confirm changes'
      TabOrder = 3
      OnClick = btnSubmitClick
    end
    object btnSubjects: TButton
      Left = 24
      Top = 192
      Width = 75
      Height = 57
      Caption = 'Click here to change your subjects'
      TabOrder = 4
      WordWrap = True
      OnClick = btnSubjectsClick
    end
    object edtConfirmPassword: TEdit
      Left = 104
      Top = 139
      Width = 255
      Height = 21
      MaxLength = 32
      PasswordChar = '*'
      TabOrder = 5
    end
    object btnShowPasswords: TButton
      Left = 365
      Top = 109
      Width = 27
      Height = 51
      Caption = #55357#56385
      TabOrder = 6
      OnMouseDown = btnShowPasswordsMouseDown
      OnMouseUp = btnShowPasswordsMouseUp
    end
  end
  object pnlSubjects: TPanel
    Left = 8
    Top = 48
    Width = 393
    Height = 257
    BevelOuter = bvNone
    TabOrder = 3
    Visible = False
    object lblpage: TLabel
      Left = 288
      Top = 18
      Width = 34
      Height = 19
      Caption = 'Page'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblSubject1: TLabel
      Left = 55
      Top = 70
      Width = 5
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblSubject2: TLabel
      Left = 55
      Top = 96
      Width = 5
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblSelectSubs: TLabel
      Left = 33
      Top = 12
      Width = 209
      Height = 38
      Caption = 'Select the subjects below that you would like to take'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object lblSubject5: TLabel
      Left = 55
      Top = 172
      Width = 5
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblSubject4: TLabel
      Left = 55
      Top = 146
      Width = 5
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblSubject3: TLabel
      Left = 54
      Top = 120
      Width = 5
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object chk1: TCheckBox
      Left = 32
      Top = 72
      Width = 16
      Height = 17
      TabOrder = 0
    end
    object chk2: TCheckBox
      Left = 32
      Top = 98
      Width = 16
      Height = 17
      TabOrder = 1
    end
    object btnNext: TButton
      Left = 152
      Top = 223
      Width = 75
      Height = 25
      Caption = 'Next'
      TabOrder = 2
      OnClick = btnNextClick
    end
    object chk4: TCheckBox
      Left = 32
      Top = 148
      Width = 16
      Height = 17
      TabOrder = 3
    end
    object chk3: TCheckBox
      Left = 32
      Top = 122
      Width = 16
      Height = 17
      TabOrder = 4
    end
    object chk5: TCheckBox
      Left = 32
      Top = 174
      Width = 16
      Height = 17
      TabOrder = 5
    end
    object btnBack: TButton
      Left = 1
      Top = 3
      Width = 26
      Height = 39
      Caption = #55358#56340
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = btnBackClick
    end
  end
  object redHelp: TRichEdit
    Left = 8
    Top = 1
    Width = 397
    Height = 310
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'On this form you can change the details of you profile.'
      ''
      
        'If you are a teacher you can change your name surname and passwo' +
        'rd.'
      
        'Click the confirm password button once you have made your change' +
        's.'
      ''
      
        'Changes to your account can not be made if they would form a dup' +
        'licate'
      'account.'
      ''
      'If you are a student you can also change what subjects you take.'
      
        'Click the "Click here to change subjects" button and will be tak' +
        'en through'
      
        'a list of all the subjects where you can select what subjects yo' +
        'u wish to'
      'take. You can take as many or as few subjects as you would like.')
    ParentFont = False
    TabOrder = 4
    Zoom = 100
  end
  object btnUnderstood: TButton
    Left = 175
    Top = 271
    Width = 75
    Height = 25
    Caption = 'I Understand'
    TabOrder = 5
    OnClick = btnUnderstoodClick
  end
end
