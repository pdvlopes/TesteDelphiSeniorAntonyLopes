unit UPrin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,EnderecoModel,Endereco_Integracao,
  Vcl.Menus,FrmCadCliente, Vcl.StdCtrls, Vcl.ExtCtrls,PEssoa;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    CadastrodeClientes2: TMenuItem;
    ImportarclientesTXT2: TMenuItem;
    AtualizaEndereoTrhead1: TMenuItem;
    memo: TMemo;
    lblcep: TLabeledEdit;
    Button1: TButton;
    procedure CadastrodeClientes2Click(Sender: TObject);
    procedure AtualizaEndereoTrhead1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.AtualizaEndereoTrhead1Click(Sender: TObject);
var
  Integracao:TEnderecoModel;
  lThread: TThread;
begin
  Integracao:= TEnderecoModel.Create;
  lThread := TThread.CreateAnonymousThread(Integracao.SelecionaEnderecos);
  lThread.Start();
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  Integracao:tEndereco_Integracao;
  Pessoa:TPEssoa;
begin
  Integracao:= tEndereco_Integracao.Create;
  PEssoa:=TPessoa.Create;
  PEssoa:= Integracao.LocalizarEndereco(lblcep.text);
  memo.Lines.Add(Pessoa.dsuf);
end;

procedure TForm1.CadastrodeClientes2Click(Sender: TObject);
begin
  try
    CadCliente:= TCadCliente.Create(Nil);
    CadCliente.ShowModal();
  finally
     CadCliente.Free;
  end;

end;

end.
