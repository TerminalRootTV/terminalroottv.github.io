---
layout: post
title: "Utilizando FTP por comando"
date: '2015-01-04T12:39:00.001-08:00'
image: '/assets/img/lpi/ftp.jpg'
description: "FTP significa File Transfer Protocol ( Protocolo de Transferência de Arquivos ), e é uma forma bastante rápida e versátil de transferir arquivo"
main-class: 'linux'
tags:
- Linux
- Servidores
- GNU
- Redes
---

![Utilizando FTP por comando](/assets/img/lpi/ftp.jpg "Utilizando FTP por comando")

> Sabemos que o melhor software gráfico para manipular arquivos via __FTP__ é o [FileZilla](https://filezilla-project.org/), porém sabemos que pra fazermos scripts em Shell, precisamos ter um vasto conhecimento em comandos para poder executálos, segue uma lista de comandos úteis para FTP que precisamos saber.

__FTP__ significa __File Transfer Protocol__ ( __Protocolo de Transferência de Arquivos__ ), e é uma forma bastante rápida e versátil de transferir arquivos (também conhecidos como ficheiros), sendo uma das mais usadas na Internet.Pode referir-se tanto ao protocolo quanto ao programa que implementa este protocolo (Servidor FTP, neste caso, tradicionalmente aparece em letras minúsculas, por influência do programa de transferência de arquivos do __Unix__).

Caso você deseje tornar seu computador um servidor FTP, para poder acessá-lo e pegar os arquivos do seu PC via FTP, você precisa instalar o __ProFTPD__ (em __Debian__ e __Debians-Like__ .

> obs.: precisar configurar o arquivo de configuração para restringir acessos e depois reiniciá-lo, não vou pôr aqui, pois o post é somente sobre os comandos do FTP, mas você pode pesquisar na internet, é bem simples!):{

{% highlight bash %}
apt-get install proftpd
{% endhighlight %}

#### Para conectar ao FTP de um servidor, executaremos conforme exemplo abaixo, para Hostname ou IP, respectivamente, será solicitado o usuário e a senha
{% highlight bash %}
ftp algumsite.com.br
ftp 192.168.1.107
{% endhighlight %}

#### Listar os arquivos
{% highlight bash %}
ftp> ls
{% endhighlight %}

#### Fazer Download de um arquivo
{% highlight bash %}
ftp> get index.php
{% endhighlight %}

#### Fazer Upload de um arquivo
{% highlight bash %}
ftp> put arquivo.html
{% endhighlight %}

#### Entrar num diretório
{% highlight bash %}
ftp> cd pasta
{% endhighlight %}

#### Deletar um arquivo
{% highlight bash %}
ftp> delete arquivo.php
{% endhighlight %}

#### Sair(Deslogar)
{% highlight bash %}
ftp> exit
{% endhighlight %}

Entre outros menos utilizados!
