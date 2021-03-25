object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 456
  ClientWidth = 803
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
  object Image1: TImage
    Left = 393
    Top = 40
    Width = 394
    Height = 407
  end
  object Memo2: TMemo
    Left = 10
    Top = 40
    Width = 377
    Height = 407
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 8
    Top = 8
    Width = 143
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 200
    Top = 9
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 296
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 393
    Top = 9
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 4
    OnClick = Button3Click
  end
  object MainMenu1: TMainMenu
    Left = 296
    Top = 280
    object Credenciamento1: TMenuItem
      Caption = 'Credenciamento'
      object CriarStore1: TMenuItem
        Caption = 'Criar Store'
        OnClick = CriarStore1Click
      end
      object AtualizarStore1: TMenuItem
        Caption = 'Atualizar Store'
        OnClick = AtualizarStore1Click
      end
      object BuscarStores1: TMenuItem
        Caption = 'Buscar Stores'
        OnClick = BuscarStores1Click
      end
      object ApagarStore1: TMenuItem
        Caption = 'Apagar Store'
        OnClick = ApagarStore1Click
      end
      object ApagarStore2: TMenuItem
        Caption = 'Gerar QR Code'
        OnClick = ApagarStore2Click
      end
      object ApagarStore3: TMenuItem
        Caption = 'Atualizar QR Code'
        OnClick = ApagarStore3Click
      end
      object BuscarQRgeral1: TMenuItem
        Caption = 'Buscar QR geral'
        OnClick = BuscarQRgeral1Click
      end
      object BuscarQRporExternalID1: TMenuItem
        Caption = 'Buscar QR por External_ID'
        OnClick = BuscarQRporExternalID1Click
      end
      object ApagarQRCode1: TMenuItem
        Caption = 'Apagar QR Code'
        OnClick = ApagarQRCode1Click
      end
      object ImprimirQRManualmente1: TMenuItem
        Caption = 'Imprimir QR Manualmente'
        OnClick = ImprimirQRManualmente1Click
      end
      object ImprimirQRManualmente2: TMenuItem
        Caption = 'OAuth - Autoriza'#231#227'o MP Connect / Marketplace'
      end
      object OAuthRenovaoMPConnectMarketplace1: TMenuItem
        Caption = 'OAuth - Renova'#231#227'o MP Connect / Marketplace'
      end
    end
    object ransacional1: TMenuItem
      Caption = 'Transacional'
      object CarregarPedidonoQR1: TMenuItem
        Caption = 'Carregar Pedido no QR'
        OnClick = CarregarPedidonoQR1Click
      end
      object ConsultardisponibilidadedoQR1: TMenuItem
        Caption = 'Consultar disponibilidade do QR'
        OnClick = ConsultardisponibilidadedoQR1Click
      end
      object ApagarPedidonoQR1: TMenuItem
        Caption = 'Apagar Pedido no QR'
        OnClick = ApagarPedidonoQR1Click
      end
      object ConsultaPedidomerchantorder1: TMenuItem
        Caption = 'Consulta Pedido (merchant order)'
        OnClick = ConsultaPedidomerchantorder1Click
      end
      object ProcurarPedidomerchantorder1: TMenuItem
        Caption = 'Procurar Pedido (merchant order)'
        OnClick = ProcurarPedidomerchantorder1Click
      end
    end
    object PsVenda1: TMenuItem
      Caption = 'P'#243's Venda'
      object ConsultarPagamento1: TMenuItem
        Caption = 'Consultar Pagamento'
        OnClick = ConsultarPagamento1Click
      end
      object ProcurarPagamento1: TMenuItem
        Caption = 'Procurar Pagamento'
        OnClick = ProcurarPagamento1Click
      end
      object DevoluoEstornodePagamento1: TMenuItem
        Caption = 'Devolu'#231#227'o/Estorno de Pagamento'
        OnClick = DevoluoEstornodePagamento1Click
      end
      object DevoluoEstornoParcialdePagamento1: TMenuItem
        Caption = 'Devolu'#231#227'o/Estorno Parcial de Pagamento'
        OnClick = DevoluoEstornoParcialdePagamento1Click
      end
    end
  end
end
