---
layout: post
title: "Escaneando Redes com NMAP"
date: 2018-07-10 21:05:06
image: '/assets/img/hacker/nmap.jpg'
description: 'O Nmap (Network Mapper) é um scanner de segurança, usado para descobrir hosts e serviços em uma rede de computadores , construindo assim um "mapa" da rede.'
main-class: 'bash'
tags:
- redes
- servidores
- shellscript
---

# Conceitos

O [Nmap](https://nmap.org/) (Network Mapper) é um scanner de segurança, originalmente escrito por Gordon Lyon (também conhecido por seu pseudônimo Fyodor Vaskovich ), usado para descobrir hosts e serviços em uma rede de computadores , construindo assim um "mapa" da rede.

# Instalação
{% highlight bash %}
sudo apt install nmap # Debian, Ubuntu, Linux Mint e derivados
sudo yum install nmap # RedHat, CentOS e derivados
sudo dnf install nmap # Fedora
sudo pacman -S nmap   # Arch Linux
sudo emerge --ask nmap # Gentoo, Funtoo, Sabayon, ...
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

# 10 Comandos Interessantes do <kbd>nmap</kbd>:

- Uso básico
{% highlight bash %}
nmap 192.168.1.150
{% endhighlight %}

- Obtendo mais detalhes de um endereço
{% highlight bash %}
nmap -v 192.168.1.150
{% endhighlight %}

- Varedura de uma rede utilizando Wildcards
{% highlight bash %}
nmap 192.168.1.*
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

- Wildcards e excluindo alguns ips
{% highlight bash %}
nmap 192.168.1.* --exclude=192.168.1.200
{% endhighlight %}

- Utilizando um arquivo com uma lista de IPs
{% highlight bash %}
nmap -iL lista-ips.txt
{% endhighlight %}

- Descobrir o Sistema Operacional e o Traceroute de determinado IP
{% highlight bash %}
nmap -A 192.168.1.150
{% endhighlight %}

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

- Descobrir o Sistema Operacional de determinado IP com mais detalhes e mais organizado
{% highlight bash %}
nmap -O 192.168.1.150
{% endhighlight %}

- Verificar se um firewall está protegendo
{% highlight bash %}
nmap -PN 192.168.1.150
{% endhighlight %}

-Enganar o firewall
{% highlight bash %}
nmap -sN 192.168.1.150
{% endhighlight %}

<!-- RETANGULO LARGO -->
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

- __nmap__ versão gráfica __zenmap__
{% highlight bash %}
sudo [gerenciador] [install] zenmap
# depois abra o zenmap pesquisando no dashboard, a versão sem root/sudo ou com root/sudo
{% endhighlight %}

Esses recursos são extensíveis por scripts que fornecem detecção de serviço mais avançada, detecção de vulnerabilidade, e outros recursos. O Nmap começou como um utilitário apenas para Linux , mas a portabilidade para Windows, Solaris, HP-UX, variantes BSD (incluindo macOS ),AmigaOS e IRIX foi seguida. O Linux é a plataforma mais popular.

Você pode criar em Shell Script, por exemplo, para filtrar ainda mais as informações!

__Conheça nosso Curso Extremamente Avançado de Shell Script Bash__
# <http://terminalroot.com.br>

# [Assista ao Vídeo](https://www.youtube.com/watch?v=)
<iframe width="920" height="400" src="https://www.youtube.com/embed/LFjMu993uAA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Endereço Oficial: <https://nmap.org/>

Valeu!

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
