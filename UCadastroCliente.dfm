object FCadastroClient: TFCadastroClient
  Left = 352
  Top = 157
  Width = 635
  Height = 490
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'CADASTRO DE CLIENTES'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial'
  Font.Style = [fsBold]
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 19
  object pnlCadCli: TPanel
    Left = 0
    Top = 0
    Width = 619
    Height = 452
    Align = alClient
    TabOrder = 0
    object lblNome: TLabel
      Left = 56
      Top = 13
      Width = 54
      Height = 19
      Caption = 'NOME:'
    end
    object lblIdentidade: TLabel
      Left = 8
      Top = 48
      Width = 105
      Height = 19
      Caption = 'IDENTIDADE:'
    end
    object lblCpf: TLabel
      Left = 269
      Top = 48
      Width = 39
      Height = 19
      Caption = 'CPF:'
    end
    object lblFone: TLabel
      Left = 17
      Top = 80
      Width = 93
      Height = 19
      Caption = 'TELEFONE:'
    end
    object lblEmail: TLabel
      Left = 248
      Top = 80
      Width = 60
      Height = 19
      Caption = 'E-MAIL:'
    end
    object lblEndereco: TLabel
      Left = 196
      Top = 127
      Width = 245
      Height = 19
      Caption = 'INFORMA'#199#213'ES DO ENDERE'#199'O'
    end
    object lblCep: TLabel
      Left = 98
      Top = 177
      Width = 40
      Height = 19
      Caption = 'CEP:'
    end
    object lblLogradouro: TLabel
      Left = 16
      Top = 213
      Width = 123
      Height = 19
      Caption = 'LOGRADOURO:'
    end
    object lblNumero: TLabel
      Left = 60
      Top = 243
      Width = 78
      Height = 19
      Caption = 'N'#218'MERO:'
    end
    object lblComplemento: TLabel
      Left = 228
      Top = 243
      Width = 133
      Height = 19
      Caption = 'COMPLEMENTO:'
    end
    object lblBairro: TLabel
      Left = 68
      Top = 277
      Width = 69
      Height = 19
      Caption = 'BAIRRO:'
    end
    object lblCidade: TLabel
      Left = 69
      Top = 309
      Width = 68
      Height = 19
      Caption = 'CIDADE:'
    end
    object lblUF: TLabel
      Left = 450
      Top = 309
      Width = 28
      Height = 19
      Caption = 'UF:'
    end
    object lblPais: TLabel
      Left = 93
      Top = 341
      Width = 42
      Height = 19
      Caption = 'PA'#205'S:'
    end
    object edtNome: TEdit
      Left = 120
      Top = 8
      Width = 489
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edtIdentidade: TEdit
      Left = 120
      Top = 40
      Width = 121
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edtCpf: TEdit
      Left = 317
      Top = 40
      Width = 121
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnKeyPress = edtCepKeyPress
    end
    object edtFone: TEdit
      Left = 119
      Top = 74
      Width = 121
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnKeyPress = edtCepKeyPress
    end
    object edtEmail: TEdit
      Left = 317
      Top = 74
      Width = 292
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object edtCep: TEdit
      Left = 144
      Top = 173
      Width = 121
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnKeyPress = edtCepKeyPress
    end
    object btnBuscaCep: TButton
      Left = 277
      Top = 173
      Width = 89
      Height = 25
      Caption = 'Consulta Cep'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = btnBuscaCepClick
    end
    object edtLogradouro: TEdit
      Left = 144
      Top = 208
      Width = 465
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object edtNumero: TEdit
      Left = 144
      Top = 240
      Width = 73
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnKeyPress = edtCepKeyPress
    end
    object edtComplemento: TEdit
      Left = 364
      Top = 240
      Width = 242
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
    end
    object edtBairro: TEdit
      Left = 144
      Top = 272
      Width = 225
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
    end
    object edtCidade: TEdit
      Left = 144
      Top = 304
      Width = 289
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
    end
    object edtUF: TEdit
      Left = 482
      Top = 304
      Width = 128
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
    end
    object edtPais: TEdit
      Left = 144
      Top = 336
      Width = 185
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
    end
    object btnCadastrar: TButton
      Left = 144
      Top = 384
      Width = 97
      Height = 49
      Caption = '&Cadastrar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 14
      OnClick = btnCadastrarClick
    end
    object btnLimpar: TButton
      Left = 272
      Top = 384
      Width = 97
      Height = 49
      Caption = '&Limpar'
      TabOrder = 15
      OnClick = btnLimparClick
    end
    object btnSair: TButton
      Left = 400
      Top = 384
      Width = 97
      Height = 49
      Caption = '&Sair'
      TabOrder = 16
      OnClick = btnSairClick
    end
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 464
    Top = 120
    object cdsClientesID: TIntegerField
      FieldName = 'ID'
    end
    object cdsClientesNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsClientesIDENTIDADE: TStringField
      FieldName = 'IDENTIDADE'
      Size = 15
    end
    object cdsClientesCPF: TStringField
      FieldName = 'CPF'
      Size = 15
    end
    object cdsClientesTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 15
    end
    object cdsClientesEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 30
    end
    object cdsClientesCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object cdsClientesLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 80
    end
    object cdsClientesNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object cdsClientesCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object cdsClientesBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 25
    end
    object cdsClientesCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 40
    end
    object cdsClientesUF: TStringField
      FieldName = 'UF'
    end
    object cdsClientesPAIS: TStringField
      FieldName = 'PAIS'
      Size = 35
    end
  end
  object IdHTTP: TIdHTTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 504
    Top = 120
  end
  object IdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL
    Destination = ':465'
    MaxLineAction = maException
    Port = 465
    DefaultPort = 0
    SSLOptions.Method = sslvSSLv23
    SSLOptions.SSLVersions = [sslvSSLv2, sslvSSLv3, sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2]
    SSLOptions.Mode = sslmClient
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 544
    Top = 120
  end
  object IdSMTP: TIdSMTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL
    Port = 465
    SASLMechanisms = <>
    UseTLS = utUseImplicitTLS
    Left = 504
    Top = 160
  end
  object IdMessage: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 544
    Top = 160
  end
  object xmlDadosCliente: TXMLDocument
    Left = 464
    Top = 160
    DOMVendorDesc = 'MSXML'
  end
end
