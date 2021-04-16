---
layout: post
title: "10 exemplos do comando ip"
date: 2021-04-16 11:27:30
image: '/assets/img/rede/ip.png'
description:
icon: 'ion:terminal-sharp'
iconname: 'Redes'
tags:
- redes
- comandos
---

![10 exemplos do comando ip](/assets/img/rede/ip.png)

O comando [ip](https://linux.die.net/man/8/ip) é uma ferramenta de rede do Linux para administradores de sistema e rede. Como o próprio nome sugere(configura o **I**nternet **P**rotocol, Protocolos de Internet), a ferramenta é usada para configurar interfaces de rede.

Distribuições mais antigas do Linux usavam o comando `ifconfig` do pacote [net-tools](https://github.com/giftnuss/net-tools), que opera de forma semelhante. No entanto, **ifconfig** tem uma gama limitada de recursos em comparação com o comando `ip`, sem dizer que está bem desatualizada, a última atualização foi há 11 anos atrás.

Sua sintaxe básica bem como seus parâmetros obedecem o seguinte padrão
{% highlight bash %}
Usage: ip [ OPTIONS ] OBJECT { COMMAND | help }
       ip [ -force ] -batch filename
where  OBJECT := { link | address | addrlabel | route | rule | neigh | ntable |
                   tunnel | tuntap | maddress | mroute | mrule | monitor | xfrm |
                   netns | l2tp | fou | macsec | tcp_metrics | token | netconf | ila |
                   vrf | sr | nexthop | mptcp }
       OPTIONS := { -V[ersion] | -s[tatistics] | -d[etails] | -r[esolve] |
                    -h[uman-readable] | -iec | -j[son] | -p[retty] |
                    -f[amily] { inet | inet6 | mpls | bridge | link } |
                    -4 | -6 | -I | -D | -M | -B | -0 |
                    -l[oops] { maximum-addr-flush-attempts } | -br[ief] |
                    -o[neline] | -t[imestamp] | -ts[hort] | -b[atch] [filename] |
                    -rc[vbuf] [size] | -n[etns] name | -N[umeric] | -a[ll] |
                    -c[olor]}
{% endhighlight %}

Nessa dica vamos ver 10 exemplos básicos de utilização que ajudará no dia-a-dia a obter informações ou resolver problemas mais corriqueiros.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

## 01. Lista os endereços atribuídos a todas as interfaces de rede. 
{% highlight bash %}
ip addr
{% endhighlight %}
> Exemplo de saída:
{% highlight bash %}
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 brd 127.255.255.255 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: eth0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast state DOWN group default qlen 1000
    link/ether 91:89:81:74:14:51 brd ff:ff:ff:ff:ff:ff
3: sit0@NONE: <NOARP> mtu 1480 qdisc noop state DOWN group default qlen 1000
    link/sit 0.0.0.0 brd 0.0.0.0
4: wlp2s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 93:93:09:52:e7:11 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.9/24 brd 192.168.1.255 scope global dynamic noprefixroute wlp2s0
       valid_lft 252684sec preferred_lft 252684sec
    inet6 fe81::f298:4464:c5e1:2b37/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
{% endhighlight %}

---

## 02. Obter informação de uma determinada interface
{% highlight bash %}
ip addr show wlp2s0
{% endhighlight %}
> Exemplo de saída:
{% highlight bash %}
4: wlp2s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 93:93:09:52:e7:11 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.9/24 brd 192.168.1.255 scope global dynamic noprefixroute wlp2s0
       valid_lft 252290sec preferred_lft 252290sec
    inet6 fe81::f298:4464:c5e1:2b37/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
{% endhighlight %}

---

## 03. `ip link`
Usado para exibir informações da camada de link, ele buscará características dos dispositivos da camada de link atualmente disponíveis. Qualquer dispositivo de rede que tenha um driver carregado pode ser classificado como um dispositivo disponível.

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

---

## 04. Adicionar um ip à uma interface
{% highlight bash %}
sudo ip addr add 192.168.1.199 dev enp1s0
{% endhighlight %}

---

## 05. Remover um ip de uma interface
{% highlight bash %}
sudo ip addr del 192.168.1.199/24 dev enp1s0
{% endhighlight %}

---

## 06. Habilitar um interface
{% highlight bash %}
sudo ip link set enp1s0 up
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

---

## 07. Desabilitar uma interface
{% highlight bash %}
sudo ip link set enp1s0 down
{% endhighlight %}

---

## 08. Exibir a rota que sua máquina utiliza
> Ou seja, o caminho até o gateway

{% highlight bash %}
ip route show
{% endhighlight %}
> Exemplo de saída:
{% highlight bash %}
default via 192.168.1.1 dev wlp2s0 proto dhcp metric 600 
192.168.1.0/24 dev wlp2s0 proto kernel scope link src 192.168.1.199 metric 600
{% endhighlight %}

---

## 09. Adicionar um gateway
{% highlight bash %}
sudo ip route add default via 192.168.1.1
{% endhighlight %}

---

## 10. Obter mais informações
Para mais informações sobre o uso do comando `ip`, basta usar o `help`, `info` ou o manual
{% highlight bash %}
ip
ip help
info ip
man 8 ip
{% endhighlight %}


