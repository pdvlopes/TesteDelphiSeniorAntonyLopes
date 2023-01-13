unit EnderecoModel;

interface

uses Pessoa,Dao,FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client ;

type
TEnderecoModel = class
private
Conexao:TConexao;
Qry:TFDQuery;

public function Salvar(const Pessoa:TPessoa):Boolean;
public function Deletar(Id:Integer):boolean;
public function Update(const Pessoa:TPessoa;Id:integer):Boolean;
public function InsertEmLote(const Pessoa:TPessoa):Boolean;

end;

implementation

{ TEnderecoModel }



function TEnderecoModel.Deletar(Id: Integer): boolean;
begin
try

    Conexao:= TConexao.create;
    Qry:= TFDQuery.Create(nil);
    Qry.Connection:= Conexao.Pdo;
    Qry.SQL.Add('DELETE FROM endereco WHERE idpessoa =:pId');
    Qry.Params.ParamByName('pId').AsInteger:= 0;
    try
      Qry.ExecSQL;
      Result:= true;
    except
      Result:= false;
    end;
  finally
    Conexao.Free;
    Qry.Free;
  end;

end;

function TEnderecoModel.InsertEmLote(const Pessoa: TPessoa): Boolean;
begin

end;

function TEnderecoModel.Salvar(const Pessoa: TPessoa): Boolean;
begin
try
    Conexao:= TConexao.create;
    Qry:= TFDQuery.Create(nil);
    Qry.Connection:= Conexao.Pdo;
    Qry.SQL.Add('INSERT INTO pessoa(idpessoa,dscep)');
    Qry.SQL.Add('VALUES(:pidpessoa,:pdscep)');

    Qry.Params.ParamByName('pidpessoa').AsInteger:= PEssoa.idpessoa;
    Qry.Params.ParamByName('pdscep').AsString:= Pessoa.dscep;

    try
      Qry.ExecSQL;
      Result:= true;
    except
      Result:= false;
    end;
  finally
    Conexao.Free;
    Qry.Free;
  end;

end;

function TEnderecoModel.Update(const Pessoa: TPessoa; Id: integer): Boolean;
begin

 try
    Conexao:= TConexao.create;
    Qry:= TFDQuery.Create(nil);
    Qry.Connection:= Conexao.Pdo;
    Qry.SQL.Add('UPDATE endereco SET idpessoa:=pidpessoa,dscep=:pdscep)');
    Qry.SQL.Add('WHERE idpessoa = :pId');

    Qry.Params.ParamByName('pidpessoa').AsInteger:= PEssoa.idpessoa;
    Qry.Params.ParamByName('pdscep').AsString:= Pessoa.dscep;
    try
      Qry.ExecSQL;
      Result:= true;
    except
      Result:= false;
    end;
  finally
    Conexao.Free;
    Qry.Free;
  end;

end;

end.
