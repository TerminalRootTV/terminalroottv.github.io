---
layout: post
title: "Como Instalar Lua LSP no Neovim"
date: 2022-06-28 08:54:13
image: '/assets/img/neovim/lua-lsp.jpg'
description: 'Série de como configurar o LSP para sua linguagem de Programação no Neovim'
icon: 'ion:terminal-sharp'
iconname: 'Neovim'
tags:
- lua
- neovim
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Hoje vamos iniciar uma série de como instalar Language Server Protocol(LSP) para diversas linguagens de programação no Neovim .

Esse artigo pressupõe que você já sabe:
- O que é um LSP, caso não saiba veja [aqui](https://terminalroot.com.br/2021/11/lsp-autocomplete-e-machine-learning-neovim-com-lua.html) e [aqui](https://en.wikipedia.org/wiki/Language_Server_Protocol).
- Já sabe configurar seu Neovim, caso não saiba veja [aqui](https://terminalroot.com.br/vim) e/ou [aqui](https://terminalroot.com.br/2021/11/tudo-sobre-neovim-com-lua-como-customizar-do-zero.html) .
- Já possui conhecimentos básicos em Lua, caso não tenha veja [aqui](https://terminalroot.com.br/lua) .

Nesse primeiro artigo da série vamos configurar o LSP para Lua .

Lua utiliza o LSP que fica no repositório <https://github.com/sumneko/lua-language-server>, o mesmo usado no [VS Code](https://terminalroot.com.br/tags#vscode) .

E como "cobaia" vamos utilizar o [Ubuntu 22.04](https://terminalroot.com.br/tags#ubuntu) , se estiver em uma versão diferente ou sistema operacional diferente ou até mesmo em outra distribuição, basta usar o `search` do seu gerenciador de pacotes .

---

# Dependências
Antes de mais nada, certifique-se que possui os seguintes pacotes/softwares instalados no seu sistema:
+ [Ninja Build](https://terminalroot.com.br/tags#ninja)
+ [GCC](https://terminalroot.com.br/tags#gcc), [G++](https://terminalroot.com.br/tags#g++) e [Clang](https://terminalroot.com.br/tags#clang)

Exemplo:

{% highlight bash %}
sudo apt install gcc g++ clang ninja-build
{% endhighlight %}

---

# Instalação do LSP

### 1º - Prepare um diretório onde ficará armazenado o LSP
> Nesse caso vou armazenar em `${HOME}/.config/lsp`, mude o caminho caso lhe interesse mais

Crie o diretório e entre no mesmo

{% highlight bash %}
mkdir -p ~/.config/lsp
cd ~/.config/lsp
{% endhighlight %}

### 2º - Agora clone e compile o binário `lua-lanaguage-server` 
Com os seguintes comandos na ordem:

{% highlight bash %}
git clone --depth=1 https://hub.fastgit.xyz/sumneko/lua-language-server
cd lua-language-server
git submodule update --init --recursive
cd 3rd/luamake
compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild

{% endhighlight %}

### 3º - Adicionar o binário à sua `$PATH`
O [Neovim](https://terminalroot.com.br/tags#neovim) já tem diversos LSP embutidos, o que falta é ele encontrar na sua `$PATH` o caminho do binário .

Para isso rode os comandos abaixo:
> Se você usou um caminho diferente de `~/.config/lsp` , altere conforme seu caso.

{% highlight bash %}
echo 'export PATH="${HOME}/.config/lsp/lua-language-server/bin:${PATH}"' >> ~/.bashrc
source ~/.bashrc
exec $SHELL
{% endhighlight %}

---

# Configurando o Neovim
Adicione o suporte ao LSP para Lua conforme o estilo de configuração que você escolheu. Nesse caso, como exemplo, vamos usar o `init.lua` .

> `vim ~/.config/nvim/init.lua`

E adicione o código abaixo
{% highlight lua %}
require'lspconfig'.sumneko_lua.setup {}
{% endhighlight %}

Se estiver tudo certo, você terá: detalhes de funções, informações de erros e warnings, autocomplete de acordo com tabelas e entre outros. Exemplos:

![print LSP Lua](/assets/img/neovim/print-lua.png)
![Autocomplete table LSP Lua](/assets/img/neovim/table-autocomp.png)
![warnings and erros LSP Lua](/assets/img/neovim/warns-erros-lua-lsp.png) 

---

# Links úteis
+ <https://github.com/sumneko/lua-language-server/wiki/>
+ <https://github.com/sumneko/lua-language-server>
+ <https://jdhao.github.io/2021/08/12/nvim_sumneko_lua_conf/>



