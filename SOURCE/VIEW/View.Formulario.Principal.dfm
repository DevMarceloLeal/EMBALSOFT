object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'FrmPrincipal'
  ClientHeight = 446
  ClientWidth = 427
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 15
  inline FrameCadastros: TFrameCadastros
    Left = 0
    Top = 0
    Width = 427
    Height = 84
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 427
  end
  inline FrameDados: TFrameDados
    Left = 0
    Top = 84
    Width = 427
    Height = 282
    Align = alClient
    TabOrder = 1
    ExplicitTop = 84
    ExplicitWidth = 427
    ExplicitHeight = 282
    inherited dbgCadastros: TDBGrid
      Width = 427
      Height = 282
    end
  end
  inline FrameTotal: TFrameTotal
    Left = 0
    Top = 366
    Width = 427
    Height = 80
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 366
    ExplicitWidth = 427
  end
end
