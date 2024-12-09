---
layout: post
title: "Instale um Cursor Animado no seu Neovim"
date: 2024-12-09 11:43:55
image: '/assets/img/neovim/smear-cursor-nvim.jpg'
description: "🚀 Com rolagem suave e com leveza."
icon: 'ion:terminal-sharp'
iconname: 'Neovim'
tags:
- neovim
- vim
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

O plugin `smear-cursor.nvim` é um recurso que torna seu [Neovim](https://terminalroot.com.br/tags#neovim) com um cursor animado, excelente para detectar mais facilmente a posição do cursos além de deixar o desenvolvimento mais divertido.

Ele funciona em qualquer [terminal](https://terminalroot.com.br/tags#terminal) com uma rolagem suave e consumindo pouquíssimos recursos do seu sistema.


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
Você pode instalar o `smear-cursor.nvim` com [Plug](https://terminalroot.com.br/2021/04/como-configurar-seu-vim-para-c-cpp.html), [LazyVim](https://terminalroot.com.br/2024/08/conheca-o-lazyvim-um-neovim-para-preguicosos.html), [Packer](https://terminalroot.com.br/2021/11/do-initvim-para-o-initlua-tudo-sobre-neovim-com-lua.html) e entre outros ou até mesmo do zero.

Nesse exemplo vamos usar o Packer:
> Supondo que você seguiu a série: [Do init.vim para o init.lua](https://terminalroot.com.br/2021/11/do-initvim-para-o-initlua-tudo-sobre-neovim-com-lua.html) ou fez o [Curso de Vim e Neovim](https://terminalroot.com.br/tags#vim).

Primeiramente adicione ao seu arquivo de configuração, ex.: `vim plugins.lua`

{% highlight lua %}
use 'sphamba/smear-cursor.nvim'
{% endhighlight %}

Em seguida instale: `:PackerInstall`

Após instalado, "chame" ele no seu arquivo de configuração, ex.: `vim utils.lua` e adicione a linha abaixo:

{% highlight lua %}
require('smear_cursor').setup({
    cursor_color = '#C578DC',
})
{% endhighlight %}
> Note que nesse exemplo usei uma cor púrpura, mas substitua pela aquela que achar melhor.

Após fechar e abrir novamente o Neovim, ao mover o cursor notará uma animação:

<video width="800" height="450" controls>
  <source src="/assets/img/neovim/smear-cursor.mp4" type="video/mp4">
Your browser does not support the video tag.
</video>

---

Para mais informações e dicas de customização visite o repositório oficial: <https://github.com/sphamba/smear-cursor.nvim> .



