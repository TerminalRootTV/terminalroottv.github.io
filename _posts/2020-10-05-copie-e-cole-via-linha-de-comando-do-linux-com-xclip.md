---
layout: post
title: "Copie e cole via linha de comando do Linux com xclip"
date: 2020-10-05 11:02:33
image: '/assets/img/comandos/xclip.jpg'
description: 'Prático e fácil de usar.'
icon: 'ion:terminal-sharp'
iconname: 'xorg'
tags:
- xorg
- comandos
---

![Copie e cole via linha de comando do Linux com xclip](/assets/img/comandos/xclip.jpg)

**xclip** é um utilitário de linha de comando projetado para ser executado em qualquer sistema com X11. Em linhas gerais: um utilitário para fazer *Ctrl + c* via linha de comando.

# Instalação
O `xclip` está disponível na maioria dos repositórios das distros [Linux](https://terminalroot.com.br/tags/linux), incluindo sistemas [BSD](https://terminalroot.com.br/tags/#bsd) . Ou seja, para instalá-lo, basta usar o gerenciador de pacotes da sua distribuição ou do seu sistema, exemplos:
{% highlight bash %}
emerge xclip # Gentoo, Funtoo, ...
sudo apt install xclip # Debian, Ubuntu, Mint, ...
sudo pacman -S xclip # Arch, Manjaro, ...
sudo dnf install xclip # Red Hat, CentOS, Fedora, ...
{% endhighlight %}

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Você também pode instalá-lo clonando o repositório oficial no GitHub:
{% highlight bash %}
git clone https://github.com/astrand/xclip
cd xclip
./configure
sudo make install
{% endhighlight %}

# Utilização
Existem alguns comandos para o `xclip`, mas o que eu mais utilizo é copiar documentos e *output* de comandos, exemplos:
+ Copiar um documento via linha de comando:
{% highlight bash %}
cat file.txt | xclip -sel copy
{% endhighlight %}
> Após rodar esse comando, todo o conteúdo de *file.txt* está na área de tranferência e basta usar o *Ctrl + v* para colar posteriormente.

+ Copiando `output` de um *loop*
{% highlight bash %}
for i in {1..10}; do echo $i | md5sum | awk '{print $1}'; done | xclip -sel copy
{% endhighlight %}

+ Utilizando o parametro `-i` não precisa esperar pelo *stdout*
{% highlight bash %}
xclip -i -sel copy file.txt
{% endhighlight %}

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Entre outras opções que podem ser consultadas rodando o parametro `-h`:
{% highlight bash %}
xclip -h
Usage: xclip [OPTION] [FILE]...
Access an X server selection for reading or writing.

  -i, -in          read text into X selection from standard input or files
                   (default)
  -o, -out         prints the selection to standard out (generally for
                   piping to a file or program)
  -l, -loops       number of selection requests to wait for before exiting
  -d, -display     X display to connect to (eg localhost:0)
  -h, -help        usage information
      -selection   selection to access ("primary", "secondary", "clipboard" or "buffer-cut")
      -noutf8      don't treat text as utf-8, use old unicode'
      -target      use the given target atom
      -rmlastnl    remove the last newline charater if present
      -version     version information
      -silent      errors only, run in background (default)
      -quiet       run in foreground, show what's happening
      -verbose     running commentary

Report bugs to <astrand@lysator.liu.se>
{% endhighlight %}

> Dica extra: Como o parametro `-sel copy` é o mais utilizado, você pode até criar um *alias* no seu `.bashrc`:
{% highlight bash %}
echo -e '\nalias copiar="xclip -sel clip"' >> ~/.bashrc
exec $SHELL
xclip -i file.txt
{% endhighlight %}

Para [Wayland](https://terminalroot.com.br/2020/05/personalize-o-seu-ubuntu-com-wayland-sway-ulauncher-waybar.html) existe o [wl-clipboard](https://github.com/bugaevc/wl-clipboard)

Para mais informações visitem o endereço do [repositório oficial](https://github.com/astrand/xclip).

# Até mais!

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



