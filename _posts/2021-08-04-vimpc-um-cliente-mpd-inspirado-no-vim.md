---
layout: post
title: "VIMPC - Um Cliente MPD inspirado no Vim"
date: 2021-08-04 09:09:26
image: '/assets/img/vim/vimpc.png'
description: 'Um player para usuários do Vim.'
icon: 'ion:terminal-sharp'
iconname: 'MPD'
tags:
- mpd
- multimidia
- vim
---

![VIMPC - Um Cliente MPD inspirado no Vim](/assets/img/vim/vimpc.png)

Pra quem não conhece ainda o artigo e vídeo que fizemos sobre [mpd](https://www.musicpd.org/) e o [ncmpcpp](https://github.com/ncmpcpp/ncmpcpp) sugiro ver [esse link](https://terminalroot.com.br/2019/07/instale-e-configurar-o-ncmpcpp-e-mpd-no-seu-linux.html) antes.

O **VIMPC** é uma alternativa ao ncmpcpp com um visual e comandos estilo [Vim](https://terminalroot.com.br/vim) .

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


---

# Instalação
Você pode tentar pelo gerenciador de pacotes da sua distro, por exemplo, aqui no [Gentoo](http://www.terminalroot.com.br/tags#gentoo) bastei rodar o comando:
{% highlight bash %}
emerge vimpc
{% endhighlight %}

Mas se não houver no repositório da sua distro, você pode compilar da fonte:
> Vai precisar das dependências: [git](https://terminalroot.com.br/git), [g++](https://terminalroot.com.br/cpp), [GNU Make](https://terminalroot.com.br/2019/12/como-criar-um-makefile.html) e do [autotools](https://terminalroot.com.br/2019/12/tutorial-definitivo-do-gnu-autotools-para-iniciantes.html)

{% highlight bash %}
git clone https://github.com/boysetsfrog/vimpc down-vimpc
cd down-vimpc
./autogen.sh
./configure
make
make install
{% endhighlight %}

---

# Utilização
Antes, lógico, o daemon MPD precisa estar rodando, verifique se está rodando: `ps -U $USER | grep mpd` e se não estiver rode o `mpd`

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


Em seguida é só rodar o `vimpc`, algumas dicas de uso:
+ As tabs ficam listadas na parte superior: `lists`, `library`, `browse` e `playlist` para navegar por elas você pode usar o comando `gt` ou até mesmo clicando nelas.
+ Para selecionar uma música em `playlist` basta mover com as teclas direcionais e pressionar ENTER para tocar a música.
+ Para STOP na música basta pressionar SPACE(espaço do teclado)
+ Para fechar uma tab basta tecla a letra `q`.
+ Para uma lista completa de todos os comando rode: [ESC]`:help`

A utilização dele será mais fácil para quem já usa o ncmpcpp, se você não usa, sugiro assistir à esse vídeo:

<iframe width="910" height="390" src="https://www.youtube.com/embed/tholV10zDi0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>



