---
layout: post
title: "O Que Fazer Após Instalar o Gentoo Linux"
date: 2017-07-17 16:23:43
image: '/assets/img/gentoo/gentoo-install-03.jpg'
description: "Algumas dicas de como instalar Interface Gráfica e configurações do sistema, logo após ser instalado."
tags:
- gentoo
- gnulinux
---

> A qualidade da gravação do vídeo que está logo apó aos comandos não ficou muito boa por conta justamente de alguns codecs de vídeo e áudio que precisam se instalados e configurados, no entanto, isso tem um lado positivo por se tratar de uma boa análise a ser feita também após instalação, que eu não me atentei a fazer, mas serão feitas nas etapas posteriores. Segue um resumo do que foi feito nesse capítulo da Série [#VamosUsarGentoo](https://goo.gl/7PyqZe)

 Para configurar o teclado para Português Brasileiro edite o arquivo __/etc/conf.d/keymaps__ e altere a linha que contém __keymap="us"__ por __keymap="br-abnt2"__ , ou use o comando abaixo
{% highlight bash %}
sed -i 's/keymap\=\"us\"/keymap\=\"br\-abnt2\"/' /etc/conf.d/keymaps
{% endhighlight %}

 Crie uma tabela __fstab__ para seu sistema, lembrando que você também pode adicionar outros dispositivos e/ou partições, caso desje. Edite o arquivo __/etc/fstab__
{% highlight bash %}nano /etc/fstab{% endhighlight %}

E cole o seguinte conteúdo abaixo trocando o __NUM__ pelo número da partição de onde está instalado seu [Gentoo](http://terminalroot.com.br/tags#gentoo) e sua __swap__

> __/dev/sda5   /     ext4   noatime  0 1__
>
> __/dev/sda6   none  swap   sw       0 0__

 Se ainda estiver no __chroot__ crie o _root_ para seu sistema como o comando __passwd__ digite sua senha quando solicitado e repita quando solitado novamente. E para criar um _normal user_ para você, use o comando abaixo
{% highlight bash %}
useradd -m -G users,wheel,audio,video -s /bin/bash [NOME_DO_SEU_USUÁRIO]
{% endhighlight %}

 Para Configurar linguagem do seu sistema, configure os seguintes arquivo, como os comandos abaixo
{% highlight bash %}
[[ $(grep LINGUAS /etc/portage/make.conf) ]] || echo 'LINGUAS="pt_BR"' >> /etc/portage/make.conf
echo -e "pt_BR ISO-8859-1\npt_BR.UTF-8 UTF-8" >> /etc/locale.gen
[[ $(grep 'pt_BR' /etc/env.d/02locale) ]] || echo echo -e "pt_BR ISO-8859-1\npt_BR.UTF-8 UTF-8" >> /etc/env.d/02locale
{% endhighlight %}

 Configure o relógio e depois ajuste a hora com o comando __date_ conforme o vídeo
{% highlight bash %}
sed -i 's/clock\=\"UTC\"/clock\=\"local\"' /etc/conf.d/hwclock
{% endhighlight %}

 Configure o domínio e coleque o nome do domínio com o nome que você deseja, alterando a palavra __NOME_QUE_VOCÊ_DESEJAR__ _(Obs.: Este ponto foi esquecido no vídeo)_
{% highlight bash %}
echo -e 'dns_domain_lo="NOME_QUE_VOCÊ_DESEJAR"\nconfig_enp1s0="dhcp"'
{% endhighlight %}

 Instale aplicativos essenciais pra sua rede e mais aqueles que desejar
{% highlight bash %}
emerge --ask net-misc/netifrc
emerge --ask net-misc/dhcpcd
emerge --ask www-client/firefox-bin
{% endhighlight %}

> Não esqueça de pôr eles na inicialização do ambiente, exemplo abaixo para o dhcpcd
{% highlight bash %}
rc-update add dhcpcd default
{% endhighlight %}

 Instale o ambiente gráfico MATE Desktop
{% highlight bash %}
eselect profile set 3 # rode primeiro esse comando
emerge --ask x11-base/xorg-server # instale antes o xorg
emerge --ask mate-base/mate # por último esse
{% endhighlight %}

> Depois criei um arquivo __.xinitrc__ no seu diretório __~/__ do seu usuário com o comando abaixo
{% highlight bash %}
echo 'exec ck-launch-session dbus-launch mate-session' > ~/.xinitrc
{% endhighlight %}

 __POSSÍVEIS PROBLEMAS__

> Se houver problemas pedindo pra atualizar seu /etc/portage, rode o comando abaixo
{% highlight bash %}
env-update && source /etc/profile && etc-update --automode -5
{% endhighlight %}

> Se houver problema ao instalar o MATE, ou seja, ao compilar algum pacote, como aconteceu comigo pra passar pelo pacote __numpy__ , mascare o pacote, forçando o Portage instalar uma versão mais recente, conforme foi detalhado no vídeo
{% highlight bash %}
echo "<dev-python/numpy-1.9.3" > /etc/portage/package.mask/numpy
{% endhighlight %}

## VEJA O VÍDEO PARA INFORMAÇÕES MAIS COMPLETAS
## Assista o vídeo

# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=O98MRx31lvU)


## Links Úteis

<https://wiki.gentoo.org/>

[#VamosUsarGentoo](https://goo.gl/7PyqZe)

# Faça nosso curso gratuito de Shell Bash e adquira todo conteúdo nesse link
<http://www.terminalroot.com.br/shell/>

## Deixe seu comentário!

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



