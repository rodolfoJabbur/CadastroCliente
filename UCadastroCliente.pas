unit UCadastroCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, DBClient, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IdMessage, IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase,
  IdSMTP, xmldom, XMLIntf, msxmldom, XMLDoc, IdAttachmentFile;

type
  TFCadastroClient = class(TForm)
    pnlCadCli: TPanel;
    lblNome: TLabel;
    lblIdentidade: TLabel;
    lblCpf: TLabel;
    lblFone: TLabel;
    lblEmail: TLabel;
    edtNome: TEdit;
    edtIdentidade: TEdit;
    edtCpf: TEdit;
    edtFone: TEdit;
    edtEmail: TEdit;
    lblEndereco: TLabel;
    lblCep: TLabel;
    edtCep: TEdit;
    btnBuscaCep: TButton;
    lblLogradouro: TLabel;
    edtLogradouro: TEdit;
    lblNumero: TLabel;
    edtNumero: TEdit;
    lblComplemento: TLabel;
    edtComplemento: TEdit;
    lblBairro: TLabel;
    edtBairro: TEdit;
    lblCidade: TLabel;
    edtCidade: TEdit;
    lblUF: TLabel;
    edtUF: TEdit;
    lblPais: TLabel;
    edtPais: TEdit;
    btnCadastrar: TButton;
    btnLimpar: TButton;
    btnSair: TButton;
    cdsClientes: TClientDataSet;
    cdsClientesID: TIntegerField;
    cdsClientesNOME: TStringField;
    cdsClientesIDENTIDADE: TStringField;
    cdsClientesCPF: TStringField;
    cdsClientesTELEFONE: TStringField;
    cdsClientesEMAIL: TStringField;
    cdsClientesCEP: TStringField;
    cdsClientesLOGRADOURO: TStringField;
    cdsClientesNUMERO: TStringField;
    cdsClientesCOMPLEMENTO: TStringField;
    cdsClientesBAIRRO: TStringField;
    cdsClientesCIDADE: TStringField;
    cdsClientesUF: TStringField;
    cdsClientesPAIS: TStringField;
    IdHTTP: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;
    IdSMTP: TIdSMTP;
    IdMessage: TIdMessage;
    xmlDadosCliente: TXMLDocument;
    procedure btnSairClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnBuscaCepClick(Sender: TObject);
    procedure edtCepKeyPress(Sender: TObject; var Key: Char);
    procedure btnLimparClick(Sender: TObject);
  private
    { Private declarations }
    procedure GravarDadosCliente;
    procedure LimpaCampos;
    procedure EnviarEmailCliente;
    procedure MontaXML;
    
  public
    { Public declarations }
  end;

var
  FCadastroClient: TFCadastroClient;
  yEnviarEmail   : Boolean;

  const
     APICONSULTACEP : String = 'https://viacep.com.br/ws/';
     CONSUMOAPI     : String = '/json/unicode';

implementation

uses
  uLkJSON, UConfigurarEmail;

{$R *.dfm}

procedure TFCadastroClient.btnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TFCadastroClient.btnCadastrarClick(Sender: TObject);
begin
   if edtNome.Text = '' then
   begin
      MessageDlg('O Nome do cliente é obrigatório!',mtInformation,[mbOK],0);

      if edtNome.CanFocus then
         edtNome.SetFocus;

      Exit;
   end;

   if edtCpf.Text = '' then
   begin
      MessageDlg('O CPF do cliente é obrigatório!',mtInformation,[mbOK],0);

      if edtCpf.CanFocus then
         edtCpf.SetFocus;

      Exit;
   end;

   if edtEmail.Text = '' then
   begin
      MessageDlg('O E-Mail do cliente é obrigatório!',mtInformation,[mbOK],0);

      if edtEmail.CanFocus then
         edtEmail.SetFocus;

      Exit;
   end;

   GravarDadosCliente;

   if yEnviarEmail then
      EnviarEmailCliente;

   LimpaCampos;
end;

procedure TFCadastroClient.GravarDadosCliente;

   function CalcularIDCliente: Integer;
   begin
      try
         Result := 0;
         cdsClientes.Prior;
         Result := cdsClientesID.Value + 1;
         cdsClientes.Next;
         cdsClientes.Edit;
      finally

      end;
   end;

