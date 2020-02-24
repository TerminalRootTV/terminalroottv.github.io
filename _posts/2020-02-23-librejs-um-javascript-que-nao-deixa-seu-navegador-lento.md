---
layout: post
title: "LibreJS - Um Javascript que não deixa seu navegador lento"
date: 2020-02-23 20:43:52
image: '/assets/img/js/librejs.png'
description: 'Evita todos tipos de rastreadores inúteis.'
tags:
- librejs
- javascript
- gnu
- softwarelivre
---

![LibreJS - Um Javascript que não deixa seu navegador lento](/assets/img/js/librejs.png)

O [GNU LibreJS](https://www.gnu.org/software/librejs/) , ou simplesmente [LibreJS](https://www.gnu.org/software/librejs/) , é uma extensão  navegadores baseados no [Mozilla Firefox](https://terminalroot.com.br/2014/09/complementos-uteis-para-firefox.html) , criada pelo [GNU Project](https://www.gnu.org/) . Seu objetivo é bloquear programas [JavaScript](https://terminalroot.com.br/2020/01/javascript.html) não triviais .

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

O complemento foi criado para resolver o chamado ["JavaScript Trap"](http://www.gnu.org/philosophy/javascript-trap.html), descrito pela primeira vez por Richard Stallman em 2009, uma situação em que muitos usuários, sem saber, executam rastreadores maliciosos no navegador .

Foi desenvolvido por Ruben Rodriguez e Nik Nyby e é incluído por padrão no navegador [GNU IceCat](https://terminalroot.com.br/2020/02/icecat-um-navegador-minimalista-baseado-em-firefox.html) , também pode funcionar com o [Tor](https://terminalroot.com.br/2019/08/navegacao-anonima-com-tor-browser-instalacao-e-dicas-para-deep-web.html) .

O complemento permite a lista de permissões do site e possui um sistema de detecção de e-mail para que os usuários entrem em contato com os webmasters da página para persuadi-los a tornar seu código [JavaScript](https://terminalroot.com.br/2020/01/javascript.html) compatível com o **LibreJS**.

**Cory Doctorow**, do [BoingBoing](http://boingboing.net/), discutiu o artigo de Finley, disse que usava o [Noscript](https://noscript.net/) há anos e contornou os problemas que Finley identificou nas páginas da lista branca com a funcionalidade desejada que só funciona com Javascript.

# Baixando LibreJS
você pode instalar o LibreJS clicando neste link e seguindo as instruções subsequentes: [librejs-7.20.1.xpi](https://ftp.gnu.org/gnu/librejs/librejs-7.20.1.xpi)

Os arquivos de origem do LibreJS podem ser encontrados via HTTPS: [librejs-7.20.1.tar.gz](https://ftp.gnu.org/gnu/librejs/librejs-7.20.1.tar.gz) . Ou FTP: [ftp://ftp.gnu.org/gnu/librejs/](ftp://ftp.gnu.org/gnu/librejs/) . Também pode ser encontrado nos espelhos do GNU, este link selecionará automaticamente um espelho para você.

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

O [LibreJS](https://en.wikipedia.org/wiki/GNU_LibreJS) também está disponível no [site de complementos da Mozilla](https://addons.mozilla.org/en-US/firefox/addon/librejs/) , devido ao processo de revisão da Mozilla, a versão do LibreJS disponível no site de Complementos geralmente está desatualizada. Isso não está sob controle do GNU Project.

# Documentação
A documentação do LibreJS está [disponível online](https://www.gnu.org/software/librejs/manual/).

# Desenvolvimento
O desenvolvimento do LibreJS acontece neste repositório git: [git.savannah.gnu.org/cgit/librejs.git/](http://git.savannah.gnu.org/cgit/librejs.git/) . Você pode clonar esse repositório com o comando:
```sh
git clone git://git.sv.gnu.org/librejs.git
```
![O projeto LibreJS está buscando mais programadores JavaScript para ajudar a manter essa extensão do navegador. Se você quiser ajudar, envie um email para <info@gnu.org>](/assets/img/js/librejs-devs.png "O projeto LibreJS está buscando mais programadores JavaScript para ajudar a manter essa extensão do navegador. Se você quiser ajudar, envie um email para <info@gnu.org> .")

Obtenha mais informações no site oficial: <https://www.gnu.org/software/librejs/>.
