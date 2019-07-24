---
layout: post
title: 'Configurando a placa de rede'
date: '2011-11-14T18:16:00.000-08:00'
description: 'Então, minha conexão possui autenticação no roteador e meu modem em modo bridge, porém um dia precisei configurar a autenticação no computador para poder disponibilizar via meu servidor de DynDNS'
main-class: 'linux'
tags:
- Linux
- Redes
---

> Então, minha conexão possui autenticação no __roteador__ e meu __modem__ em __modo bridge__, porém um dia precisei configurar a __autenticação__ no computador para poder disponibilizar via meu servidor de __DynDNS__ com a porta __80__ o acesso ao meu PC (da pasta __/var/www__), utilizando o __Servidor Apache__, para isso configuei meu __Roteador também em modo Brigde__ e depois utilizei o comando

{% highlight bash %}
pppoeconf
{% endhighlight %}

Após configurado, aê sim, ao digitar o endereço do meu __DynDNS__, batia na porta __80 do meu PC e não mais no Roteador (Utilizando o No-IP)__ .Depois que utilizei, decidí voltar a configuração pro Roteador (reconfigurei o Roteador para modo Router e conectou), porém após reiniciar o PC, __a máquina não conectava mais na Internet__, então fiz o seguinte para reconectar

- __1__ vi as configurações da conexão
- __2__ Desativei a placa de rede.
- __3__ reconfigurei do modo exato, reativando-a (já sabia quais as configurações de IP e Máscara, pois utilizo muito isso).
- __4__ Setei o DNS(na verdade entreguei a tarefa pro roteador, pois ele reconhece o DNS do Provedor que utilizo, automaticamente)
- __5__ Setei o gateway como padrão(endereço do roteador)
- __6__ revisei as configurações da placa de rede
- __7__ e depois tentei pingar no Gooogle com limite de ping 4, para testar a conexão.

E então, conseguí reestabelecer conexão com a Internet. Porém toda vez que eu reiniciava meu PC, as configurações eram perdidas, cheguei até a criar um __Script__ para não perder muito tempo

{% highlight bash %}
#!/bin/bash
echo Livre Xpert TI irá reconfigurar sua rede, pressione ENTER para iniciar a configuração, ou Ctrl+c para desistir
read resposta
ifconfig
ifconfig eth0 down
ifconfig eth0 10.1.1.2 netmask 255.0.0.0 up
echo nameserver 10.1.1.1
route add default gw 10.1.1.1 dev eth0
ifconfig
ping -c4 www.google.com
{% endhighlight %}

Mas isso tava me enchendo o saco, então procurei minhas configurações de __standart automático__, e encontrei no seguinte endereço
{% highlight bash %}
vim /etc/network/interfaces
{% endhighlight %}

E estava com a seguinte configuração
{% highlight bash %}
auto lo
iface lo inet loopback
auto dsl-provider
iface dsl-provider inet ppp
pre-up /sbin/ifconfig eth0 up # line maintained by pppoeconf
provider dsl-provider
auto eth0
iface eth0 inet manual
{% endhighlight %}

E então alterei para
{% highlight bash %}
auto lo
iface lo inet loopback
iface eth0 inet static
address 10.1.1.2
netmask 255.0.0.0
gateway 10.1.1.1
auto eth0
{% endhighlight %}

### Pronto, não tive mais problema, fácil, né?Abraço a todos e até a próxima!

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

