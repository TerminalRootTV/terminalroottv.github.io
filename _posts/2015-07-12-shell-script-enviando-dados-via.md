---
layout: post
title: 'Enviando dados via Terminal para um formulário web'
date: '2015-07-12T18:32:00.000-07:00'
description: "Curl é uma ferramenta para transferir dados de ou para um servidor"
image: '/assets/img/shell-script/CurlLogo.jpg'
tags:
- shellscript
- criptografia
- terminal
- comandos
---

![Enviando dados via Terminal para um formulário web](/assets/img/shell-script/CurlLogo.jpg "Enviando dados via Terminal para um formulário web")

### COMO ENVIAR DADOS PARA FORMULÁRIO COM CURL VIA POST PELO TERMINAL COM SHELL SCRIPT

[Curl](https://curl.haxx.se/) é uma ferramenta para transferir dados de ou para um servidor, usando um dos protocolos suportados (DICT, o FILE, FTP, FTPS, GOPHER, HTTP, HTTPS, IMAP, IMAPS, LDAP, LDAPS, POP3, POP3S, RTMP, RTSP, SCP, SFTP, SMTP, SMTPS, TELNET e TFTP). O comando é projetado para funcionar sem interação do usuário.

> Curl oferece um busload cheio de truques úteis como suporte a proxy, autenticação de usuário, upload FTP, HTTP post, conexões SSL, cookies, transferência e muito mais. Como você verá abaixo, o número de recursos vai fazer a sua cabeça girar!
 
## SINOPSE
 
> __curl [options] [URL...]__

 Verifique se o curl está instalado 
{% highlight bash %}
which curl
{% endhighlight %}

Se retornar isso: 
> /usr/bin/curl é porque está instalado, mas se não retornar nada, é porque não está instalado e você pode instalá-lo, pelo apt-get:
 
{% highlight bash %}
su
{% endhighlight %}

{% highlight bash %}
apt-get install curl
{% endhighlight %}

Se sua distro tiver o sudo instalado e configurado para seu usuário, utilize-o então, ou se form outra distro que não possui apt-get, tente com o gerenciador de pacotes correspondente.

### Para mais informações detalhadas 
{% highlight bash %}
man curl
{% endhighlight %}

ou

{% highlight bash %}
man curlcurl --help
{% endhighlight %}

## Como enviar dados para formulário com curl via post pelo terminal com Shell Script

> Este teste foi feito em localhost com o Apache e o PHP devidamente instalados, mas se você possui um endereço na web, utilize-o!

> Eu criei o arquivo formulario.php na raíz do meu localhost

Eu fiz um página HTML básica e pus uma condição de envio de formulário. Outra coisa, eu utilizo o __shell_exec__ ( [PHP](http://php.net/) para executar [Shell](http://www.terminalroot.com.br/shell/) ) para criar um novo arquivo __banco.txt__ e salvar os dados enviados, mas você pode fazer do jeito que quiser: __MySQL__, __fopen()__,...

Devidamente criada a página que irá receber os dados, vamos mandar os dados via __Shell__ pelo __Terminal__.

> O __-F__ indica o __input HTML__, e depois indicamos a __URL__, o __&& echo__ é só pra pular linha mesmo, __abra o terminal__ e envie o comando abaixo

{% highlight bash %}
curl -F 'nome=TerminalRoot' -F 'senha=gnu123' -F 'enviar=ok' http://127.0.0.1/formulario.php && echo
{% endhighlight %}

Pronto, depois é verificar lá na pasta do servidor se há o arquivo banco.txt e verificar se os dados estão lá
{% highlight bash %}
cat /var/www/html/banco.txt
{% endhighlight %} 
 
## Qualquer coisa é só comentar! :)

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



