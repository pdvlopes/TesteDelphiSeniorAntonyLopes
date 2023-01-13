unit Endereco_Integracao;

interface

uses Pessoa,Dao,FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client ;

type

tEndereco_Integracao = class

private
Conexao:TConexao;
Qry:TFDQuery;

public function Salvar(const Pessoa:TPessoa):Boolean;
public function Deletar(Id:Integer):boolean;
public function Update(const Pessoa:TPessoa;Id:integer):Boolean;
public function InsertEmLote(const Pessoa:TPessoa):Boolean;

end;

implementation

{ tEndereco_Integracao }

function tEndereco_Integracao.Deletar(Id: Integer): boolean;
begin
try
    Conexao:= TConexao.create;
    Qry:= TFDQuery.Create(nil);
    Qry.Connection:= Conexao.Pdo;
    Qry.SQL.Add('DELETE FROM endereco_integracao WHERE idendereco=:pId');
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

function tEndereco_Integracao.InsertEmLote(const Pessoa: TPessoa): Boolean;
begin

end;

function tEndereco_Integracao.Salvar(const Pessoa: TPessoa): Boolean;
begin

 try
    Conexao:= TConexao.create;
    Qry:= TFDQuery.Create(nil);
    Qry.Connection:= Conexao.Pdo;
    Qry.SQL.Add('INSERT INTO pessoa(idendereco,dsuf,nmcidade,nmlogradouro,dscomplemento)');
    Qry.SQL.Add('VALUES(:pidendereco,:pdsuf,:pnmcidade,:pnmlogradouro,:pdscomplemento)');

    Qry.Params.ParamByName('pidendereco').AsInteger:= PEssoa.idendereco;
    Qry.Params.ParamByName('pdsuf').AsString:= Pessoa.dsuf;
    Qry.Params.ParamByName('pnmcidade').AsInteger:= PEssoa.nmcidade;
    Qry.Params.ParamByName('pnmlogradouro').AsString:= Pessoa.nmlogradouro;
    Qry.Params.ParamByName('pnmbairro').AsInteger:= PEssoa.nmbairro;
    Qry.Params.ParamByName('pdscomplemento').AsInteger:= PEssoa.dscomplemento;


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

function tEndereco_Integracao.Update(const Pessoa: TPessoa;
  Id: integer): Boolean;
begin

 try
    Conexao:= TConexao.create;
    Qry:= TFDQuery.Create(nil);
    Qry.Connection:= Conexao.Pdo;
    Qry.SQL.Add('UPDATE endereco SET idendereco=:pidendereco,nmbairro=:pnmbairro,nmcidade=:pnmcidade,nmlogradouro=:pnmlogradouro,dsuf=:pdsuf,dscomplemento=:pdscomplemento)');
    Qry.SQL.Add('WHERE idpessoa = :pId');

    Qry.Params.ParamByName('pidendereco').AsInteger:= PEssoa.idendereco;
    Qry.Params.ParamByName('pdsuf').AsString:= Pessoa.dsuf;
    Qry.Params.ParamByName('pnmcidade').AsInteger:= PEssoa.nmcidade;
    Qry.Params.ParamByName('pnmlogradouro').AsString:= Pessoa.nmlogradouro;
    Qry.Params.ParamByName('pnmbairro').AsInteger:= PEssoa.nmbairro;
    Qry.Params.ParamByName('pdscomplemento').AsInteger:= PEssoa.dscomplemento;
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