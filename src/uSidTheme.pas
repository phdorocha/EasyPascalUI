unit uSidTheme;

{$mode objfpc}{$H+}

interface

uses
  Graphics, Forms, StdCtrls;

type
  TSidPalette = record
    Primary: TColor;
    PrimaryDark: TColor;
    Success: TColor;
    Surface: TColor;
    Text: TColor;
    Muted: TColor;
    Border: TColor;
    White: TColor;
  end;

const
  SID_SPACE_XS = 4;
  SID_SPACE_SM = 8;
  SID_SPACE_MD = 12;
  SID_SPACE_LG = 16;
  SID_SPACE_XL = 24;
  SID_SPACE_XXL = 32;

function SidDefaultPalette: TSidPalette;
procedure SidApplyFormBase(AForm: TForm);
procedure SidApplyTitleFont(ALabel: TLabel; ASize: Integer);
procedure SidApplyBodyFont(ALabel: TLabel);
procedure SidApplyMutedFont(ALabel: TLabel; ASize: Integer);

implementation

function SidDefaultPalette: TSidPalette;
begin
  Result.Primary := $006B3A12;
  Result.PrimaryDark := $004D2808;
  Result.Success := $004CB45F;
  Result.Surface := $00F8FAFC;
  Result.Text := $00312A23;
  Result.Muted := $00817970;
  Result.Border := $00E5E7EB;
  Result.White := clWhite;
end;

procedure SidApplyFormBase(AForm: TForm);
var
  Palette: TSidPalette;
begin
  Palette := SidDefaultPalette;
  AForm.Color := Palette.Surface;
  AForm.Font.Name := 'Segoe UI';
  AForm.Font.Size := 10;
end;

procedure SidApplyTitleFont(ALabel: TLabel; ASize: Integer);
var
  Palette: TSidPalette;
begin
  Palette := SidDefaultPalette;
  ALabel.Font.Name := 'Segoe UI';
  ALabel.Font.Color := Palette.Text;
  ALabel.Font.Size := ASize;
  ALabel.Font.Style := [fsBold];
end;

procedure SidApplyBodyFont(ALabel: TLabel);
var
  Palette: TSidPalette;
begin
  Palette := SidDefaultPalette;
  ALabel.Font.Name := 'Segoe UI';
  ALabel.Font.Color := Palette.Text;
  ALabel.Font.Size := 10;
  ALabel.Font.Style := [];
end;

procedure SidApplyMutedFont(ALabel: TLabel; ASize: Integer);
var
  Palette: TSidPalette;
begin
  Palette := SidDefaultPalette;
  ALabel.Font.Name := 'Segoe UI';
  ALabel.Font.Color := Palette.Muted;
  ALabel.Font.Size := ASize;
  ALabel.Font.Style := [];
end;

end.
