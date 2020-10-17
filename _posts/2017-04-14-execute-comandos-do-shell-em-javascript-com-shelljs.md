---
layout: post
title: "Execute Comandos do Shell em JavaScript com ShellJS"
date: 2017-04-14 11:35:58
image: '/assets/img/shell-script/shelljs.jpg'
description: "ShellJS é uma implementação portable para Linux, OS X e Windows de comandos de Shell Unix da API Node.js."
tags:
- shellscript
- bash
- javascript
- unix
---

![Execute Comandos do Shell em JavaScript com ShellJS](/assets/img/shell-script/shelljs.jpg "Execute Comandos do Shell em JavaScript com ShellJS")

## Introdução

[ShellJS](https://www.npmjs.com/package/shelljs) é uma implementação portable para __Linux__, __OS X__ e __Windows__ de comandos de __Shell Unix__ da __API Node.js__. Você pode usá-lo para eliminar a dependência do __Script Shell em Unix__, mantendo seus comandos familiares e poderosos. Você também pode instalá-lo __globalment__e para que você possa executá-lo a partir de projetos externos!

O projeto é testado em projetos como

* [PDF.js](http://github.com/mozilla/pdf.js) - Leitor de PDF do Firefox
* [Firebug](http://getfirebug.com/) - Depurador do Firefox
* [JSHint](http://jshint.com/) & [ESLint](http://eslint.org/) - Linters populares de JavaScript 
* [Zepto](http://zeptojs.com/) - Biblioteca de JavaScript compatível com jQuery para navegadores modernos
* [Yeoman](http://yeoman.io/) - Aplicativos da Web e ferramenta de desenvolvimento
* [Deployd.com](http://deployd.com/) - PaaS de código aberto para rápida geração de backend de API

E [muitos mais](https://npmjs.org/browse/depended/shelljs).

## Uso da linha de comando

Se você quiser apenas comandos [UNIX](https://pt.wikipedia.org/wiki/Unix), confira o novo projeto [shelljs/shx](https://github.com/shelljs/shx), um utilitário para __shelljs na linha de comando__.
{% highlight bash %}
shx mkdir -p foo
shx touch foo/bar.txt
shx rm -rf foo
{% endhighlight %}

## Instalação

Via __npm__

{% highlight bash %}
npm install [-g] shelljs
{% endhighlight %}

## Exemplos

{% highlight js %}
var shell = require('shelljs');
 
if (!shell.which('git')) {
  shell.echo('Desculpe, este script requer o git.');
  shell.exit(1);
}
 
// Copiar ou remover arquivos
shell.rm('-rf', 'out/Release');
shell.cp('-R', 'stuff/', 'out/Release');
 
// Substituir macros em cada arquivo .js 
shell.cd('lib');
shell.ls('*.js').forEach(function (file) {
  shell.sed('-i', 'BUILD_VERSION', 'v0.1.2', file);
  shell.sed('-i', /^.*LINHA_PARA_REMOVER.*$/, '', file);
  shell.sed('-i', /.*TROCAR_LINHA_QUE_CONTENHA_ISSO.*\n/, shell.cat('macro.js'), file);
});
shell.cd('..');
 
// Executar ferramenta externa de forma síncrona 
if (shell.exec('git commit -am "Auto-commit"').code !== 0) {
  shell.echo('Error: Git commit failed');
  shell.exit(1);
}
{% endhighlight %}

## Global vs Local

Já não recomenda-se usar uma importação global para __ShellJS__ (ou seja, __require('shelljs / global')__). Embora ainda seja suportado por conveniência, isso polui o namespace global e, portanto, só deve ser usado com cautela.

Em vez disso, recomenda-se uma importação local (padrão para pacotes npm)
{% highlight js %}
var shell = require('shelljs');
shell.echo('hello world');
{% endhighlight %}

## Comandos do Shell em JS

Todos os comandos são executados de forma síncrona, salvo indicação em contrário. Todos os comandos aceitam caracteres globbing do bash (*,?, etc.), compatíveis com o módulo [node glob module](https://github.com/isaacs/node-glob).

Para comandos e recursos menos utilizados, consulte a [wiki](https://github.com/shelljs/shelljs/wiki).

### cat(file [, file ...])

{% highlight js %}
var str = cat('file*.txt');
var str = cat('file1', 'file2');
var str = cat(['file1', 'file2']);
{% endhighlight %}

### cd([dir])

### chmod([options,] octal_mode || octal_string, file)

### chmod([options,] symbolic_mode, file)

Opções disponíveis:

* __-v__: exibe um diagnóstico para cada arquivo processado
* __-c__: como verboso mas relatório apenas quando uma alteração é feita
* __-R__: alterar arquivos e diretórios recursivamente

### echo([options,] string [, string ...])

Opções disponíveis:

* __-e__: Interpretar backslashes

### exec(command [, options] [, callback])

### find(path [, path ...])

### grep([options,] regex_filter, file [, file ...])

### sed([options,] search_regex, replacement, file [, file ...])

Opções disponíveis:

* __-i__: Substitua o conteúdo do 'arquivo' no local.

Exemplos:

{% highlight js %}
sed('-i', 'VERSAO_DO_PROGRAMA', 'v0.1.3', 'source.js');
sed(/.*DELETE_ESSA_LINHA.*\n/, '', 'source.js');
{% endhighlight %}

> Como o Unix sed, o ShellJS sed suporta regex

{% highlight js %}
sed(/(\w+)\s(\w+)/, '$2, $1', 'file.txt');
{% endhighlight %}

## E vários outros comandos!

## Veja o endereço oficial do ShellJS
<https://github.com/shelljs/shelljs>

# Faça nosso curso gratuito de Shell Script e adquira todo conteúdo nesse link
<http://www.terminalroot.com.br/shell/>

## Deixe seu comentário!

# Valeu!

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



