---
layout: post
title: "Três plugins Vim que você também deveria conhecer"
date: 2021-05-14 13:03:09
image: '/assets/img/vim/three-vim-plugin.jpg'
description: 'Para aumentar ainda mais sua produtividade!'
icon: 'ion:terminal-sharp'
iconname: 'Vim'
tags:
- vim
---

![Três plugins Vim que você também deveria conhecer](/assets/img/vim/three-vim-plugin.jpg)

O [Vim](https://terminalroot.com.br/vim) é um riqueza de vários segmentos, poucos conseguem identificar e valorizar isso.

Nós já publicamos diversos conteúdos sobre vim, para saber todos recomendo ver a #tag sobre Vim:
### <https://terminalroot.com.br/tags#vim>

E também nossa [Playlist do Youtube sobre Vim](https://cutt.ly/PlayVim) . E como o assunto são plugins, esse vídeo é uma boa pedida também:

<iframe width="910" height="390" src="https://www.youtube.com/embed/PmKJT6SlN-Q" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Mas nesse artigo vamos incrementar essas listas e conhecer **3** que com certeza você se interessará!

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# 01. Exibir cores no Vim
Uma das coisas que as pessoas sentem falta no Vim que utilizam em [outros editores](https://terminalroot.com.br/tags#editores) é o fato de digitar o código hexadecimal de uma cor e já mostrar qual a cor.

E para isso existe o [Coloresque](https://github.com/ObserverOfTime/coloresque.vim) .

![Coloresque](/assets/img/vim/coloresque.png)

Além de exibir as cores normal, diversas outras são exibidas como: hexadecimal, RGB e entre outras. Há ainda a possibilidade de bloquear cores que você deseja que não seja exibida ou até mesmo filtrar o recursos para somente determinadas extensões de arquivo.

GitHub do Coloresque: <https://github.com/ObserverOfTime/coloresque.vim>

---

# Destacar o documento atual
Quando abrimos um novo documento na "janela" que estamos do [Vim](https://terminalroot.com.br/vim) às vezes fica difícil identificar em qual documentos estamos, até por conta da concentração que aplciamos ao que estamos escrevendo.

Mas essa dificuldade pode ser anulada quando os documentos que não estão sendo utilizados ficam com opacidade e é justamente isso que o [VimMade](https://github.com/TaDaa/vimade) faz, veja um exemplo:

![VimMade](/assets/img/vim/vimmade.gif)

E ainda existem outros recursos, como ver diff no estilo GitHub e entre outros, para uma análise completa acesse: <https://github.com/TaDaa/vimade>

---

# Mini mapa do documento
E pra finalizar as dicas de hoje, vamos fechar com "chave de ouro" 🔑 e falar sobre um plugin excelente que é o [MiniMap](https://github.com/severin-lemaignan/vim-minimap) .

Ele exibe no canto direito do documento, similar à outros editores de texto, qual parte do documento o cursor está e isso pode facilitar muito em relação à agilidade do desenvolvimento.

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


Veja um exemplo:

![MiniMap](/assets/img/vim/minimap.gif)

Após instalado você pode abrir e fechar o Minimap rodando os comando:
{% highlight viml %}
:Minimap " Abre
:MinimapClose " Fecha
{% endhighlight %}

Você ainda pode definir um alias pro [Vim](https://terminalroot.com.br/vim) no seu `~/.bashrc` para abrir sempre o Minimap por padrão, exemplo:
{% highlight bash %}
echo 'alias vim="vim -c Minimap"'
exec $SHELL
{% endhighlight %}

Acesse o GitHub do Minimap para mais detalhes: <https://github.com/severin-lemaignan/vim-minimap>

Se quiser saber como instalar e customizar seus plugin sugiro o nosso [Curso de Vim Moderno e Vimscript](https://terminalroot.com.br/vim) com diversas dicas excelentes e se quiser um conteúdo mais específico, sugiro o vídeo abaixo:

<iframe width="910" height="390" src="https://www.youtube.com/embed/W8bFxnpJjF3" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> 

# Valeu!


