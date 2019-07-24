---
layout: post
title: "BSPWM Review"
date: 2018-09-13 12:50:39
image: '/assets/img/bspwm/bspwm-review-min.jpg'
description: 'bspwm é um gerenciador de janelas leve, lado a lado, e minimalista escrito em C que organiza janelas em árvore binária completa.'
main-class:
tags:
- bspwm
- gentoo 
---

<img class="img img-thumbnail text-center" width="30%" src="/assets/img/bspwm/bspwm-review-min.jpg" alt="Captura de Tela, Gentoo + bspwm" title="Captura de Tela, Gentoo + bspwm">

[bspwm](https://github.com/baskerville/bspwm) é um gerenciador de janelas leve, lado a lado, e minimalista escrito em C que organiza janelas em árvore binária completa Seu tamanho instalado é menor que 600KB. O bspwm tem suporte para EWMH e múltiplos monitores. Ele responde apenas a eventos e mensagens X que recebe em um soquete dedicado de um programa incluído em seu pacote, o bspc.

Você clonar o bspwm do seu repositório oficial e compilar na sua máquina, para isso acesse os passos no endereço <https://github.com/baskerville/bspwm>, ou verificar no repositório da sua distribuição, por exemplo, no Gentoo o comando para instalar é

{% highlight bash %}
emerge bspwm
{% endhighlight %}

Caso deseje instatar também os exemplos, use a flag `examples` em `make.conf`

E depois criar e copiar os arquivos essenciais para seu `.config`

{% highlight bash %}
mkdir ~/.config/bspwm
cp /usr/share/doc/bspwm-0.9.5/examples/bspwmrc ~/.config/bspwm/
mkdir ~/.config/sxhkd
cp /usr/share/doc/bspwm-0.9.5/examples/sxhkdrc ~/.config/sxhkd/
{% endhighlight %}

Após isso é só logar no bspwm. Seus principais comandos são:

{% highlight bash  %}
super+enter = Abre oterminal
super+w = Fecha uma janela'
super+space = Abre o dmenu, se estiver instalado
esc = Sai dmenu
super+right-mouse = Redimensiona a janela
super+left-mouse = Move a janela
super+f = Tela cheia
super+t = Restaura a janela para seu tamanho normal
super+s = "Flota" a janela
super+2 = Vai para a área de trabalho 2
super+3 = Vai para a área de trabalho 3
...
super+shift+2 = move a janela para desktop 2
...

super + alt + Esc = Encerra a sessão

{% endhighlight  %}

# [Saiba mais assistindo a Review sobre bspwm, clique aqui para assistir](https://www.youtube.com/watch?v=h1diTbJzm5Y)

Mais informações:

{% highlight bash %}
man bspwm
man bspc
{% endhighlight %}

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