begin
   try
      yEnviarEmail := False;

      if not cdsClientes.Active then
      begin
         cdsClientes.CreateDataSet;
      end;

      if cdsClientes.IsEmpty then
      begin
         cdsClientes.Insert;
         cdsClientesID.Value := 1;
      end
      else
      begin
         cdsClientes.Append;
         cdsClientesID.Value := CalcularIDCliente;
      end;

      cdsClientesNOME.Value        := edtNome.Text;
      cdsClientesIDENTIDADE.Value  := edtIdentidade.Text;
      cdsClientesCPF.Value         := edtCpf.Text;
      cdsClientesTELEFONE.Value    := edtFone.Text;
      cdsClientesEMAIL.Value       := edtEmail.Text;
      cdsClientesCEP.Value         := edtCep.Text;
      cdsClientesLOGRADOURO.Value  := edtLogradouro.Text;
      cdsClientesNUMERO.Value      := edtNumero.Text;
      cdsClientesCOMPLEMENTO.Value := edtComplemento.Text;
      cdsClientesBAIRRO.Value      := edtBairro.Text;
      cdsClientesCIDADE.Value      := edtCidade.Text;
      cdsClientesUF.Value          := edtUF.Text;
      cdsClientesPAIS.Value        := edtPais.Text;

      cdsClientes.Post;
      MessageDlg('Cliente Cadastrado com Sucesso!',mtInformation,[mbOK],0);
      yEnviarEmail := True;

   except
      MessageDlg('Ocorreu um erro ao cadastrar o cliente!',mtError,[mbOK],0);
   end;
end;

procedure TFCadastroClient.LimpaCampos;
begin
   edtNome.Text        := '';
   edtIdentidade.Text  := '';
   edtCpf.Text         := '';
   edtFone.Text        := '';
   edtEmail.Text       := '';
   edtCep.Text         := '';
   edtLogradouro.Text  := '';
   edtNumero.Text      := '';
   edtComplemento.Text := '';
   edtBairro.Text      := '';
   edtCidade.Text      := '';
   edtUF.Text          := '';
   edtPais.Text        := '';
end;

procedure TFCadastroClient.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
     VK_ESCAPE: Close;
   end;
end;

procedure TFCadastroClient.btnBuscaCepClick(Sender: TObject);
var
  xWebService: string;
  xRespostaJson: TlkJSONBase;
begin
   if edtCep.Text = '' then
   begin
      MessageDlg('Cep em Branco!',mtInformation,[mbOK],0);

      if edtCep.CanFocus then
         edtCep.SetFocus;

      Exit;
   end;

   if Length(edtCep.Text) <> 8 then
   begin
      MessageDlg('Digite um Cep válido!',mtInformation,[mbOK],0);

      edtCep.Clear;

      if edtCep.CanFocus then
         edtCep.SetFocus;

      Exit;
   end;

   try
      try
         xWebService  := APICONSULTACEP + Trim(edtCep.Text) + CONSUMOAPI;

         xRespostaJson := TlkJSON.ParseText(IdHTTP.Get(xWebService));

         if xRespostaJson.Field['erro'] <> nil then
         begin
            if xRespostaJson.Field['erro'].Value = 'true' then
            begin
               MessageDlg('O CEP consultado não foi encontrado na base de dados!',mtInformation,[mbOK],0);

               if edtLogradouro.CanFocus then
                  edtLogradouro.SetFocus;

               Exit;
            end;
         end;

         edtLogradouro.Text := xRespostaJson.Field['logradouro'].Value;
         edtBairro.Text     := xRespostaJson.Field['bairro'    ].Value;
         edtCidade.Text     := xRespostaJson.Field['localidade'].Value;
         edtUF.Text         := xRespostaJson.Field['uf'        ].Value;
         edtPais.Text       := 'Brasil';

      finally
         if xRespostaJson <> nil then
            FreeAndNil(xRespostaJson);
      end

   except
      MessageDlg('Falha ao consultar CEP!',mtError,[mbOK],0);
   end;
end;

procedure TFCadastroClient.edtCepKeyPress(Sender: TObject; var Key: Char);
begin
   if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
      key := #0;
end;

procedure TFCadastroClient.btnLimparClick(Sender: TObject);
begin
   LimpaCampos;
end;

procedure TFCadastroClient.EnviarEmailCliente;
var
  xConfEmail: TFConfEmail;
  xMsgDoEmail: TStrings;
