---
layout: post
title: "TUIOS: Um Gerenciador de Janelas para o Terminal"
date: 2026-07-21 20:08:05
image: '/assets/img/terminal/tuios.jpg'
description: "🔳 Escrito em Go"
icon: 'ion:terminal-sharp'
iconname: 'Terminal/TUI'
tags:
- tui
- terminal
- wm
- go
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**TUIOS** é um **[terminal](https://terminalroot.com.br/tags#terminal) multiplexer e gerenciador de janelas** que permite criar múltiplos terminais, organizá-los em layouts lado a lado (BSP tiling).


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
O projeto oferece diversas formas de instalação:

**Homebrew**

{% highlight bash %}
brew install tuios
{% endhighlight %}

**Go**

{% highlight bash %}
go install github.com/Gaurav-Gosain/tuios/cmd/tuios@latest
{% endhighlight %}

**Script de instalação**

{% highlight bash %}
curl -fsSL https://raw.githubusercontent.com/Gaurav-Gosain/tuios/main/install.sh | bash
{% endhighlight %}

Também há binários prontos para download e uma imagem Docker oficial. O requisito principal é utilizar um terminal moderno com suporte a True Color, sendo Ghostty, Kitty e WezTerm algumas das opções recomendadas.

## Uso básico

Após instalar, basta iniciar o TUIOS:

{% highlight bash %}
tuios
{% endhighlight %}

Alguns atalhos úteis:

* `n` → cria um novo terminal.
* `Ctrl + P` → abre a paleta de comandos.
* `Esc` → retorna ao modo de gerenciamento de janelas.
* `z` → maximiza/restaura o painel atual.
* `Ctrl + B` → tecla de prefixo para comandos avançados.

Também é possível criar sessões persistentes:

{% highlight bash %}
tuios new minha-sessao
tuios attach minha-sessao
{% endhighlight %}

Assim você pode fechar o terminal e retomar exatamente de onde parou posteriormente.

![TUIOS gif](https://github.com/Gaurav-Gosain/tuios/raw/main/assets/demo.gif) 

---

Para mais informações acesse o **repositório:** <https://github.com/Gaurav-Gosain/tuios>


