---
layout: post
title: "Como Exibir Gráficos de Música no Desktop do seu Linux"
date: 2019-06-16 11:57:47
image: '/assets/img/multimidia/musica-com-grafico.jpg'
description: 'Instale um visualizador de espectro para áudio usado para janelas ou planos de fundo da área de trabalho.'
tags:
- multimidia
- audio
- linux
---

![Como Exibir Gráficos de Música no Desktop do seu Linux](/assets/img/multimidia/musica-com-grafico.gif)

### Instale um visualizador de espectro para áudio usado para janelas ou planos de fundo da área de trabalho.

Estamos nos referindo ao [Glava](https://github.com/wacossusca34/glava).

## Instalação

**Qualquer Distro**

Para instalar no seu [Linux](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=Linux) independente da distribuição, rode os comandos na ordem:

> Lembre-se de já possuir instalado o [Git](https://terminalroot.com.br/git), o [Meson](https://mesonbuild.com/) e o [Ninja](https://ninja-build.org/)
{% highlight bash %}
git clone https://github.com/wacossusca34/glava
cd glava
CFLAGS="-march=native" meson build
ninja -C build
cd build
sudo meson install
glava
{% endhighlight %}

**Ubuntu, Mint e derivados**

{% highlight bash %}
sudo add-apt-repository ppa:linuxuprising/apps
sudo apt update
sudo apt install glava
{% endhighlight %}

**Fedora**

{% highlight bash %}
sudo dnf copr enable ycollet/linuxmao
sudo dnf install glava
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


Se após instado você rodar `glava` no terminal, já abrirá uma janela e se houver um áudio tocando, os gráficos já aparecerão. Mas Se você quiser que apareça como fundo do seu desktop, primeiramente você precisa copiar as configurações padrão para seu diretório pessoal com o comando:

{% highlight bash %}
glava --copy-config
{% endhighlight %}

E depois abrir o arquivo `~/.config/glava/rc.glsl` e substitutir a linha `#request setgeometry 0 0 600 400` pelo tamanho do seu monitor, exemplo: o meu é 1920x1080, logo, nessa linha eu deixo assim: `#request setgeometry 0 0 1920 1080`.

E para rodar no fundo inteiro do seu desktop, use o o parâmetro **--desktop**

{% highlight bash %}
glava --desktop
# Ou visualizar os gráficos em modo círculo, por exemplo
glava --desktop --force-mod=circle
{% endhighlight %}

Se quiser você ainda pode de diversas maneiras "*startar*" o Glava sempre que rodar um áudio! 😀️

## Veja o Vídeo

<iframe width="920" height="400" src="https://www.youtube.com/embed/RMqq91uZtnI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


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


## Links Úteis

+ <https://github.com/wacossusca34/glava>
+ <https://terminalroot.com.br/git>
+ <https://mesonbuild.com/>
+ <https://ninja-build.org/>

## Para remover totalmente o Glava do seu computador rode esses comandos na ordem

{% highlight bash %}
sudo rm -rf /etc/xdg/glava/
rm -rf ~/.config/glava/
sudo rm /usr/local/bin/glava*
{% endhighlight %}


## Fala aí nos comentários o que achou do Glava !


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

