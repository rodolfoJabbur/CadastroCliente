unit UConfigurarEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TFConfEmail = class(TForm)
    pnlConfEmail: TPanel;
    lblTitulo: TLabel;
    lblsMTP: TLabel;
    lblPorta: TLabel;
    lblEmail: TLabel;
    lblSenha: TLabel;
    edtPorta: TEdit;
    edtSmtp: TEdit;
    edtEmail: TEdit;
    edtSenha: TEdit;
    btnEnviar: TButton;
    btnCancelar: TButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConfEmail: TFConfEmail;

implementation

{$R *.dfm}

procedure TFConfEmail.btnCancelarClick(Sender: TObject);
begin
   Close;
end;

procedure TFConfEmail.btnEnviarClick(Sender: TObject);
begin
   Self.ModalResult := mrOk;
end;

end.
