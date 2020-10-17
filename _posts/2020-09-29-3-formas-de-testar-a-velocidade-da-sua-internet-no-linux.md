---
layout: post
title: "3 Formas de Testar a Velocidade da Sua Internet no Linux"
date: 2020-09-29 11:25:13
image: '/assets/img/comandos/internet-test.jpg'
description: 'Todos os dias duvidamos do nosso provedor de internet se ele realmente está entregando a largura de banda que contratamos.'
icon: 'mdi:web'
iconname: 'internet'
tags:
- ferramentas
- comandos
---


![3 Formas de Testar a Velocidade da Sua Internet no Linux](/assets/img/comandos/internet-test.jpg)

Todos os dias duvidamos do nosso provedor de internet se ele realmente está entregando a largura de banda que contratamos.

E a melhor forma de ficarmos atento a isso é monitorando constantemente utilizando alguma ferramenta rápida e fácil.

Vamos conhecer 3 ferramentas excelentes para isso via linha de comando.

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

# 1. [Speedtest](https://www.speedtest.net/)
`speedtest-cli` é uma interface de linha de comando de código aberto para testar a largura de banda da Internet que também pode ser utilizado diretamente pelo navegador . É uma pequena ferramenta rápida para verificar a velocidade de download e upload.

`speedtest-cli` está disponível na maioria das distros e pode ser facilmente instalado usando o gerenciador de pacotes.

No [Gentoo](https://terminalroot.com.br/tags#gentoo) basta instalá-lo com o Portage:
{% highlight bash %}
su
emerge speedtest-cli
{% endhighlight %}

No [Debian](https://terminalroot.com.br/tags#debian)/[Ubuntu](https://terminalroot.com.br/tags#ubuntu), você pode usar o seguinte procedimento:
{% highlight bash %}
sudo apt-get install gnupg1 apt-transport-https dirmngr
export INSTALL_KEY=379CE192D401AB61
export DEB_DISTRO=$(lsb_release -sc)
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $INSTALL_KEY
echo "deb https://ookla.bintray.com/debian ${DEB_DISTRO} main" | sudo tee  /etc/apt/sources.list.d/speedtest.list
sudo apt-get update
sudo apt-get install speedtest
{% endhighlight %}

No [Fedora](https://terminalroot.com.br/tags#fedora)/[CentOS](https://terminalroot.com.br/tags#centos)/[RedHat](https://terminalroot.com.br/tags#redhat)
{% highlight bash %}
sudo yum install wget
wget https://bintray.com/ookla/rhel/rpm -O bintray-ookla-rhel.repo
sudo mv bintray-ookla-rhel.repo /etc/yum.repos.d/
sudo yum install speedtest
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

No [FreeBSD](https://terminalroot.com.br/tags#freebsd):
{% highlight bash %}
sudo pkg update && sudo pkg install -g libidn2 ca_root_nss
sudo pkg add "https://bintray.com/ookla/download/download_file?file_path=ookla-speedtest-1.0.0-freebsd.pkg"
{% endhighlight %}

Para qualquer outra distro você pode fazer o download via linha de comando e instalá-lo:
{% highlight bash %}
# 64-bit
wget https://bintray.com/ookla/download/download_file?file_path=ookla-speedtest-1.0.0-x86_64-linux.tgz

# 32-bit
wget https://bintray.com/ookla/download/download_file?file_path=ookla-speedtest-1.0.0-i386-linux.tgz
{% endhighlight %}

![Speedtest](/assets/img/comandos/speedtest.gif)

---

# 2. [Fast](https://fast.com)
Fast é um utilitário CLI de código aberto desenvolvido pelo serviço fast.com da Netflix e você também pode acessá-lo diretamente pelo navegador.

Fast é a ferramenta perfeita para quem quer apenas verificar a velocidade de download de uma forma muito simples.

Para usá-lo via linha de comando você precisará do [npm](https://github.com/sindresorhus/fast-cli) devidamente instalado no seu sistema e em seguida rodar comando:
{% highlight bash %}
sudo npm install --global fast-cli
{% endhighlight %}

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

Você pode instalá-lo também usando o snap:
{% highlight bash %}
sudo snap install fast
{% endhighlight %}

Após instalado você pode rodar via linha de [comando](https://terminalroot.com.br/tags#comandos)
{% highlight bash %}
fast
{% endhighlight %}

![Fast](/assets/img/comandos/fast.gif)

---

# 3. [LibreTest](https://librespeed.org/)
LibreTest é de código abertoe não utiliza Flash, Java e Websocket. Ele pode ser acessado diretamente pelo navegador e utilizado via linha de comando de acordo com [ferramentas adicionais que o implementam](https://github.com/librespeed/speedtest).

O diferencial dele é que você pode usá-lo no seu servidor e oferecer como serviço e utilizar o [curl](https://terminalroot.com.br/tags#curl) via linha de comando apontando para seu server(esse procedimento está fora do escopo desse artigo).

![LibreTest](/assets/img/comandos/libretest.gif)






