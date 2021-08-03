---
layout: post
title: "duf - Uma alternativa mais completa do comando df"
date: 2021-08-03 08:05:57
image: '/assets/img/go/duf.jpg'
description: 'Um utilitário moderno e com saída TUI.'
icon: 'ion:terminal-sharp'
iconname: 'Go'
tags:
- do
- comandos
---

![duf - Uma alternativa mais completa do comando df](/assets/img/go/duf.jpg)

Se você está acotumado em usar o [df]() e/ou o comando [du](), mas gostaria de algo mais completo, o `duf` é uma solução perfeita que substitui ambos da melhor forma possível.

`duf` significa uso de disco/utilitário gratuito. Funciona em sistemas [Linux](https://terminalroot.com.br/tags#linux), [BSD](https://terminalroot.com.br/tags#bsd) e Windows. Ele possui os seguintes recursos:

+ Fácil de usar
+ Display colorido
+ Ajuste a altura e a largura de acordo com o movimento de redimensionamento do terminal
+ Classifica dados de acordo com nossa necessidade
+ Filtros e grupos
+ Saídas JSON e entre outros.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


# Instalação
Ele está disponível no repositório da maioria dos gerenciadores de pacotes de variadas [distros](https://terminalroot.com.br/tags#distros), exemplos:
+ [Arch Linux via AUR](https://terminalroot.com.br/2020/12/como-instalar-pacotes-do-aur-via-yay-no-arch-linux.html): `yay -S duf`
+ NixOS: `nix-env -iA nixpkgs.duf`
+ Ubuntu ou qualquer distro com snap: `sudo snap install duf-utility`
+ [FreeBSD](https://terminalroot.com.br/tags#freebsd): `pkg install duf`
+ [macOS](https://terminalroot.com.br/tags#macos): `brew install duf`
+ [Windows](https://terminalroot.com.br/tags#windows): `choco install duf` ou `scoop install duf`
+ Entre outros que podem ser encontrados [aqui](https://github.com/muesli/duf/releases).

### Ou compilando da fonte
Antes de qualquer coisa você vai precisar do [Go](https://terminalroot.com.br/tags#go) e [Git](https://terminalroot.com.br/git) instalados. E então rode os seguintes comandos:

{% highlight bash %}
git clone https://github.com/muesli/duf
cd duf
go build
sudo cp duf /usr/local/bin/
{% endhighlight %}

# Utilização
A utilização é tão intuitiva quanto o `df`, exemplos:

Mostrar uso do dispositivos conectados
{% highlight bash %}
duf
{% endhighlight %}

Mostrar um diretório específico
{% highlight bash %}
duf /home/$USER/Downloads
{% endhighlight %}

Utilizar um tema específico
{% highlight bash %}
duf -theme dark
{% endhighlight %}
> Ou `light`.

E para mais informações rode `duf --help`.

Visite o [repositório do duf](https://github.com/muesli/duf).











