unit uSidUI;

{$mode objfpc}{$H+}

interface

uses
  Classes, Controls, Graphics, StdCtrls, ExtCtrls, ComCtrls,
  uSidTheme;

function SidPanel(AOwner: TComponent; AParent: TWinControl; AAlign: TAlign;
  AColor: TColor): TPanel;
function SidLabel(AOwner: TComponent; AParent: TWinControl; const ACaption: string;
  ALeft, ATop: Integer): TLabel;
function SidTitle(AOwner: TComponent; AParent: TWinControl; const ACaption: string;
  ALeft, ATop, ASize: Integer): TLabel;
function SidMutedLabel(AOwner: TComponent; AParent: TWinControl; const ACaption: string;
  ALeft, ATop, ASize: Integer): TLabel;
function SidButton(AOwner: TComponent; AParent: TWinControl; const ACaption: string;
  ALeft, ATop, AWidth, AHeight: Integer): TButton;
function SidEdit(AOwner: TComponent; AParent: TWinControl; ALeft, ATop,
  AWidth, AHeight: Integer; const AText: string): TEdit;
function SidPasswordEdit(AOwner: TComponent; AParent: TWinControl; ALeft, ATop,
  AWidth, AHeight: Integer): TEdit;
function SidProgress(AOwner: TComponent; AParent: TWinControl; ALeft, ATop,
  AWidth, AHeight: Integer): TProgressBar;

implementation

function SidPanel(AOwner: TComponent; AParent: TWinControl; AAlign: TAlign;
  AColor: TColor): TPanel;
begin
  Result := TPanel.Create(AOwner);
  Result.Parent := AParent;
  Result.Align := AAlign;
  Result.BevelOuter := bvNone;
  Result.Color := AColor;
end;

function SidLabel(AOwner: TComponent; AParent: TWinControl; const ACaption: string;
  ALeft, ATop: Integer): TLabel;
begin
  Result := TLabel.Create(AOwner);
  Result.Parent := AParent;
  Result.Caption := ACaption;
  Result.Left := ALeft;
  Result.Top := ATop;
  SidApplyBodyFont(Result);
end;

function SidTitle(AOwner: TComponent; AParent: TWinControl; const ACaption: string;
  ALeft, ATop, ASize: Integer): TLabel;
begin
  Result := SidLabel(AOwner, AParent, ACaption, ALeft, ATop);
  SidApplyTitleFont(Result, ASize);
end;

function SidMutedLabel(AOwner: TComponent; AParent: TWinControl; const ACaption: string;
  ALeft, ATop, ASize: Integer): TLabel;
begin
  Result := SidLabel(AOwner, AParent, ACaption, ALeft, ATop);
  SidApplyMutedFont(Result, ASize);
end;

function SidButton(AOwner: TComponent; AParent: TWinControl; const ACaption: string;
  ALeft, ATop, AWidth, AHeight: Integer): TButton;
begin
  Result := TButton.Create(AOwner);
  Result.Parent := AParent;
  Result.Caption := ACaption;
  Result.Left := ALeft;
  Result.Top := ATop;
  Result.Width := AWidth;
  Result.Height := AHeight;
end;

function SidEdit(AOwner: TComponent; AParent: TWinControl; ALeft, ATop,
  AWidth, AHeight: Integer; const AText: string): TEdit;
begin
  Result := TEdit.Create(AOwner);
  Result.Parent := AParent;
  Result.Left := ALeft;
  Result.Top := ATop;
  Result.Width := AWidth;
  Result.Height := AHeight;
  Result.Text := AText;
  Result.Font.Name := 'Segoe UI';
  Result.Font.Size := 11;
end;

function SidPasswordEdit(AOwner: TComponent; AParent: TWinControl; ALeft, ATop,
  AWidth, AHeight: Integer): TEdit;
begin
  Result := SidEdit(AOwner, AParent, ALeft, ATop, AWidth, AHeight, '');
  Result.PasswordChar := '*';
end;

function SidProgress(AOwner: TComponent; AParent: TWinControl; ALeft, ATop,
  AWidth, AHeight: Integer): TProgressBar;
begin
  Result := TProgressBar.Create(AOwner);
  Result.Parent := AParent;
  Result.Left := ALeft;
  Result.Top := ATop;
  Result.Width := AWidth;
  Result.Height := AHeight;
  Result.Min := 0;
  Result.Max := 100;
  Result.Position := 0;
end;

end.
