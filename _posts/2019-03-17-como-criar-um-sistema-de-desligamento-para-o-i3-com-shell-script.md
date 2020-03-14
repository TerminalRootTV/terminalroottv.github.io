---
layout: post
title: "Como Criar um Sistema de Desligamento para o i3 com Shell Script"
date: 2019-03-17 19:34:48
image: '/assets/img/gentoo/shell-script-i3-yad-gentoo.png'
description: 'Nesse exemplo vamos usar uma ferramenta para Shell Script: Yad.'
tags:
- i3
- shellscript
- yad
- gentoo
---

![Como Criar um Sistema de Desligamento para o i3 com Shell Script](/assets/img/gentoo/shell-script-i3-yad-gentoo.png)

> Nesse exemplo vamos usar uma ferramenta para Shell Script: [Yad](https://github.com/v1cont/yad).

Primeiramente precisamos instalar alguns programas para que o sistema funcione corretamente. E no caso do [Gentoo](http://terminalroot.com.br/2017/05/como-instalar-o-gentoo.html), precisamos passar algumas flags. Em resumo o comando de instalação fica:

> Para mais detalhes assista o vídeo

{% highlight bash  %}
USE="X examples" emerge -a gtk+ polybar sudo
{% endhighlight  %}

> Depois configuramos o Polybar e o Sudo

Agora precisamos clonar, compilar e instalar o [Yad](https://github.com/v1cont/yad) , na sua distribuição talvez basta usar o gerenciador de pacotes.

{% highlight bash  %}
git clone https://github.com/v1cont/yad
su && cd yad && autoreconf -ivf && intltoolize
./configure --enable-html --enable-icon-browser
make && make install
{% endhighlight  %}

Agora criaremos nosso sistema em [Shell Script](http://terminalroot.com.br/shell)

> Lembrando que usamos o ícone com as dimensões similares a esse: <http://terminalroot.com.br/img/favicon.png> `wget http://terminalroot.com.br/img/favicon.png -O icon.png`

{% highlight bash  %}
#!/bin/bash
acao=$(yad --center --width 500 --height 100 --entry --title "Sistema de Desligamento" \
	--image=icon.png \
	--button="Ok:0" \
	--button="Fechar:1" \
	--text "Escolha:" \
	--entry-text \
	"Desligar" "Reiniciar" "Encerrar Sessao")

case "$acao" in
	"Desligar") sudo shutdown -ah now;;
	"Reiniciar") sudo shutdown -ar now;;
	"Encerrar Sessao") i3-msg exit;;
	*) : ;;
esac
{% endhighlight  %}

> Finalizamos efetuando modificações no `$HOME/.config/i3/config`

Comandos e configs específicos usados no vídeo

{% highlight bash  %}

# linha de comando
which poweroff reboot shutdown | paste - - - | tr '\t' ','

# sudoers
marcos ALL=(ALL) ALL
marcos ALL=NOPASSWD:/sbin/poweroff,/sbin/reboot,/sbin/shutdown

# i3/config
exec_always $HOME/.config/polybar/launch.sh
for_window [instance="yad"] floating enable

# polybar
[module/desligar]
type = custom/script
exec = ~/.config/polybar/d.sh
tail = true
click-left = /usr/bin/desligar

{% endhighlight  %}

Para entender melhor, assista o vídeo:

# [Clique Aqui Para Assistir o Vídeo](https://youtu.be/Szoid9aH9Tw)

***

## Conheça nosso Treinamentos de Shell Script, Vim, Expressões Regulares e Sed
# <http://terminalroot.com.br/cursos>

## Crie Sua Promoção
# <http://terminalroot.com.br/promo>

## Acompanhe todos os vídeos da **Série Shell Script Profissional**
# [#ShellPro](http://bit.ly/shell-pro-root)

Comente!

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

