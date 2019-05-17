---
layout: post
title: "Como Compilar o YAD no GNU/Linux"
date: 2017-03-22 08:19:08
image: '/assets/img/bash/yad-color.jpg'
description: "Yad é um fork do Zenity, melhorado. É uma ferramenta para criar interface gráfica para o usuário (GUI) em Shell Script."
main-class: 'linux'
tags:
- bash
- shell script
---

![Como Compilar o YAD no GNU-Linux](/assets/img/bash/yad-color.jpg "Como Compilar o YAD no GNU-Linux")

## Introdução 

__Yad__ significa para o __Shell Script__: "__Y__ et __A__ nother __D__ ialog" em português "*Ainda outro diálogo*". É um __fork do Zenity, melhorado__. É uma ferramenta para __criar interface gráfica para o usuário (GUI) em Shell Script__.

## Instalação

> Instale as bibliotecas necessárias antes

{% highlight bash %}
apt-get install libgtk2.0*
apt-get install intltool intltool-debian
{% endhighlight %}

> Você também pode usar o próprio apt para compilar programas, caso você deseje, nesse link possui um guia completo de compilação de programas, inclusive com auto-apt.

[Clique aqui pra acessar o conteúdo](http://terminalroot.com.br/2012/12/curso-certificacao-linux-lpi-1_2.html)

*...continuando*

## Vamos fazer o Download do yad (esse link pega a última versão automaticamente)
[https://sourceforge.net/projects/yad-dialog/files/latest/download](https://sourceforge.net/projects/yad-dialog/files/latest/download)

## Esse comando baixa a versão [0.38.2]
{% highlight bash %}
wget https://ufpr.dl.sourceforge.net/project/yad-dialog/yad-0.38.2.tar.xz
{% endhighlight %}

## Descompacte o arquivo [.xz]
{% highlight bash %}
tar -Jxvf yad-0.38.2.tar.xz
{% endhighlight %}

## Entre no diretório do Yad baixado e descompactado
{% highlight bash %}
cd yad-0.38.2/
{% endhighlight %}

## Configure
{% highlight bash %}
./configure
{% endhighlight %}

> Atenção: Se o __config.log__ não apresentou nenhum erro (__exit 0__), então tudo que ele precisa para ser instalado está no seu sistema

## Aponte para o Make
{% highlight bash %}
make
{% endhighlight %}

## Instale
{% highlight bash %}
make install
{% endhighlight %}

## Teste o Yad pra ver se está tudo certo
{% highlight bash %}
yad
{% endhighlight %}

# Veja um vídeo sobre Yad


# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=2gUIoUWHZMg)

