---
layout: post
title: "Como instalar o COMPIZ no Debian 8 Jessie MATE"
date: '2016-05-07T17:00:00.001-07:00'
image: '/assets/img/debian/compiz.jpg'
description: "Compiz foi um dos primeiros gerenciadores de janelas 3D para o servidor de janela X, onde foi usada aceleração OpenGL."
main-class: 'debian'
tags:
- Debian
- MATE
- TerminalRootTV
twitter_text: "Como instalar o COMPIZ no Debian 8 Jessie MATE"
introduction: "Compiz foi um dos primeiros gerenciadores de janelas 3D para o servidor de janela X, onde foi usada aceleração OpenGL."
---
![Compiz Debian Blog Linux Terminal Root](/assets/img/debian/compiz.jpg "Compiz Debian Blog Linux Terminal Root")

## ![Blog Linux](http://compiz-debian.tuxfamily.org/images/title.jpg "Blog Linux")O que é Compiz ?


[Compiz](http://www.compiz.org/) foi um dos primeiros [gerenciadores](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=gerenciadores) de janelas 3D para o servidor de janela X, onde foi usada aceleração [OpenGL](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=OpenGL). O gerenciador permite que as janelas tenham efeitos visuais, como animações ao minimizar e uma área de trabalho em forma de cubo.

## ![Blog Linux](http://compiz-debian.tuxfamily.org/images/debian.jpg "Blog Linux") Porque Compiz para Debian ?



[Compiz](http://www.compiz.org/) já não é fornecido pelo repositório oficial do [Debian](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=Debian) desde o lançamento do [Squeeze](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=Squeeze), por causa do abandono do branch 0.8. A próxima versão 0.9 é desenvolvido pela unidade pelo Ubuntu e sempre foi muito instável em outros ambientes. Depois de pesquisar na web, alguns desenvolvedores passaram a corrigir bugs, retirar os pacotes e adicionar melhorias nas diferentes aplicações. Esta nova versão foi criada no [Github](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=Github) e funciona muito bem no Debian, é por isso que este projeto foi criado. Os pacotes para o Debian foram atualizados a partir da antiga versão 0.8.4 e desenvolvida com sucesso para arquiteturas i386 e amd64. Compiz [Debian](http://www.terminalroot.com.br/tags#debian) [GNU](http://www.terminalroot.com.br/tags#gnu)/[Linux](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=Linux) oferece pacotes tanto para o Debian stable "Jessie" quanto para o testing "Stretch".
Instale e divirta-se!


# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=1DbBQzuz9BE)


Como o 'root' rode o comando abaixo para configurar o sources.list e [gerar a chave pública](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=chave_pública)

{% highlight bash %}
wget -q http://download.tuxfamily.org/compiz/apt/key.pub -O- | apt-key add - && echo "deb http://download.tuxfamily.org/compiz/debian $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/compiz-debian.list && apt-get update
{% endhighlight %}

Depois também com o 'root' rode o comando abaixo para instalar os pacotes necessários
{% highlight bash %}
apt-get install compiz fusion-icon compiz-mate compiz-fusion-plugins-extra compiz-fusion-plugins-unsupported -y
{% endhighlight %}

      
![Blog Linux](http://compiz-debian.tuxfamily.org/images/install.jpg "Blog Linux")
InstalaçãoAbra seu terminal com usuário root e copie e cole os comandos abaixo.

![Blog Linux](http://compiz-debian.tuxfamily.org/images/keyring.jpg "Blog Linux")
RepositórioIntalando sources.list e chave pública GPG
{% highlight bash %}
wget -q  http://download.tuxfamily.org/compiz/apt/key.pub -O- | apt-key add -  && echo "deb http://download.tuxfamily.org/compiz/debian  $(lsb_release -sc) main" | tee  /etc/apt/sources.list.d/compiz-debian.list && apt-get update
{% endhighlight %}

![Blog Linux](http://compiz-debian.tuxfamily.org/images/compiz.jpg "Blog Linux")
Instalando compiz-core, gtk-window-decorator, gerenciador de configurações e plugins principais
{% highlight bash %}
apt-get install compiz
{% endhighlight %}

![Blog Linux](http://compiz-debian.tuxfamily.org/images/emerald.jpg "Blog Linux")
Instale o decorador de janela do Compiz ( recomenado pra XFCE, LXDE )
{% highlight bash %}
apt-get install emerald
{% endhighlight %}

![Blog Linux](http://compiz-debian.tuxfamily.org/images/fusion-icon.jpg "Blog Linux")
Instale o ícone na barra de tarefas que facilitará para iniciar e desligar o Compiz e também configurá-lo.
{% highlight bash %}
apt-get install fusion-icon
{% endhighlight %}

![Blog Linux](http://compiz-debian.tuxfamily.org/images/mate.jpg "Blog Linux")
Instale mate-compat plugin para compatibilidade com o MATE Desktop
{% highlight bash %}
apt-get install compiz-mate
{% endhighlight %}

![Blog Linux](http://compiz-debian.tuxfamily.org/images/plugins-extra.jpg "Blog Linux")
Instale plugins extra
{% highlight bash %}
apt-get install compiz-fusion-plugins-extra
{% endhighlight %}

![Blog Linux](http://compiz-debian.tuxfamily.org/images/plugins-exp.jpg "Blog Linux")
Instale plugins não suportados e experimentais no seu sistema
{% highlight bash %}
apt-get install compiz-fusion-plugins-unsupported
{% endhighlight %}

## Problemas ou Bugs ?
[Acesse o projeto no Github](http://compiz-debian.tuxfamily.org/)
