---
layout: post
title: "Yaydl - Uma alternativa ao Youtube-dl escrita em Rust"
date: 2021-06-21 13:28:25
image: '/assets/img/rust/yaydl.jpg'
description: 'Fiz um teste baixando um vídeo e foi ultraveloz!'
icon: 'ion:terminal-sharp'
iconname: 'Rust'
tags:
- rust
---

![Yaydl - Uma alternativa ao Youtube-dl escrita em Rust](/assets/img/rust/yaydl.jpg)

Pra quem é fã de [Rust](https://terminalroot.com.br/tags#rust) e de velocidade, o Yaydl é outro software via linha de comando para fazer downloads de vídeos do [Youtube](https://youtube.com/TerminalRootTV) .

# Instalação
Você pode construir do zero usando [Git](https://terminalroot.com.br/git) ou [Fossil](https://fossil-scm.org/). Mas a melhor forma é instalar via [Cargo](https://crates.io/). Se você não tiver instalado acesse [esse link](https://rustup.rs/) e veja como instalar e não esqueça de adicionar o Cargo à sua `$PATH`: `echo ''export PATH="${PATH}:${HOME}/.cargo/bin" >> ~/.bashrc`.

Após isso basta rodar:

{% highlight bash %}
cargo install yaydl
{% endhighlight %}

Se preferir usar o Git:

{% highlight bash %}
git clone https://github.com/dertuxmalwieder/yaydl
cd yaydl
cargo build --release
{% endhighlight %}
> O binário será contruído no diretório: `yaydl/src/release/yaydl`.

E eles ainda disponibilizam via Fossil(não sei quem realmente usa ele, mas...):

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


{% highlight bash %}
fossil clone https://code.rosaelefanten.org/yaydl
cd yaydl
cargo build --release
{% endhighlight %}

E se você utiliza [NetBSD](https://terminalroot.com.br/2018/09/netbsd.html) ou [OpenBSD](https://terminalroot.com.br/2018/07/openbsd-o-sistema-mais-seguro-do-mundo-instalacao-e-configuracao.html), basta rodar os comandos abaixo:

{% highlight bash %}
pkg_add yaydl # OpenBSD
pkgin install yaydl # NetBSD
{% endhighlight %}

# Utilização
Usar é tão simples quanto o [Youtube-DL](https://terminalroot.com.br/2020/10/baixe-o-youtube-dl-em-duas-imagens.html) , basta invocar o comando e em seguida a URL, exemplo:

{% highlight bash %}
yaydl https://www.youtube.com/watch?v=t0UNRdk1MfE
{% endhighlight %}

A saída será mais ou menos assim:

{% highlight bash %}
Fetching from YouTube.
⠚ [00:00:02] [##################################>-----] 1.80MB/2.10MB (1s)
{% endhighlight %}
> Após finalizado: `"Bate papo sobre GNOME, KDE e Linux   MrRobot.mp4" successfully downloaded.`

É muito rápido!

Para mais informações consukte o repositório:
#### <https://github.com/dertuxmalwieder/yaydl>


