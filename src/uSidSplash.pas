unit uSidSplash;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, StdCtrls, ExtCtrls, ComCtrls,
  uSidTheme, uSidUI;

type
  TSidSplashInfo = record
    ProductName: string;
    ProductSubtitle: string;
    ProductDetail: string;
    FooterText: string;
    BrandName: string;
    BrandSubtitle: string;
    BrandTagline: string;
  end;

  TSidSplashForm = class(TForm)
  private
    FInfo: TSidSplashInfo;
    FPalette: TSidPalette;
    FStartedAt: QWord;
    FStatusLabel: TLabel;
    FProgress: TProgressBar;
    FAccentPanel: TPanel;
    FAccentPaint: TPaintBox;
    procedure BuildLayout;
    procedure InitializeSplash(const AInfo: TSidSplashInfo);
    procedure PaintAccent(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    constructor CreateWithInfo(AOwner: TComponent; const AInfo: TSidSplashInfo);
    procedure UpdateStatus(const AText: string; AProgress: Integer);
    procedure WaitMinimum(AMilliseconds: QWord);
  end;

function SidSplashInfo(const AProductName, AProductSubtitle, AProductDetail,
  AFooterText: string): TSidSplashInfo;

implementation

function SidSplashInfo(const AProductName, AProductSubtitle, AProductDetail,
  AFooterText: string): TSidSplashInfo;
begin
  Result.ProductName := AProductName;
  Result.ProductSubtitle := AProductSubtitle;
  Result.ProductDetail := AProductDetail;
  Result.FooterText := AFooterText;
  Result.BrandName := 'SiD';
  Result.BrandSubtitle := 'Solucoes';
  Result.BrandTagline := 'Gestao simples' + LineEnding + 'para vender melhor';
end;

constructor TSidSplashForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  InitializeSplash(SidSplashInfo('Aplicacao', 'Sistema desktop',
    'Inicializando componentes', 'SiD Solucoes'));
end;

constructor TSidSplashForm.CreateWithInfo(AOwner: TComponent; const AInfo: TSidSplashInfo);
begin
  inherited Create(AOwner);
  InitializeSplash(AInfo);
end;

procedure TSidSplashForm.InitializeSplash(const AInfo: TSidSplashInfo);
begin
  FInfo := AInfo;
  FPalette := SidDefaultPalette;
  FStartedAt := GetTickCount64;
  BuildLayout;
end;

procedure TSidSplashForm.BuildLayout;
var
  Root: TPanel;
  BrandLabel: TLabel;
  DetailLabel: TLabel;
begin
  BorderStyle := bsNone;
  Position := poScreenCenter;
  Width := 640;
  Height := 360;
  SidApplyFormBase(Self);

  Root := SidPanel(Self, Self, alClient, FPalette.Surface);

  FAccentPanel := SidPanel(Self, Root, alLeft, FPalette.Primary);
  FAccentPanel.Width := 196;

  FAccentPaint := TPaintBox.Create(Self);
  FAccentPaint.Parent := FAccentPanel;
  FAccentPaint.Align := alClient;
  FAccentPaint.OnPaint := @PaintAccent;

  BrandLabel := SidTitle(Self, FAccentPanel, FInfo.BrandName, 28, 76, 36);
  BrandLabel.Font.Color := FPalette.White;
  BrandLabel.BringToFront;

  DetailLabel := SidMutedLabel(Self, FAccentPanel, FInfo.BrandSubtitle, 32, 126, 13);
  DetailLabel.Font.Color := FPalette.White;
  DetailLabel.BringToFront;

  DetailLabel := SidMutedLabel(Self, FAccentPanel, FInfo.BrandTagline, 30, 238, 10);
  DetailLabel.Font.Color := FPalette.White;
  DetailLabel.BringToFront;

  SidTitle(Self, Root, FInfo.ProductName, 246, 74, 28);

  SidMutedLabel(Self, Root, FInfo.ProductSubtitle, 249, 118, 12);

  DetailLabel := SidLabel(Self, Root, FInfo.ProductDetail, 250, 170);
  DetailLabel.Font.Color := FPalette.Text;

  FStatusLabel := SidMutedLabel(Self, Root, 'Preparando ambiente...', 250, 232, 10);
  FStatusLabel.Width := 330;

  FProgress := SidProgress(Self, Root, 250, 258, 330, 14);
  FProgress.Position := 18;

  SidMutedLabel(Self, Root, FInfo.FooterText, 250, 306, 9);
end;

procedure TSidSplashForm.PaintAccent(Sender: TObject);
var
  C: TCanvas;
  R: TRect;
begin
  C := FAccentPaint.Canvas;
  R := FAccentPaint.ClientRect;

  C.Brush.Color := FPalette.Primary;
  C.FillRect(R);

  C.Brush.Color := FPalette.PrimaryDark;
  C.Pen.Color := FPalette.PrimaryDark;
  C.Ellipse(104, -42, 260, 118);

  C.Brush.Color := FPalette.Success;
  C.Pen.Color := FPalette.Success;
  C.Ellipse(126, 246, 226, 346);

  C.Brush.Color := FPalette.White;
  C.Pen.Color := FPalette.White;
  C.RoundRect(30, 188, 96, 198, 5, 5);
  C.Brush.Color := FPalette.Success;
  C.Pen.Color := FPalette.Success;
  C.RoundRect(30, 204, 132, 214, 5, 5);
end;

procedure TSidSplashForm.UpdateStatus(const AText: string; AProgress: Integer);
begin
  FStatusLabel.Caption := AText;
  if AProgress < FProgress.Min then
    FProgress.Position := FProgress.Min
  else if AProgress > FProgress.Max then
    FProgress.Position := FProgress.Max
  else
    FProgress.Position := AProgress;

  Update;
  Application.ProcessMessages;
end;

procedure TSidSplashForm.WaitMinimum(AMilliseconds: QWord);
begin
  while GetTickCount64 - FStartedAt < AMilliseconds do
  begin
    Application.ProcessMessages;
    Sleep(20);
  end;
end;

end.
