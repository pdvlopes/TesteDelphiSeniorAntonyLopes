unit Pessoa;

interface

uses Endereco;
type
TPessoa = class(TEndereco)
 private
 Fidpessoa:Integer;
 Fflnatureza:Integer;
 Fdsdocumento:string[20];
 Fnmprimeiro:string[100];
 Fnmsegundo:string[100];
 Fdtregistro:TDate;
    function Getidpessoa: integer;
    procedure Setidpessoa(const Value: integer);
    function Getdsdoocumento: String;
    function Getdtregistro: TDate;
    function Getflnatureza: Integer;
    function Getnmprimeiro: String;
    function Getnmsegundo: String;
    procedure Setdsdocumento(const Value: String);
    procedure Setdtregistro(const Value: TDate);
    procedure Setflnatureza(const Value: Integer);
    procedure Setnmprimeiro(const Value: String);
    procedure Setnmsegundo(const Value: String);

 public

 property idpessoa:integer read Getidpessoa write Setidpessoa;
 property flnatureza:Integer read Getflnatureza write Setflnatureza;
 property dsdocumento:string read Getdsdoocumento write Setdsdocumento;
 property nmprimeiro:string read Getnmprimeiro write Setnmprimeiro;
 property nmsegundo:string read Getnmsegundo write Setnmsegundo;
 property dtregistro:TDate read Getdtregistro write Setdtregistro;

end;


implementation

{ TPessoa }

function TPessoa.Getdsdoocumento: String;
begin
  Result:= Fdsdocumento;
end;

function TPessoa.Getdtregistro: TDate;
begin
  Result:= Fdtregistro;
end;

function TPessoa.Getflnatureza: Integer;
begin
  Result:= Fflnatureza;
end;

function TPessoa.Getidpessoa: integer;
begin
  Result:= Fidpessoa;
end;

function TPessoa.Getnmprimeiro: String;
begin
  Result:= Fnmprimeiro;
end;

function TPessoa.Getnmsegundo: String;
begin
  Result:= Fnmsegundo;
end;

procedure TPessoa.Setdsdocumento(const Value: String);
begin
  Fdsdocumento := Value;
end;

procedure TPessoa.Setdtregistro(const Value: TDate);
begin
  Fdtregistro:=Value;
end;

procedure TPessoa.Setflnatureza(const Value: Integer);
begin
  Fflnatureza:= Value;
end;

procedure TPessoa.Setidpessoa(const Value: integer);
begin
  Fidpessoa:= Value;
end;

procedure TPessoa.Setnmprimeiro(const Value: String);
begin
  Fnmprimeiro:= Value;
end;

procedure TPessoa.Setnmsegundo(const Value:String);
begin
   Fnmsegundo:= Value;
end;

end.