begin

   xConfEmail := TFConfEmail.Create(nil);

   xConfEmail.ShowModal;

   if xConfEmail.ModalResult = mrOk then
   begin
      try
         Screen.Cursor := crSQLWait;

         IdSMTP.Port      := StrToInt(xConfEmail.edtPorta.Text);
         IdSMTP.Host      := xConfEmail.edtSmtp.Text;
         IdSMTP.Username  := xConfEmail.edtEmail.Text;
         IdSMTP.Password  := xConfEmail.edtSenha.Text;

         // Tentativa de conexão e autenticação
         try
           if IdSMTP.Connected then
              IdSMTP.Disconnect;

           IdSMTP.Connect;
           IdSMTP.Authenticate;

         except
           on E:Exception do
           begin
             MessageDlg('Erro na conexão e/ou autenticação: ' +
                         E.Message, mtWarning, [mbOK], 0);
             Exit;
           end;
         end;

         // Configuração da mensagem
         IdMessage.From.Address           := IdSMTP.Username;
         IdMessage.ReplyTo.EMailAddresses := IdMessage.From.Address;
         IdMessage.Recipients.Add.Text    := edtEmail.Text;
         IdMessage.Subject                := 'DADOS CADASTRAIS';
         IdMessage.Encoding               := meMIME;

         xMsgDoEmail := TStringList.Create;
         xMsgDoEmail.Add('Prezado cliente,');
         xMsgDoEmail.Add('segue em anexo arquivo com os dados cadastrais.');

         IdMessage.Body := xMsgDoEmail;

         MontaXML;

         //Anexando xml ao Email
         TIdAttachmentFile.Create(IdMessage.MessageParts, TFileName(ExtractFilePath(Application.ExeName)+'DadosCliente.xml'));

         // Envio da mensagem
         try
           IdSMTP.Send(IdMessage);
           MessageDlg('Mensagem enviada com sucesso!', mtInformation, [mbOK], 0);
           IdSMTP.Disconnect;
         except
           On E:Exception do
           begin
             MessageDlg('Erro ao enviar a mensagem: ' +
               E.Message, mtWarning, [mbOK], 0);
           end;
         end;

      finally
         Screen.Cursor := crDefault;
      end;
   end;
end;

procedure TFCadastroClient.MontaXML;
var
  xDadosCadastrais,
  xDadosEndereco: IXMLNode;
begin
   try
      xmlDadosCliente.FileName := '';
      xmlDadosCliente.XML.Text := '';
      xmlDadosCliente.Active   := True;
      xmlDadosCliente.Version  := '1.0';
      xmlDadosCliente.Encoding := 'UTF-8';

      xDadosCadastrais := xmlDadosCliente.AddChild('DADOSCADASTRAIS');

      xDadosCadastrais.AddChild('NOME'      ).Text := edtNome.Text;
      xDadosCadastrais.AddChild('IDENTIDADE').Text := edtIdentidade.Text;
      xDadosCadastrais.AddChild('CPF'       ).Text := edtCpf.Text;
      xDadosCadastrais.AddChild('TELEFONE'  ).Text := edtFone.Text;
      xDadosCadastrais.AddChild('EMAIL'     ).Text := edtEmail.Text;

      xDadosEndereco := xDadosCadastrais.AddChild('ENDERECO');

      xDadosEndereco.AddChild('CEP'        ).Text := edtCep.Text;
      xDadosEndereco.AddChild('LOGRADOURO' ).Text := edtLogradouro.Text;
      xDadosEndereco.AddChild('NUMERO'     ).Text := edtNumero.Text;
      xDadosEndereco.AddChild('COMPLEMENTO').Text := edtComplemento.Text;
      xDadosEndereco.AddChild('BAIRRO'     ).Text := edtBairro.Text;
      xDadosEndereco.AddChild('CIDADE'     ).Text := edtCidade.Text;
      xDadosEndereco.AddChild('UF'         ).Text := edtUF.Text;
      xDadosEndereco.AddChild('PAIS'       ).Text := edtPais.Text;

      xmlDadosCliente.SaveToFile(ExtractFilePath(Application.ExeName)+'DadosCliente.xml');
      xmlDadosCliente.Active := False;

   except
      On E:Exception do
      begin
        MessageDlg('Erro ao gerar arquivo XML com os dados do cadastro: ' +
          E.Message, mtWarning, [mbOK], 0);
      end;
   end;
end;

end.
