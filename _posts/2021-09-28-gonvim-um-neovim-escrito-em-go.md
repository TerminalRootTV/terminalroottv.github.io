---
layout: post
title: "Gonvim - Um Neovim escrito em Go"
date: 2021-09-28 08:58:50
image: '/assets/img/neovim/gonvim.jpg'
description: 'Uma combinação de Go com Neovim e Qt .'
icon: 'ion:terminal-sharp'
iconname: 'Golang'
tags:
- neovim
- go
---

![Gonvim - Um Neovim escrito em Go](/assets/img/neovim/gonvim.jpg)

O [Vim](https://terminalroot.com.br/vim) e o [Neovim](https://terminalroot.com.br/tags#neovim) possuem diversas variantes, uma delas é uma das versões escrita em [Go](https://terminalroot.com.br/tags#go) e [Qt](https://terminalroot.com.br/cpp#qt) que é o **Gonvim** .

O Gonvim possui recursos/suporte:
+ Modern UI
+ Fuzzy Finder
+ Workspace
+ Markdown Preview

---

# Instalação
Para instalar você precisará ter:
+ [Neovim](https://terminalroot.com.br/tags#neovim)
+ [Go](https://terminalroot.com.br/tags#go)

Exemplo no [Ubuntu](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=ubuntu):


<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

{% highlight sh %}
sudo apt install golang-go neovim
{% endhighlight %}

Após instalada as dependências, faça o download do Gonvim e instale:
> Versão de acordo com a data de publicação desse artigo, para todas as versões acesse [esse link](https://github.com/dzhou121/gonvim/releases/).

{% highlight sh %}
wget https://github.com/dzhou121/gonvim/releases/download/v0.2.2/gonvim-linux.zip
unzip gonvim-linux.zip
cd gonvim
./gonvim.sh
{% endhighlight %}

---

# Utilização
A utilização é similar ao uso do Vim/Neovim , somente locais onde serão abertas as janelas que será diferente, ou seja, para mais dicas de utilização, rode:
{% highlight viml %}
:help
{% endhighlight %}

Visite o [repositório do Gonvim](https://github.com/dzhou121/gonvim).








