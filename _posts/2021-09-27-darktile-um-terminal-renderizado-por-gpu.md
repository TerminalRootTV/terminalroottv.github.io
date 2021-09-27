---
layout: post
title: "Darktile - Um terminal renderizado por GPU"
date: 2021-09-27 08:34:46
image: '/assets/img/terminal/darktile.jpg'
description: 'Destaca links no terminal, renderiza unicode e entre outros recursos.'
icon: 'ion:terminal-sharp'
iconname: 'Terminal'
tags:
- terminal
- go
---

![Darktile - Um terminal renderizado por GPU](/assets/img/terminal/darktile.jpg)

[Darktile](https://github.com/liamg/darktile) é um emulador de terminal(escrito em [Go](https://terminalroot.com.br/tags#go)) renderizado por GPU projetado para gerenciadores de janelas lado a lado.

Dentre seus recursos também há:
+ Suporte Unicode
+ Variedade de temas disponíveis (ou crie o seu próprio!)
+ Fonte powerline compilada
+ Funciona com suas fontes TTF/OTF monoespaçadas favoritas
+ Ligaduras de fonte (desative-as se você não for um fã de ligaduras)
+ Capturas de tela com um único atalho de tecla
+ Transparência da janela (0-100%)
+ Cursor personalizável (formatos de imagem mais populares suportados)


<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# Instalação
Antes certifique-se que possui as dependências:
+ [curl](https://terminalroot.com.br/2019/10/12-dicas-para-voce-usar-o-comando-curl-como-um-ninja.html)
+ `xorg-dev`
+ `libgl1-mesa-dev`

Em seguida basta rodar o comando:
{% highlight sh %}
curl -s "https://raw.githubusercontent.com/liamg/darktile/main/scripts/install.sh" | sudo bash
{% endhighlight %}

Após instalado para abrir basta rodar o comando:
{% highlight sh %}
darktile
{% endhighlight %}

Ou se estiver usando [bspwm](https://terminalroot.com.br/2021/06/como-instalar-e-configurar-o-bspwm-com-temas-para-polybar.html) crie um atalho de exemplo em `$HOME/.config/sxhkd/sxhkdrc`:
> Abrir o `darktile` com a combinação das teclas: **Super + shift + Enter** .
{% highlight sh %}
# Darktile
super + shift + Return
    darktile
{% endhighlight %}

---

# Configuração
Para alterar as configurações do Darktile, crie/edite um arquivo no endereço: `$HOME/.config/darktile/config.yml`.
> Exemplo de configuração:
{% highlight sh %}
opacity: 1.0       # Window opacity: 0.0 is fully transparent, 1.0 is fully opaque
font:
  family: ""       # Font family. Find possible values for this by running 'darktile list-fonts'
  size: 16         # Font size
  dpi: 72          # DPI
  ligatures: true  # Enable font ligatures e.g. render '≡' instead of '==='
cursor:
  image: ""        # Path to an image to render as your cursor (defaults to standard rectangular cursor)
{% endhighlight %}

Veja abaixo um GIF de exemplo de uso do Darktile:
> Ao passar o cursor sobre um link, ele destaca o link com informações.


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

![Darktile GIF](https://github.com/liamg/darktile/raw/main/demo.gif)

Para mais informações acesse o repositório do Darktile no GitHub:
### <https://github.com/liamg/darktile>
