unit EnderecoModel;

interface

uses Pessoa,Dao,FireDAC.Stan.Option, System.SysUtils,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,Endereco_Integracao;

type
TEnderecoModel = class
private
Conexao:TConexao;
Qry:TFDQuery;
Pessoa:TPessoa;

public function Salvar(const Pessoa:TPessoa;IdPessoa:integer):Boolean;
public function Deletar(Id:Integer):boolean;
public function Update(const Pessoa:TPessoa):Boolean;
public procedure SelecionaEnderecos;

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

function TEnderecoModel.Salvar(const Pessoa: TPessoa;IdPessoa:integer): Boolean;
begin
try
    Conexao:= TConexao.create;
    Qry:= TFDQuery.Create(nil);
    Qry.Connection:= Conexao.Pdo;
    Qry.SQL.Add('INSERT INTO endereco(idpessoa,dscep)');
    Qry.SQL.Add('VALUES(:pidpessoa,:pdscep)');

    Qry.Params.ParamByName('pidpessoa').AsInteger:= IdPessoa;
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

procedure TEnderecoModel.SelecionaEnderecos;
var
Integracao:TEndereco_Integracao;
ModelIntegracao: TEndereco_Integracao;
begin
  try
    Conexao:= TConexao.create;
    Qry:= TFDQuery.Create(nil);
    Pessoa:= TPessoa.Create;
    Integracao:=TEndereco_Integracao.create;
    ModelIntegracao:= TEndereco_Integracao.create;
    Qry.Connection:= Conexao.Pdo;
    Qry.SQL.Add('SELECT * FROM endereco');

    try
      Qry.Open;
      Qry.First;

     while Not Qry.Eof do
       begin
         Pessoa:= Integracao.LocalizarEndereco(Qry.FieldByName('dscep').AsString);
         ModelIntegracao.Salvar(Pessoa,Qry.FieldByName('idendereco').AsInteger);
         Qry.Next;
       end;


    except
       raise Exception.Create('Error ao selecionar enderešos.');
    end;
  finally
    Conexao.Free;
    Qry.Free;
  end;
end;

function TEnderecoModel.Update(const Pessoa: TPessoa): Boolean;
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
