unit IntegracaoController;

interface

uses Pessoa,Endereco_Integracao,Enderecocontroller,FireDAC.Stan.Option, System.SysUtils,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client;

type
TEnderecoIntegracaoController   = class

private
  Pessoa:TPessoa;
  IntegracaoModel :tEndereco_Integracao;
  Endereco:TEnderecoController;

public
  procedure Salvar;
   function Localizaendereco(Cep:string):TPessoa;

end;

implementation

{ TTEnderecoIntegracaoController   }

function TEnderecoIntegracaoController.Localizaendereco(Cep: string): TPessoa;
begin
  IntegracaoModel:= tEndereco_Integracao.Create;
  Result:= IntegracaoModel.LocalizarEndereco(Cep);
end;

procedure TEnderecoIntegracaoController.Salvar;
begin


end;

end.
