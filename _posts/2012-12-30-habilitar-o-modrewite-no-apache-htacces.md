---
layout: post
title: 'Habilitar o mod_rewite no Apache'
date: '2012-12-30T07:18:00.000-08:00'
image: '/assets/img/servidor/apache.jpg'
description: "Pra quem vai trabalhar com MVC no PHP (por exemplo) precisa habilitar o mod_rewrite no Apache pra que funcione, segue os passos pra fazer isso"
main-class: 'linux'
tags:
- Debian
- Linux
- Apache
- PHP
---

![Habilitar o mod_rewite no Apache](/assets/img/servidor/apache.jpg "Habilitar o mod_rewite no Apache")

> Pra quem vai trabalhar com __MVC__ no PHP (por exemplo) precisa habilitar o __mod_rewrite__ no __Apache__ pra que funcione, segue os passos pra fazer isso

+ 1 - Logue como root: 
{% highlight bash %}
su
{% endhighlight %}

+ 2 - Abra o arquivo default do Apache: 
{% highlight bash %}
vi /etc/apache2/sites-available/default
{% endhighlight %}

+ 3 - Altere a linha que contém __AllowOverride None__ dentro de __&lt;Directory />__ substituindo por __AllowOverride AuthConfig__ e altere a linha __AllowOverride None__ dentro de __&lt;Directory /var/www/>__ substituindo por __AllowOverride All__.


+ 4 - Não esqueça de habilitar o __mod_rewrite__
{% highlight bash %}
a2enmod rewrite
{% endhighlight %}

+ 5 - Reinicie o apache:
{% highlight bash %}
/etc/init.d/apache2 restart
{% endhighlight %}

### Agora vamos testar

+ 6 - Crie um arquivo __.htacces__ dentro do diretório __/var/www/__ 
{% highlight bash %}
vi /var/www/.htaccess
{% endhighlight %}

+ 7 - Escreva isso dentro do Arquivo, salve e feche-o
{% highlight bash %}
RewriteEngine On
RewriteCond %{SCRIPT_FILENAME} !-f
RewriteCond %{SCRIPT_FILENAME} !-d
RewriteRule ^(.*)$ index.php?chave=$1 
{% endhighlight %}

+ 8 - Agora crie um arquivo __index.php__ e cole o conteúdo logo abaixo
{% highlight bash %}
vi /var/www/index.php
{% endhighlight %}

Conteúdo
{% highlight php %}
<?php echo $_GET['chave']; ?>
{% endhighlight %}

+ 9 - Acesse o endereço __http://localhost/nomequalquer/outronome/__

Se imprimir na tela: __nomequalquer/outronome/__ 

Ou o nome que você escolheu, está tudo certo.

Você já pode escrever seu Framework!


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

