---
layout: post
title: "Jogue Wordle no terminal via SSH"
date: 2022-04-14 11:47:28
image: '/assets/img/tui/clidle.jpg'
description: 'Wordle é o jogo do momento e você pode jogá-lo no seu terminal com essa versão escrita em Go.'
icon: 'ion:terminal-sharp'
iconname: 'Terminal Root'
tags:
- go
- tui
- terminal
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

A internet só fala em [Wordle](https://en.wikipedia.org/wiki/Wordle), é o jogo do momento!

**Wordle** é um jogo de palavras baseado na web criado e desenvolvido pelo engenheiro de software galês Josh Wardle e de propriedade e publicado pela The New York Times Company desde 2022.

Os jogadores têm seis tentativas para adivinhar uma palavra de cinco letras, com feedback dado para cada palpite em a forma de ladrilhos coloridos indicando quando as letras combinam ou ocupam a posição correta.

A mecânica é quase idêntica ao jogo de caneta e papel de 1955 Jotto e à franquia de jogos de televisão Lingo . 

Wordle tem uma única solução diária, com todos os jogadores tentando adivinhar a mesma palavra.

---

# Clidle
Clidle é a versão do Wordle no terminal com TUI(Terminal User Interface) escrito com a linguagem de programação [Golang](https://terminalroot.com.br/tags#go) .

Para rodá-lo no seu sistema você não precisa instalar nada. Basta utilizar o [comando](https://terminalroot.com.br/tags#comandos) [SSH](https://terminalroot.com.br/tags#ssh) da seguinte forma:

{% highlight sh %}
ssh clidle.ddns.net -p 3000
{% endhighlight %}

Se quiser rodar localmente, basta possuir o [Go](https://terminalroot.com.br/tags#go) instalado e usar o comando:

{% highlight sh %}
go install github.com/ajeetdsouza/clidle@latest
{% endhighlight %}

Para mais informações acesse o [repositório](https://github.com/ajeetdsouza/clidle) do [clidle](https://github.com/ajeetdsouza/clidle) .


