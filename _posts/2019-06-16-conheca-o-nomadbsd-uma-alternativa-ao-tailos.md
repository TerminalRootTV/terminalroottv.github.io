---
layout: post
title: "Conheça o NomadBSD uma alternativa ao Tails"
date: 2019-06-16 18:28:34
image: '/assets/img/bsd/nomadbsd.jpg'
description: 'Um sistema instalável em USB que você pode levar para qualquer lugar.'
main-class: 'bsd'
tags:
- bsd
- freebsd
- privacidade
---

![Conheça o NomadBSD uma alternativa ao TailOS](/assets/img/bsd/nomadbsd.jpg)

O [NomadBSD](http://nomadbsd.org/) como o próprio nome diz, é um sistema Live, ou seja, você instala e usa ele direto de um disco USB (Pendrive) . Ele é baseado em [FreeBSD](https://terminalroot.com.br/2017/09/por-que-freebsd.html) e possui uma avançadíssima detecção de hardware.

O NomadBSD possui um desktop completo e baseado em múltiplas opções:


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


+ Você pode escolher entre Thunar, Midnight Commander, PCmanFM ,... para gerenciar seus arquivos.
+ Escolher o editor de texto padrão entre: [Vim](https://terminalroot.com.br/vim), Vi, EE, ...
+ Escolher o Shell padrão: [Bash](https://terminalroot.com.br/shell), [Fish](https://terminalroot.com.br/2018/01/fish-shell-mais-produtividade-no-seu-shell-script.html), [ZSH](https://terminalroot.com.br/2018/02/como-instalar-e-usar-o-shell-zsh-e-o-oh-my-zsh.html),...
+ Esses são so que já vem instalados, mas você ainda pode instalar outros da sua vontade.

Além do LibreOffice, Gravador de CD/DVD , ferramenta gráfica (e de fácil utilização) para conexão a redes Wi-FI e entre uma porrada de softwares bem bacanas.

E tudo isso ele carrega muito rapidamente e tudo muito leve. O NomadBSD vem por padrão com OpenBox e tint2, e possui ainda o Plank que é startado automaticamente ao iniciar a sessão.

## Instalação

Para instalar o NomadBSD é bem fácil, basta baixar o arquivo no formato compactado: *.lzma*:

{% highlight bash %}
wget http://nomadbsd.org/download/nomadbsd-1.2.img.lzma
{% endhighlight %}

> Nesse caso baixará a versão 1.2, a mais atual para a data de publicação desse artigo, para a arquitetura 64-bit . Para outras opções acesse esse link: <http://nomadbsd.org/download.html>

Depois descompacte o arquivo:

{% highlight bash %}
lzma -d nomadbsd-1.2.img.lzma
{% endhighlight %}

E depois grave num disco USB (Pendrive)

> Lembrando que nesse caso, eu assumi que o pendrive está como dispositivo **sdb** , atente-se também que não deve copiar para partição (não usar números: ~~sdb1~~) .

{% highlight bash %}
dd bs=1M if=nomadbsd-1.2.img of=/dev/sdb conv=fsync
{% endhighlight %}

## Configuração


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


Depois é só dar o *boot* na sua máquina pelo Pendrive e configurar a instalação para seus gostos . Ele irá pedir para você informar dados como: editor padrão, senha, shell padrão  e entre outros, depois é só reiniciar e logar com a senha que você escolheu.

> O NomadBSD não faz nenhuma modificação no seu HD, somente no disco USB . Apesar de ser possível usá-lo no seu HD.

## Screenshots

![NomadBSD](/assets/img/bsd/nomadbsd.jpg)

![NomadBSD](http://nomadbsd.org/screenshots/nomadbsd-1.2-ss1.png)

![NomadBSD](http://nomadbsd.org/screenshots/nomadbsd-1.2-ss2.png)

![NomadBSD](http://nomadbsd.org/screenshots/nomadbsd-1.0.1-ss3.png)

![NomadBSD](http://nomadbsd.org/screenshots/nomadbsd-1.0.1-ss4.png)

![NomadBSD](http://nomadbsd.org/screenshots/nomadbsd-1.0.1-ss6.png)


Veja mais screenshots em: <http://nomadbsd.org/screenshots.html>

## Site Oficial

# <http://nomadbsd.org>


## E você ? O que achou do NomadBSD ? Deixe seu comentário!


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

