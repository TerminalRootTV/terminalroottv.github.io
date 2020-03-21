---
layout: post
title: "Use o Reddit pelo Terminal"
date: 2020-03-21 19:59:42
image: '/assets/img/terminal/rtv.png'
description: 'RTV é uma TUI(Terminal User Interface) para o Reddit.'
tags:
- terminal
- comandos
- linux
---

![Use o Reddit pelo Terminal](/assets/img/terminal/rtv.png)

O [Reddit](https://www.reddit.com/) é um dos maiores candidatos à falir o [Facebook](https://www.facebook.com/TerminalRootTV) 😀️, é lá que estão as comunidades mais **root** do [Linux](terminalroot.com.br/linux), e a mais ativa, nosso querido [#unixporn](https://www.reddit.com/r/unixporn/). Nós também possuimos uma página [lá](https://www.reddit.com/user/terminalroot/).

O [RTV(Reddit Terminal Viewer)](https://github.com/michael-lazar/rtv) é uma interface de usuário do terminal (TUI, Terminal User Interface) para o Reddit que permite fazer login na sua conta do Reddit, abrir mídia usando ferramentas externas e muito mais. O aplicativo do console é criado usando Python e a biblioteca curses e é executado no Linux e Mac.

# Instalação
O RTV está disponível em diversos repositórios de distros Linux e também para o [FreeBSD](https://terminalroot.com.br/2017/09/por-que-freebsd.html) e [macOS](https://terminalroot.com.br/2018/03/como-instalar-o-mac-os-x-em-virtualbox-no-linux.html), logo, para instalá-lo é bem simples, basta usar o comando de acordo com o seu sistema:
{% highlight bash %}
pacman -S rtv # Arch
apt install rtv # Debian
nix-env -i rtv # Nix
pkg install rtv # FreeBSD
brew install rtv # macOS
{% endhighlight %}

Você também pode instalá-lo via [PIP](https://pypi.org/project/pip/):
{% highlight bash %}
pip install rtv
{% endhighlight %}

Ou se preferir, através do código fonte:
{% highlight bash %}
git clone https://github.com/michael-lazar/rtv.git
cd rtv
python setup.py install
{% endhighlight %}

> O RTV não é suportado no Windows!

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Ou ainda, sem instalar nada, somente via [SSH](https://terminalroot.com.br/2015/01/utilizando-o-ssh.html) ou [Telnet](https://pt.wikipedia.org/wiki/Telnet), se tiver um deles instalado, que é justamentamente assim que eu uso!
{% highlight bash %}
ssh redditbox.us
# Ou
telnet redditbox.us
{% endhighlight %}
![RTV SSH](/assets/img/terminal/rtv-ssh.jpg)

# Uso
Para abrir basta rodar o comando
{% highlight bash %}
rtv
{% endhighlight %}

<!-- LISTA MIN -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Escolha o tema via linha de comando: `--list-themes` e selecione com `--theme`
![RTV Themes](/assets/img/terminal/rtv-themes.jpg)

+ Use as teclas direcionais:**← ↑ → ↓** para mover o cursor;
+ Tecle **/** para pequisar alguma página ou usuário:
![RTV Search](/assets/img/terminal/rtv-search.jpg)
![RTV Terminal Root](/assets/img/terminal/rtv-terminalroot.jpg)
+ **u** para logar;
+ **o** para abrir uma postagem e **l** para comentar;
+ **c** para criar uma postagem;
+ **a/z** para votar;
+ Teclando: **?** , obtenha um ajuda de comandos e com **q** você sai.

Acessando o **#unixporn**:
![RTV unixporn](/assets/img/terminal/rtv-unixporn.jpg)

Veja alguns gifs de demonstração de uso:
![RTV Demo](/assets/img/terminal/demo.gif)
![RTV mailcap](mailcap.gif)

Para mais informação consulte o [endereço oficial do RTV](https://github.com/michael-lazar/rtv).

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

## Alternativas ao RTV
+ [Terminal UI for Reddit (TUIR)](https://gitlab.com/ajak/tuir) - fork do RTV
+ [Tildes Terminal Reddit Viewer (TTRV)](https://github.com/tildeclub/ttrv) - fork do RTV
+ [reddio - a command-line interface for Reddit](https://gitlab.com/aaronNG/reddio) escrito em [Shell Script](https://terminalroot.com.br/bash)

Porquê falar de alternativas logo na postagem sobre o projeto? O RTV, apesar de ainda funcionar, foi arquivado! 😥️ , [saiba mais aqui](https://github.com/michael-lazar/rtv/issues/696).

Abraços!   
