program CadastroClientes;

uses
  Forms,
  UCadastroCliente in 'UCadastroCliente.pas' {FCadastroClient},
  uLkJSON in 'uLkJSON.pas',
  UConfigurarEmail in 'UConfigurarEmail.pas' {FConfEmail};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFCadastroClient, FCadastroClient);
  Application.Run;
end.
