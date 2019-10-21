---
layout: post
title: "Instale um Visualizar Gráfico de Música no seu Linux"
date: 2019-10-21 18:11:28
image: '/assets/img/multimidia/vis.png'
description: 'Mais uma opção muito boa para exibição de gráficos da áudio. 🎼️'
tags:
- multimidia
- musica
- vis
- clivisualizer
---

![Instale um Visualizar Gráfico de Música no seu Linux](/assets/img/multimidia/vis.png)

Aqui no blog já mostramos dois visualizadores de áudio:
+ [Como Exibir Gráficos de Música no Desktop do seu Linux](https://terminalroot.com.br/2019/06/como-exibir-graficos-de-musica-no-desktop-do-seu-linux.html)
+ [Instale e Configure o ncmpcpp e mpd no seu Linux](https://terminalroot.com.br/2019/07/instale-e-configurar-o-ncmpcpp-e-mpd-no-seu-linux.html) , esse possui o *music vizualize* embutido nele.

+ Também instalamos o **CAVA**(outro visualizador) nesse tutorial: [Ubuntu + i3-gaps + Albert + Cava + Polybar](https://terminalroot.com.br/2019/01/ubuntu-i3gaps-albert-cava-polybar.html)

Além de algumas opções de player como:
+ [Musikcube - Reprodutor de Músicas no Terminal para Linux, macOS e Windows](https://terminalroot.com.br/2019/10/musikcube-um-otimo-reprodutor-de-musicas-no-terminal-para-linux-macos-e-windows.html)
+ [Os 8 Melhores Reprodutores de Áudio para Debian GNU/Linux](https://terminalroot.com.br/2016/05/os-8-melhores-reprodutores-de-audio.html)

Nesse último link há um player bem minimalista, [mpg123](https://terminalroot.com.br/2016/05/os-8-melhores-reprodutores-de-audio.html#3---mpg123) que vamos tocar as músicas com ele, nesse exemplo, mas use o que lhe convém! 😃

<!-- RETANGULO LARGO -->
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

## Introdução

Para exibir os gráficos das músicas que estiverem tocando, vamos utilizar o [cli-visualizer](https://github.com/dpayne/cli-visualizer) ou **vis** (o nome do comando) que é um visualizador de linha de comando. Suporta **mpd**, e com suporte experimental para **alsa** e **pulseaudio**.

## Instalação

Antes de mais nada, verifique se seu sistema possui as dependências(só são duas, bem pequenas por sinal, além do [git](https://terminalroot.com.br/git) ) para que o **vis** funcione corretamente. 

No [Gentoo](https://terminalroot.com.br/2017/05/como-instalar-o-gentoo.html) e [Funtoo](https://terminalroot.com.br/2018/10/como-instalar-o-funtoo-pelo-ubuntu-ou-linux-mint.html) , rode esses comando:
{% highlight bash %}
emerge fftw dev-vcs/git ncurses cmake
{% endhighlight %}

No [Debian](https://terminalroot.com.br/2016/05/conheca-o-devuan-um-debian-sem-systehtml.html), [Ubuntu](https://terminalroot.com.br/2019/10/remaster-ubuntu-buntuwm-linux.html) e [Linux Mint](https://terminalroot.com.br/2019/07/como-customizar-seu-linux-mint-com-i3-polybar-rofi.html) rode esses comando:
{% highlight bash %}
sudo apt install libfftw3-dev libncursesw5-dev git
{% endhighlight %}

Use o *search* do gerenciador de repositório da sua distro para encontrar o nome do pacote na sua distro, exemplos:
{% highlight bash %}
pacman -Ss fftw
yum search ncurses
{% endhighlight %}

Após instalar as dependências, agora vamos clonar o repositório do **cli-visualizer/vis** e instalar.
{% highlight bash %}
cd /tmp
git clone https://github.com/dpayne/cli-visualizer
cd cli-visualizer
./install.sh
{% endhighlight %}
> Ao final da compilação, ele pedirá sua senha de **sudo** para instalar.

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

## Utilizando

Como havia dito vamos rodar primeiro , exemplo:
{% highlight bash %}
mpg123 minha-musica.mp3
{% endhighlight %}

E numa outra janela de terminal, rode o comando:
{% highlight bash %}
vis
{% endhighlight %}

A saída será similar a da imagem abaixo.
![Instale um Visualizar Gráfico de Música no seu Linux](/assets/img/multimidia/vis.jpg)


Se quiser sair do **vis** tecle a letra **q**
> Se você encerrar ou acabar a música , o **vis** irá parar com a animação, mas ainda estará rodando.

Você ainda pode configurar as cores da animação do **vis** à sua maneira, para isso edite o arquivo: `~/.config/vis/colors/rainbow`, perceba que as cores estão separadas por linha e está em formato hexadecimal, ou seja, café com açucar ☕ e para alterar as configurações, caso você queira salvar esse arquivo **rainbow** com outro nome (criar um tema) , altere o nome do arquivo em: ` ~/.config/vis/config` .

Qualquer dúvida, posta aí nos comentários!

Abraços!

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

## Links úteis
+ GitHub do Vis: <https://github.com/dpayne/cli-visualizer#cli-visualizer>
+ Imagem da chamada: <https://linuxundich.de/gnu-linux/audio-visualizer-terminal-cli-visualizer/>
    
