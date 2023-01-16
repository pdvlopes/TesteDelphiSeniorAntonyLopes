unit Dao;

interface

 uses  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client ;
type
TConexao = class

private

public
constructor create;
destructor destroy;

var
Pdo: TFDConnection;

end;

implementation

{ TConexao }

constructor TConexao.create;
begin
  Pdo:= TFDConnection.Create(nil);
  Pdo.Params.Database:= 'postgres';
  Pdo.Params.UserName:= 'postgres';
  Pdo.Params.Password:='123';
  Pdo.DriverName:= 'PG';
  Pdo.Params.DriverID:='PG';
  Pdo.Connected:= True;
end;

destructor TConexao.destroy;
begin
   Pdo.Free;
end;

end.
