object FConfEmail: TFConfEmail
  Left = 405
  Top = 286
  Width = 321
  Height = 266
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Configurar E-mail'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = [fsBold]
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 15
  object pnlConfEmail: TPanel
    Left = 0
    Top = 0
    Width = 305
    Height = 228
    Align = alClient
    TabOrder = 0
    object lblTitulo: TLabel
      Left = 52
      Top = 8
      Width = 199
      Height = 16
      Caption = 'CONFIGURAR E-MAIL DE ENVIO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblsMTP: TLabel
      Left = 29
      Top = 77
      Width = 36
      Height = 15
      Caption = 'SMTP:'
    end
    object lblPorta: TLabel
      Left = 24
      Top = 48
      Width = 42
      Height = 15
      Caption = 'PORTA:'
    end
    object lblEmail: TLabel
      Left = 21
      Top = 108
      Width = 42
      Height = 15
      Caption = 'E-MAIL:'
    end
    object lblSenha: TLabel
      Left = 21
      Top = 140
      Width = 42
      Height = 15
      Caption = 'SENHA:'
    end
    object edtPorta: TEdit
      Left = 72
      Top = 40
      Width = 97
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edtSmtp: TEdit
      Left = 72
      Top = 72
      Width = 217
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edtEmail: TEdit
      Left = 72
      Top = 104
      Width = 217
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object edtSenha: TEdit
      Left = 72
      Top = 136
      Width = 217
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 3
    end
    object btnEnviar: TButton
      Left = 60
      Top = 179
      Width = 75
      Height = 33
      Caption = '&Enviar'
      TabOrder = 4
      OnClick = btnEnviarClick
    end
    object btnCancelar: TButton
      Left = 180
      Top = 179
      Width = 75
      Height = 33
      Caption = '&Cancelar'
      TabOrder = 5
      OnClick = btnCancelarClick
    end
  end
end
