object frmTeacherHome: TfrmTeacherHome
  Left = 353
  Top = 372
  Caption = 'Teacher Home'
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
    Left = 8
    Top = 205
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
    Top = 45
    Width = 409
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
  object pnlStudents: TPanel
    Left = 224
    Top = 205
    Width = 193
    Height = 145
    BevelInner = bvRaised
    BevelWidth = 5
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = pnlStudentsClick
    object lblStudents: TLabel
      Left = 33
      Top = 32
      Width = 125
      Height = 78
      Alignment = taCenter
      Caption = 'View Students'
      Layout = tlCenter
      WordWrap = True
      OnClick = lblStudentsClick
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
    Left = 223
    Top = 8
    Width = 91
    Height = 25
    Caption = 'Edit Profile'
    TabOrder = 6
    OnClick = btnEditProfileClick
  end
  object btnSubject: TButton
    Left = 110
    Top = 8
    Width = 91
    Height = 25
    Caption = 'Add new subject'
    TabOrder = 7
    OnClick = btnSubjectClick
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
      
        'This is the main navigation for for teachers. From this form you' +
        ' can do the '
      'following:'
      ''
      
        'Add a new subject. Click the "Add new subject" button to enter t' +
        'han name'
      
        'of a new subject you would like to add. Subjects can not have du' +
        'plicate'
      'names and subject names can not be longer than 255 characters.'
      ''
      
        'Edit your profile. Click the "edit profile" button to edit your ' +
        'profile. You will'
      
        'be taken to a form where you can edit your name, surname and Pas' +
        'sword.'
      ''
      
        'Create a test. Click the "tests" button and you will be taken to' +
        ' an interface'
      'where you can create new tests for students to take.'
      ''
      
        'Create a note. Click the "notes" button and you will be taken to' +
        ' an interface'
      'where you can create new notes for students to view.'
      ''
      
        'View student information. Click the "view students" button and y' +
        'ou will'
      
        'be taken to a form where you can view information on all student' +
        '.'
      ''
      
        'Message Other users. Click the "Open Messages" button and you wi' +
        'll'
      
        'be taken to the messaging form where you can message other teach' +
        'ers'
      'and message students.')
    ParentFont = False
    TabOrder = 8
    Zoom = 100
  end
  object btnUnderstood: TButton
    Left = 176
    Top = 356
    Width = 75
    Height = 25
    Caption = 'I Understand'
    TabOrder = 9
    OnClick = btnUnderstoodClick
  end
end
