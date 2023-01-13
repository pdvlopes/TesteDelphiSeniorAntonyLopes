unit PessoaController;

interface

uses Pessoa,PessoaModel,System.Classes,System.SysUtils,Vcl.Dialogs;

type
TPessoaController = class(TPessoa)

private
PessoaModel : TPessoaModel;

public
public function Salvar(const Pessoa:TPessoa):Boolean;
private function Validar(const Pessoa:TPessoa):Boolean;
public function Deletar(Id:Integer):boolean;
public function Update(const Pessoa:TPessoa;Id:integer):Boolean;
public function InsertEmLote(const Pessoa:TPessoa):Boolean;

end;

implementation

{ TPessoaController }

function TPessoaController.Deletar(Id: Integer): boolean;
begin
  if Id <>0 then
    begin
      PessoaModel:= TPessoaModel.Create;
      Result:= PessoaModel.Deletar(Id);
  end;
end;

function TPessoaController.InsertEmLote(const Pessoa: TPessoa): Boolean;
begin
  if Validar(Pessoa) then
    begin
      PessoaModel:= TPessoaModel.Create;
      Result:= PessoaModel.InsertEmLote(Pessoa);
    end;
end;

function TPessoaController.Salvar(const Pessoa: TPessoa): Boolean;
begin
  if Validar(Pessoa) then
    begin
      PessoaModel := TPessoaModel.Create;
      Result:= PessoaModel.Salvar(Pessoa);
    end;
end;

function TPessoaController.Update(const Pessoa: TPessoa; Id: integer): Boolean;
begin
if Validar(Pessoa) then
    begin
      PessoaModel := TPessoaModel.Create;
      Result:= PessoaModel.Salvar(Pessoa);
    end;
end;

function TPessoaController.Validar(const Pessoa: TPessoa): Boolean;
begin
  if Pessoa.flnatureza = 0 then
    raise Exception.Create('Selecione a natureza');
  if Pessoa.dsdocumento = '' then
    raise Exception.Create('Digite o documento');
  if Pessoa.nmprimeiro = '' then 
    raise Exception.Create('Digite o primeiro Nome');
  if Pessoa.nmsegundo ='' then
    raise Exception.Create('Digite segundo nome');
  if Pessoa.dscep = '' then
    raise Exception.Create('Digite o cep');
  if Pessoa.dsuf = '' then
    raise Exception.Create('Digite a uf');
  if Pessoa.nmcidade = '' then
    raise Exception.Create('Digite a cidade');
  if Pessoa.nmbairro = '' then
    raise Exception.Create('Digite o bairro');
  if Pessoa.nmlogradouro = '' then
    raise Exception.Create('Digite o lagradouro');

  result:= True;

end;

end.
