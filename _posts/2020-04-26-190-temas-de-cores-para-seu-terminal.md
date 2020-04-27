---
layout: post
title: "190 Temas de cores para seu Terminal"
date: 2020-04-26 20:28:53
image: '/assets/img/terminal/gogh.png'
description: 'Temas como: Gruvbox, Dracula, Nord e muitos outros.'
icon: 'ion:terminal-sharp'
iconname: 'terminal'
tags:
- terminal
- temas
- dicas
---

![190 Temas de cores para seu Terminal](/assets/img/terminal/gogh.png)


[Gogh](http://mayccoll.github.io/Gogh/) é um conjunto de scripts do [Bash](https://terminalroot.com.br) que facilita a alteração do esquema de cores dos [terminais](https://terminalroot.com.br/tags#terminal) no [Linux](https://terminalroot.com.br/tags#linux) e no [macOS](https://terminalroot.com.br/tags#macos). Atualmente, oferece 190 esquemas de cores de terminais e suporta terminais baseados em Gtk, como [Gnome](https://terminalroot.com.br/tags#gnome) Terminal, Xfce Terminal, Mate Terminal, Pantheon Terminal, Tilix e Guake no Linux e iTerm2 no Mac.

# Instalação 

Para instalar e utilizar o Gogh é muito simples. Primeiramente certifique-se de que possui as dependências, exemplo para sistemas baseados em APT:
{% highlight bash %}
sudo apt install dconf-cli uuid-runtime wget
{% endhighlight %}

Após isso é só escolher um dos comandos abaixo, como `wget` ou `curl`:
{% highlight bash %}
bash -c  "$(wget -qO- https://git.io/vQgMr)"
{% endhighlight %}

ou

{% highlight bash %}
 bash -c  "$(curl -sLo- https://git.io/vQgMr)" 
{% endhighlight %}

Ele vai executar e exibir uma lista com 190 temas, exemplo:
> Para escolher  basta digitar o **NÚMERO** do tema

![Gogh escolha do tema](/assets/img/terminal/escolha-o-tema.png)

Supondo que você você escolheu o tema **115**(Nord):

![Nord Theme](/assets/img/terminal/alterando-o-tema.png)

Próximo passo é clicar com o botão direito do mouse e ir até **Preferências** e no canto direito do menu que se abrirá , altere o tema definindo-o como padrão, depois é só fechar e abrir novamente o terminal e o esquema de cores já estará alterado.

![Preferências](/assets/img/terminal/preferencias.png)

![Definir como padrão](/assets/img/terminal/definindo-como-padrao.png)

![Tema alterado](/assets/img/terminal/tema-alterado.png)

Show de bola!

Visite o site do [Gogh](http://mayccoll.github.io/Gogh/) para mais detalhes:
# <http://mayccoll.github.io/Gogh/>

