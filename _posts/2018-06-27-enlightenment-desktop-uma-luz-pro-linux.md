---
layout: post
title: "Enlightenment Desktop - Uma Luz pro Linux"
date: 2018-06-27 20:42:41
image: '/assets/img/review/shot-enlightenment.jpg '
description: 'Enlightenment é um desktop environment completamente open-source e independente que tem sido desenvolvido há mais de 10 anos.'
main-class: 'linux'
tags:
- enlightenment
---

[Enlightenment](https://www.enlightenment.org/) é um desktop environment completamente open-source e independente que tem sido desenvolvido há mais de 10 anos. Embora seja à primeira vista só um "gestor de janelas", por ter um vasto leque de aplicações, bibliotecas e serviços, pode ser considerado de fato um DE independente.O E além de ter o seu completo sistema de bibliotecas gráficas (EFL) tem o chamado entrance, que é uma alternativa ao GDM (Gnome, Xfce) ou KDM (KDE).

A primeira versão do Enlightenment foi desenvolvida por Rasterman (Carsten Haitzler) em 1997. Elivecd é uma distribuição Linux baseada no Debian que usa o gerenciador de janelas Enlightenment. O Enlightenment Desktop está disponível não somente para o [GNU/Linux](http://terminalroot.com.br/2014/09/alguns-comandos-gnulinux-por-categorias.html) como stambém o [FreeBSD](http://terminalroot.com.br/2017/09/por-que-freebsd.html) e o [UNIX](http://terminalroot.com.br/2016/11/blog-linux-unix.html). 

# Como Instalar o Enlightenment no Linux

- Debian
{% highlight bash  %}
sudo apt install e17
{% endhighlight  %}

- Ubuntu, Mint e derivados
{% highlight bash  %}
sudo add-apt-repository ppa:enlightenment-git/ppa
sudo apt-get update
sudo apt-get install e20 terminology
{% endhighlight  %}

- Gentoo
{% highlight bash  %}
emerge enlightenment
{% endhighlight  %}

No caso do Gentoo haverá [mais opções](https://wiki.gentoo.org/wiki/Enlightenment). Perceba que no Ubuntu, Mint e derivados é uma versão mais nova e nos repositórios adicionados já há a possibilidade de instalar também o Terminology que é o emulador de terminal padrão do enlightment. No caso do Debian (9) basta você adicionar **temporariamente** o repositório do Debian 8 e remover após instalação do Terminology para que não haja "quebra do seu sistema"

Ex.:

{% highlight bash  %}
sudo vim /etc/apt/sources.list.d/jessie.list
{% endhighlight  %}

Dentro do arquivo insira o conteúdo abaixo

{% highlight bash  %}
deb http://deb.debian.org/debian/ oldstable main contrib non-free
deb-src http://deb.debian.org/debian/ oldstable main contrib non-free
deb http://deb.debian.org/debian/ oldstable-updates main contrib non-free
deb-src http://deb.debian.org/debian/ oldstable-updates main contrib non-free
deb http://deb.debian.org/debian-security oldstable/updates main
deb-src http://deb.debian.org/debian-security oldstable/updates main
deb http://ftp.debian.org/debian jessie-backports main
deb-src http://ftp.debian.org/debian jessie-backports main
{% endhighlight  %}

Salve, atualize o APT instale o Terminology, depois remova o repositório temporário e atualize novamente o APT.

{% highlight bash  %}
sudo apt update
sudo apt install terminology terminology-data
sudo rm /etc/apt/sources.list.d/jessie.list
sudo apt update
{% endhighlight  %}

Lógico que isso é uma "manobra" o correto mesmo é instalar as dependências e o EFL e compilar com o __meson__ e o __ninja__

- Baixa o EFL e descompacta

{% highlight bash  %}
wget https://download.enlightenment.org/rel/libs/efl/efl-1.17.0.tar.xz
tar xvf efl-1.17.0.tar.xz 
{% endhighlight  %}

- Instala as dependências

{% highlight bash  %}
sudo apt install gcc g++ check libssl-dev libsystemd-dev libjpeg-dev libglib2.0-dev libgstreamer1.0-dev libluajit-5.1-dev libfreetype6-dev libfontconfig1-dev libfribidi-dev libx11-dev libxext-dev libxrender-dev libgl1-mesa-dev libgif-dev libtiff5-dev libpoppler-dev libpoppler-cpp-dev libspectre-dev libraw-dev librsvg2-dev libudev-dev libmount-dev libdbus-1-dev libpulse-dev libsndfile1-dev libxcursor-dev libxcomposite-dev libxinerama-dev libxrandr-dev libxtst-dev libxss-dev libbullet-dev libgstreamer-plugins-base1.0-dev doxygen
{% endhighlight  %}

- Configura, compila e instala 

{% highlight bash  %}
cd e17-1.17.0/
./configure
make
su -c "make install"
{% endhighlight  %}

- Criar um link simbólico e atualizar a biblioteca
{% highlight bash  %}
sudo ln -s /usr/local/share/dbus-1/services/org.enlightenment.Ethumb.service /usr/share/dbus-1/services/org.enlightenment.Ethumb.service
sudo ldconfig
{% endhighlight  %}

Lógico que você também pode fazer tudo isso pelo repositório do Git deles <kbd>git clone https://git.enlightenment.org/core/efl.git</kbd> , caso haja alguma dúvida [consulte a documentação oficial](https://www.enlightenment.org/docs/distros/debian-start.md) bem como sua página oficial: <https://www.enlightenment.org/>, além de mais informações na [wiki](https://pt.wikipedia.org/wiki/Enlightenment).

## Veja o vídeo
# [Clique aqui para ver o vídeo](https://www.youtube.com/watch?v=Xl6liAsr_uc)


