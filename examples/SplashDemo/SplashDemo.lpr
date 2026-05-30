program SplashDemo;

{$mode objfpc}{$H+}

uses
  Interfaces, Forms, uSidSplash;

var
  Splash: TSidSplashForm;
  Info: TSidSplashInfo;

begin
  RequireDerivedFormResource := False;
  Application.Scaled := True;
  Application.Initialize;

  Info := SidSplashInfo(
    'EasyDemo',
    'Exemplo LCL com EasyPascalUI',
    'Splash reutilizavel para sistemas desktop',
    'EasyPascalUI'
  );

  Splash := TSidSplashForm.CreateWithInfo(nil, Info);
  try
    Splash.Show;
    Splash.UpdateStatus('Carregando exemplo...', 40);
    Splash.WaitMinimum(1600);
    Splash.UpdateStatus('Pronto.', 100);
    Splash.WaitMinimum(1900);
  finally
    Splash.Free;
  end;
end.
