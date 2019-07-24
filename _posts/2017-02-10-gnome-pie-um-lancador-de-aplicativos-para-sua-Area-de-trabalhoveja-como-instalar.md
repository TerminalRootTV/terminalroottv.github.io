---
layout: post
title: "GNOME-Pie, Um Lançador de Aplicativos Circular para o Desktop, Veja Como Instalar"
date: 2017-02-10 10:28:27
image: '/assets/img/dicas/GNOME-PIE.jpg'
description: "O Gnome-Pie é um Lançador de Aplicativos Circular para Linux."
main-class: 'artigos'
color: '#009688'
tags:
- dicas
- linux
categories:
twitter_text: "GNOME-Pie, Um Lançador de Aplicativos Circular para o Desktop, Veja Como Instalar"
introduction: "O Gnome-Pie é um Lançador de Aplicativos Circular para Linux."
---

![Gnome Pie Blog Linux](/assets/img/dicas/GNOME-PIE.jpg "Gnome Pie")

O Gnome-Pie é um Lançador de Aplicativos Circular para Linux. O usuário não precisa lembrar o nome de um aplicativo - apenas o atalho, não precisam clicar diretamente no ícone , mas em algum lugar na tela em sua direção - o Gnome-Pie é uma alternativa aos lançadores baseados em texto.

# Instalação

Primeiro instale todas as dependências necessárias
{% highlight bash %}
sudo apt-get install git build-essential libgtk-3-dev libcairo2-dev libappindicator3-dev libgee-0.8-dev libxml2-dev libxtst-dev libgnome-menu-3-dev valac cmake libwnck-3-dev libarchive-dev
{% endhighlight %}

Baixe pelo git, se não tiver o git instale-o [Veja aqui como instalar](http://www.terminalroot.com.br/git)
{% highlight bash %}
git clone git://github.com/Simmesimme/Gnome-Pie.git cd Gnome-Pie 
{% endhighlight %}

Em seguida, compilar Gnome-Pie.
{% highlight bash %}
./make.sh 
{% endhighlight %}

Se você possui Ubuntu ou distros que usam PPA, você pode instalar assim
{% highlight bash %}
sudo add-apt-repository ppa:vala-team/ppa sudo apt-get update sudo apt-get upgrade
{% endhighlight %}

Procure no Dash e abra-o, os principais comandos:

* Aplicações: Ctrl + Alt + A
* Sessão: Ctrl + Alt + Q
* Marcadores: Ctrl + Alt + B
* Menu principal: Ctrl + Alt + espaço
* Multimídia: Ctrl + Alt + M
* Janelas: Ctrl + Alt + W

# Endereço Oficial do GNOME-Pie
[http://simmesimme.github.io/gnome-pie.html](http://simmesimme.github.io/gnome-pie.html)

### Comente!

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

