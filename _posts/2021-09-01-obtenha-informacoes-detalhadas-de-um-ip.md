---
layout: post
title: "Obtenha informações detalhadas de um IP"
date: 2021-09-01 10:37:54
image: '/assets/img/comandos/ipinfo.jpg'
description: 'País, estado, cidade, se tem proxy e entre outros.'
icon: 'ion:terminal-sharp'
iconname: 'Comandos'
tags:
- rede
- comandos
---

![Obtenha informações detalhadas de um IP](/assets/img/comandos/ipinfo.jpg)

**ipinfo** é a ferramenta CLI oficial para a API de endereço IP IPinfo.io, permitindo que você:
+ Procure detalhes de IP em massa ou um por um.
+ Procure os detalhes do ASN.
+ Resuma os detalhes de até 1000 IPs por vez.
+ Abra um mapa de localizações de IP para qualquer conjunto de IPs.
+ Filtre os endereços IPv4 e IPv6 de qualquer entrada.
+ Imprima listas de IP para qualquer CIDR ou intervalo de IP.
+ E mais!

---

# Instalação
Você precisará ter a linguagem de programação [Go](https://terminalroot.com.br/2021/07/crie-seu-site-no-github-com-hugo-escrito-em-go.html) instalada no seu sistema, além do [Git](https://terminalroot.com.br/git).

Após isso rode os comandos:
{% highlight bash %}
git clone https://github.com/ipinfo/cli ipinfo-cli
cd ipinfo-cli/
go build -o ~ ./ipinfo
cd
sudo install -v ipinfo .local/bin/
{% endhighlight %}
> Depois remova o diretório que foi clonado: *ipinfo-cli*.


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

# Utilização
Para obter um help dos parâmetros basta rodar o comando `ipinfo` aparecerá algo assim:
{% highlight bash %}
Usage: ipinfo <cmd> [<opts>] [<args>]

Commands:
  <ip>        look up details for an IP address, e.g. 8.8.8.8.
  <asn>       look up details for an ASN, e.g. AS123 or as123.
  myip        get details for your IP.
  bulk        get details for multiple IPs in bulk.
  summarize   get summarized data for a group of IPs.
...
{% endhighlight %}

Para saber dados do seu próprio IP, rode:
{% highlight bash %}
ipinfo myip
{% endhighlight %}

Descobrir o IP de uma determinada URL e obter informações detalhadas com ipinfo:
> Exemplo, obter dados da URL: <https://terminalroot.com.br/>

{% highlight bash %}
ipinfo $(ping -c1 terminalroot.com.br | sed -n '1p' | sed 's/.* (//;s/) .*//')
{% endhighlight %}

Saída no formato [JSON](https://terminalroot.com.br/2020/01/javascript.html)
{% highlight bash %}
ipinfo myip --json
{% endhighlight %}
> Os parâmetros devem ser indicado ao final  do comando.

Veja um GIF exemplo de uso:

![IPinfo](/assets/img/comandos/ipinfo.gif)


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

Para mais informações acesse os links abaixo:
+ <https://github.com/ipinfo/cli>
+ <https://ipinfo.io/>




