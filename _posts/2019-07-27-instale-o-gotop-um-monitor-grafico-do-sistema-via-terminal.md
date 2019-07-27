---
layout: post
title: "Instale o gotop - Um Monitor Gráfico do Sistema via Terminal"
date: 2019-07-27 17:34:08
image: '/assets/img/dicas/gotop.jpg'
description: 'Escrito em Go e disponível para Linux e macOS.'
main-class: 'terminal'
tags:
- gotop
- redes
- servidores
---

![gotop](/assets/img/dicas/gotop.jpg)

[gotop](https://github.com/cjbassi/gotop/) é um monitor de sistema que roda pelo terminal para Linux e macOS. O software é inspirado no [gtop](https://github.com/aksakalli/gtop) e no [vtop](https://github.com/MrRio/vtop), mas enquanto esses dois utilitários usam o Node.js, o gotop é escrito em [Go](https://golang.org/).


## Instalação

Existem diversas formas, veja abaixo, as opções

+ [Debian](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=Debian), [Ubuntu](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=PALAVRA) e [Linux Mint](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=PALAVRA)
{% highlight bash %}
wget https://github.com/cjbassi/gotop/releases/download/3.0.0/gotop_3.0.0_linux_amd64.deb
sudo dpkg -i gotop_3.0.0_linux_amd64.deb
{% endhighlight %}

+ [RedHat](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=RedHat), [CentOS](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=CentOS) e Fedora

{% highlight bash %}
wget https://github.com/cjbassi/gotop/releases/download/3.0.0/gotop_3.0.0_linux_amd64.rpm
sudo rpm -ivh gotop_3.0.0_linux_amd64.rpm
{% endhighlight %}

+ [Arch Linux](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=Arch Linux) via AUR (gotop, gotop-bin, ou gotop-git)
+ [FreeBSD](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=FreeBSD)

{% highlight bash %}
pkg install gotop
{% endhighlight %}

Ou para qualquer distro, baixe com [wget](https://terminalroot.com.br/2019/05/aprenda-a-explorar-o-comando-wget.html)

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

{% highlight bash %}
wget https://github.com/cjbassi/gotop/releases/download/3.0.0/gotop_3.0.0_linux_amd64.tgz
{% endhighlight %}

ou com o próprio Go, se tiver instalado

{% highlight bash %}
go get github.com/cjbassi/gotop
{% endhighlight %}

Descompacte o TGZ

{% highlight bash %}
tar zxvf gotop_3.0.0_linux_amd64.tgz
{% endhighlight %}

Você já pode rodar com o comando: `./gotop` e se quiser que seja executado via comando, use seu dir pessoal sem precisar de ~~sudo~~ , foi assim que eu fiz!

{% highlight bash %}
mkdir -p ~/.local/bin
mv gotop ~/.local/bin/
# Se esse diretório não estiver sua PATH, inclua
echo 'PATH="${PATH}:$HOME/.local/bin/"' >> ~/.bashrc
source ~/.bashrc
gotop
{% endhighlight %}

Veja a ajuda para atalhos de teclas: `gotop --help`

Desfrute! :trollface:

![gotop](/assets/img/dicas/gotop.gif)

