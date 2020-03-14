---
layout: post
title: "Pos Install Arch Linux + i3 + Polybar + Pywal"
date: 2018-08-23 22:03:20
image: '/assets/img/distros/popy.jpg'
description: 'Pós instalação do Arch Linux com i3, Polybar, Pywal e aplicativos.'
tags:
- arch
- i3
- bash
- shellscript
---

Pós instalação do [Arch Linux](http://terminalroot.com.br/2018/07/como-instalar-facilmente-o-arch-linux.html) do [i3](http://terminalroot.com.br/2018/07/como-instalar-e-configurar-o-i3wm-e-o-i3blocks.html), __Polybar__, __Pywal__ e mais dos aplicativos listados abaixo de forma [Automatizada com Shell Script](http://terminalroot.com.br/shell)!

+ xorg;
+ fonts;
+ lightdm;
+ xterm;
+ firefox;
+ e bash-completion.

***

Após a instalação que fizemos automatizada ([Como Instalar Facilmente o Arch Linux](http://terminalroot.com.br/2018/07/como-instalar-facilmente-o-arch-linux.html)), não foi criada a senha de __root__, logo é necessário criarmos, para mais segurança, a menos que você já tenha criado e logo após isso atualizamos todo o sistema. 

Depois instalamos o [wget](https://www.gnu.org/software/wget/), pois ele só existia no [CD de boot do Arch](https://www.archlinux.org/download/) . Após baixarmos nosso __software__ para pós-instalação __automatizada__, damos permissão de execução ao _programa_, verificando quais opções estão disponíveis com o parâmetro <kbd>--help</kbd> e optimizamos o _espelho de rede_, para que as instalações fiquem mais __rápidas__ com o parâmetro <kbd>--mirror</kbd>. 

Criamos e configuramos um __usuário__ para ser o __sudo__. E então efetuamos a __pós-instalação com nosso aplicativo ninja 😎__ !!! Após finalizado, _reiniciamos_ o sistema.

{% highlight bash %}
passwd
pacman -Syu
pacman -S wget
wget terminalroot.com.br/pos-arch.in
chmod +x pos-arch.in
./pos-arch.in --help
./pos-arch.in --mirror
./pos-arch.in --sudouser [seu-usuario]
./pos-arch.in --install
reboot
{% endhighlight %}

Após iniciar sessão gráfica no __i3__ , instalamos o __Polybar__ e o __Pywal__ com outro __Shell Script Ninja__: o [Popy](https://gitlab.com/terminalroot/popy)

{% highlight bash %}
git clone https://gitlab.com/terminalroot/popy.git
cd popy && ./popy.in --all
{% endhighlight %}

Além de outras dicas complementares que podem ser consultadas assistindo o vídeo abaixo:

# [Clique Aqui Para Assistir o Vídeo](https://www.youtube.com/watch?v=DdJb2N8twbU)

Aprenda a criar aplicativos semelhantes ao __pos-arch.in__ e o __popy__ de forma PROFISSIONAL e EXTREMAMENTE AVANÇADA, adquirindo o [Curso Extremamente de Shell Script](http://terminalroot.com.br/shell) !!!

Acesse <http://terminalroot.com.br/shell> e saiba mais !!!

## Links Úteis

{% highlight html %}
http://terminalroot.com.br/shell
http://terminalroot.com.br/2018/07/como-instalar-facilmente-o-arch-linux.html
http://terminalroot.com.br/2018/07/como-instalar-e-configurar-o-i3wm-e-o-i3blocks.html
https://gitlab.com/terminalroot/popy
https://github.com/jaagr/polybar/
https://github.com/dylanaraps/pywal
https://wiki.archlinux.org/index.php/list_of_applications
{% endhighlight %}

## Comente e Compartilhe!

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

