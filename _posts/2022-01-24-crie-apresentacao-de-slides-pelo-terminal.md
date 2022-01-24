---
layout: post
title: "Crie apresentação de slides pelo terminal"
date: 2022-01-24 14:35:09
image: '/assets/img/markdown/mdp.jpg'
description: 'Para apresentações diferenciadas .'
icon: 'ion:terminal-sharp'
iconname: 'Markdown'
tags:
- terminal
- comandos
- markdown
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

Às vezes ter uma apresentação diferenciada faz toda a diferença, *pleonasmente* falando! :) . O **mdp** é uma ferramenta de apresentação de [markdown](https://terminalroot.com.br/tags#markdown) via [linha de comando](https://terminalroot.com.br/tags#terminal).

---

# Instalação
Antes de mais nada certifique-se que possui as dependências, tais como:
+ [Git](https://terminalroot.com.br/tags#git)
+ [gcc](https://terminalroot.com.br/tags#gcc)
+ [GNU Make](https://terminalroot.com.br/tags#make)
+ [Ncurses](https://terminalroot.com.br/ncurses)


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

Existem algumas maneiras de instalar dependendo do seu sistema operacional ou [distribuição](https://terminalroot.com.br/tags#distros) [Linux](https://terminalroot.com.br/tags#linux).

No entanto, dentre todas elas eu recomendo você compilar, que por sinal é muito rápido.

Para isso faça:

{% highlight sh %}
git clone https://github.com/visit1985/mdp
cd mdp
{% endhighlight %}

Eu havia tentado compilar, mas deu erro e percebi que o problema está na compilação da biblioteca [Ncurses](https://terminalroot.com.br/ncurses), mas consegui reslver .

Não enviei um [PR](https://terminalroot.com.br/2017/12/como-criar-um-pull-request-no-github.html) porque iria demorar muito para o cara aceitar, então antes de compilar rode esse comando abaixo dentro do diretório *mdp/*

{% highlight sh %}
sed -i 's/\-l\$(CURSES)/-l$(CURSES) -ltinfow/g' Makefile
{% endhighlight %}
> Esse comando irá substituir a linha que compila somente o Ncurses do tipo *strings longas* e adicionar também para o [terminfo](https://terminalroot.com.br/shell), lembrando que aquele **w** do `-ltinfo` é de extrema importância, se você remover até compila, mas haverá [falha de segmentação](https://terminalroot.com.br/2020/06/gdb-a-melhor-ferramenta-para-encontrar-suas-falha-de-segmentacao.html) .

E agora é só compilar:
{% highlight sh %}
make
{% endhighlight %}

Para testar já há um `sample.md` no próprio diretório raiz do mdp, então rode:
{% highlight sh %}
./mdp sample.md
{% endhighlight %}

A saída provável será similar ao gif abaixo:

![MDP](https://cloud.githubusercontent.com/assets/2237222/5810237/797c494c-a043-11e4-9dbd-959cab4055fa.gif) 

Se quiser instalar no seu sistema rode:
{% highlight sh %}
sudo make install
{% endhighlight %}

Para mais informações acesse: <https://github.com/visit1985/mdp> .


