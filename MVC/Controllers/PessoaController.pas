unit PessoaController;

interface

uses Pessoa,PessoaModel,System.Classes,System.SysUtils,Vcl.Dialogs,Enderecocontroller;

type
TPessoaController = class(TPessoa)

private
PessoaModel : TPessoaModel;
Enderecocontroller: TEnderecoController;

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
      Result:= PessoaModel.Salvar(Pessoa);
    end;
end;

function TPessoaController.Salvar(const Pessoa: TPessoa): Boolean;
 var
  IdPessoa:Integer;
begin
  if Validar(Pessoa) then
    begin
      PessoaModel := TPessoaModel.Create;
      Enderecocontroller:= TEnderecoController.create;
      try
        IdPessoa:= PessoaModel.CapturarValorSequence();
        PessoaModel.Salvar(Pessoa);
        Enderecocontroller.Salvar(Pessoa,IdPessoa);
        Result:= True;
        ShowMessage('Salvo Com sucesso!');
      except
        raise Exception.Create('Error ao salvar.');

      end;
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

  if Pessoa.dsdocumento = '' then
    raise Exception.Create('Digite o documento');
  if Pessoa.nmprimeiro = '' then 
    raise Exception.Create('Digite o primeiro Nome');
  if Pessoa.nmsegundo ='' then
    raise Exception.Create('Digite segundo nome');
  if (Pessoa.dscep = '') or (Length(Pessoa.dscep) < 8)  then
    raise Exception.Create('Digite o cep com 8 digitos.');

  result:= True;

end;

end.
