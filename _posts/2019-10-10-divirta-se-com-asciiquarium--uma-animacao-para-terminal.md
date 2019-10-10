---
layout: post
title: "Divirta-se com ASCIIQuarium , uma Animação para Terminal"
date: 2019-10-10 10:47:00
image: '/assets/img/terminal/asciiquarium.png'
description: 'E com algumas artimanhas, você pode deixá-lo como seu bloqueio de tela.'
tags:
- terminal
- comandos
- dicas
---

[![Divirta-se com ASCIIQuarium , uma Animação para Terminal](/assets/img/terminal/asciiquarium.png)](/assets/img/terminal/asciiquarium.png)

O Asciiquarium é uma animação de aquário/mar com arte ASCII. E foi escrito em [Perl](https://www.perl.org/). O site oficial do [Asciiquarium](https://github.com/cmatsuoka/asciiquarium) é <https://robobunny.com/projects/asciiquarium/html/>.

## Instalação

Primeiramente tenha a biblioteca *curses* na sua máquina:

{% highlight bash %}
emerge dev-perl/Curses # Gentoo, Funtoo, ...
sudo apt install libcurses-perl # Debian, Ubuntu, Mint ... 
{% endhighlight %}

Depois baixe e instale o framework [Term-Animation](https://metacpan.org/pod/Term::Animation)

{% highlight bash %}
cd /tmp
wget http://search.cpan.org/CPAN/authors/id/K/KB/KBAUCOM/Term-Animation-2.4.tar.gz
tar zxvf Term-Animation-2.4.tar.gz
cd Term-Animation-2.4/
perl Makefile.PL && make
sudo make install
{% endhighlight %}

E então baixe e instale o Asciiquarium

{% highlight bash %}
cd /tmp
wget http://www.robobunny.com/projects/asciiquarium/asciiquarium.tar.gz
tar zxvf asciiquarium.tar.gz
cd asciiquarium_1.*
chmod +x asciiquarium
sudo install -D -v asciiquarium -t /usr/local/bin/asciiquarium
{% endhighlight %}

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

## Utilizando

Após isso é só rodar `asciiquarium` que o aquário vai surgir no seu terminal. Se quiser mais opções, rode com os parâmetro:

+ `aquarium -c` - Modo "clássico", mostra apenas espécies do Asciiquarium 1.0

Opções

+ `q` - Sair
+ `r` - Redesenhar (recriará todas as entidades)
+ `p` - Pausa e despausa

Algumas pessoas que usam [xscreensaver](https://www.jwz.org/xscreensaver/) e acham *feinho* pode recorrer à outros bloquedores de tela. Nesse artigo apresenta uma outra alternativa: [Como criar um Bloqueio de Tela no i3 ou bspwm](https://terminalroot.com.br/2019/08/como-criar-um-bloqueio-tela-no-i3-ou-bspwm.html) .

Mas caso você não consiga implementar você pode tentar com:
+ <https://github.com/leonnnn/pyxtrlock>
+ <https://github.com/YanDoroshenko/asciiquarium-lock>
Ou
+ <https://github.com/jarun/xtrlock>

Não hesite em não comentar! Abraços
    
