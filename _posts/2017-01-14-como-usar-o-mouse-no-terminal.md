---
layout: post
title: "Como usar o mouse no terminal"
date: 2017-01-14 10:11:52
image: '/assets/img/dicas/mouse.jpg'
description: "A principal funcionalidade de ter um mouse em um TERMINAL TTY é poder marcar um texto e colar este texto com o scroll do mouse por comando."
main-class: 'gnu'
color: '#720c76'
tags:
- comandos
- terminal
categories:
twitter_text: "Como usar o mouse no terminal"
introduction: "A principal funcionalidade de ter um mouse em um TERMINAL TTY é poder marcar um texto e colar este texto com o scroll do mouse por comando."
---

![Mouse](/assets/img/dicas/mouse.jpg)

O pacote a ser instalado para habilitar o mouse é o gpm, acredito que esteja também em outras ou em todas as distribuições.

Mas vamos fazer o seguinte, vamos abrir um terminal TTY. Pressione as teclas CTRL+ALT+F1, este comando de teclas acessará o terminal tty1, podemos acessar até seis (06) terminais sendo o tty6 (CTRL+ALT+F6), 

Para voltar ao ambiente gráfico é só pressional CTRL+ALT+F7, se você saiu, volte até o tty1 ou qualquer das seis opções. Digite seu usuário e logo em seguida sua senha.

### Instalação
{% highlight c %}
apt-get install gpm
{% endhighlight %}

Após a instalação é preciso ATIVAR  O GPM, digite na linha de comando:
{% highlight c %}
/etc/init.d/gpm start
{% endhighlight %}

Movimente o mouse e se tudo estiver certo, será apresentado um cursor em forma retangular em sua tela. 

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

