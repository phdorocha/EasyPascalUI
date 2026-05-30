# EasyPascalUI

Framework visual em Pascal/Lazarus para aplicações desktop LCL da SiD Solucoes.

O objetivo e oferecer uma base reaproveitavel, parecida com a ideia do Bootstrap,
mas voltada para sistemas desktop Pascal: paleta, tipografia, espacamentos,
helpers de componentes e telas prontas para manter os projetos com o mesmo padrao
visual.

## Recursos atuais

- Tema visual padrao SiD/EasyGestor.
- Helpers para criar paineis, labels, botoes e barras de progresso.
- Tela splash moderna e configuravel.
- Codigo 100% criado por Pascal, sem dependencia de `.lfm`.
- Compatibilidade com Lazarus/Free Pascal e LCL.

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

## Instalacao em outro projeto

### Opcao 1: adicionar o caminho das units

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

### Opcao 2: instalar como pacote Lazarus

1. Abra `EasyPascalUI/EasyPascalUI.lpk` no Lazarus.
2. Compile o pacote.
3. Adicione `EasyPascalUI` aos pacotes requeridos do projeto consumidor.

## Exemplo de splash

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
