---
layout: post
title: "Alpine Linux com AwesomeWM, NÃO RECOMENDADO para usuários NUTELLA"
date: 2019-12-29 17:50:49
image: '/assets/img/wm/anti-nutella-min.jpg'
description: 'Utiliza por padrão BusyBox, musl, PaX e grsecurity.'
tags:
- alpine
- awesomewm
- wm
- distro
- linux
---

![Alpine Linux com AwesomeWM, NÃO RECOMENDADO para usuários NUTELLA](/assets/img/wm/anti-nutella-min.jpg "Alpine Linux com AwesomeWM, NÃO RECOMENDADO para usuários NUTELLA")

[Alpine Linux](https://alpinelinux.org/) é uma [Distribuição Linux](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=Distro) baseada em [musl](https://www.musl-libc.org) e [BusyBox](https://www.busybox.net/), originalmente projetado para usuários avançados que apreciam segurança, simplicidade e eficiência no uso de recursos.

Usa PaX e grsecurity patches no kernel padrão e compila todos os binários userspace como executável de posição independente com proteção stack-smashing.

Originalmente, Alpine Linux começou como um fork do Projeto LEAF Os membros do LEAF gostariam de continuar construindo uma Distribuição Linux que funcionasse em um único disquete, enquanto que a equipe do Alpine Linux desejava incluir alguns pacotes mais pesados como Squid e Samba, assim como recursos adicionais de segurança e um novo kernel. Uma das metas originais foi criar um framework para sistemas maiores.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

+ Alpine usa seu próprio sistema gerenciador de pacote, [apk-tools](https://pkgs.alpinelinux.org/package/v3.4/main/x86/apk-tools), que originalmente foi uma coleção de [shell scripts](https://terminalroot.com.br/shell) e mais tarde foi rescrito em [C](https://terminalroot.com.br/2017/01/codigo-de-linguagem-c-para-aprendizado.html). Alpine atualmente contém os pacotes mais comuns como [GNOME](https://terminalroot.com.br/2018/02/como-customizar-a-aparencia-do-gnome.html), Xfce, [Firefox](https://terminalroot.com.br/2014/09/complementos-uteis-para-firefox.html), e outros.

+ C standard library: O Linux Alpine anteriormente usava [uClibc](https://www.uclibc.org) em vez do tradicional [GNU C Library (glibc)](https://www.gnu.org › software › libc) que é mais comumente usado. Embora seja leve, possui significantes incompatibilidades com o glibc. O que obrigava que todos os softwares fossem compilados com o uClibc. Em abril de 2014 os desenvolvedores trocaram para o **musl**, que possui uma compatibilidade parcial com glibc.

+ Sistema de iniciação: O simples e leve [OpenRC](https://wiki.gentoo.org › wiki › OpenRC) é o sistema de iniciação corrente do Linux Alpine.

## Download
Para fazer o download do Alpine basta acessar a página: <https://alpinelinux.org/downloads/>

## Instalação
Para instalar basta logar inicialmente com o usuário `root` diretamente e executar o comando:
{% highlight bash %}
setup-alpine
{% endhighlight %}
E seguir os passos de acordo com as perguntas efetuadas, no final basta reiniciar: `reboot`.

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

## Configuração
Para configurar os espelhos de rede é o arquivo: `/etc/apk/repositories` , você pode descomentar e/ou adicionar novos.

Após isso é interessante atualizar o repositório com o comando:
{% highlight bash %}
apk update
{% endhighlight %}

## Pós Configuração (`pos-alpine.sh`)
Nós criamos um [Shell Script](https://terminalroot.com.br/shell) que funciona em 2 etapas e instala alguns aplicativos e configura-os automaticamente, para utilizá-lo basta fazer o download do mesmo e rodar:
{% highlight bash %}
wget terminalroot.com.br/sh/pos-alpine.sh
chmod +x pos-alpine.sh
./pos-alpine.sh
usage: pos-alpine.sh [flags]

  Options:

    --install          First step, only root.
    --user             Second step, only normal user.

* Marcos Oliveira - <terminalroot.com.br> - POS-ALPINE 0.1
{% endhighlight %}

+ **Primeiramente, como o `root`** rode: `pos-alpine.sh --install`
+ E após criar um usuário(`adduser [yourusername]`) e logar com o mesmo rode: `./pos-alpine --user`.

Depois é só iniciar a sessão do Xorg: `startx`

## Utilização
As teclas de atalho(hotkeys) do [AwesomeWM](https://awesomewm.org/) podem ser consultada teclando a combinação: **Super + w** → Awesome → hotkeys .

# Assista ao Vídeo
<iframe width="920" height="400" src="https://www.youtube.com/embed/RLN20em8JvQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<!-- RETANGULO LARGO 2 -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:block; text-align:center;"
data-ad-layout="in-article"
data-ad-format="fluid"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="8549252987"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

## Links úteis
+ Temas pro AwesomeWM: <https://github.com/lcpz/awesome-copycats>
+ <https://pt.wikipedia.org/wiki/Alpine_Linux>
+ <https://wiki.alpinelinux.org/wiki/Awesome(wm)_Setup>
+ ✅ Conheça nossos Cursos: <http://bit.ly/CursosTerminalRoot>
+ ✅ Pacotes Promocionais: <http://bit.ly/PromoTerminalRoot>
+ 🎁 Todos os Cursos na Udemy: <http://bit.ly/UdemyTerminalRoot>


