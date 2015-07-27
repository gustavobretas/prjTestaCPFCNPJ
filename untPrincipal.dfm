object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Teste CPF/CNPJ'
  ClientHeight = 120
  ClientWidth = 262
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object edtCPF: TLabeledEdit
    Left = 8
    Top = 26
    Width = 160
    Height = 21
    EditLabel.Width = 19
    EditLabel.Height = 13
    EditLabel.Caption = 'CPF'
    NumbersOnly = True
    TabOrder = 0
    OnKeyDown = edtCPFKeyDown
  end
  object edtCNPJ: TLabeledEdit
    Left = 8
    Top = 72
    Width = 160
    Height = 21
    EditLabel.Width = 25
    EditLabel.Height = 13
    EditLabel.Caption = 'CNPJ'
    NumbersOnly = True
    TabOrder = 2
    OnKeyDown = edtCNPJKeyDown
  end
  object btnCPF: TButton
    Left = 174
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Testar CP&F'
    TabOrder = 1
    OnClick = btnCPFClick
  end
  object btnCNPJ: TButton
    Left = 174
    Top = 70
    Width = 75
    Height = 25
    Caption = 'Testar CNP&J'
    TabOrder = 3
    OnClick = btnCNPJClick
  end
end
