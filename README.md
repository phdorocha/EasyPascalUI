# EasyPascalUI

English | [Português](#portugues)

## English

EasyPascalUI is a reusable Pascal/Lazarus visual framework for LCL desktop
applications.

Its goal is similar to Bootstrap, but for Pascal desktop systems: a shared
visual foundation with palette, typography, spacing, component helpers, and
ready-to-use screens that keep projects visually consistent.

## Current Features

- SiD/EasyGestor visual theme.
- Helpers for panels, labels, buttons, edits, password edits, and progress bars.
- Modern configurable splash screen.
- 100% Pascal-created UI, with no `.lfm` dependency.
- Compatible with Lazarus, Free Pascal, and LCL.

## Structure

```text
EasyPascalUI/
├── EasyPascalUI.lpk       Reusable Lazarus package
├── README.md              This documentation
├── src/                   Framework units
│   ├── uSidTheme.pas      Colors, fonts, and spacing
│   ├── uSidUI.pas         LCL component creation helpers
│   └── uSidSplash.pas     Configurable splash screen
└── examples/
    └── SplashDemo/        Minimal usage example
```

## Installation In Another Project

### Option 1: Add The Unit Path

1. Copy the `EasyPascalUI` folder into your project or into a shared folder.
2. In Lazarus, open `Project > Project Options > Compiler Options > Paths`.
3. Add this path:

```text
EasyPascalUI/src
```

4. Use the units you need:

```pascal
uses
  uSidTheme, uSidUI, uSidSplash;
```

### Option 2: Install As A Lazarus Package

1. Open `EasyPascalUI/EasyPascalUI.lpk` in Lazarus.
2. Compile the package.
3. Add `EasyPascalUI` to the required packages of the consuming project.

## Splash Example

```pascal
uses
  Forms, uSidSplash;

var
  Splash: TSidSplashForm;
  Info: TSidSplashInfo;

begin
  Application.Initialize;

  Info := SidSplashInfo(
    'EasyPDV',
    'Desktop point of sale',
    'NFC-e with ACBr  |  Local ZEOS/SQLite database',
    'SiD Solucoes EasyGestor standard'
  );

  Splash := TSidSplashForm.CreateWithInfo(nil, Info);
  try
    Splash.Show;
    Splash.UpdateStatus('Loading...', 40);
    Splash.WaitMinimum(1200);
  finally
    Splash.Free;
  end;
end.
```

## Conventions

- Units should be independent from business rules.
- Components should be created in code to make reuse easier.
- Product-specific text should stay in the consuming project, not in the
  framework.
- New components should accept configuration through parameters or simple
  records.

## License

Copyright (c) SiD Solucoes.

Internal use and redistribution according to SiD Solucoes authorization.

---

## Portugues

EasyPascalUI e um framework visual em Pascal/Lazarus para aplicacoes desktop LCL.

O objetivo e oferecer uma base reaproveitavel, parecida com a ideia do
Bootstrap, mas voltada para sistemas desktop Pascal: paleta, tipografia,
espacamentos, helpers de componentes e telas prontas para manter os projetos
com o mesmo padrao visual.

## Recursos Atuais

- Tema visual padrao SiD/EasyGestor.
- Helpers para criar paineis, labels, botoes, campos de texto, campos de senha
  e barras de progresso.
- Tela splash moderna e configuravel.
- Codigo 100% criado por Pascal, sem dependencia de `.lfm`.
- Compatibilidade com Lazarus, Free Pascal e LCL.

## Estrutura

```text
EasyPascalUI/
├── EasyPascalUI.lpk       Pacote Lazarus reutilizavel
├── README.md              Esta documentacao
├── src/                   Units do framework
│   ├── uSidTheme.pas      Cores, fontes e medidas
│   ├── uSidUI.pas         Helpers de criacao de componentes LCL
│   └── uSidSplash.pas     Splash configuravel
└── examples/
    └── SplashDemo/        Exemplo minimo de uso
```

## Instalacao Em Outro Projeto

### Opcao 1: Adicionar O Caminho Das Units

1. Copie a pasta `EasyPascalUI` para dentro do seu projeto ou para uma pasta
   compartilhada.
2. No Lazarus, abra `Project > Project Options > Compiler Options > Paths`.
3. Adicione o caminho:

```text
EasyPascalUI/src
```

4. Use as units necessarias:

```pascal
uses
  uSidTheme, uSidUI, uSidSplash;
```

### Opcao 2: Instalar Como Pacote Lazarus

1. Abra `EasyPascalUI/EasyPascalUI.lpk` no Lazarus.
2. Compile o pacote.
3. Adicione `EasyPascalUI` aos pacotes requeridos do projeto consumidor.

## Exemplo De Splash

```pascal
uses
  Forms, uSidSplash;

var
  Splash: TSidSplashForm;
  Info: TSidSplashInfo;

begin
  Application.Initialize;

  Info := SidSplashInfo(
    'EasyPDV',
    'Frente de caixa desktop',
    'NFC-e com ACBr  |  Banco local ZEOS/SQLite',
    'EasyGestor padrao SiD Solucoes'
  );

  Splash := TSidSplashForm.CreateWithInfo(nil, Info);
  try
    Splash.Show;
    Splash.UpdateStatus('Carregando...', 40);
    Splash.WaitMinimum(1200);
  finally
    Splash.Free;
  end;
end.
```

## Convencoes

- Units devem ser independentes de regras de negocio.
- Componentes devem ser criados por codigo para facilitar reaproveitamento.
- Textos especificos do produto devem ficar no projeto consumidor, nao no
  framework.
- Novos componentes devem aceitar configuracao por parametros ou records simples.

## Licenca

Copyright (c) SiD Solucoes.

Uso interno e redistribuicao conforme autorizacao da SiD Solucoes.
