---
layout: post
title: "Como Compilar o NEOVIM do Zero"
date: 2022-05-22 11:41:59
image: '/assets/img/neovim/building-neovim.jpg'
description: 'Quando algum plugin deseja a versão mais recente e o repositório do seu sistema operacional ainda não possui.'
icon: 'ion:terminal-sharp'
iconname: 'Neovim'
tags:
- neovim
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Quando algum plugin deseja a versão mais recente do [Neovim](https://terminalroot.com.br/tags#neovim) e o repositório do seu sistema operacional ainda não possui, a solução é você compilar do zero ou baixar um AppImage quando disponível.

Vamos ver que essa tarefa é bem simples e nesse exemplo vamos mostrar no [Ubuntu](https://terminalroot.com.br/tags#ubuntu) **22.04 LTS** e você pode adaptar para qualquer outro sistema, usando o *search* do seu gerenciador de pacotes.

---

# Dependências
Antes de tudo remova o Neovim do seu sistema:

{% highlight sh %}
sudo apt remove neovim --purge
sudo apt autoremove autoclean clean
{% endhighlight %}
Agora instale as dependências necessárias:

{% highlight sh %}
sudo apt update
sudo apt install git build-essential cmake git pkg-config libtool g++ libunibilium4 libunibilium-dev \
ninja-build gettext libtool libtool-bin autoconf automake unzip curl doxygen lua-term lua-term-dev luarocks
{% endhighlight %}

No caso do Ubuntu quando já há a versão mais recente instalada ele não reinstala a menos que você queira isso indicando o parâmetro para isso.

---

# Construir
Agora é só clonar do [repositório](https://github.com/neovim/neovim)
> **NOTE**: é necessário antes usar o comando `make CMAKE_BUILD_TYPE=RelWithDebInfo` para que não haja *lag* quando sai do Neovim, pois nesse caso, usaremos o [CMake](https://terminalroot.com.br/tags#cmake) .

{% highlight sh %}
git clone https://github.com/neovim/neovim
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
{% endhighlight %}
> Veja [aqui](https://gist.github.com/terroo/bc9b7a39f5e0a4fbec055e808002bbe2) o caminho onde tudo é instalado.


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

# Resolvendo possíveis problemas
Se tiver problema em ler o `lfs` do [Lua](https://terminalroot.com.br/lua) instale com [LuaRocks](https://luarocks.org/):

{% highlight sh %}
sudo luarocks install luafilesystem
{% endhighlight %}

Ás vezes a equipe de desenvolvimento do Neovim disponibiliza uma versão AppImage em *releases*, se não houver, com certeza, haverá binários já prontos [aqui](https://github.com/neovim/neovim/releases), caso você prefira.

---

# Links úteis
+ <https://github.com/neovim/neovim/wiki/Building-Neovim>
+ <https://github.com/neovim/neovim/issues/8312>


