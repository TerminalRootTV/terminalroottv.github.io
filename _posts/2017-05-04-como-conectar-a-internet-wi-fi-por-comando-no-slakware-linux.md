---
layout: post
title: "Como Conectar a Internet Wi-Fi por Comando no Slackware Linux"
date: 2017-05-04 15:13:51
image: '/assets/img/slackware/slackware-wireless-comando.jpg'
description: "A demonstração é feita para o Slackware Linux, no entanto, o procedimento serve pra qualquer distribuição Linux."
main-class: 'tv'
tags:
- slackware
- redes
---

> A demonstração é feita para o [Slackware Linux](http://slackware.com/), no entanto, o procedimento serve pra qualquer [distribuição Linux](http://terminalroot.com.br/tags#distros).

Assim que [instalamos o Slackware](https://www.youtube.com/watch?v=PBhziG7CbsU&t=25s) num notebook por exemplo, ele não reconhece automaticamente o tipo de conexão e não nos leva pra um autenticado WEP/WPA2 , é necessário conectar manualmente. Existe algumas maneiras, eis uma das formas detalhadas abaixo, bem como formalização para outras alternativas.

- Levantar a Placa Wireless
{% highlight bash %}
ifconfig wlan0 up
{% endhighlight %}

- Lista as redes wifi
{% highlight bash %}
iwlist wlan0 scan
{% endhighlight %}
	
- Retorna a configuração que deve ser incluída no arquivo __/etc/wpa_supplicant.conf__
{% highlight bash %}
wpa_passphrase [REDE] [SENHA]
{% endhighlight %}
	
- Edite (ou crie) o arquivo "__/etc/wpa_supplicant.conf__"
{% highlight bash %}
wpa_passphrase [REDE] [SENHA] > /etc/wpa_supplicant.conf
{% endhighlight %}
	
- Faz com que o __wpa_supplicant__ rode em modo __daemon__
{% highlight bash %}
wpa_supplicant -i wlan0 -c /etc/wpa_supplicant.conf -B -D wext
{% endhighlight %}
	
- Configurar a rede via __dhcp__
{% highlight bash %}
dhclient wlan0
{% endhighlight %}
	
- Configurar a rede manualmente
{% highlight bash %}
ifconfig wlan0 [IP] netmask [MÁSCARA] up
route add default gw 192.168.1.1 dev wlan0
{% endhighlight %}
	
- Editar o arquivo "__/etc/resolv.conf__" e escrever nele o ip do servidor de __DNS__, nesse caso, o [OpenDNS](https://pt.wikipedia.org/wiki/OpenDNS)
{% highlight bash %}
echo "nameserver 208.67.222.222" > /etc/resolv.conf
{% endhighlight %}
	
- No entanto __quando você reiniciar__ você deverá __repetir__ esse processo pra conectar, mas você pode criar um [Shell Script](http://www.terminalroot.com.br/shell/), mas o mais interessante mesmo é editar o __/etc/network/interfaces__ e deverá possuir o seguinte conteúdo
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
	 
Ou utilizar o [WICD](http://wicd.net/)

## Veja o Vídeo Explicativo

# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=q3oaZ4SIbkA)


> Esse vídeo faz parte da Série [#VamosUsarSlack](https://www.youtube.com/playlist?list=PLUJBQEDDLNcm7ofcijCwxjwcnODFhP6HD) !!!

# Faça nosso curso gratuito de Shell Bash e adquira todo conteúdo nesse link
<http://www.terminalroot.com.br/shell/>

## Deixe seu comentário!

### Valeu!
