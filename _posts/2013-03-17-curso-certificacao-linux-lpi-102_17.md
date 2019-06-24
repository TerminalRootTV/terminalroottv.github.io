---
layout: post
title: "Curso Certificação Linux LPI-102: Utilitários e Ferramentas do TCP/IP"
date: '2013-03-17T06:51:00.000-07:00'
image: '/assets/img/lpi/tools.jpg'
description: "Principais ferramentas do TCP/IP no Linux"
main-class: 'linux'
tags:
- Linux
- LPI
---
![Curso Certificação Linux LPI-102: Utilitários e Ferramentas do TCP/IP](/assets/img/lpi/tools.jpg "Curso Certificação Linux LPI-102: Utilitários e Ferramentas do TCP/IP")

## Principais ferramentas do TCP/IP no Linux
* __dig__
* __ping__
* __traceroute__
* __whois__
* __telnet__
* __ftp__
* __host__

## Dig

O comando __dig__ tem como função primária __retornar o dns da rede__, mas também pode ser usado para __pegar o ip de um host__ ou retornar o __nome do hos__t de um __ip dado__.

> dig [endereço]


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


{% highlight bash %}
dig www.terminalroot.com.br
{% endhighlight %}

## Ping

Ele usa o protocolo __ICMP__ obrigatório __ECHO_REQUEST__ datagrama de obter uma __ECHO_RESPONSE ICMP__ de um __host__ ou __gateway__. __ECHO_REQUEST__ datagramas (pings) tem um cabeçalho de __IP e ICMP__, seguido por um __struct timeval__ e, em seguida, um número arbitrário usados ​​para preencher o pacote.

> ping [opções] [endereço(HOST ou IP)]

Exemplo(a opção __-c__ testa o número __x__ de vezes):
{% highlight bash %}
ping www.terminalroot.com.br
ping -c4 www.terminalroot.com.br
{% endhighlight %}

## Traceroute

__Rastreia__ os rotear pacotes tomadas a partir de uma rede __IP__ em seu caminho para um determinado host. Ele utiliza o protocolo __IP__ tempo de vida (__TTL__) de campo e as tentativas de obter uma resposta __ICMP TIME_EXCEEDED__ de cada __gateway__ ao longo do caminho para o __host__.

> traceroute [opções] [endereço]

exemplo
{% highlight bash %}
traceroute www.terminalroot.com.br
{% endhighlight %}

## Whois

__Whois__ se refere a um serviço para __consultar a informação sobre um domínio de Internet__, quem é o __dono__ do domínio, __quando expira__ o domínio, quem é o __registrador__ do domínio, seus __DNS-s__. Através desta web ou de qualquer web que ofereça a busca de domínios, ou serviço __whois__ se pode ver via web.

> whois objeto[@servidor]

{% highlight bash %}
whois www.terminalroot.com.br
{% endhighlight %}

## Telnet
O comando __telnet__ é usado para __se comunicar__ com __outro host__ usando o __protocolo TELNET__. Se o __telnet__ é invocado sem o argumento host, ele entra em modo de comando, indicado por seu prompt (telnet>). Neste modo, ele aceita e executa os comandos listados abaixo. Se ele é chamado com argumentos, ele executa um comando de abertura com esses argumentos.

> telnet [endereço] [porta]


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


{% highlight bash %}
$ telnet www.terminalroot.com.br
{% endhighlight %}

## FTP

[Clique aqui para mais informações sobre FTP](http://terminalroot.com.br/2015/01/utilizando-ftp-por-comando.html)

## Host
 
É um utilitário simples para a realização de pesquisas de DNS. É normalmente usado para converter nomes em endereços IP e vice-versa. Quando não há argumentos ou opções são dadas, anfitrião imprime um breve resumo de seus argumentos de linha de comando e opções.
 

> host [opções] [endereço] [servidor]

Exemplo
{% highlight bash %}
host www.terminalroot.com.br
{% endhighlight %}

# Até a próxima!
