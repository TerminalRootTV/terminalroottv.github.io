---
layout: post
title: "Remova a sujeira que o Facebook faz na URL do seu site"
date: 2024-06-25 13:25:49
image: '/assets/img/js/clean-url.jpg'
description: "🗑️ Um código JavaScript básico e útil!"
icon: 'ion:terminal-sharp'
iconname: 'JavaScript'
tags:
- javascript
- web
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Nós já publicamos uma vez sobre uma extensão que remove de qualquer site vários *gets* que sujam sua url: [Limpe suas URLs dos Parâmetros das Redes Sociais e Outros](https://terminalroot.com.br/2019/09/limpe-sua-url.html).

Mas, hoje vamos mostrar como usar um script [JavaScript](https://terminalroot.com.br/tags#javascript) básico para você remover do seu site o tal do: `fbclid` do Facebook.

Algo exemplo isso:

{% highlight html %}
https://seusite.com/index.html?fbclid=IwZXh0bgNhZW0CMTEAAR0-qJHl1VErGqub7nFOmL9OOuFJFJsdnr5yg9xEZA2T1Cc29buSBeBVfzc_aem_qxWU50NfOPAeOYePO2TlzA
{% endhighlight %}

Essas *sujeiras* que o Facebook faz, além de HORRÍVEL 🤮 , também atrapalham:
+ Quando você salva a URL nos favoritos, às vezes já está salva, mas como esses códigos são dinâmicos, você acaba salvando várias vezes uma URL que já está lá;
+ Atrapalha também os serviços de estatísticas do site, como Google Analytics, por exemplo, aparecem ocorrências duplicadas.

Sem dizer que isso só serve de rastreamento para eles.

Para remover, adicione esse código abaixo, antes do fechamento da tag `</head>`:

{% highlight html %}
<!-- REMOVE fbclid -->
<script>
  const url = window.location.href
  if(url.match(/fbclid/)){
    const nova_url = url.replace( new RegExp("\\\?fbclid.*","gm"),"")
    history.pushState({}, null, nova_url);
  }
</script>
{% endhighlight %}

Depois é só testar e fim de sujeira!

Uma dica rápida e útil para muitos.

## Veja também:
+ [14 códigos úteis de JavaScript #3](https://terminalroot.com.br/2024/06/14-codigos-uteis-de-javascript-3.html)
+ [Como Alterar URL com JavaScript](https://terminalroot.com.br/2022/02/original-url.html)
+ [10 códigos úteis de JavaScript #2](https://terminalroot.com.br/2016/12/alguns-codigos-simples-de-javascript-2.html)
+ [Como Converter JavaScript para C++ facilmente](https://terminalroot.com.br/2024/05/como-converter-javascript-para-cpp-facilmente.html)
+ [Alguns códigos simples de JavaScript](https://terminalroot.com.br/2011/11/alguns-codigos-simples-de-javascript.html)
+ [Os 20 Melhores Motores para Desenvolvimento de Jogos com JavaScript](https://terminalroot.com.br/2024/05/os-20-melhores-motores-para-desenvolvimento-de-jogos-com-javascript.html)
+ [Limpe suas URLs dos Parâmetros das Redes Sociais e Outros](https://terminalroot.com.br/2019/09/limpe-sua-url.html)

