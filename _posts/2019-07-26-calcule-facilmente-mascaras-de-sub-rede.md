---
layout: post
title: "Calcule Facilmente Máscaras de Sub-Rede"
date: 2019-07-26 11:33:43
image: '/assets/img/rede/ipcalc.png'
description: 'Uma calculadora de IP que calcula endereços de rede, classes de rede e outras informações.'
main-class: 'rede' 
tags:
- ipcalc
- redes
- network
---

![IP CALC](/assets/img/rede/ipcalc.png)

A matemática por trás dos endereços IP é complicada. Bons endereços IPv4 começam como números binários de 32 bits, que são convertidos em números de base 10 em quatro campos de 8 bits. Números decimais são mais fáceis de gerenciar do que strings binárias longas.

Ainda assim, o cálculo de intervalos de endereços, máscaras de rede e sub-redes é um pouco difícil e propenso a erros, exceto pelos brainiacs que conseguem fazer conversões binárias em suas cabeças. Para o resto de nós, atenda ipcalc e ipv6calc .

[ipcalc](http://jodies.de/ipcalc) é para redes IPv4 e ipv6calc é para redes IPv6. Você deve entender o CIDR (Classless Inter-Domain Routing), pois isso é fundamental para o endereçamento IP.

## Instalação

Tanto o *ipcalc* quanto o *ipv6calc* estão disponíveis na maioria dos repositórios das distribuições Linux e sistemas BSD. Veja o procedimento para cada uma:

{% highlight bash %}
emerge net-misc/ipcalc # Gentoo, Funtoo e derivados
sudo apt install ipcalc # Ubuntu, Debian e Mint
sudo pacman -S ipcalc # Arch Linux, Manjaro e outros
sudo yum install ipcalc # Red Hat e CentOS
sudo dnf install ipcalc # Fedora
{% endhighlight %}

Após instalar o modo básico de calcular é:

{% highlight bash %}
ipcalc 192.168.1.110
{% endhighlight %}

A saída será

{% highlight bash %}
Address:   192.168.1.110        11000000.10101000.00000001. 01101110
Netmask:   255.255.255.0 = 24   11111111.11111111.11111111. 00000000
Wildcard:  0.0.0.255            00000000.00000000.00000000. 11111111
=>
Network:   192.168.1.0/24       11000000.10101000.00000001. 00000000
HostMin:   192.168.1.1          11000000.10101000.00000001. 00000001
HostMax:   192.168.1.254        11000000.10101000.00000001. 11111110
Broadcast: 192.168.1.255        11000000.10101000.00000001. 11111111
Hosts/Net: 254                   Class C, Private Internet
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

Ou seja, exibirá os dados como:

- Address: exibe o endereço que você pesquisou e a identificação binária separadas pelos octetos;
- Wildcard: indica quais partes de um endereço IP estão disponíveis para exame;
- Netmask: Mostra a máscara;
- Broadcast: o último endereço IP válido para a rede que possui o IP que você pesquisou.

E entre outros dados e opções que podem ainda serem ampliadas, consulte o a ajuda do comando para mais informações:

{% highlight bash %}
ipcalc --help
{% endhighlight %}

Se quiser fazer consultas online, o **ipcalc** disponibiliza a versão web no endereço: <http://jodies.de/ipcalc>

## Assista um vídeo para entender como esse cálculo é feito

<iframe width="1246" height="701" src="https://www.youtube.com/embed/GCU_cndQN1Q" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
