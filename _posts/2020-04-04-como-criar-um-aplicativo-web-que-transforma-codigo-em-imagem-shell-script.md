---
layout: post
title: "Como Criar um Aplicativo Web que Transforma código em Imagem (Shell Script)"
date: 2020-04-04 01:51:53
image: '/assets/img/dev/code-to-img.jpg'
description: 'Tava devendo essa faz tempo.'
icon: 'emojione:spiral-shell'
iconname: 'shellscript'
tags:
- shellscript
- desenvolvimentoweb
- docker
- apache
- debian
- javascript
- html
- css
---

[![Como Criar um Aplicativo Web que Transforma código em Imagem](/assets/img/dev/code-to-img.jpg)](/assets/img/dev/code-to-img.jpg)


Nesse vídeo mostramos algumas técnicas bacanas de Shell Script Web, Frontend(CSS, Javascript, jQuery) e entre outros.


 A única alteração do conteúdo criado no vídeo é na **linha 15** que eu esqueci de informar o arquivo **`$_filename`** em `sh/index.sh` que ficou assim: `sed -i "s/'/\\\'/g"` , por isso o código foi transformado sem interpretação das partes com *aspas simples* , mas alterei e deixei assim:
{% highlight bash %}
sed -i "s/'/\\\'/g" "$_filename"
{% endhighlight %}

# Vídeo do tutorial

<iframe width="1244" height="500" src="https://www.youtube.com/embed/q-nDkg1PauE" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> 

# [Baixar o projeto](https://github.com/terroo/code2img)
{% highlight bash %}
git clone https://github.com/terroo/code2img
mv code2img /var/www/html
{% endhighlight %}

Abraços!


