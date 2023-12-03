---
layout: post
title: "Conectando por comando com chave WPA/WPA2 a Wireless"
date: '2014-12-14T09:12:00.002-08:00'
image: '/assets/img/rede/wifi.jpg'
description: "Bem, no outro post Conectando em Redes Wireless no Linux por comando mostrei como conectar por comando em chave WEP que é bem simples, nesse post aqui vou explicar para chaves WAP ou WAP2."
tags:
- debian
- gnulinux
- redes
---

Bem, no outro post Conectando em __Redes Wireless__ no __Linux__ por comando mostrei como conectar por comando em chave __WEP__ que é bem simples, nesse post aqui vou explicar para chaves __WAP ou WAP2__, vamos utilizar a mesma lógica porém um pouco menos fácil.Primeiramente precisamos nos certificar que o roteador está configurado corretamente

{% highlight bash %}
Region:Brazil
Channel:Automatic(que no caso conectou no Canal 1)
Rate:54Mbps(802.11g)
Security Type:WPA-PSK/WPA2-PSK
Security Option:WPA2-PSK
Encryption:Automatic(que pegou o TKIP).
PSK Passphrase:SUA_SENHA
{% endhighlight %}



> E também que o pacote __wpa_supplicant__ está instalado
{% highlight bash %}
su
apt-get install wpasupplicant
{% endhighlight %}


, caso sua distribuição tenha o sudo instalado, dê preferência em utilizar o __root (# su)__.Então após listar as redes disponíveis com o __"iwlist wlan0 scan"__ verifique o nome do __ESSID__ da rede que deseja se conectar, certifique-se da senha e execute os comandos abaixo
{% highlight bash %}
wpa_passphrase NOME SENHA > /etc/wpa_supplicant/wpa_supplicant.conf
wpa_supplicant -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf -B -D wext
{% endhighlight %}


Configure sua placa wireless inicialmente com um __IP__ somente para setar a rede.
{% highlight bash %}
ifconfig wlan0 down
ifconfig wlan0 192.168.1.107 netmask 255.255.255.0 up
{% endhighlight %}


Como o __DNS__ em conexões pppOe está setado no local da autenticação, basta direcionar seu DNS local pra lá, no caso o __Gateway__(se sua autenticação estiver sendo em sua máquina, verifique com o seu __PROVEDOR quais os dados de DNS__), em alguns casos pode até pular esta parte
{% highlight bash %}
echo nameserver 192.168.1.1
{% endhighlight %}


Defina o __Gateway__, que no caso será o mesmo
{% highlight bash %}
route add default gw 192.168.1.1 dev wlan0
{% endhighlight %}


Para tornar inicializável, edite o arquivo "__/etc/network/interfaces__", com o código abaixo
{% highlight bash %}
auto lo
iface lo inet loopback
auto wlan0
iface wlan0 inet dhcp
wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf
{% endhighlight %}


Verifique que informamos acima que pegará o __IP via DHCP(automaticamente)__, caso não seja seu caso, verifique o post __Conectando em Redes Wireless no Linux por comando__ como configurar como __static(Estático)__, porém considerando que seu Roteador está como __DHCP__, finalize com o comando abaixo
{% highlight bash %}
dhclient wlan0
{% endhighlight %}


Verifique agora se restabeleceu a conexão, em alguns casos ainda é preciso reiniciar o serviço de rede, para isso, rode esse comando
{% highlight bash %}
/etc/init.d/networking restart
{% endhighlight %}


Caso você não deseje usar comando e sim um aplicativo gráfico que voçê pode sair clicando e ele fazer tudo, instale o __WICD__ ou o __Network Manager__
{% highlight bash %}
apt-get install wicd
apt-get install network-manager
{% endhighlight %}


Prontinho, com isso você deverá conectar!Abraços e até a próxima onde explicarei como quebrar as chaves __WEP e WPA/WPA2__, e depois como criar uma antena __USB__ para alta conectividade com ferramentas caseiras!

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



