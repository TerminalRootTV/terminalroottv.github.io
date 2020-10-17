---
layout: post
title: "OpenBSD - O Sistema mais Seguro do Mundo - Instalação e Configuração"
date: 2018-07-18 11:36:10
image: '/assets/img/bsd/openbsd.jpg'
description: 'Nesse vídeo também customizamos o XFCE, além de dicas adicionais de compilação, Shell e muitas outras coisas.'
tags:
- shellscript
- openbsd
- bsd
- xfce
- slim
---


### Nesse vídeo também customizamos o XFCE adicionando temas e ícones, além de dicas adicionais de compilação padrão, customização do Shell e muitas outras dicas interessantes.

## Introdução

O [OpenBSD](https://www.openbsd.org/) é um sistema operacional livre e de código aberto, semelhante ao Unix(http://terminalroot.com.br/2016/11/blog-linux-unix.html), originário da Berkeley Software Distribution (**BSD**), um derivado da Research Unix desenvolvido na Universidade da Califórnia, em Berkeley . No final de 1995, [Theo de Raadt](https://www.theos.com/deraadt/) se separou do [NetBSD](https://www.netbsd.org/) . Além do sistema operacional como um todo, o projeto mantém versões portáveis ​​de muitos subsistemas, principalmente o [OpenSSH](https://www.openssh.com/) , que estão disponíveis como pacotes em outros sistemas operacionais.

Os __aprimoramentos de segurança__ do OpenBSD , a criptografia integrada e o PF ( filtro de pacotes ) são adequados para uso no setor de segurança, como em firewalls, __sistemas de detecção de invasão__ e gateways VPN . __Sistemas proprietários de vários fabricantes são baseados no OpenBSD__, incluindo dispositivos da Armorlogic (Profense web application firewall), Calyptix Security, GeNUA, RTMX, e .vantronix. __Versões posteriores do Services for UNIX da Microsoft__, uma extensão do sistema operacional Windows que fornece funcionalidade semelhante ao Unix , __usam grandes quantidades de código do OpenBSD__.

## Download

O download do OpenBSD pode ser obtido [nesse link](https://www.openbsd.org/faq/faq4.html#Download) onde há diversas opções, inclusive o __install__ que seria o mais recomendado para aqueles que desejam instalar via CD/DVD ou por um dispositivo USB. Se quiser escolha o [espelho](https://www.openbsd.org/ftp.html) mais próximo da sua localização e baixe com mais velocidade.

## Instalação e Configuração

No vídeo que encontra-se no final desse artigo há todos os procedimentos necessários:

+ __Instalação e configuração do OpenBSD__
+ __Instalação e customização do XFCE__
+ __Instalação e configuração dos pacotes__:

{% highlight bash %}
usermod -G wheel [usuário]
echo "export PKG_PATH=ftp://mirrors.unb.br/pub/OpenBSD/$(uname -r)/packages/$(uname -m)" >> .profile
echo 'exec startxfce4' > ~/.xinitrc
vim /etc/rc.conf
#dbus_daemon avahi_daemon
#dbus_enable=YES
{% endhighlight %}

+ [Vim](https://www.vim.org/)
+ [XFCE](https://xfce.org/)
+ [Tema](https://www.gnome-look.org/p/1184643/) e [Ícones](https://www.gnome-look.org/p/1191167/)
+ [Firefox](https://www.mozilla.org/pt-BR/firefox/)
+ [SLiM](https://github.com/iwamatsu/slim)
+ __Unzip__ `pkg_add unzip`

{% highlight bash %}
echo '/usr/local/bin/slim -d' >> /etc/rc.local
vim /etc/slim.conf
#/current_theme
#s/default/bluer
{% endhighlight %}

+ [Wget](https://www.gnu.org/software/wget/)
+ Compilação padrão do [Bash](https://www.gnu.org/software/bash/)
+ [NeoFetch](https://github.com/dylanaraps/neofetch)
+ __Shell Variáveis__

{% highlight bash %}
vim ~/.profile
export PKG_PATH=ftp://mirrors.unb.br/pub/OpenBSD/6.3/packages/amd64
export LC_ALL=pt_BR.UTF-8
export LANGUAGE=pt_BR.UTF-8
export LANG=pt_BR.UTF-8
export PS1="\e[36;1m\u\e[37;1m@\e[34;1m\h \w \e[m»\n ⤷ "
{% endhighlight %}

+ [SLiM Themes](https://github.com/adi1090x/slim_themes)
+ Adicionar diretórios da __pasta pessoal__ automaticamente

{% highlight bash %}
pkg-add xdg-user-dirs
exit
cd
xdg-user-dirs-update
{% endhighlight %}

> _Observação_: os botões de desligar e reiniciar ficam "cinzas" impedindo de usar o launcher para efetuar esses procedimentos, ainda não encontrei uma solução, apesar de haver isso na documentação:
> 
> <https://github.com/openbsd/ports/blob/master/meta/xfce/pkg/README-main> , caso ocorra com você também, tente adicionar seu usuário ao grupo __operator__ para poder usar o comando `shutdown` para desligar e rebootar o sistema:
{% highlight bash %}
usermod -G operator [usuário]
{% endhighlight %}

# [Clique Aqui para Assitir o Vídeo](https://youtu.be/NhoErMsS_Hc)

# [Conheça nosso Curso Extremamente Avançado de Shell Script Bash](http://terminalroot.com.br/shell)

## [Download de todos os arquivos](http://bit.ly/2NsgBJV)

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



