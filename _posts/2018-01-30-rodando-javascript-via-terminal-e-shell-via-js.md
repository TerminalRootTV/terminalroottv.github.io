---
layout: post
title: "Rodando JavaScript via Terminal e Shell via JS"
date: 2018-01-30 16:16:42
image: '/assets/img/js/phantomjs.jpg'
description: 'PhantomJS é browser baseado em scripts, sem interface gráfica, para automatizar tarefas da web.'
tags:
- javascript
- terminal
---

## Conceito

+ [PhantomJS](http://phantomjs.org) é browser baseado em __scripts__, __sem interface gráfica__, para __automatizar__ tarefas da __web__. 
+ É um software de código aberto lançado sob a licença [BSD](https://www.freebsd.org/doc/pt_BR/articles/explaining-bsd/article.html). 
+ Algumas __empresas__ que __usam__ o PhantomJS para automatizar suas tarefas:
  - [Twitter](http://twitter.com/);
  - [Netflix](https://www.netflix.com);
  - [LinkedIn](http://linkedin.com/);
  - __Entre outras__.
+ Foi criado por __Ariya Hidayat__ em __2011__, __após vários anos de desenvolvimento__.
+ Existem __inúmeras utilidades__ para o PhantomJS, __mas também é usado muito por hackers para automatizar ataques__. :(
+ Um tempo depois foi criado o [CasperJS](http://casperjs.org/) por __Nicolas Perriault__, que é um __biblioteca__ de funções do __PhantomJS__.

## Instalação

{% highlight bash %}
git clone https://github.com/terminalrootsh/jsterminal.git
cd jsterminal/
sh jsterminal.sh
{% endhighlight %}

Depois saia do <kbd>terminal</kbd>, abra-o novamente e rode esse comando

<kbd>phantomjs --version</kbd>

E também:

<kbd>phantomjs --help</kbd>

Se quiser rodar diretamente pelo terminal rode

<kbd>phantomjs</kbd>


## Uso/Vídeo


# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=I4zO0d4IS7Y)


## Rodar Comandos Shell em JS

> Quando você quiser executar comandos __UNIX__ com __Server Side__. Exs.: Salvar um dado do cliente simplesmente inserido o conteúdo que ele solicitou num arquivo txt; Copiar um arquivo solicitado; ...

### Instalação

+ [Gentoo](http://terminalroot.com.br/tags/#gentoo)

> O portage irá instalar todas as depedências necessárias caso já não estejam instaladas, basta rodar o simples comando:

{% highlight bash %}
emerge nodejs
{% endhighlight %}

+ [Debian](http://terminalroot.com.br/tags/#debian), [Ubuntu](http://terminalroot.com.br/tags/#ubuntu), [Linux](http://terminalroot.com.br/tags/#linux) Mint e derivados

> Diferentemente do __Portage__ no Gentoo, será ncessário instalar dependências juntamente com o [NodeJS](https://nodejs.org)

{% highlight bash %}
sudo apt-get install build-essential libssl-dev nodejs
{% endhighlight %}

+ Fedora, [CentOS](http://terminalroot.com.br/tags/#centos) e derivados do [Red Hat](http://terminalroot.com.br/tags/#redhat)

> Você precisará antes adicionar o __epel-release__

{% highlight bash %}
sudo yum install epel-release
sudo yum install nodejs
{% endhighlight %}

Após instalar o NodeJS use o comando npm com o usuário normal para instalar o ShellJS

{% highlight bash %}
npm install [-g] shelljs
{% endhighlight %}

Após instalado __veja__/__crie__ esse __arquivo__ com alguns __exemplos__:

{% highlight js %}
var shell = require('shelljs');
shell.echo('Utilizando o comando echo com ShellJS');
shell.echo('-e', '\nUsando o parâmetro -e do echo para pular linha com o \\n \nCriando o arquivo meu-arquivo.txt com o comando touch');
shell.touch('meu-arquivo.txt');
shell.echo('Copiando o meu-arquivo.txt para novo-arquivo.txt');
shell.cp('meu-arquivo.txt', 'novo-arquivo.txt');
shell.echo('Rode esse script com o comando: node shelljs.js');
shell.echo('-e','Para mais informações acesse:\nhttps://www.npmjs.com/package/shelljs\n');
{% endhighlight %}


## Links Úteis

<http://phantomjs.org/>

<https://github.com/ariya/phantomjs/>

<https://github.com/terminalrootsh/jsterminal>

<https://github.com/ariya/phantomjs/tree/master/examples>

<https://en.wikipedia.org/wiki/PhantomJS>

<https://nodejs.org>

<https://www.npmjs.com/package/shelljs>

<https://www.npmjs.com/browse/keyword/shelljs>

<https://www.npmjs.com/package/shx>

## Comentários, fica por sua conta! ;)

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



