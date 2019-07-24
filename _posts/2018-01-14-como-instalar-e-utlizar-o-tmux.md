---
layout: post
title: "Como Instalar E Utlizar O Tmux"
date: 2018-01-14 17:34:02
image: '/assets/img/terminal/como-instalar-utilizar-tmux.jpg'
description: 'O tmux é um software que serve para multiplexar vários terminais'
main-class: 'bash'
tags:
- terminal
---

# Conceito

O [tmux](https://github.com/tmux/tmux) é um software que serve para multiplexar vários terminais , permitindo que um usuário acesse várias sessões de terminal separadas dentro de uma única janela de terminal ou sessão de terminal remoto. É útil para lidar com vários programas. Existem alguns aplicativos similares como: GNU Screen, Byobu, Wemux, entre outros.

# Instalação

No Gentoo

{% highlight bash %}
emerge --ask app-misc/tmux
{% endhighlight %}

Outras distros

{% highlight bash %}
apt-get install tmux
yum install tmux
pacman -S tmux
{% endhighlight %}

# Assista o Vídeo


# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=Z7YcXTMMhEQ)



# Utilização

+ Iniciar o tmux:

{% highlight bash %}
tmux # irá ver uma barra na parte inferior do seu terminal
{% endhighlight %}

+ O Atalho [Prefix], mais conhecida como: [CTRL+b]

> __CTRL__ + __b__

+ Verificar as sessões (sessões não terminam ao fechar o tmux)
{% highlight bash %}
tmux ls # O 0 é o nome da sessão, 2 windows significa que tem 2 windows abertas na sessão, o timestamp da criação e o tamanho.
{% endhighlight %}

+ Ver o número da sessão
{% highlight bash %}
[CTRL+b] $
{% endhighlight %}

+ Acessar a sessão já criada
{% highlight bash %}
tmux attach -t nome_da_sessão # onde nome_da_sessão é o nome exibido antes de : no nosso caso seria tmux. [CTRL+b] s , 'j' e 'k'
{% endhighlight %}

+ Criar uma pane (divisão da janela) verticalmente
{% highlight bash %}
[CTRL+b] %
{% endhighlight %}

+ Criar uma pane (divisão da janela) horizontalmente
{% highlight bash %}
[CTRL+b] “
{% endhighlight %}

+ Navegar entre os panes
{% highlight bash %}
[CTRL+b] [setas ou números das panes]
{% endhighlight %}

# Dicas

+ __[CTRL+b] !__ - Converte um pane em window;

+ __[CTRL+b] x__ - Para matar o panel, também podemos usar o exit ou o x para matar uma window;

+ __[CTRL+b] z__ - Se quiser dar zoom em um pane, imagine o cenário onde tem 4 pane criada na tela e um deles está exibindo um log, em algum momento você precisa de mais espaço para ver esta informação, com o z você verá este pane como uma window, mas se repetir o comando voltará como estava, ou seja 4 panes criados;

+ __[CTRL+b] :__ - seta comandos para o tmux (no entanto os comandos perdem as configurações ao fechar o mesmo)
{% highlight bash %}
set prefix C-a #Onde C significa C significa ctrl e a a tecla para combinação do [CTRL+b]. Muitos tutorias explicam o [CTRL+b] com essa combinação.
{% endhighlight %}

> Você ainda pode customizar seu tmux setando comandos no arquivo __~/.tmux.conf__

{% highlight bash %}
vim ~/.tmux.conf # setar ou modificar comandos; mudar cor do texto ou background, entre outros.
{% endhighlight %}

+ Fechar todas as panes de uma só vez
{% highlight bash %}
tmux kill-session
{% endhighlight %}

# Mais informações

__[CTRL+b] ?__

{% highlight bash %}
man tmux
{% endhighlight %}

<https://github.com/tmux/tmux/wiki>

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

