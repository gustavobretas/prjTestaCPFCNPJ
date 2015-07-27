unit untPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    edtCPF: TLabeledEdit;
    edtCNPJ: TLabeledEdit;
    btnCPF: TButton;
    btnCNPJ: TButton;
    procedure btnCPFClick(Sender: TObject);
    procedure btnCNPJClick(Sender: TObject);
    procedure edtCPFKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtCNPJKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    function mtdTestaCNPJ(asCNPJ: String): Boolean;
    function mtdTestaCPF(asCPF: String): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

function TfrmPrincipal.mtdTestaCPF(asCPF: String): Boolean;
var
  aiSomaCPF, aiCPFDigt, i: Integer;
  asCPFCalc: String;
  aiSX1: ShortInt;
begin
  if Trim(asCPF) <> EmptyStr then
  begin
    try
      asCPFCalc := Copy(asCPF, 1, 9);
      aiSomaCPF := 0;
      for aiSX1 := 1 to 9 do
        aiSomaCPF := aiSomaCPF + StrToInt(Copy(asCPFCalc, aiSX1, 1)) * (11 - aiSX1);
      aiCPFDigt := 11 - aiSomaCPF mod 11;
      if aiCPFDigt in [10, 11] then
        asCPFCalc := asCPFCalc + '0'
      else
        asCPFCalc := asCPFCalc + InttoStr(aiCPFDigt);
      aiSomaCPF := 0;
      for aiSX1 := 1 to 10 do
        aiSomaCPF := aiSomaCPF + StrToInt(Copy(asCPFCalc, aiSX1, 1)) * (12 - aiSX1);
      aiCPFDigt := 11 - aiSomaCPF mod 11;
      if aiCPFDigt in [10, 11] then
        asCPFCalc := asCPFCalc + '0'
      else
        asCPFCalc := asCPFCalc + InttoStr(aiCPFDigt);
      if asCPF <> asCPFCalc then
      begin
        Application.MessageBox('Número do CPF Informado não é Válido !!!', 'Aviso!', MB_IconStop or MB_OK);
        mtdTestaCPF := False;
      end
      else
        mtdTestaCPF := True;
    except
      on eConvertError do
      begin
        Application.MessageBox('Número do CPF Informado não é Válido !!!', 'Aviso!', MB_IconStop or MB_OK);
        mtdTestaCPF := False;
      end;
    end;
  end
  else
  begin
    if TrimRight(TrimLeft(Trim(asCPF))) = EmptyStr then
    begin
      Application.MessageBox('CPF não Informado !!!', 'Aviso!', MB_IconStop or MB_OK);
      mtdTestaCPF := True
    end
    else
    begin
      Application.MessageBox('Número do CPF Informado não é Válido !!!', 'Aviso!', MB_IconStop or MB_OK);
      mtdTestaCPF := False;
    end;
  end;
end;

procedure TfrmPrincipal.btnCPFClick(Sender: TObject);
begin
  if (TrimRight(TrimLeft(Trim(edtCPF.Text))) <> EmptyStr) and mtdTestaCPF(edtCPF.Text) then
    Application.MessageBox('Número do CPF Informado é Válido !!!', 'Aviso!', MB_ICONINFORMATION or MB_OK);
end;

procedure TfrmPrincipal.edtCNPJKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnCNPJ.Click;
end;

procedure TfrmPrincipal.edtCPFKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnCPF.Click;
end;

procedure TfrmPrincipal.btnCNPJClick(Sender: TObject);
begin
  if (TrimRight(TrimLeft(Trim(edtCNPJ.Text))) <> EmptyStr) and mtdTestaCNPJ(edtCNPJ.Text) then
    Application.MessageBox('Número do CNPJ Informado é Válido !!!', 'Aviso!', MB_ICONINFORMATION or MB_OK);
end;

function TfrmPrincipal.mtdTestaCNPJ(asCNPJ: String): Boolean;
var
  aiSomaCNPJ, aiCNPJDigt, i: Integer;
  asCNPJCalc: String;
  aiSX1: ShortInt;
begin
  if Trim(asCNPJ) <> EmptyStr then
  begin
    try
      asCNPJCalc := Copy(asCNPJ, 1, 12);
      aiSomaCNPJ := 0;
      for aiSX1 := 1 to 4 do
        aiSomaCNPJ := aiSomaCNPJ + StrToInt(Copy(asCNPJCalc, aiSX1, 1)) * (6 - aiSX1);
      for aiSX1 := 1 to 8 do
        aiSomaCNPJ := aiSomaCNPJ + StrToInt(Copy(asCNPJCalc, aiSX1 + 4, 1)) * (10 - aiSX1);
      aiCNPJDigt := 11 - aiSomaCNPJ mod 11;
      if aiCNPJDigt in [10, 11] then
        asCNPJCalc := asCNPJCalc + '0'
      else
        asCNPJCalc := asCNPJCalc + InttoStr(aiCNPJDigt);
      aiSomaCNPJ := 0;
      for aiSX1 := 1 to 5 do
        aiSomaCNPJ := aiSomaCNPJ + StrToInt(Copy(asCNPJCalc, aiSX1, 1)) * (7 - aiSX1);
      for aiSX1 := 1 to 8 do
        aiSomaCNPJ := aiSomaCNPJ + StrToInt(Copy(asCNPJCalc, aiSX1 + 5, 1)) * (10 - aiSX1);
      aiCNPJDigt := 11 - aiSomaCNPJ mod 11;
      if aiCNPJDigt in [10, 11] then
        asCNPJCalc := asCNPJCalc + '0'
      else
        asCNPJCalc := asCNPJCalc + InttoStr(aiCNPJDigt);
      if asCNPJ <> asCNPJCalc then
      begin
        Application.MessageBox('Número do CNPJ Informado não é Válido !!!', 'Atenção!', MB_IconStop or MB_OK);
        mtdTestaCNPJ := False;
      end
      else
        mtdTestaCNPJ := True;
    except
      on eConvertError do
      begin
        Application.MessageBox('Número do CNPJ Informado não é Válido !!!', 'Atenção!', MB_IconStop or MB_OK);
        mtdTestaCNPJ := False;
      end
    end
  end
  else
  begin
    if TrimRight(TrimLeft(Trim(asCNPJ))) = EmptyStr then
    begin
      Application.MessageBox('CNPJ não Informado !!!', 'Aviso!', MB_IconStop or MB_OK);
      mtdTestaCNPJ := True
    end
    else
    begin
      Application.MessageBox('Número do CNPJ Informado não é Válido !!!', 'Aviso!', MB_IconStop or MB_OK);
      mtdTestaCNPJ := False;
    end;
  end;
end;

end.
