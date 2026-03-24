---
layout: post
title: "Baixe vídeos do Youtube com esse App TUI"
date: 2026-03-24 10:08:52
image: '/assets/img/go/xytz.jpg'
description: "▶️ Mais um utilitário feito com Go."
icon: 'ion:terminal-sharp'
iconname: 'TUI'
tags:
- go
- tui
- terminal
- youtube
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

`xytz` é um projeto open source simples e muito útil pra quem curte terminal que é um frontend [TUI](https://terminalroot.com.br/tags#tui) pro *yt-dlp* feito em [Go](https://terminalroot.com.br/tags#go) usando [Bubble Tea](https://terminalroot.com.br/2025/07/crie-lindas-interfaces-para-o-terminal-com-essa-lib-go.html).

* Busca vídeos do YouTube direto no terminal
* Navegação por canal (`/channel`) e playlist (`/playlist`)
* Escolha de qualidade/formatos antes de baixar
* Download com progresso, velocidade e ETA
* Resume de downloads interrompidos
* Histórico de buscas
* Atalhos estilo Vim
* Playback direto via mpv (sem baixar) ([pkg.go.dev][1])


<!-- SQUARE - GAMES ROOT -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

## Instalação

+ Via Go:
{% highlight bash %}
go install github.com/xdagiz/xytz@latest
{% endhighlight %}

+ Via [cURL](https://terminalroot.com.br/tags#curl)
{% highlight bash %}
curl -fsSL https://raw.githubusercontent.com/xdagiz/xytz/main/install.sh | bash
{% endhighlight %}

+ Homebrew (macOS)
{% highlight bash %}
brew install xdagiz/tap/xytz
{% endhighlight %}

+ Arch
{% highlight bash %}
paru -S xytz-bin # or yay -S xytz-bin
{% endhighlight %}

+ Scoop (Windows)
{% highlight bash %}
scoop bucket add xdagiz https://github.com/xdagiz/scoop-bucket.git
scoop install xdagiz/xytz
{% endhighlight %}

Após instalar basta rodar:

{% highlight bash %}
xytz
{% endhighlight %}

E um guia rápido em:
{% highlight bash %}
xytz --help
{% endhighlight %}

---

Para mais informações acesse o [repositório](https://github.com/xdagiz/xytz).

