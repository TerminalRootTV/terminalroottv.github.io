---
layout: post
title: 'Como configurar o inetd.conf para habilitar uma porta'
date: '2011-12-20T19:52:00.000-08:00'
description: 'Quando você abre uma porta no Iptables, não significa que existirá um Daemon(um programa rodando em background gerenciado pelo sistema) para aquela porta.'
tags:
- debian
- gnulinux
- servidores
- redes
---

Quando você abre uma porta no __Iptables__, não significa que existirá um __Daemon__(um programa rodando em background gerenciado pelo sistema) para aquela __porta__. Para habilitar um __Daemon__ para tal porta é necessário configurarmos o __inetd__.O __inetd é um Daemon__ (geralmente os __Daemons terminam com a letra "d"__, exemplo: o daemon do __TCP__ é o __tcdp__, ou seja, um programa que gerencia o TCP), e o arquivo de configuração dele é o "__inetd.conf__".Precisei habilitar a inicialização do serviço de leitura de Sockets(usado em ligações de redes de computadores para um fim de um elo __bidirecional__ de comunicação entre dois programas), e para isso precisava de uma porta "livre", a __porta 8080__ já tem um serviço pré-definido, de __webcaching__.

Se você visualisar o arquivo de serviços
{% highlight bash %}
nano /etc/services
{% endhighlight %}

Verás que na linha correspondente a porta __8080__ terá seguinte informação
{% highlight bash %}
nome      porta/protocolo        apelido     #comentário 
http-alt 8080/tcp webcache # WWW caching service
http-alt 8080/udp   # WWW caching service
{% endhighlight %}

Mas se verificar no __nmap 127.0.0.1__, mesmo que inicie algo nessa porta, não conseguira escutar nela, pois é necessário configurar o __inetd.conf__. Para editá-lo, abra-o com seu editor de preferência, para editar precisa ser __root__
{% highlight bash %}
su
nano /etc/inetd.conf
{% endhighlight %}

Assim que o mesmo estiver aberto, crie uma nova linha, sem comentário(sem o __#__) e inclua a porta __8080__ (você também pode usar outra porta, mesmo se não houver nome para ela, só criar o nome no /etc/services) da seguinte maneira(serviço, tipo de soquete, protocolo, opções, usuário, caminho do serviço e o serviço opc.)
{% highlight bash %}
Meu_Servico    stream    tcp    nowait      root   /usr/bin/php5   /usr/bin/php5 -i
{% endhighlight %}

Isso quer dizer que: dei o nome de "__Meu_Servico__"; informei que o tipo de __socket__ será "__stream__"; o protocolo será "__tcp__"; a opção será "__nowait__"(para outros serviços que não seja __tcp__, usa-se "__wait__"); o nome do usuaŕio "marcos"(se quiser o root, deve digitá-lo nesse campo); o caminho do programa, nesse caso eu pus "__/usr/bin/php__" como exemplo, mas se você quiser deixar para qualquer programa, basta deixá-lo em branco; e o último campo é opcional, serve pra passar argumentos pro programa servidor que será rodado(ex.: __/bin/bash -i__, rodará em modo __interativo__.).

> __Obs.:__ Se você não for mais usar a porta, precisa comentar a linha utilizando o "__#__" na frente.
Após habilitar e salvar, agora basta reiniciar o inetd, no Debian (Não sei se também nas Debian-Likes(Ubuntu, Backtrack, Linux Mint) é o mesmo modo(caminho) de reiniciar), o comando é:

{% highlight bash %}
/etc/init.d/openbsd-inetd restart
{% endhighlight %}

Se você rodar um telnet na porta __8080__, verás que já estará escutando:
{% highlight bash %}
telnet localhost 8080
{% endhighlight %}

Ao rodar esse comando, será encaminhado ao subshell, então dê um exit, para retornar ao Shell.

Pronto, agora a porta estará esperando pelo serviço.

Espero que gostem e comentem!

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



