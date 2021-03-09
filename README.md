<p align="center">
<<<<<<< HEAD
  <a href="https://github.com/alepmedeiros/JunoAPI4Delphi/blob/master/imagens/Mercado-Pago.png">
    <img alt="Mercado Pago" height="150" src="https://github.com/alepmedeiros/JunoAPI4Delphi/blob/master/imagens/Mercado-Pago.png">
  </a>  
</p><br>
<p align="center">
  <b>MercadoPago4D</b> é uma biblioteca Delphi desenvolvida para consumo dos recursos da API do <a href="https://www.mercadopago.com.br/">Mercado Pago</a>, dando a possibilidade de integração para geração de pagamentos recorrentes e geração de boleto e muito mais, e integração PDV com PIX.

## ⚙️ Instalação 

*Pré requisitos: [**RESTRequest4Delphi](https://github.com/viniciussanchez/RESTRequest4Delphi) e [**DataSet-Serialize**](https://github.com/viniciussanchez/dataset-serialize)
=======
  <a href="https://github.com/alepmedeiros/JunoAPI4Delphi/blob/master/imagens/logo.png">
    <img alt="Juno" height="150" src="https://github.com/alepmedeiros/JunoAPI4Delphi/blob/master/imagens/logo.png">
  </a>  
</p><br>
<p align="center">
  <b>JunoAPI4Delphi</b> é uma biblioteca Delphi desenvolvida para consumo dos recursos da API do meio de pagamento <a href="https://juno.com.br/">Juno</a>, dando a possibilidade de integração para geração de pagamentos recorrentes e geração de boleto e muito mais.

## ⚙️ Instalação 

*Pré requisitos: [**RESTRequest4Delphi**](https://github.com/viniciussanchez/RESTRequest4Delphi) e [**DataSet-Serialize**](https://github.com/viniciussanchez/dataset-serialize)
>>>>>>> 6293d1f037a352044c1cd1d827778e6376a6d9ad

* **Instlação manual**: Adicione as seguintes pastas ao seu projeto, em *Project > Options > Resource Compiler > Directories and Conditionals > Include file search path*

```
<<<<<<< HEAD
../MercadoPago4D/src
```

## ⚡️ Como utilizar

Crie uma nova Unit e adicione nas uses MercadoPago4D

```pascal
uses MercadoPago4D;
```

**Ficando desta forma**

```pascal
uses
  MercadoPago4D;

var
  _MercadoPago4D : iMercadoPago4D;

implementation

const
  //Informações encontradas na plataforma do juno em integrações
  ClientId = 'ClientId';
  ClientSecret = 'ClientSecret';
  ResourceToken = 'ResourceToken';

initialization
  _MercadoPago4D := TMercadoPago4D.New;

  _MercadoPago4D
    .Config
    .ClientId(ClientId)
    .ClientSecret(ClientSecret)
    .ResourceToken(ResourceToken);
```

## Observação

Seguindo como está no exemplo que acompanha, sua integração ficará simples
=======
../JunoAPI4Delphi/src
```
>>>>>>> 6293d1f037a352044c1cd1d827778e6376a6d9ad
