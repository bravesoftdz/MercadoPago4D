object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'QR Code PDV Mercado Pago v2 (Biblioteca)'
  ClientHeight = 345
  ClientWidth = 661
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 319
    Height = 329
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 334
    Top = 8
    Width = 319
    Height = 329
    BevelOuter = bvNone
    TabOrder = 1
    object Image1: TImage
      Left = 0
      Top = 0
      Width = 319
      Height = 329
      Align = alClient
      ExplicitTop = -1
    end
  end
  object MainMenu1: TMainMenu
    Left = 280
    Top = 264
    object Credenciamento1: TMenuItem
      Caption = 'Credenciamento'
      object CriarStore1: TMenuItem
        Caption = 'Criar Store'
      end
      object BuscarStores1: TMenuItem
        Caption = 'Atualizar Stores'
      end
      object ApagarStore1: TMenuItem
        Caption = 'Apagar Store'
      end
      object GerarQRCode1: TMenuItem
        Caption = 'Gerar QR Code'
      end
      object ApagarStore2: TMenuItem
        Caption = 'Atualizar QR COde'
      end
      object BuscarQRsgeral1: TMenuItem
        Caption = 'Buscar QRs geral'
      end
      object BuscarQRporExternalID1: TMenuItem
        Caption = 'Buscar QR por External_ID'
      end
      object ApagarQRCOde1: TMenuItem
        Caption = 'Apagar QR COde'
      end
      object ImprimirQRmanualmente1: TMenuItem
        Caption = 'Imprimir QR manualmente'
      end
      object OAuthAutorizaoMPConnectMarketplace1: TMenuItem
        Caption = 'OAuth - Autoriza'#231#227'o MP Connect / Marketplace'
      end
      object OauthRenovaoMPConnectMarketplace1: TMenuItem
        Caption = 'Oauth - Renova'#231#227'o MP Connect / Marketplace'
      end
    end
    object ransacional1: TMenuItem
      Caption = 'Transacional'
      object CarregarPedidonoQR1: TMenuItem
        Caption = 'Carregar Pedido no QR'
      end
      object ConsultardisponibilidadenoQR1: TMenuItem
        Caption = 'Consultar disponibilidade no QR'
      end
      object ApagarPedidonoQR1: TMenuItem
        Caption = 'Apagar Pedido no QR'
      end
      object ConsultarPedido1: TMenuItem
        Caption = 'Consultar Pedido'
      end
      object ProcurarPedido1: TMenuItem
        Caption = 'Procurar Pedido'
      end
    end
    object PsVenda1: TMenuItem
      Caption = 'P'#243's Venda'
      object ConsultarPagamento1: TMenuItem
        Caption = 'Consultar Pagamento'
      end
      object ProcurarPagamento1: TMenuItem
        Caption = 'Procurar Pagamento'
      end
      object DevoluoEstornodePagamento1: TMenuItem
        Caption = 'Devolu'#231#227'o/Estorno de Pagamento'
      end
      object DevoluoEstornoParcialdePagamento1: TMenuItem
        Caption = 'Devolu'#231#227'o/Estorno Parcial de Pagamento'
      end
    end
    object Gerarusurioteste1: TMenuItem
      Caption = 'Gerar usu'#225'rio teste'
    end
  end
end
