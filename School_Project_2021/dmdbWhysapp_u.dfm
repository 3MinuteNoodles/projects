object dmdbWhysapp: TdmdbWhysapp
  OldCreateOrder = False
  Height = 268
  Width = 356
  object condbWhysapp: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\Pat\Project\Win3' +
      '2\Debug\dbWhysapp.mdb;Mode=ReadWrite;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 56
    Top = 136
  end
  object tblUsers: TADOTable
    Active = True
    Connection = condbWhysapp
    CursorType = ctStatic
    TableName = 'tblUsers'
    Left = 152
    Top = 120
  end
  object tblMessages: TADOTable
    Active = True
    Connection = condbWhysapp
    CursorType = ctStatic
    TableName = 'tblMessages'
    Left = 152
    Top = 168
  end
end
