unit Endereco;


interface

uses EnderecoIntegracao;

type
TEndereco = class(TEnderecoIntegracao )

  private
  Fidendereco:integer;
  Fdscep:string[15];

    function Getdscep: String;
    function Getidendereco: integer;
    procedure Setdscep(const Value:String);
    procedure Setidendereco(const Value: integer);


  public
  property idendereco:integer read Getidendereco write Setidendereco;
  property dscep:string read Getdscep write Setdscep;

end;

implementation

{ TEndereco }

function TEndereco.Getdscep: String;
begin
  Result:= Fdscep;
end;

function TEndereco.Getidendereco: integer;
begin
  Result:= Fidendereco;
end;

procedure TEndereco.Setdscep(const Value: String);
begin
  Fdscep:= Value;
end;

procedure TEndereco.Setidendereco(const Value: integer);
begin
  Fidendereco := Value;
end;

end.
