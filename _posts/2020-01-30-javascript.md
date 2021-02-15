---
layout: post
title: "Javascript para Iniciantes"
date: 2020-01-30 17:33:10
image: '/assets/img/js/js.jpg'
description: 'Para quem deseja aprender JavaScript do Zero no Linux.'
tags:
- javascript
- jquery
---

![Javascript para Iniciantes](/assets/img/js/js.jpg)

JavaScript é uma linguagem de programação interpretada.

Foi originalmente implementada como parte dos navegadores web para que scripts pudessem ser executados do lado do cliente e interagissem com o usuário sem a necessidade deste script passar pelo servidor, controlando o navegador, realizando comunicação assíncrona e alterando o conteúdo do documento exibido.

JavaScript foi originalmente desenvolvido por Brendan Eich quando trabalhou na Netscape sob o nome de Mocha, posteriormente teve seu nome mudado para LiveScript e por fim JavaScript.

Mais em: <https://pt.wikipedia.org/wiki/JavaScript>

### Conteúdo relativo ao tópico sobre [JSON](https://www.youtube.com/watch?v=HI6YZJxoaIQ&t=4610s)
{% highlight js %}
// about:config → security.fileuri.strict_origin_policy → false
var xmlhttp = new XMLHttpRequest();
var file = "habilidades.json";

xmlhttp.onreadystatechange = function() {
  if (this.readyState == 4 && this.status == 200) {
    var alldata = JSON.parse(this.responseText);
    show_data(alldata);
  }
};
xmlhttp.open("GET", file, true);
xmlhttp.send();

function show_data(data) {
  var out = "";
  var i;
  for(i = 0; i < data.length; i++) {
    out += '<code>' +
    data[i].name + '</code> ';
  }
  document.getElementById("habilidades").innerHTML = out;
}
{% endhighlight %}

## Conteúdo anterior necessário para esse
### [Curso de Desenvolvimento Web do Zero no Linux](https://terminalroot.com.br/2020/01/desenvolvimento-web.html)

# Assista ao vídeo
<iframe width="920" height="400" src="https://www.youtube.com/embed/HI6YZJxoaIQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Links úteis
- 🔗 Alguns códigos simples de JavaScript: <https://terminalroot.com.br/2011/11/alguns-codigos-simples-de-javascript.html>
- 🔗 10 códigos úteis de JavaScript 2: <https://terminalroot.com.br/2016/12/alguns-codigos-simples-de-javascript-2.html>
- 🔗 Curso Javascript Ninja: <http://bit.ly/NinjaJs>
- 🔗 Como Instalar Node.js no Linux e Primeiros Passos: <https://terminalroot.com.br/2019/11/como-instalar-nodejs-no-linux-e-primeiros-passos.html>
- 🔗 Monitore seu Linux com Gráficos pelo Terminal: <https://terminalroot.com.br/2018/07/monitore-seu-linux-com-graficos-pelo-terminal.html>
- 🔗 Rodando JavaScript via Terminal e Shell via JS: <https://www.youtube.com/watch?v=I4zO0d4IS7Y>
- 🔗 Mais em: <https://pt.wikipedia.org/wiki/JavaScript>
- 🔗 Vue.js: <https://vuejs.org/>
- 🔗 jQuery: <https://jquery.com/>
- 🔗 jQuery na W3Shools: <https://www.w3schools.com/jquery/>


