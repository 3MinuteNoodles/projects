unit dmdbWhysapp_u;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmdbWhysapp = class(TDataModule)
    condbWhysapp: TADOConnection;
    tblUsers: TADOTable;
    tblMessages: TADOTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdbWhysapp: TdmdbWhysapp;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
