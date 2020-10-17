---
layout: post
title: "21 Melhores Temas para seu Vim"
date: 2020-03-25 09:47:39
image: '/assets/img/vim/vim-themes.jpg'
description: 'E 10 Linhas Interessantes para seu .vimrc'
icon: 'logos:vim'
iconname: 'vim'
tags:
- vim
- temas
- desenvolvimento
---

![21 Melhores Temas para seu Vim](/assets/img/vim/vim-themes.jpg)

Salve, rapaziada! Separei 21 temas de alta qualidade para vocês.

# Instalação
{% highlight bash %}
git clone https://github.com/terroo/vim-themes
mkdir -p ~/.vim
mv vim-themes/themes ~/.vim
{% endhighlight %}

# Uso
Insira o caminho do tema no seu `.vimrc`: *source ~/.vim/themes/**NOME_DO_TEMA**.vim*
> Exemplo

{% highlight bash %}
echo "source ~/.vim/themes/terroo-colors.vim" >> ~/.vimrc
{% endhighlight %}

Para usar o `.vimrc` informado no vídeo [10 Linhas Interessantes para seu .vimrc]():
{% highlight bash %}
mv vim-themes/vimrc ~/.vimrc
{% endhighlight %}

## Cada tema tem sua própria licença, bem como seus detalhes de contato e repositório/autor/contato e outros.
Para consultar todos:
{% highlight bash %}
for i in vim-themes/themes/*; do head $i | \
sed -n '/github\|Author\|Maintainer/p'; done
{% endhighlight %}

# Assista ao vídeo
<iframe width="1244" height="500" src="https://www.youtube.com/embed/XXGk3n1uzPg" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

# Veja também:
- [10 DICAS para Você Usar o VIM como um NINJA](https://www.youtube.com/watch?v=nFWQJiLvjnk)
- [7 dicas para você usar o VIM como um PRO](http://bit.ly/VimDiolinux)
- [Por que o Vim é tão difícil e tão amado por programadores?](http://bit.ly/2yjqTX9)
- [Conheça o Kakoune, um Vim fácil de usar](http://bit.ly/2RUAUWe)
- [Conheça o Bat, um clone do cat com Asas](http://bit.ly/2Tv8uiR)
- <https://vimcolors.com>    


