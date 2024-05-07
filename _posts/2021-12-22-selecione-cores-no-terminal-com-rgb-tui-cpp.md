---
layout: post
title: "Selecione Cores no Terminal com RGB-TUI C++"
date: 2021-12-22 12:59:01
image: '/assets/img/cpp/rgb-tui.png'
description: 'Um seletor de cores no terminal.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- ftxui
- cpp
- cppdaily
- graficos
---

![Selecione Cores no Terminal com RGB-TUI C++](/assets/img/cpp/rgb-tui.png)

Existem diversos serviços *online* e locais que você pode selecionar as cores seja **RGB** ou **Hexadecimal**, ou até mesmo usando o [GIMP](https://terminalroot.com.br/tags#gimp) ou qualquer outro software semelhante. No entanto, ter esse serviço no [terminal](https://terminalroot.com.br/tags#terminal) é realmente notório!

**rgb-tui** é um seletor de cores escrito em [C++](https://terminalroot.com.br/tags#cpp) que é fácil de instalar e utilizar.


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

# Instalação
O legal é que basta você instalar o binário e já está tudo certo.

Basta rodar os comandos abaixo:

{% highlight sh %}
wget https://github.com/ArthurSonzogni/rgb-tui/releases/download/v1.1/rgb-tui-1.0.0-Linux.tar.gz
tar zxvf rgb-tui-1.0.0-Linux.tar.gz
sudo install -v rgb-tui-1.0.0-Linux/bin/rgb-tui /usr/local/bin/
{% endhighlight %}

Para utilizá-lo, basta rodar o comando:

{% highlight sh %}
rgb-tui
{% endhighlight %}

Você pode selecionar a range de cores e copiar segurando o **Shift** e selecionando a cor Hexadecimal ou RGB para usar no seu projeto.

Veja o GIF abaixo:

![rgb-tui](https://github.com/ArthurSonzogni/rgb-tui/raw/master/demo.webp) 

> Para sair tecle **Ctrl + c** .

Você ainda pode instalar usando o Snap, exemplo:

{% highlight sh %}
sudo snap install rgb-tui
{% endhighlight %}

Para mais informações acesse o [repositorio](https://github.com/ArthurSonzogni/rgb-tui/) .


