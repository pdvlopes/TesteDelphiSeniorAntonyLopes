unit EnderecoIntegracao;

interface

type
TEnderecoIntegracao = class

private
  Fdsuf:string[50];
  Fnmcidade:string[100];
  Fnmbairro:string[50];
  Fnmlogradouro:string[100];
  Fdscomplemento:string[100];
    function Getdsuf: string;
    function Getlogradouro: string;
    function Getnmbairro: string;
    function Getnmcidade: string;
    procedure Setdsuf(const Value: string);
    procedure Setnmbairro(const Value: string);
    procedure Setnmcidade(const Value: string);
    procedure Setnmlogradouro(const Value: string);
    function Getdscomplemento: string;
    procedure Setdscomplemento(const Value: string);
public

  property dsuf:string read Getdsuf write Setdsuf;
  property nmcidade:string read Getnmcidade write Setnmcidade;
  property nmbairro:string read Getnmbairro write Setnmbairro;
  property nmlogradouro:string read Getlogradouro write Setnmlogradouro;
  property dscomplemento:string read Getdscomplemento write Setdscomplemento;





end;

implementation

{ TEnderecoIntegracao }

function TEnderecoIntegracao.Getdscomplemento: string;
begin
  Result:= Fdscomplemento;
end;

function TEnderecoIntegracao.Getdsuf: string;
begin
  Result:= Fdsuf;
end;

function TEnderecoIntegracao.Getlogradouro: string;
begin
  Result:= Fnmlogradouro;
end;

function TEnderecoIntegracao.Getnmbairro: string;
begin
  Result:= Fnmbairro;
end;

function TEnderecoIntegracao.Getnmcidade: string;
begin
  Result:= Fnmcidade;
end;

procedure TEnderecoIntegracao.Setdscomplemento(const Value: string);
begin
  Fdscomplemento:= Value;
end;

procedure TEnderecoIntegracao.Setdsuf(const Value: string);
begin
  Fdsuf:= Value;
end;

procedure TEnderecoIntegracao.Setnmbairro(const Value: string);
begin
  Fnmbairro:= Value;
end;

procedure TEnderecoIntegracao.Setnmcidade(const Value: string);
begin
  Fnmcidade:= Value;
end;

procedure TEnderecoIntegracao.Setnmlogradouro(const Value: string);
begin
  Fnmlogradouro:= Value;
end;

end.
