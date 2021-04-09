---
layout: post
title: "Conheça o space-vim que não é o SpaceVim"
date: 2021-04-09 11:55:12
image: '/assets/img/vim/space-vim.jpg'
description: 'E mais uma dica extra de um Vim estilo VSCode'
icon: 'ion:terminal-sharp'
iconname: 'Vim'
tags:
- vim
---

![Conheça o space-vim que não é o SpaceVim](/assets/img/vim/space-vim.jpg)

Todos devem conhecer o [SpaceVim](https://www.youtube.com/watch?v=nfPubmjO5xw) que é uma distribuição [Vim](https://terminalroot.com.br/vim/) que lhe proporciona uma interface pré-configurada para o usuário. Inclusive fizemos um vídeo sobre ele e você pode assistir [aqui](https://www.youtube.com/watch?v=nfPubmjO5xw) . 

Mas existe também o [space-vim](https://github.com/liuchengxu/space-vim) que apesar ter uma nome parecido não se trata da mesma coisa.

Não sei qual a história verdadeira, ou seja, quem foi o primeiro a usar esse nome, mas eu percebi que antigamente eu usava esse [space-vim](https://github.com/liuchengxu/space-vim) e nem sabia, dia desse mexendo aqui nas minhas coisas antigas notei que eu já tinha usado esse space-vim há muito tempo atrás e resolvi testar.

Bom, parece que o projeto ficou parado por um tempo, talvez tenha sido esse o motivo de ter surgido o SpaceVim, então nem tudo se comportou como o esperado, mas ainda é legal!

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

## Instalação
Para instalar o [space-vim](https://github.com/liuchengxu/space-vim) é muito simples e eles te dão diversas alternativas, por exemplo:
+ Via [Bash](https://terminalroot.com.br/bash) basta rodar esse simples comando:
{% highlight bash %}
bash <(curl -fsSL https://raw.githubusercontent.com/liuchengxu/space-vim/master/install.sh)
{% endhighlight %}

+ Outra alternativa é usando [Makefile](https://terminalroot.com.br/2019/12/como-criar-um-makefile.html)
{% highlight bash %}
git clone https://github.com/liuchengxu/space-vim.git ~/.space-vim
cd ~/.space-vim
make vim     # install space-vim for Vim
make neovim  # install space-vim for NeoVim
{% endhighlight %}

Além de outras alternativas que podem ser consultadas diretamente no GitHub do projeto:
### <https://github.com/liuchengxu/space-vim>

> **Lembrando que você precisará das dependências de: Vim, Fonts, make,....**

## Outra alternativa ao space-vim
Existe também o [NVCode](https://github.com/ChristianChiarulli/nvcode) que é um [Vim](https://terminalroot.com.br/tags#vim) estilo [VSCode](https://terminalroot.com.br/2020/01/instale-essa-extensao-do-vs-code-para-comentar-blocos-em-ascii.html) , os passos não são tão simples quanto ao [space-vim](https://github.com/liuchengxu/space-vim), mas você pode tentar no endereço do projeto no GitHub:
> **Clique na imagem para ser direcionado ao projeto**

[![NVCode um Vim estilo VSCode](/assets/img/vim/nvcode.jpg)](https://github.com/ChristianChiarulli/nvcode)

Se quiser assistir um vídeo sobre o outro [SpaceVim](https://www.youtube.com/watch?v=nfPubmjO5xw):

<iframe width="910" height="390" src="https://www.youtube.com/embed/nfPubmjO5xw" frameborder="-1" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

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


# Conheça também o [Spacemacs](https://terminalroot.com.br/2018/07/spacemacs-um-editor-para-desenvolvimento-profissional.html)



