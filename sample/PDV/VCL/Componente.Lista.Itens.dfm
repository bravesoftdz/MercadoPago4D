object CtrlListaVenda: TCtrlListaVenda
  Left = 0
  Top = 0
  Width = 599
  Height = 60
  Align = alTop
  TabOrder = 0
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 599
    Height = 60
    Align = alClient
    BevelOuter = bvNone
    Color = 6994790
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 112
    ExplicitTop = 32
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 599
      Height = 30
      Align = alTop
      BevelOuter = bvNone
      Padding.Left = 5
      Padding.Right = 5
      TabOrder = 0
      ExplicitWidth = 185
      object Label1: TLabel
        Left = 5
        Top = 0
        Width = 28
        Height = 30
        Align = alLeft
        Caption = 'ITEM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object Bevel3: TBevel
        Left = 33
        Top = 0
        Width = 11
        Height = 30
        Align = alLeft
        Shape = bsSpacer
        ExplicitLeft = 39
      end
      object Label2: TLabel
        Left = 44
        Top = 0
        Width = 74
        Height = 30
        Align = alLeft
        Caption = 'ID_PRODUTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitLeft = 126
      end
      object Bevel4: TBevel
        Left = 118
        Top = 0
        Width = 11
        Height = 30
        Align = alLeft
        Shape = bsSpacer
      end
      object Label3: TLabel
        Left = 129
        Top = 0
        Width = 465
        Height = 30
        Align = alClient
        Caption = 'DECRICAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitLeft = 135
        ExplicitTop = -6
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 30
      Width = 599
      Height = 30
      Align = alBottom
      BevelOuter = bvNone
      Padding.Left = 5
      Padding.Right = 5
      TabOrder = 1
      ExplicitTop = 0
      ExplicitWidth = 185
      object Label4: TLabel
        Left = 5
        Top = 0
        Width = 73
        Height = 30
        Align = alLeft
        Alignment = taRightJustify
        Caption = 'QUANTIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitLeft = 42
        ExplicitHeight = 13
      end
      object Bevel1: TBevel
        Left = 78
        Top = 0
        Width = 11
        Height = 30
        Align = alLeft
        Shape = bsSpacer
        ExplicitLeft = 110
      end
      object Label5: TLabel
        Left = 89
        Top = 0
        Width = 23
        Height = 30
        Align = alLeft
        Caption = 'UND'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitLeft = 126
        ExplicitHeight = 13
      end
      object Label6: TLabel
        Left = 112
        Top = 0
        Width = 7
        Height = 30
        Align = alLeft
        Caption = 'X'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitLeft = 149
        ExplicitHeight = 13
      end
      object Label7: TLabel
        Left = 119
        Top = 0
        Width = 76
        Height = 30
        Align = alLeft
        Alignment = taRightJustify
        Caption = 'VL_UNITARIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitLeft = 247
        ExplicitHeight = 13
      end
      object Bevel2: TBevel
        Left = 195
        Top = 0
        Width = 11
        Height = 30
        Align = alLeft
        Shape = bsSpacer
        ExplicitLeft = 318
      end
      object Label8: TLabel
        Left = 206
        Top = 0
        Width = 388
        Height = 30
        Align = alClient
        Alignment = taRightJustify
        Caption = 'VL_TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitLeft = 538
        ExplicitWidth = 56
        ExplicitHeight = 13
      end
    end
  end
end
