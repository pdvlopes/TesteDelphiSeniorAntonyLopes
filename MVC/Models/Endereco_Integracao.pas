unit Endereco_Integracao;

interface

uses Pessoa,Dao,FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait,  System.JSON,IdHTTP,Data.DB, FireDAC.Comp.Client ;

type

tEndereco_Integracao = class

private
Conexao:TConexao;
Qry:TFDQuery;
Pessoa:TPessoa;


public function Salvar(const Pessoa:TPessoa;Idendereco:integer):Boolean;
public function Deletar(Id:Integer):boolean;
public function Update(const Pessoa:TPessoa;Id:integer):Boolean;
function LocalizarEndereco(Cep:string):TPessoa;

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

function tEndereco_Integracao.LocalizarEndereco(Cep: string): TPessoa;
var

 IdHTTP1:TIdHTTP;
 Str :String;
 jsonObject:TJsonObject;

begin
  IdHTTP1:= TIdHTTP.Create(nil);
  try
    IdHTTP1.Request.UserAgent:='Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV2';
    Str := IdHTTP1.get('http://viacep.com.br/ws/' + Cep +'/json');

    Pessoa:= TPessoa.Create;
    jsonObject := TJsonObject.ParseJSONValue(str) as TJsonObject;
    Pessoa:= TPessoa.Create;
    Pessoa.nmlogradouro := jsonObject.GetValue('logradouro').Value;
    Pessoa.nmbairro:=jsonObject.GetValue('bairro').Value;
    Pessoa.nmcidade:= jsonObject.GetValue('localidade').Value;
    Pessoa.dsuf:= jsonObject.GetValue('uf').Value;

    Result:= Pessoa;
  finally
      IdHTTP1. Free;
      Pessoa.Free;
  end;


end;

function tEndereco_Integracao.Salvar(const Pessoa: TPessoa;IdEndereco:integer): Boolean;
var
cidade,bairro,uf,endereco:string;
begin

 try
    Conexao:= TConexao.create;
    Qry:= TFDQuery.Create(nil);
    Qry.Connection:= Conexao.Pdo;
    Qry.SQL.Add('INSERT INTO endereco_integracao(idendereco,dsuf,nmcidade,nmlogradouro,nmbairro)');
    Qry.SQL.Add('VALUES(:pidendereco,:pdsuf,:pnmcidade,:pnmlogradouro,:pnmbairro)');

    cidade:= Pessoa.nmcidade;
    endereco:= PEssoa.nmlogradouro;
    bairro:=Pessoa.nmbairro;
    uf:= Pessoa.dsuf;
    Qry.Params.ParamByName('pidendereco').AsInteger:= Idendereco;
    Qry.Params.ParamByName('pdsuf').AsString:= uf;
    Qry.Params.ParamByName('pnmcidade').AsString:= cidade;
    Qry.Params.ParamByName('pnmlogradouro').AsString:= endereco;
    Qry.Params.ParamByName('pnmbairro').Asstring:=bairro;
   // Qry.Params.ParamByName('pdscomplemento').AsString:= PEssoa.dscomplemento;

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
    Qry.SQL.Add('UPDATE endereco_integracao SET idendereco=:pidendereco,nmbairro=:pnmbairro,nmcidade=:pnmcidade,nmlogradouro=:pnmlogradouro,dsuf=:pdsuf,dscomplemento=:pdscomplemento)');
    Qry.SQL.Add('WHERE idpessoa = :pId');

    Qry.Params.ParamByName('pidendereco').AsInteger:= PEssoa.idendereco;
    Qry.Params.ParamByName('pdsuf').AsString:= Pessoa.dsuf;
    Qry.Params.ParamByName('pnmcidade').Asstring:= PEssoa.nmcidade;
    Qry.Params.ParamByName('pnmlogradouro').AsString:= Pessoa.nmlogradouro;
    Qry.Params.ParamByName('pnmbairro').AsString:= PEssoa.nmbairro;
    Qry.Params.ParamByName('pdscomplemento').AsString:= PEssoa.dscomplemento;
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
