---
layout: post
title: "Como Compilar o Kernel do Zero no Gentoo Linux"
date: 2017-07-09 20:27:47
image: '/assets/img/gentoo/gentoo-install-02.jpg'
description: "O núcleo em torno do qual todas as distribuições são criadas é o kernel Linux. Ele é a camada entre os programas de usuários e o hardware do sistema. O Gentoo provê aos seus usuários diversos possíveis fontes do kernel."
main-class: 'web'
tags:
- gentoo
- linux
---

> O núcleo em torno do qual todas as distribuições são criadas é o [kernel Linux](https://www.kernel.org/). Ele é a camada entre os programas de usuários e o hardware do sistema. O [Gentoo](https://www.gentoo.org/) provê aos seus usuários diversos possíveis fontes do kernel.

Para sistemas baseados em __x86__ o Gentoo recomenda o pacote __sys-kernel/gentoo-sources__.

Escolha um fonte do kernel apropriado e instale-o usando o __emerge__
{% highlight bash %}
emerge --ask sys-kernel/gentoo-sources
{% endhighlight %}

Isso irá instalar os fontes do kernel Linux em __/usr/src/__ no qual um __link simbólico__ chamado __linux__ estará apontando para o fonte do kernel instalado:
{% highlight bash %}
ls -l /usr/src/linux

lrwxrwxrwx    1 root   root    09 Oct 17 11:04 /usr/src/linux -> linux-4.9.34-gentoo
{% endhighlight %}

É chegada a hora de configurar e compilar os fontes do kernel. Há duas formas de se fazer isso:

+ O kernel é manualmente configurado e compilado, ou
+ é usada uma ferramenta chamada genkernel para automaticamente compilar e instalar o kernel Linux

Configurar manualmente um kernel é geralmente visto como o ~~procedimento mais difícil que um usuário Linux pode fazer~~. Nada mais falso -- depois de configurar algumas vezes o kernel ninguém irá se lembrar que era difícil.

Porém, uma coisa é verdade: é vital conhecer o sistema quando um kernel é configurado manualmente. A maioria das informações pode ser coletada fazendo emerge no __sys-apps/pciutils__ que contém o comando __lspci__
{% highlight bash %}
emerge --ask sys-apps/pciutils
{% endhighlight %}

Uma outra fonte de informação do sistema é executar o __lsmod__ para ver quais módulos do kernel o CD de instalação usa pois isso pode dar dicas sobre o que habilitar.

Agora vá para o diretório dos fontes do kernel.
{% highlight bash %}
cd /usr/src/linux
{% endhighlight %}

+ __01__ - Antes de configurá-lo, rode
{% highlight bash %}
make defconfig # olddefconfig, dependendo da etapa que vc está
{% endhighlight %}

+ __02__ - Entre no menu para configurá-lo, veja o vídeo ao final dessa postagem
{% highlight bash %}
make menuconfig
{% endhighlight %}

+ __03__ - Compile
{% highlight bash %}
make # use -j 2 , se vc possui um processador com 2 núcleos, isso agiliza a compilação
{% endhighlight %}

+ __04__ - Compile os módulos
{% highlight bash %}
make modules_install
{% endhighlight %}

+ __05__ - Copie o kernel, map, imagem,... pro boot do sistema
{% highlight bash %}
make install
{% endhighlight %}

Depois baixe e compile o grub (ou o lilo), configure e instale-o! Case deseje você também pode usar o [genkernel](https://wiki.gentoo.org/wiki/Handbook:X86/Full/Installation/pt-br#Alternativa:_Usando_o_genkernel)!

## Assista o vídeo

# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=lW4MqZamXQY)



## Links Úteis

<https://www.kernel.org/>

<https://www.gentoo.org/>

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

