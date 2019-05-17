---
layout: post
title: 'Utilizando Media Queries do CSS'
date: '2011-11-23T07:12:00.000-08:00'
image: '/assets/img/css3/midia-queries.jpg'
description: 'Media Queries é a utilização de Media Types com uma ou mais expressões envolvendo características de uma media para definir formatações para diversos dispositivos.'
main-class: 'web'
tags:
- CSS
---

> __Media Queries__ é a utilização de __Media Types__ com uma ou mais expressões envolvendo características de uma media para definir formatações para diversos dispositivos. O browser ou a aplicação lê as expressões definidas na query, caso o dispositivo se encaixe nestas requisições, o __CSS__ será aplicado.

Colocando em prática, temos uma pagina em __HTML 5__ (pode ser HTML 4 também ou XHTML) com um link __teste.css__ e ná pagina __teste.html__, teremos uma __div id teste__, entao queremos que quando essa página for visualizado por um __Celular ou Smartphone__ tenha um tamanho; quando for um __Tablet ou um NetBook__ tenha outro tamanho(maior) e quando for um __PC ou uma TV__ tenha um novo tamanho(ainda maior), então utilizamos as __Medias Queries em CSS__ para essa façanha, segue o arquivo __teste.html__ e __teste.css__ pra você entender melhor como funciona, veirifque as imagens(clique nelas para ampliar) para ver os testes que fiz diminuindo o tamanho da janela do Navegdor para verificar se realmente funciona, se a div id teste tivesse um único tamanho, o mesmo ficaria com a mesma resolução.

## teste.html
{% highlight html %}
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8" />
        <link rel="stylesheet" type="text/css" href="teste.css">
        <title>Teste</title>       
    </head>       
<body>
    <div id="teste">
        Div Teste
    </div><!--TESTE-->
</body>
</html>
{% endhighlight %}

## teste.css
{% highlight css %}
@charset "utf-8";
/*teste.css*/
/* começamos com o tamanho minimo de 200 px e maximo de 250 px, infromando ter 100% dos 250px, Configurada para CELULARES E SMARTPHONES */
div#teste {
           min-width:200px;
           max-width:250px;
           min-height:500px;
           border:1px solid blue;
           background:silver;
           width:100%;
          }
/* se a tela for maior que 600 pixels, a div teste passa a ter um valor mínimo de 600 pixels e maximo de 650 pixels - tamanho para TABLETS E NETBOOKS */
@media screen and (min-width:650px){
div#teste {
           min-width:600px;
           max-width:650px;
           min-height:500px;
           width:100%;
          }
}

/* se a tela for maior que 900 pixels, a div teste passa a ter um valor mínimo de 1200 pixels - tamanho para TVs e PCs */
@media screen and (min-width:900px){
div#teste {
           min-width:1200px;
           width:100%;
          }
}
{% endhighlight %}

## Verifique as imagens pra ver como resultará

- Primeira Configuração para Celulares e Smartphones
![Utilizando Media Queries do CSS](/assets/img/css3/celular.jpg "Utilizando Media Queries do CSS")

- Segunda Configuração para Tablets e NetBooks
![Utilizando Media Queries do CSS](/assets/img/css3/tablets.jpg "Utilizando Media Queries do CSS")

- Terceira Configuração para PCs e TVs
![Utilizando Media Queries do CSS](/assets/img/css3/pc.jpg "Utilizando Media Queries do CSS")

Verifique que usamos a propriedade __@media screen __and(operador booleano) para informar se o tamanho tiver no minimo tal, tais propriedade passarão a ter tais valores, lembrando que as Media Queries devem estar depois pois a leitura do código começa de cima e quem for definido por último passará ater o último valor.

## Ok, é isso, mini-tutorial só pra saber mesmo como funciona, espero que gostem e comentem!
