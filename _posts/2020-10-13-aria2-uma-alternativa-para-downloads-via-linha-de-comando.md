---
layout: post
title: "aria2 - Uma Alternativa para Downloads via Linha de Comando"
date: 2020-10-13 12:43:26
image: '/assets/img/comandos/aria2.png'
description: 'Baixe arquivos e torrents via linha de comando.'
icon: 'ion:terminal-sharp'
iconname: 'aria2'
tags:
- comandos
- wget
- curl
---

![aria2 - Uma Alternativa para Downloads via Linha de Comando](/assets/img/comandos/aria2.png)

[aria2](https://aria2.github.io/) é um utilitário de download de linha de comando multiprotocolo e multi-fonte leve. Suporta HTTP/HTTPS , FTP , BitTorrent e Metalink . aria2 pode ser manipulado por meio de interfaces embutidas JSON-RPC e XML-RPC

# Instalação

{% highlight bash %}
emerge aria2 # Gentoo, Funtoo, ...
sudo apt install aria2 # Debian, Ubuntu, Mint, ...
sudo pacman -S aria2 # Arch, Manjaro, ...
sudo dnf install aria2 # Red Hat, CentOS, Fedora, ...
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

# Configuração
Você pode criar um arquivo de configuração no diretório: `~/.config/aria2/aria2.conf` definindo locais padrão para download, input, largura de banda máxima e entre outros, exemplo:
{% highlight bash %}
continue
dir=${HOME}/Desktop
file-allocation=none
input-file=${HOME}/.aria2/input.conf
log-level=warn
max-connection-per-server=4
min-split-size=5M
on-download-complete=exit
{% endhighlight %}

Isso equivale ao comando:
{% highlight bash %}
aria2c --dir=${HOME}/Desktop --file-allocation=none \
       --input-file=${HOME}/.aria2/input.conf \
       --on-download-complete=exit \
       --log-level=warn FILE
{% endhighlight %}

# Exemplos de uso
+ Download de um arquivo:
{% highlight bash %}
aria2c https://bouncer.gentoo.org/fetch/root/all/releases/amd64/autobuilds/20201011T214503Z/install-amd64-minimal-20201011T214503Z.iso
{% endhighlight %}

+ Download de 2 arquivos:
{% highlight bash %}
aria2c https://bouncer.gentoo.org/fetch/root/all/releases/amd64/autobuilds/20201011T214503Z/stage3-amd64-20201011T214503Z.tar.xz https://bouncer.gentoo.org/fetch/root/all/releases/amd64/autobuilds/20201011T214503Z/install-amd64-minimal-20201011T214503Z.iso
{% endhighlight %}

+ Download de BitTorrent:
{% highlight bash %}
aria2c https://torrents.artixlinux.org/artix-base-openrc-20200214-x86_64.iso.torrent
{% endhighlight %}

+ Download de múltiplas URLs a partir de um arquivo:
{% highlight bash %}
aria2c -i links.url
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

+ Limitando a largura de banda:
{% highlight bash %}
aria2c –max-download-limit=90K https://eu-mirror.artixlinux.org/iso/artix-base-openrc-20200214-x86_64.iso
{% endhighlight %}

Para mais informações utilize o manual:
{% highlight bash %}
man aria2c
{% endhighlight %}

# Página Oficial do Projeto
## <https://aria2.github.io/>

Alternativamente você também pode instalar o [Aria2 Web UI](https://github.com/ziahamza/webui-aria2.git)

---

# Alternativas ao aria2
## [curl](https://terminalroot.com.br/2019/10/12-dicas-para-voce-usar-o-comando-curl-como-um-ninja.html)

<iframe width="1234" height="694" src="https://www.youtube.com/embed/HxezVt5IEHQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## [wget](https://terminalroot.com.br/2019/05/aprenda-a-explorar-o-comando-wget.html)

<iframe width="1234" height="694" src="https://www.youtube.com/embed/-1v1Qy_lXks" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

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

# Links Úteis
+ <https://wiki.archlinux.org/index.php/aria2>
+ <https://www.tecmint.com/aria2-multi-protocol-commandline-download-tool-for-linux/>




