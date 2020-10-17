---
layout: post
title: "Como instalar o GDM3 ou configurar o LightDM no Debian"
date: '2016-05-07T07:44:00.000-07:00'
image: '/assets/img/debian/gm3.jpg'
description: "Apesar de ser configurável e ser um ótimo Display Manager, há quem goste de uma forma diferente de logar no sistema."
tags:
- debian
- mate
---

![Como instalar o GDM3 ou configurar o LightDM no Debian](/assets/img/debian/gm3.jpg "Como instalar o GDM3 ou configurar o LightDM no Debian")

> Por padrão o __Debian 8 Jessie MATE__ vem o com o gerenciador de sessão (login) o __LightDM instalado__ (veja imagem abaixo)

![Como instalar o GDM3 ou configurar o LightDM no Debian](/assets/img/debian/lightDM.jpg "Como instalar o GDM3 ou configurar o LightDM no Debian")

Nesse vídeo há procedimentos de o que fazer após instalação do __Debian 8 Jessie__, mas não há esa dica, você pode incluí-la

# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=mifEI1pBx4s)


Apesar de ser configurável e ser um ótimo __Display Manager__, há quem goste de uma forma diferente de logar no sistema. Um dos
gerenciadores mais utilizados e preferidos dos linusers é o __GDM3__ (veja imagem abaixo)

![Como instalar o GDM3 ou configurar o LightDM no Debian](/assets/img/debian/gm3.jpg "Como instalar o GDM3 ou configurar o LightDM no Debian")

Para instalar o __GMD3__ siga os passos abaixo
Logue como root
{% highlight bash %}
su
{% endhighlight %}

E rode o apt-get para instalá-lo
{% highlight bash %}
apt-get install gdm3 -y
{% endhighlight %}

Durante a instalação você será questionado para se deseja tornar o __gdm3__ como padrão de __login__, selecione o __gdm3 __e prossiga a instalação, mas
caso você tenha errado na seleção, você também pode fazer posteriormente, rodando o comando
{% highlight bash %}
dpkg-reconfigure gdm3
{% endhighlight %}

Para mudar a imagem do seu usuário ao logar no sistema , basta você ir no Painel Principal do MATE e seguir o caminho e mudar sua foto

> __Sistema__ > __Preferências__ > __Sobre mim__

Para mudanças no __GDM3__ você precisa editar esse arquivo __/etc/gdm3/greeter.gconf-defaults__

Mais informações sobre GDM3 em
<https://wiki.debian.org/GDM>

Caso você não gostou do GDM3 quer o LightDM mas quer efetuar algumas alterações sem precisar instalar o Greeter
Definir o LightDM como padrão
{% highlight bash %}
dpkg-reconfigure lightdm
{% endhighlight %}

Ver as configurações definidas pra ele
{% highlight bash %}
/usr/sbin/lightdm --show-config
{% endhighlight %}

Para exibir os usuários e suas respectivas imagens em vez de escrever o nome, edite o arquivo
{% highlight bash %}
nano /etc/lightdm/lightdm.conf
{% endhighlight %}

descomente a linha greeter-hide-users e deixe-a assim
{% highlight bash %}
greeter-hide-users=false
{% endhighlight %}

Para mudar a imagem de fundo, tenha conhecimento de o caminho é
{% highlight bash %}
/usr/share/images/desktop-base/
{% endhighlight %}

E para mudá-la use o comando
{% highlight bash %}
update-alternatives --config desktop-background
{% endhighlight %}

Mais informações sobre LightDM em <https://wiki.debian.org/LightDM>

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



