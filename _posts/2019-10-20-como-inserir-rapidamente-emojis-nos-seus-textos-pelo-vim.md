---
layout: post
title: "Como Inserir rapidamente Emojis nos seus textos pelo Vim"
date: 2019-10-20 13:45:31
image: '/assets/img/'
description: 'O Vim é uma verdadeira mão-na-roda ajuda diversas coisas do dia a dia para programadores e também para quem escreve textos para Web.'
tags:
- vim
- emoji
- editores
---

![Como Inserir rapidamente Emojis nos seus textos pelo Vim](/assets/img/vim/emoji-complete-vim.jpg "Como Inserir rapidamente Emojis nos seus textos pelo Vim")

O [Vim](https://terminalroot.com.br/vim) é uma verdadeira "*mão-na-roda*" ajuda diversas coisas do dia a dia para programadores e também para quem escreve textos para Web. Com simples comandos conseguimos auto-completar e inserir diversos trechos personalizados por nós mesmo.

Nessa dica vamos conhecer o [emoji-complete](https://www.vim.org/scripts/script.php?script_id=5058) um plugin pro Vim muito interessante. ☺️

## Instalação

Você pode inserí-lo manualmente o usar o [Vundle](https://github.com/VundleVim/Vundle.vim) . Basta adicionar essa linha ao mesmo:

{% highlight vim %}
Plugin 'kyuhi/vim-emoji-complete'
{% endhighlight %}

Após isso , rode o comando:

{% highlight vim %}
:PluginIinstall
{% endhighlight %}

E pronto!

<!-- RETANGULO LARGO -->
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Informat -->
<ins class="adsbygoogle"
style="display:block"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="2327980059"
data-ad-format="auto"
data-full-width-responsive="true"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script> 

## Configuração

Bom, no meio de tantos maps, remap, noremaps ,... O [emoji-complete](https://www.vim.org/scripts/script.php?script_id=5058) não escolhe a tecla de auto-completar para você, ou seja, você precisa analisar qual para o seu caso está disponivel.

No meu caso eu escolhi o **Ctrl + v** e adicinei essas linhas ao meu arquivo de configuração:

{% highlight vim %}
" emoji-complete                                                                                                                                           
let g:emoji_complete_overwrite_standard_keymaps = 0                                                                   
imap <c-v> <Plug>(emoji-start-complete)
{% endhighlight %}

Após isso, é só fechar e abrir qualquer documento e no modo de inserção tecle **Ctrl + v** onde você quiser inserir. Nesse momento estou escrevendo essa postagem com o [Vim](https://terminalroot.com.br/vim) e vou inserir um emoji 💯 .

Show, né ?! Quer saber como criar plugins pro [Vim](https://terminalroot.com.br/vim) , utilizar como um ninja , personalizar ele totalmente à sua maneira, além de dicas, games, plugins e uma *porrada* de dicas ? Adquira o nosso curso de [Vim Moderno e Vimscript](https://terminalroot.com.br/vim) clicando nesse link: <https://terminalroot.com.br/vim> . Ou ,se preferir, adquira pela [Udemy](https://www.udemy.com/course/curso-de-vim-moderno-e-vimscript/) , clicando nesse link: <https://www.udemy.com/course/curso-de-vim-moderno-e-vimscript/> .
> A Udemy possui algumas políticas para upload de arquivos, no entanto, nem todos os arquivos do curso adquirido por aqui estão disponíveis lá na versão da Udemy.

Por hoje é só, um forte abraço e até mais!

