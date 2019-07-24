---
layout: post
title: "Diferenças do Shell Bash no Linux para o Mac OS X"
date: 2017-04-20 13:17:04
image: '/assets/img/bash/macosx-linux.jpg'
description: "No Mac OS X a partir do Panther, o Bash é o Shell padrão do sistema, e ele já devidamente instalado para todos os usuários."
main-class: 'bash'
tags:
- bash
- gnu
- macosx
---

![Diferenças do Shell Bash no Linux para o Mac OS X](/assets/img/bash/macosx-linux.jpg "Diferenças do Shell Bash no Linux para o Mac OS X")

> No [Mac OS X](https://www.apple.com/br/macos/) a partir do __Panther__, o [Bash](https://www.gnu.org/software/bash/) é o [Shell](http://terminalroot.com.br/shell/) padrão do sistema, e ele já está devidamente instalado para todos os usuários. No entanto, o Bash no Mac se difere em algumas coisas do Bash no GNU/Linux. O Mac OS X é derivado do [BSD](http://terminalroot.com.br/tags#bsd), as ferramentas não tem as opções das ferramentas [GNU](https://www.gnu.org/), que são nativas no __Linux__. Mas também há execeções.

### Exemplos


* O comando __tac__ &raquo; No Mac não existe tac, no entanto, pode-se obter o mesmo resultado utilizando o camando __tail -r__ , e então criar um alias para chegar até o __tac__
{% highlight bash %}
alias tac="tail -r"
{% endhighlight %}


* O comando __seq__ &raquo; No Mac e no Unix em geral, não existe __seq__ , mas há um comando similar que é o __jot__ , mas há uma sintaxe diferente.


* O comando __dialog__ &raquo; No Mac também não há __dialog__ . Mas existem programas como o [Fink](http://finkproject.org/), [MacPorts](https://www.macports.org/) e [Rudix](http://rudix.org/), que permitem instalar no Mac da Apple, programas do Linux. O Rudix por sinal é desenvolvido por brasileiros. Existe também o [CocoaDialog](http://mstratman.github.io/cocoadialog/), que utiliza janelas gráficas do __Mac OS X__, mas as opções se diferem do __dialog__, mas é muito similiar em outras coisas.

## Links dos Projetos

Pra você saber mais sobre as ferramentas citadas, você pode cosultar os links abaixo:

<http://rudix.org/>

<http://finkproject.org/>

<https://www.macports.org/>

<http://mstratman.github.io/cocoadialog/>

# Faça nosso curso gratuito de Shell Bash e adquira todo conteúdo nesse link
<http://www.terminalroot.com.br/shell/>

## Deixe seu comentário!

### Valeu!

<sub>Esse post foi adapatado do livro Shell Script Profissional - Aurelio M. Jargas</sub>


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

