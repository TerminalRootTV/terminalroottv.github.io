---
layout: post
title: "Como Criar um CRUD com LARAVEL"
date: 2020-09-02 10:43:16
image: '/assets/img/laravel/laravel.jpg'
description: 'Laravel é um framework de aplicação web com sintaxe expressiva e elegante.'
icon: 'cib:laravel'
iconname: 'laravel'
tags:
- php
- laravel
- desenvolvimentoweb
---

![Como Criar um CRUD com LARAVEL](/assets/img/laravel/laravel.jpg)

[Laravel](https://laravel.com/) é um framework PHP livre e open-source criado por Taylor B. Otwell para o desenvolvimento de sistemas web que utilizam o padrão MVC (model, view, controller). Algumas características proeminentes do Laravel são sua sintaxe simples e concisa, um sistema modular com gerenciador de dependências dedicado, várias formas de acesso a banco de dados

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

# Instalação
Para instalar o **Laravel** você precisará antes do [Composer](https://getcomposer.org/) devidamente instalado. Você pode usar o gerenciador de pacotes da sua distribuição, exemplos:
{% highlight bash %}
emerge composer # Gentoo, Funtoo, ...
sudo apt install composer # Debian, Ubuntu, Mint, ...
sudo pacman -S composer # Arch, Manjaro, ...
sudo dnf install composer # Red Hat, CentOS, Fedora, ...
{% endhighlight %}

Ou diretamente pelo procedimento recomendado pelo próprio Composer:
{% highlight bash %}
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '8a6138e2a05a8c28539c9f0fb361159823655d7ad2deecb371b04a83966c61223adc522b0189079e3e9e277cd72b8897') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
{% endhighlight %}

Depois só instalar o Laravel com os comandos abaixo:
{% highlight bash %}
composer global require laravel/installer
echo 'alias laravel="$HOME/.config/composer/vendor/bin/laravel"' >> ~/.bashrc
exec $SHELL
{% endhighlight %}

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

Para criar um novo projeto com Laravel:
{% highlight bash %}
laravel new [nome-do-projeto]
{% endhighlight %}

O tutorial de como criar um CRUD segue no vídeo logo abaixo:

<iframe width="1234" height="694" src="https://www.youtube.com/embed/TKH4S4_d9PA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> 

Download do projeto:

<a href="https://bit.ly/32Ozb8u" class="btn btn-danger btn-block">CRUD LARAVEL DOWNLOAD</a> 


<!-- RETANGULO LARGO -->
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

