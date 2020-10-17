---
layout: post
title: "Crie Sua REMASTER do UBUNTU → BuntuWM Linux"
date: 2019-10-02 16:53:23
image: '/assets/img/ubuntu/buntuwm-remaster-ubuntu.jpg'
description: 'Customize seu Ubuntu com Facilidade e Praticidade.'
tags:
- ubuntu
- distro
- linux
---

![Crie Sua REMASTER do UBUNTU → BuntuWM Linux](/assets/img/ubuntu/buntuwm-remaster-ubuntu.jpg "Crie Sua REMASTER do UBUNTU → BuntuWM Linux")

Nessa *aventura* foi utilizado o [CUBIC](https://launchpad.net/cubic) .

## Introdução

Cubic (**C**ustom **Ub**untu **I**SO **C**reator) é um assistente da GUI para criar uma imagem inicializável personalizada do Ubuntu Live CD (ISO). O Cubic apresenta um ambiente integrado de linha de comando chroot para fazer as personalizações e permite a navegação sem esforço, para trás e para frente, através das etapas de geração ISO. Você pode criar novos projetos de customização ou modificar projetos existentes. Parâmetros importantes são preenchidos automaticamente com padrões inteligentes para simplificar o processo de personalização.

## Como Instalar o Cubic

+ **1**. Adicionar o repositório:

{% highlight bash %}
sudo apt-add-repository ppa:cubic-wizard/release
{% endhighlight %}

+ **2**. Adicionar a chave do Cubic:

{% highlight bash %}
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6494C6D6997C215E
{% endhighlight %}

+ **3**. Atualizar o repositório:
 
{% highlight bash %}
sudo apt update
{% endhighlight %}

+ **4**. Instalar o [Cubic](https://launchpad.net/cubic):
 
{% highlight bash %}
sudo apt install cubic
{% endhighlight %}

Não esqueça de alterar o `/etc/apt/sources.list`, aqui o exemplo que foi utilizado no vídeo:

{% highlight bash %}
deb http://br.archive.ubuntu.com/ubuntu/ disco main restricted
deb http://br.archive.ubuntu.com/ubuntu/ disco-updates main restricted
deb http://br.archive.ubuntu.com/ubuntu/ disco universe
deb http://br.archive.ubuntu.com/ubuntu/ disco-updates universe
deb http://br.archive.ubuntu.com/ubuntu/ disco multiverse
deb http://br.archive.ubuntu.com/ubuntu/ disco-updates multiverse
deb http://br.archive.ubuntu.com/ubuntu/ disco-backports main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu disco-security main restricted
deb http://security.ubuntu.com/ubuntu disco-security universe
deb http://security.ubuntu.com/ubuntu disco-security multiverse
{% endhighlight %}

## → BuntuWM (Remaster)

Clique no botão abaixo pra fazer download do BuntuWM e da Hash MD5 ( [O que é e como gerar uma HASH ?](https://terminalroot.com.br/2019/05/o-que-e-e-como-gerar-uma-hash.html) )

<div class="text-center">
	<p>
		<a href="http://bit.ly/2oAlHwy" style="cursor:pointer;">
			<strong><button class="btn-lg btn-success">Download → BuntuWM</button></strong>
		</a>
	</p>
</div>

<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Informat  -->
<ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-2838251107855362"
     data-ad-slot="2327980059"
     data-ad-format="auto"
     data-full-width-responsive="true"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

## Assista ao vídeo

<iframe width="920" height="400" src="https://www.youtube.com/embed/4980zIQci8Q" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Links úteis

+ <https://launchpad.net/cubic>
+ <http://bit.ly/2oAlHwy>
+ <https://terminalroot.com.br/2019/05/o-que-e-e-como-gerar-uma-hash.html>

    


