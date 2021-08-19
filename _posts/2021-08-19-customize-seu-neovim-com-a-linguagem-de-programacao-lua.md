---
layout: post
title: "Customize seu NEOVIM com a Linguagem de Programação LUA"
date: 2021-08-19 08:52:02
image: '/assets/img/neovim/neovim.jpg'
description: 'Instalação automática de plugins via packer.nvim com a distribuição Neovim: NvChad.'
icon: 'ion:terminal-sharp'
iconname: 'Neovim'
tags:
- lua
- neovim
- vim
---

![Customize seu NEOVIM com a Linguagem de Programação LUA](/assets/img/neovim/neovim.jpg)

Nesse vídeo mostramos como criar seus próprios mapeamentos utilizando [Lua](https://terminalroot.com.br/2016/11/blog-linux-lua.html) e também como rodar [Vimscript](https://terminalroot.com.br/vim) via [API](https://terminalroot.com.br/2021/04/como-criar-uma-api-com-laravel-8.html) do [Vim](https://terminalroot.com.br/vim) . Compilamos do zero o [Neovim](https://terminalroot.com.br/2019/07/novo-curso-de-vim-moderno-e-vimscript.html) que já possui dependências embutidas como: [LuaJit](https://luajit.org/), [LuaRocks](https://luarocks.org/) , além de dicas de utilização dos plugins e entre outros.

## Assista ao Vídeo
<iframe width="910" height="390" src="https://www.youtube.com/embed/ylY1ngUhFMI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# Comandos Utilizados

## Dependências
{% highlight bash %}
sudo apt install build-essential cmake make gcc curl git
{% endhighlight %}

## Instalação

+ 1. Remova seu NEOVIM se você tiver instalado
{% highlight bash %}
sudo apt remove neovim --purge
{% endhighlight %}

+ 2. Clone o Neovim
{% highlight bash %}
git clone https://github.com/neovim/neovim/
{% endhighlight %}

+ 3. Entre no diretório e compile
{% highlight bash %}
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
{% endhighlight %}

+ 4. Instale no seu sistema
{% highlight bash %}
sudo make install
{% endhighlight %}


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

+ 5. Instale o NvChad
> Precisa ter as [fonts](https://github.com/terroo/fonts) e pré-instalados no seu sistema.
> 
> Altere a fonte do seu terminal para: **JetBrainsMonoMedium Nerd Font**.

A instalação deve ser feita através [desse link](https://github.com/NvChad/NvChad/wiki#clone-my-setup), mas caso haja algum problema, rode os comandos abaixo:
{% highlight bash %}
git clone https://github.com/NvChad/NvChad
cd NvChad
git checkout c62e949
bash install.sh --install
{% endhighlight %}

Saia do Neovim assim que terminar e abra um arquivo de teste, exemplo:
{% highlight bash %}
nvim main.cpp
{% endhighlight %}

---

## Configurações básicas

### 1. Criando mapeamentos
Exemplo, mapear a letra 'q' sair no modo de comando

Edite o arquivo: `nvim ~/.config/nvim/lua/mappings.lua`

{% highlight lua %}
-- Meus mapeamentos
map("n", "q", ":quit <CR>", opt)
{% endhighlight %}

### 2. Utilizando comandos do VimScript
Por exemplo, quando entramos em modo normal o cursor fica do tipo **Block** e se você gosta do **I-Beam**, ele modifica até o do terminal.

Para alterar para sempre ser I-Beam utilizando VimScript dentro de arquivos `.lua` edite o arquivo: `~/.config/nvim/lua/options.lua` e adicione essa linha:

{% highlight lua %}
vim.cmd [[ set guicursor= ]]
{% endhighlight %}

## Dicas de comandos
+ Abrir/Fechar o [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter) explorador de arquivos: `Ctrl + n`, o arquivo será aberto em TabBuffer;
+ Abrir o terminal → `:ToogleTerm` 
+ No modo normal `Ctrl + s` salva o arquivo
+ Lsitar todos os plugins instalados → `:PackerStatus`
+ Usar o comando `vim` para o `nvim` se você estiver acostumado com ele: `echo 'alias vim="nvim"' >> ~/.bashrc && source ~/.bashrc`.

# Links Úteis
+ <https://github.com/neovim/neovim>
+ <https://github.com/NvChad/NvChad>
+ <https://github.com/wbthomason/packer.nvim>
+ <https://github.com/nvim-treesitter/nvim-treesitter>



