---
layout: post
title: "Conectando em Redes Wireless no Linux por comando"
date: '2015-01-04T12:29:00.000-08:00'
image: '/assets/img/rede/wifi.jpg'
description: "Nesse post vou iniciar um processo de rede wireless para executarmos por comando."
tags:
- linux
- gnu
- redes
---

Nesse post vou iniciar um processo de rede wireless para executarmos por comando,  comando é bom, pois poderemos criar __Scripts em Shell__, caso precisarmos, no final desse post tem um modo mais simples, mais vou explicar primeiramente "__tudo na unha__".

{% highlight bash %}
Region:Brazil
Channel:Automatic(que no caso conectou no Canal 1)
Rate:54Mbps(802.11g)
Mode:Automatic(managed)
Router
SSID Broadcast
Security Type:WEP
Security Option:Automatic
WEP Key Format:Hexadecimal(pode ser a ASCII também)
Key Type:64bits
{% endhighlight %}

> Para 1 chave, mas esses dados são podem estar diferentes, o mais importante é que seja WEP, pois WAP e WAP2 é outro processo(que será de outro post) e utilizaremos o wpa_passphrase e wpa_supplicant.

Primeiramente temos de verificar se tem algum aplicativo gráfico rodando, se houver, precisamos parar, remover o modo de incialização e remover ele(pode ser o __Network Manager ou WICD__).

{% highlight bash %}
su
/etc/init.d/network-manager stop
update-rc.d -f network-manager remove
apt-get remove network-manager
{% endhighlight %}


Em distros similares a Debian precisamos também precisa do __root__, ao invés do __sudo__, isso é importante.
Certifique-se que sua interface tá configurada pra receber o __IP, máscara, gateway__..de forma automática
{% highlight bash %}
gedit /etc/network/interfaces
{% endhighlight %}


esse arquivo tem de haver as linhas descomentadas
{% highlight bash %}
auto wlan
iface wlan0 inet dhcp
{% endhighlight %}


Agora verificamos se há a placa wireless ativa, porém provavelmente seu __ESSID estará vazio(ESSID:off/any)__, pois não não o definimos, porém verificaremos quais __ESSID__ estão disponíveis (listar as redes wireless disponíveis)
{% highlight bash %}
iwconfig
iwlist wlan0 scan
{% endhighlight %}


Também verificaremos que estamos sem número I__P e sem máscara__
{% highlight bash %}
ifconfig
{% endhighlight %}


Então desativamos a placa wireless, e ativamos setando o IP e a máscara de acordo com nossa rede(__o ponto de acesso, Access Point__), em alguns casos, não precisa setar o IP manualmente, pois o Roteador entregará o IP automaticamente e a Interface está setada pra pegar automaticamente via __DHCP__, conforme nas configurações de __network/interfaces__, citada acima
{% highlight bash %}
ifconfig wlan0 down
ifconfig wlan0 192.168.1.220 netmask 255.255.255.0 up
route add default gw 192.168.1.1 dev wlan0
{% endhighlight %}


Se na listagem da rede esta com __(Encryption key:off)__ significa estar __SEM senha__, basta executar esse comando para conectar
{% highlight bash %}
iwconfig wlan0 essid NOME
{% endhighlight %}


Se na listagem da rede esta com __(Encryption key:on)__ significa estar __COM senha__, basta executar esse comando para conectar
{% highlight bash %}
iwconfig wlan0 essid NOME key SENHA
{% endhighlight %}


Isso foi o processo "__na unha__", ou seja, se você reiniciar o PC essas configurações serão perdidas, para vc automatizar esse processo, para não precisar todavia ter de reconfigurar, você pode pôr tudo no __/etc/network/interfaces__, assim
{% highlight bash %}
gedit /etc/network/interfaces
{% endhighlight %}


E deverá configurar o arquivo que se abriu, e nem precisará fazer toda a etapa acima
{% highlight bash %}
auto lo
iface lo inet loopback
auto wlan0
iface wlan0 inet static
address INFORME_O_IP
netmask INFORME_A_MASCARA
gateway INFORME_O_GATEWAY
wireless-rate INFORME_O_RATE_(exemplo: 54M)
wireless-essid INFORME_ESSID
wireless-mode INFORME_O_RATE_(exemplo: managed)
wireless-key INFORME_A_SENHA
{% endhighlight %}


Ok, até apróxima que é para __WAP__ e __WAP2__ e depois como quebrar essas chaves, caso existam.

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

