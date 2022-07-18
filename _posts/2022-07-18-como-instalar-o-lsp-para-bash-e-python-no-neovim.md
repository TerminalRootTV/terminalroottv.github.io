---
layout: post
title: "Como Instalar o LSP para Bash e Python no Neovim"
date: 2022-07-18 18:56:55
image: '/assets/img/neovim/bash-python/lsp-bash-python-nvim.jpg'
description: 'Essa é a terceira postagem da série.'
icon: 'ion:terminal-sharp'
iconname: 'Neovim'
tags:
- bash
- python
- neovim
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Nesse terceiro artigo dessa série de **COMO INSTALAR O LSP PARA SUA LINGUAGEM DE PROGRAMÇÃO** vamos ver o quão simples é para [Bash](https://terminalroot.com.br/tags#bash) e [Python](https://terminalroot.com.br/tags#python) .

Outros artigos dessa série:
+ [Como Instalar Lua LSP no Neovim](https://terminalroot.com.br/2022/06/como-instalar-lua-lsp-no-neovim.html)
+ [Como Configurar o LSP para TypeScript no Neovim](https://terminalroot.com.br/2022/07/como-configurar-o-lsp-para-typescript-no-neovim.html)


Para ser simples de verdade, é imprescindível que você tenha todos os plugins devidamente instalados como na [outra série](https://terminalroot.com.br/2021/11/tudo-sobre-neovim-com-lua-como-customizar-do-zero.html) que mostramos os procedimentos do zero, ou também em vídeo que atualizamos no [Curso de Vim Moderno, Neovim e Lua](https://terminalroot.com.br/vim) .

Em ambos os casos precisaremos do [NPM](https://terminalroot.com.br/2019/11/como-instalar-nodejs-no-linux-e-primeiros-passos.html) já instalado no seu sistema .

---

# Python
Use o npm para instalar o `pyright`

{% highlight bash %}
sudo npm i -g pyright
{% endhighlight %}

No arquivo da série há o arquivo `~/.config/nvim/lua/plugins/lsp.lua`, basta adicionar essa linha ao final do arquivo:

{% highlight lua %}
require'lspconfig'.pyright.setup{}
{% endhighlight %}

Agora teste:

{% highlight python %}
nvim main.py
{% endhighlight %}

Erros, auto-complete, ...

![Python Image 1](/assets/img/neovim/bash-python/py1.png "Python Image 1") 


<!-- SQUARE - GAMES ROOT -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

![Python Image 2](/assets/img/neovim/bash-python/py2.png "Python Image 2") 

---

# Bash
Use tambémm o NPM para instalar o `bash-language-server` 

{% highlight bash %}
sudo npm i -g bash-language-server
{% endhighlight %}

E basta adicionar essa linha ao seu `lsp.lua`

{% highlight bash %}
require'lspconfig'.bashls.setup{} -- sudo npm i -g bash-language-server
{% endhighlight %}

*Infos*, auto-complete, ...

![Bash Image 1](/assets/img/neovim/bash-python/sh1.png "Bash Image 1") 
![Bash Image 2](/assets/img/neovim/bash-python/py2.png "Bash Image 2") 

---

Mais em: 
+ <https://github.com/neovim/nvim-lspconfig>
+ <https://github.com/bash-lsp/bash-language-server>


