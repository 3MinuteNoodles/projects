object dmEducation: TdmEducation
  OldCreateOrder = False
  Height = 296
  Width = 707
  object conEducation: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=D:\Cu' +
      'rrent PAT save 2022\PAT 2022\Win32\Debug\dmEducation.mdb;Mode=Re' +
      'adWrite;Persist Security Info=False;Jet OLEDB:System database=""' +
      ';Jet OLEDB:Registry Path="";Jet OLEDB:Database Password="";Jet O' +
      'LEDB:Engine Type=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:G' +
      'lobal Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Je' +
      't OLEDB:New Database Password="";Jet OLEDB:Create System Databas' +
      'e=False;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy Lo' +
      'cale on Compact=False;Jet OLEDB:Compact Without Replica Repair=F' +
      'alse;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 40
    Top = 116
  end
  object tblMarks: TADOTable
    Active = True
    Connection = conEducation
    CursorType = ctStatic
    TableName = 'tblMarks'
    Left = 188
    Top = 56
  end
  object tblMessages: TADOTable
    Active = True
    Connection = conEducation
    CursorType = ctStatic
    TableName = 'tblMessages'
    Left = 350
    Top = 56
  end
  object tblNotes: TADOTable
    Active = True
    Connection = conEducation
    CursorType = ctStatic
    TableName = 'tblNotes'
    Left = 597
    Top = 56
  end
  object tblStudentSubjects: TADOTable
    Active = True
    Connection = conEducation
    CursorType = ctStatic
    TableName = 'tblStudentSubjects'
    Left = 267
    Top = 56
  end
  object tblSubjects: TADOTable
    Active = True
    Connection = conEducation
    CursorType = ctStatic
    TableName = 'tblSubjects'
    Left = 419
    Top = 56
  end
  object tblTests: TADOTable
    Active = True
    Connection = conEducation
    CursorType = ctStatic
    TableName = 'tblTests'
    Left = 539
    Top = 56
  end
  object tblUsers: TADOTable
    Active = True
    Connection = conEducation
    CursorType = ctStatic
    TableName = 'tblUsers'
    Left = 478
    Top = 56
  end
  object qryUsers: TADOQuery
    Connection = conEducation
    Parameters = <>
    SQL.Strings = (
      'f')
    Left = 480
    Top = 184
  end
  object dsrUsers: TDataSource
    DataSet = qryUsers
    Left = 480
    Top = 136
  end
  object qrySubjects: TADOQuery
    Connection = conEducation
    Parameters = <>
    Left = 424
    Top = 183
  end
  object qryMarks: TADOQuery
    Connection = conEducation
    Parameters = <>
    Left = 184
    Top = 184
  end
  object dsrSubjects: TDataSource
    DataSet = qrySubjects
    Left = 424
    Top = 136
  end
  object dsrMarks: TDataSource
    DataSet = qryMarks
    Left = 184
    Top = 128
  end
  object qryStudentSubjects: TADOQuery
    Connection = conEducation
    Parameters = <>
    Left = 264
    Top = 192
  end
end
