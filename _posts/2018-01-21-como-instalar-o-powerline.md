---
layout: post
title: "Como Instalar o Powerline"
date: 2018-01-21 16:34:45
image: '/assets/img/terminal/como-instalar-o-powerline.jpg'
description: 'O Powerline é um plugin de status para o terminal, vim, tmux e vários outros aplicativos.'
main-class: 'web'
tags:
- terminal
---

O [Powerline](https://powerline.readthedocs.io/en/master/index.html) é um plugin de status para o [terminal](http://terminalroot.com.br/shell), [vim](http://terminalroot.com.br/vim), [tmux](http://terminalroot.com.br/2018/01/como-instalar-e-utlizar-o-tmux.html) e vários outros aplicativos.

## Instalação 

> No [Gentoo](https://goo.gl/7PyqZe): você precisa adicionar o [raiagent](https://github.com/leycec/raiagent)

{% highlight bash %}
emerge -a layman
touch /var/lib/layman/make.conf
echo 'source /var/lib/layman/make.conf' >> /etc/portage/make.conf
layman -a raiagent # [y/n] y
layman -S
{% endhighlight %}

Depois é só instalar
{% highlight bash %}
emerge -a app-misc/powerline
{% endhighlight %}

> No Debian, Ubuntu e derivados
{% highlight bash %}
sudo apt-get install powerline fonts-powerline
{% endhighlight %}

> No Fedora
{% highlight bash %}
sudo dnf install powerline powerline-fonts
{% endhighlight %}

Depois rode os comandos abaixo na sequência
{% highlight bash %}
mkdir /usr/local/bin/powerline
git clone https://github.com/powerline/powerline.git /usr/local/bin/powerline/
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf -O /usr/share/fonts/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf -O /etc/fonts/conf.d/10-powerline-symbols.conf
echo '. /usr/local/bin/powerline/powerline/bindings/bash/powerline.sh' >> ~/.bashrc
{% endhighlight %}

Saia do terminal, abra de novo e desfrute!

# Assista o Vídeo

# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=YaLR2RZeI1A)


## Endereço do Powerline no [GitHub](http://terminalroot.com.br/git)
<https://github.com/powerline/powerline>

# Comente!

