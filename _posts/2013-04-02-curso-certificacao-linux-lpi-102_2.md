---
layout: post
title: "Curso Certificação Linux LPI-102: Configurando o DNS"
date: '2013-04-02T16:11:00.000-07:00'
image: '/assets/img/lpi/dns-bind.jpg'
description: "BIND (Berkeley Internet Name Domain ou, como chamado previamente, Berkeley Internet Name Daemon) é o servidor para o protocolo DNS mais utilizado na Internet."
main-class: 'linux'
tags:
- Linux
- LPI
---

![Configurando o DNS](/assets/img/lpi/dns-bind.jpg "Configurando o DNS")

## Introdução

[BIND](http://pt.wikipedia.org/wiki/BIND) ( __Berkeley Internet Name Domain__ ou, como chamado previamente, __Berkeley Internet Name Daemon__ ) é o servidor para o __protocolo DNS mais utilizado na Internet__. Foi criado por quatro estudantes de graduação, membros de um grupo de pesquisas em ciência da computação da Universidade de Berkeley.

> Para a versão 9, o BIND foi praticamente reescrito. Ele passou a suportar, dentre outras funcionalidades, a extensão __DNSSEC__ e os protocolos __TSIG__ e __IPv6__.

## 1-Instalação

Para Debian e Debians-Like (Ubuntu, Linux Mint...) dnsutils será instalado juntamente com o pacote, ou seja, não precisa especificá-lo na instalação.
{% highlight bash %}
apt-get install bind9
{% endhighlight %}

## 2- Configuração Inicial

> abra o arquivo named.conf.options informado e escreva o código abaixo, de acordo com seus IPs e antes do fechamento da chave "};"

> adicione, depois salve e feche o arquivo

{% highlight bash %}
vi /etc/bind/named.conf.options
{% endhighlight %}

{% highlight bash %}
listen-on { 127.0.0.1; 192.168.1.1/24; };
allow-query { 127.0.0.1; };
recursion yes;
allow-recursion { 127.0.0.1; 192.168.1.1/24; };
{% endhighlight %}


## 3- Configurar a Zona e a Zona Reversa

Depois edite o arquivo named.conf.local e escreva o código abaixo, de acordo com seus IPs e o nome do host que deseja, nesse exemplo vou utilizar "marcospinguim.com.br"
{% highlight bash %}
vi /etc/bind/named.conf.local
{% endhighlight %}

adicione

{% highlight bash %}
zone "marcospinguim.com.br" {
type master;
file "marcospinguim.com.br.zone";
allow-transfer { 192.168.1.7; };
};
zone "0.168.192.in-addr.arpa" {
type master;
file "marcospinguim.com.br.rev";
allow-transfer { 192.168.1.7; };
};
{% endhighlight %}

## 4-Verificar se há erros nas alterações efetuadas
{% highlight bash %}
named-checkconf
{% endhighlight %}

se não receber nenhuma mensagem é porque está tudo correto até aqui.

## 5-Criar o arquivo de zona
crie o arquivo seuendereco.subdominio.dominio.zone, e abra-o, ex.
{% highlight bash %}
vi /var/cache/bind/marcospinguim.com.br.zone
{% endhighlight %}
adicione de acordo com seus dados
{% highlight bash %}
;
; Zone file for dominio.com.br
;
$TTL 86400
@ IN SOA ns1.marcospinguim.com.br. hostmaster.marcospinguim.com.br. (
2012010100 ; serial
7200  ; refresh
1800  ; retry
1209600  ; expire
300 )  ; minimum
NS ns1
NS ns2
MX 5 mail
TXT "v=spf1 mx -all"
HINFO PC-Intel-2.4GHz "Linux 2.6"
A 192.168.1.100
ns1  A 192.168.1.100
ns2  A 192.168.1.100
mail  A 192.168.1.100
www  CNAME @
ftp  CNAME www
pop3  CNAME mail
smtp  CNAME mail
{% endhighlight %}

## 6-Verificar se há erros nas zonas
Execute o comando de acordo com seus dados
{% highlight bash %}
named-checkzone marcospinguim.com.br /var/cache/bind/marcospinguim.com.br.zone
{% endhighlight %}
se der certo retornará algo tipo isso
{% highlight bash %}
zone marcospinguim.com.br/IN: loaded serial 2012010100
OK
{% endhighlight %}

## 7 - Criar o arquivo de zona reversa
{% highlight bash %}
vi /var/cache/bind/marcospinguim.com.br.rev
{% endhighlight %}

adicione de acordo com seus dados

{% highlight bash %}
;
; Reverse zone file for dominio.com.br
;
$TTL 86400
@ IN SOA ns1.dominio.com.br. hostmaster.marcospinguim.com.br. (
2012010100 ; serial
7200  ; refresh
1800  ; retry
1209600  ; expire
300 )  ; minimum
NS ns1.marcospinguim.com.br.
NS ns2.marcospinguim.com.br.
100  PTR marcospinguim.com.br.
10  PTR ns1.marcospinguim.com.br.
11  PTR ns2.marcospinguim.com.br.
57  PTR mail.marcospinguim.com.br.
{% endhighlight %}

## 8-verificar se há erros nas zona reversa
{% highlight bash %}
named-checkzone 0.168.192.in-addr.arpa /var/cache/bind/marcospinguim.com.br.rev
{% endhighlight %}

se der certo retornará algo tipo isso

{% highlight bash %}
zone 0.168.192.in-addr.arpa/IN: loaded serial 2012010100
OK
{% endhighlight %}

## 9-reiniciar o Bind

> __/etc/init.d/bind9 restart__

se der certo retornará isso

{% highlight bash %}
* Stopping domain name service... bind9                                 [ OK ] 
* Starting domain name service... bind9                                 [ OK ]
{% endhighlight %}

## 10- consultar o servidor DNS para testar as zonas
{% highlight bash %}
$ dig @127.0.0.1 marcospinguim.com.br SOA
{% endhighlight %}

se der certo retornará algo tipo isso

{% highlight bash %}
; > DiG 9.7.0-P1 > @127.0.0.1 marcospinguim.com.br SOA
; (1 server found)
;; global options: +cmd
;; Got answer
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 64129
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 2, ADDITIONAL: 2
;; QUESTION SECTION
;marcospinguim.com.br.  IN SOA
;; ANSWER SECTION
marcospinguim.com.br. 86400 IN SOA ns1.marcospinguim.com.br. hostmaster.marcospinguim.com.br. 2012010100 7200 1800 1209600 300
;; AUTHORITY SECTION
marcospinguim.com.br. 86400 IN NS ns1.marcospinguim.com.br.
marcospinguim.com.br. 86400 IN NS ns2.marcospinguim.com.br.
;; ADDITIONAL SECTION
ns1.marcospinguim.com.br. 86400 IN A 192.168.1.100
ns2.marcospinguim.com.br. 86400 IN A 192.168.0.101
;; Query time: 3 msec
;; SERVER: 127.0.0.1#53(127.0.0.1)
;; WHEN: Thu Jan  5 19:29:53 2012
;; MSG SIZE  rcvd: 153
{% endhighlight %}


## Pronto, existem outras formas, mas acredito que essa é a mais simples!

### Fontes

http://www.hardware.com.br/tutoriais/instalando-servidor-dns/

http://www.hardware.com.br/tutoriais/configurando-rede-linux/pagina7.html

http://www.hardware.com.br/tutoriais/servidores-dns/pagina4.html

http://blog.cesar.augustus.nom.br/instalando-o-servidor-bind-no-linux.html

http://www.hardware.com.br/tutoriais/opendns/

http://www.hardware.com.br/livros/linux-redes/configurando-bind.html

http://goo.gl/GEYz9

http://pt.wikipedia.org/wiki/BIND

