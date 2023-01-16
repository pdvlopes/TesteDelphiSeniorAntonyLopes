unit PessoaModel;

interface

uses Dao, Pessoa,FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Data.DB,FireDAC.Comp.Client,EnderecoModel,Endereco_Integracao;

type
TPessoaModel = class

private
Conexao:TConexao;
Qry:TFDQuery;
Endereco:TEnderecoModel;
Integracao:tEndereco_Integracao;
Pessoa:TPessoa;

public
public function Salvar(const Pessoa:TPessoa):Boolean;
public function Deletar(Id:Integer):boolean;
public function Update(const Pessoa:TPessoa;Id:integer):Boolean;
public function CapturarValorSequence:Integer;


end;
implementation

{ TPessoaModel }

function TPessoaModel.CapturarValorSequence: Integer;
begin
try
    Conexao:= TConexao.create;
    Qry:= TFDQuery.Create(nil);
    Qry.Connection:= Conexao.Pdo;
    Qry.SQL.Add('SELECT last_value FROM PESSOA_IDPESSOA_seq');
    try
      Qry.Open();
      Result:= Qry.Fields[0].AsInteger +1;
    except

    end;
  finally
    Conexao.Free;
    Qry.Free;
  end;

end;

function TPessoaModel.Deletar(Id: Integer): boolean;
begin
  try

    Conexao:= TConexao.create;
    Qry:= TFDQuery.Create(nil);
    Qry.Connection:= Conexao.Pdo;
    Qry.SQL.Add('DELETE FROM pessoa WHERE idpessoa =:pId');
    Qry.Params.ParamByName('pId').AsInteger:= Id;
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

function TPessoaModel.Salvar(const Pessoa: TPessoa): Boolean;
var
Id:Integer;
begin

 try

    Conexao:= TConexao.create;
    Qry:= TFDQuery.Create(nil);
    Qry.Connection:= Conexao.Pdo;
    Qry.SQL.Add('INSERT INTO integracao_endereco(flnatureza,dsdocumento,nmprimeiro,nmsegundo,dtregistro)');
    Qry.SQL.Add('VALUES(:pflnatureza,:pdsdocumento,:pnmprimeiro,:pnmsegundo,:pdtregistro)');

    Qry.Params.ParamByName('pflnatureza').AsInteger:= PEssoa.flnatureza;
    Qry.Params.ParamByName('pdsdocumento').AsString:= Pessoa.dsdocumento;
    Qry.Params.ParamByName('pnmprimeiro').AsString:= Pessoa.nmprimeiro;
    Qry.Params.ParamByName('pnmsegundo').AsString:= Pessoa.nmsegundo;
    Qry.Params.ParamByName('pdtregistro').AsDate:= Pessoa.dtregistro;
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

function TPessoaModel.Update(const Pessoa: TPessoa; Id: integer): Boolean;
begin

 try
    Conexao:= TConexao.create;
    Qry:= TFDQuery.Create(nil);
    Qry.Connection:= Conexao.Pdo;
    Qry.SQL.Add('UPDATE integracao_endereco flnatureza:=:pflnatureza,dsdocumento=:pdsdocumento,nmprimeiro=:pnmprimeiro,nmsegundo=:pnmsegundo,dtregistro=:pdtregistro)');
    Qry.SQL.Add('WHERE idpessoa = :pId');

    Qry.Params.ParamByName('pflnatureza').AsInteger:= PEssoa.flnatureza;
    Qry.Params.ParamByName('pdsdocumento').AsString:= Pessoa.dsdocumento;
    Qry.Params.ParamByName('pnmprimeiro').AsString:= Pessoa.nmprimeiro;
    Qry.Params.ParamByName('pnmsegundo').AsString:= Pessoa.nmsegundo;
    Qry.Params.ParamByName('pdtregistro').AsDate:= Pessoa.dtregistro;
    Qry.Params.ParamByName('pId').AsInteger:= Id;
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
