---
layout: post
title: "Monitore seu Linux com Gráficos pelo Terminal"
date: 2018-07-09 14:01:19
image: '/assets/img/js/blessed-nodejs-shellscript.jpg'
description: 'Blessed é uma biblioteca de interface para terminal de alto nível construída em node.js que nos permite criar aplicativos de terminal impressionantes facilmente.'
tags:
- terminal
- javascript
- nodejs
- blessed
- shellscript
- shell-script
- videos
---

# Conceitos iniciais

[Node.js](https://nodejs.org) é um interpretador de código JavaScript com o código aberto, focado em migrar o Javascript do lado do cliente para servidores. Seu objetivo é ajudar programadores na criação de aplicações de alta escalabilidade (como um servidor web), com códigos capazes de manipular dezenas de milhares de conexões simultâneas, numa única máquina física. O Node.js é baseado no interpretador V8 JavaScript Engine (interpretador de JavaScript open source implementado pelo Google em C++ e utilizado pelo Chrome). Foi criado por Ryan Dahl em 2009, e seu desenvolvimento é mantido pela fundação Node.js em parceria com a Linux Foundation.

[NPM](https://npmjs.com) é o nome reduzido de Node Package Manager (Gerenciador de Pacotes do Node). A NPM é duas coisas: Primeiro, e mais importante, é um repositório online para publicação de projetos de código aberto para o Node.js; segundo, ele é um utilitário de linha de comando que interage com este repositório online, que ajuda na instalação de pacotes, gerenciamento de versão e gerenciamento de dependências.

[blessed](https://github.com/chjj/blessed) é uma biblioteca do tipo curses com uma API de interface de terminal de alto nível para node.js. blessed possui mais de 16.000 linhas de código e é usado pelo terminal. Seu objetivo consiste em duas coisas:


+ Reimplementa ncurses inteiramente analisando e compilando [terminfo](http://terminalroot.com.br/shell) e [termcap](http://terminalroot.com.br/shell), e expondo um objeto que pode gerar seqüências de escape compatíveis com qualquer terminal.

+ Implementa uma API de widget altamente otimizada para terminais.


[blessed-contrib](https://github.com/yaronn/blessed-contrib) é uma extensão abençoada que adiciona ainda mais widgets à biblioteca blessed. Saiba mais sobre o projeto no endereço [https://github.com/yaronn/blessed-contrib](https://github.com/yaronn/blessed-contrib).

# Instalação
 
 
+ Instalar o curl (se não já possuir instalado)
{% highlight bash %}
sudo apt install curl
{% endhighlight %}
 
+ Instalar o Node.js
{% highlight bash %}
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt install -y nodejs
{% endhighlight %}

+ Clonar o blessed-contrib
{% highlight bash %}
git clone https://github.com/yaronn/blessed-contrib.git
{% endhighlight %}

+ Entra o diretório e roda o NPM
{% highlight bash %}
cd blessed-contrib/ && npm install
{% endhighlight %}

# Utilização

+ Ver/testar o example Dashboard
{% highlight bash %}
node ./examples/dashboard.js
{% endhighlight %}

+ Exemplo: ver imagem
{% highlight bash %}
node ./examples/picture.js
{% endhighlight %}

Todos os recursos podem ser alterados de acordo com a sua necessidade. Caso queira customizar o script de instalação verifique o arquivo:
{% highlight bash %}
vim node_modules/dashdash/etc/dashdash.bash_completion.in
{% endhighlight %}

Se quiser customizar a saída do dashboard para ver os dados que deseja, verifique o arquivo:
{% highlight bash %}
vim examples/dashboard-random-colors.js
{% endhighlight %}

Para mais informações de utilização, consulte as documentações oficiais!

Caso queira criar suas próprias artes em ASCII pelo terminal com Shell Script, conheça nosso __Curso de Shell Script Bash Extremamente Avançado__ clicando no link abaixo:
# [http://terminalroot.com.br/shell](http://terminalroot.com.br/shell)

## Veja o vídeo tutorial
# [Clique Aqui Para Assistir o Vídeo](https://youtu.be/-6O7_UQ765g)

Valeu!


<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>

<!-- Informat -->
<ins class="adsbygoogle"
 style="display:block"
 data-ad-client="ca-pub-2838251107855362"
 data-ad-slot="2327980059"
 data-ad-format="auto"
 data-full-width-responsive="true"></ins>

<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

