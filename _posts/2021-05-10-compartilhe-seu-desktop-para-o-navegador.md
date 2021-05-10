---
layout: post
title: "Compartilhe seu Desktop para o Navegador"
date: 2021-05-10 10:40:05
image: '/assets/img/dicas/deskreen.jpg'
description: 'Útil fazer aquele helpdesk rápido!'
icon: 'ion:terminal-sharp'
iconname: 'Dicas'
tags:
- dicas
---

![Compartilhe seu Desktop para o Navegador](/assets/img/dicas/deskreen.jpg)

Muitas vezes precisamos mostrar algo para algum cliente ou alguém ou acessar de forma simples a àrea de trabalho de outra pessoa. E isso às vezes há uma limitação dependendo do sistema operacional que você ou a outra pessoa está, para resolver esse problema de forma simples podemos usar o **Deskreen** .

**Deskreen** é um aplicativo de desktop que transforma qualquer dispositivo com um navegador da web em uma tela secundária para o seu computador via WiFi. Ele pode ser usado para espelhar a tela inteira do computador na tela de qualquer dispositivo que tenha um navegador da web.

Além disso, você pode limitar o Deskreen para selecionar apenas uma visualização da janela do aplicativo para compartilhar - muito útil para fins de apresentação. A melhor característica do Deskreen é usar qualquer dispositivo como tela secundária.

O Deskreen é escrito em [TypeScript](https://pt.wikipedia.org/wiki/TypeScript) e está disponível para [Linux](https://terminalroot.com.br/tags#linux), [Windows](https://terminalroot.com.br/tags#windows) e [macOS](https://terminalroot.com.br/tags#macos).

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


# Download
Para fazer o download você pode utilizar [.deb](https://github.com/pavlobu/deskreen/releases/download/v1.0.11/deskreen_1.0.11_amd64.deb) para [Linux](https://terminalroot.com.br/linux), [.exe](https://github.com/pavlobu/deskreen/releases/download/v1.0.11/Deskreen.Setup.1.0.11.exe) para [Windows](https://terminalroot.com.br/2019/04/como-acessar-o-windows-pelo-linux-com-metasploit.html) ou [.dmg](https://github.com/pavlobu/deskreen/releases/download/v0.0.11/Deskreen-1.0.11.dmg) para [macOS](https://terminalroot.com.br/2018/03/como-instalar-o-mac-os-x-em-virtualbox-no-linux.html) .

No entanto, no caso do Linux você pode simplesmente usar um [AppImage](https://github.com/pavlobu/deskreen/releases/download/v1.0.11/Deskreen-1.0.11.AppImage). Ou seja, basta rodar os seguintes comandos:
{% highlight bash %}
wget https://github.com/pavlobu/deskreen/releases/download/v1.0.11/Deskreen-1.0.11.AppImage
chmod +x Deskreen-1.0.11.AppImage
./Deskreen-1.0.11.AppImage
{% endhighlight %}

# Fazendo a conexão
Ao executar o Deskreen(`./Deskreen-1.0.11.AppImage`) será aberta uma janela com o QRCode e um link com número de IP, a porta(3131) e um endereço de número, exemplo: `https://10.1.0.8:3131/164523`, basta clicar nesse endereço que será copiado e enviar para pessoa que você deseja que acesse:

![Deskreen 1](/assets/img/dicas/deskreen-1.jpg)

Assim que a pessoa acessar o endereço aparecerá para ela essa tela abaixo:

![Deskreen 2](/assets/img/dicas/deskreen-2.jpg)

Então você deverá permitir o acesso clicando em `Allow`

![Deskreen 3](/assets/img/dicas/deskreen-3.jpg)

E em seguida selecionando a tela/janela que deseja compartilhar e confirmando:

<!-- RETANGULO LARGO 2 -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:block; text-align:center;"
data-ad-layout="in-article"
data-ad-format="fluid"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="8549252987"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


![Deskreen 4](/assets/img/dicas/deskreen-4.jpg)
![Deskreen 5](/assets/img/dicas/deskreen-5.jpg)
![Deskreen 6](/assets/img/dicas/deskreen-6.jpg)


E então a pessoa poderá ver pelo navegador sua àrea de trabalho!
> Note que minha máquina é um Linux 64-bit e compartilhei com um Linux 32-bit i686 normalmente!
![Deskreen 7](/assets/img/dicas/deskreen-7.jpg)

Show, né?!

Para mais informações acesse o endereço oficial do Deskreen: <https://deskreen.com/> .
