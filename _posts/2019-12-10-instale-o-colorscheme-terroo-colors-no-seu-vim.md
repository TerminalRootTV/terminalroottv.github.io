---
layout: post
title: "Instale o colorscheme Terroo Colors no seu Vim"
date: 2019-12-10 13:19:12
image: '/assets/img/'
description: 'Criei essa primeira versão desse tema.'
tags:
- vim
- temas
- themes
- colorscheme
---

![Instale o colorscheme Terroo Colors no seu Vim](/assets/img/vim/terroo-colors-min.jpg)

O [Terroo Colors] é um esquema de cores de modo escuro para o Vim e inspirado no [vim-monokai-bold](https://github.com/Mcmartelle/vim-monokai-bold) e [minimalist](https://github.com/dikiaap/minimalist).

## Instalação

Para instalar esse esquema de cores, você pode usar uma das seguintes maneiras:

1. Use o Vundle adicionando à sua seção de plugin `.vimrc` [Vundle](https://github.com/VundleVim/Vundle.vim#quick-start):

{% highlight viml %}
Plugin 'terroo / terroo-colors'
{% endhighlight %}

Em seguida, execute: `:PluginInstall`.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

OU

2. Use o [vim-plug](https://github.com/junegunn/vim-plug#installation) adicionando ao seu `~/.vimrc`:
{% highlight viml %}
Plug 'terroo / terroo-colors'
{% endhighlight %}

Em seguida, execute: `:PlugInstall`.

OU

3. Use [Pathogen](https://github.com/tpope/vim-pathogen#installation):

Execute o seguinte em um terminal:
{% highlight bash %}
cd ~/.vim/pacote
git clone https://github.com/terroo/terroo-colors
{% endhighlight %}

Uso

Após concluir a instalação, coloque este código no seu `.vimrc`:
{% highlight viml %}
set t_Co=256
syntax on
colorscheme terroo-colors
{% endhighlight %}

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Esse esquema de cores também é incorporado ao Vim Airline. Se você quer usar:
{% highlight viml %}
let g:airline_theme='terrooairline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1    
{% endhighlight %}

## Suporte

Como você sabe, o esquema de cores no vim, por padrão, suporta muitas linguagens de programação. Neste momento, a terroo-colors é bonita e focada em:
+ C ++
+ CSS / CSS3
+ HTML / HTML5
+ Javascript
+ Markdown
+ PHP
+ Python
+ Rubi
+ Sass
+ Concha
+ XML

Se você precisar de mais realce de sintaxe, poderá usar o [vim-polyglot](https://github.com/sheerun/vim-polyglot).

Valeu!
