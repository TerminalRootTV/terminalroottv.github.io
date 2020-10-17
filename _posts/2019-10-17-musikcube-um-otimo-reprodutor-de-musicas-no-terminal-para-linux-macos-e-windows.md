---
layout: post
title: "Musikcube - Reprodutor de Músicas no Terminal para Linux, macOS e Windows"
date: 2019-10-17 11:45:51
image: '/assets/img/multimidia/musikcube.png'
description: 'É mais uma opção fácil de instalar e um design interessante e intuitivo.'
tags:
- musikcube
- music
- player
---

![Musikcube - Um Ótimo Reprodutor de Músicas no Terminal para Linux, macOS e Windows](/assets/img/multimidia/musikcube.png)

Nós já mostramos para vocês algumas opções de Reprodutor de Músicas(Music Player) , tais como podem ser encontrados em:
+ [Instale e Configure o ncmpcpp e mpd no seu Linux](https://terminalroot.com.br/2019/07/instale-e-configurar-o-ncmpcpp-e-mpd-no-seu-linux.html) 
+ [Como Exibir Gráficos de Música no Desktop do seu Linux](https://terminalroot.com.br/2019/06/como-exibir-graficos-de-musica-no-desktop-do-seu-linux.html)
+ [Os 8 Melhores Reprodutores de Áudio para Debian GNU/Linux](https://terminalroot.com.br/2016/05/os-8-melhores-reprodutores-de-audio.html) 

Mas o [Musikcube](https://musikcube.com/) é mais uma opção, fácil de instalar e um design interessante e intuitivo.

## Introdução

Além de reprodutor , o Musikcube também é: um mecanismo de áudio, biblioteca, reprodutor e servidor de plataforma cruzada e baseado em terminal. O musikcube compila e roda facilmente no [Linux](https://terminalroot.com.br/linux), [Mac](https://terminalroot.com.br/2018/03/como-instalar-o-mac-os-x-em-virtualbox-no-linux.html) e [Windows](https://terminalroot.com.br/2018/03/como-usar-o-shell-bash-no-windows.html) . ele também roda bem em um Raspberry Pi com [Raspbian](https://www.raspbian.org) e pode ser configurado como um servidor de streaming de áudio.

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

## Instalação

No meu caso, eu compilei e a única dependência que acusou aqui que eu precisei instalar foi a [net-libs/libmicrohttpd](https://packages.gentoo.org/packages/net-libs/libmicrohttpd) `emerge libmicrohttpd`. Isso porque eu uso [Gentoo](https://terminalroot.com.br/2017/05/como-instalar-o-gentoo.html) e ele já possui todas as ferramentas para construir softwares, é especialista nisso! =) Então eu só fiz isso:

{% highlight bash %}
git clone https://github.com/clangen/musikcube.git --recursive
cd musikcube
cmake -G "Unix Makefiles" .
make
sudo make install
{% endhighlight %}

Se você quiser compilar, sugiro você ler essa parte da documentação <https://github.com/clangen/musikcube/wiki/building> que foi justamente onde eu encontrei as informações para proceder .

<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

### Outras distro Linux

Mas a parte boa é que além de compilar, você pode instalar via pacote com arquivos pré-compilados:
+ No [Ubuntu](https://terminalroot.com.br/2019/10/remaster-ubuntu-buntuwm-linux.html), [Debian](https://terminalroot.com.br/2016/05/conheca-o-devuan-um-debian-sem-systehtml.html), [Linux Mint](https://terminalroot.com.br/2019/07/como-customizar-seu-linux-mint-com-i3-polybar-rofi.html) e similares
> Para baixar o arquivo referente à sua arquitetura, sugiro você consultar a paǵina de downloads para arquivos [.deb](https://terminalroot.com.br/2014/12/como-criar-pacotes-deb.html) : <https://github.com/clangen/musikcube/releases>
Nesse caso será para **64-bit** e [Ubuntu versão Bionic Beaver](https://terminalroot.com.br/2019/01/ubuntu-i3gaps-albert-cava-polybar.html), mas provavelmente funciona em versões superiores, até porque, se não me engano, ele é LTS
{% highlight bash %}
wget https://github.com/clangen/musikcube/releases/download/0.65.0/musikcube_0.65.0_ubuntu_bionic_amd64.deb
sudo dpkg -i musikcube_0.65.0_ubuntu_bionic_amd64.deb
sudo apt-get install -f
{% endhighlight %}

+ No [Arch Linux](https://terminalroot.com.br/2018/08/pos-install-arch-linux-i3-polybar-pywal.html) você pode usar o [yaourt](https://archlinux.fr/yaourt-en)
{% highlight bash %}
yaourt -S musikcube
{% endhighlight %}

No [guia de instalação](https://github.com/clangen/musikcube/wiki/installing) é ainda mostrado para outras [distros](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=distro) e também para o [FreeBSD](https://terminalroot.com.br/2017/09/por-que-freebsd.html): <https://github.com/clangen/musikcube/wiki/installing>

<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:50px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

### macOS e Windows

+ No **Mac** você também pode instalar via homebrew da seguinte maneira:
{% highlight bash %}
brew tap clangen/musikcube
# Ou somente
brew install musikcube
{% endhighlight %}

+ No **Windows** você também pode instalar via chocolatey da seguinte maneira:
{% highlight bash %}
choco install musikcube
{% endhighlight %}

## Utilização

Assim que você instala, para rodar o player basta abrir um terminal e rodar:
{% highlight bash %}
musikcube
{% endhighlight %}

Ele automáticamente cria um subdiretório na raíz da sua pasta pessoal dentro do dirtório *config*: `~/.config/musikcube/` e lhe avisa dessa criação:
![Musikcube Diretório](/assets/img/multimidia/start-musikcube.jpg)

Após isso você precisa navegar até o diretório que está suas músicas, utilizando as teclas direcionais do seu teclado: **→ ↓ ↑ →** e se você entrar no diretório, a pasta (mesmo que exista música) , ele mostraá vazio. Então você precisa (com a pasta selecionada), teclar **s** para adicionar primeiramente a biblioteca.

Após isso você pode teclar a letra **a** e voltar ao painel do player e entrar no diretório, selecionar e tocar as músicas pressionando a tecla **Backspace** do seu teclado.
![Musikcube S](/assets/img/multimidia/dir-musikcube.jpg)
![Musikcube Empty](/assets/img/multimidia/empty-dir-musikcube.jpg)
![Musikcube Músicas](/assets/img/multimidia/play-musikcube.jpg)

Existem diversos atalhos, dicas ... que você pode usar, por exemplo:

+ **~** - Alternar para a visualização do console.
+ **a** - Alternar para a exibição da biblioteca.
+ **s** - Alternar para a visualização de configurações.
+ **ESC** - Foca/desfoca a barra de comando (a barra inferior que contém configurações, biblioteca, console, opções de encerramento)
+ **TAB** - Selecione a próxima janela
+ **SHIFT + TAB** - Selecionar janela anterior
+ **ENTER** - Ativa ou alterna o item selecionado
+ **M-ENTER** - Mostrar menu de contexto para o item selecionado (M significa META, que fica à esquerda da tecla ALT. Portanto, pressione ALT + M para exibir o menu de contexto)
+ **CIMA, BAIXO, ESQUERDA, DIREITA, PAGE_UP, PAGE_DOWN, HOME e END** devem se comportar conforme o esperado.
+ **CTRL + D** - Sai do Musikcube.

Para mais informações consulte o [guia do usuário](https://github.com/clangen/musikcube/wiki/user-guide) , a [página oficial](https://musikcube.com/) e o [GitHub](https://github.com/clangen/musikcube/) do [Musikcube](https://github.com/clangen/musikcube/).

<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:block"
data-ad-format="autorelaxed"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="9652691879"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

## Asciinema

<img src="https://camo.githubusercontent.com/9958ed346d55205b2595532faa0275e84e762b4c/68747470733a2f2f61736369696e656d612e6f72672f612f3132393734382e706e67" alt="asciicast" data-canonical-src="https://asciinema.org/a/129748.png" style="max-width:100%;">

## Links úteis

+ <https://terminalroot.com.br/2019/07/instale-e-configurar-o-ncmpcpp-e-mpd-no-seu-linux.html>
+ <https://terminalroot.com.br/2019/06/como-exibir-graficos-de-musica-no-desktop-do-seu-linux.html>
+ <https://terminalroot.com.br/2016/05/os-8-melhores-reprodutores-de-audio.html>
+ <https://musikcube.com/>
+ <https://terminalroot.com.br/linux>
+ <https://packages.gentoo.org/packages/net-libs/libmicrohttpd>
+ <https://github.com/clangen/musikcube/wiki/building>
+ <https://terminalroot.com.br/2019/10/remaster-ubuntu-buntuwm-linux.html>
+ <https://terminalroot.com.br/2014/12/como-criar-pacotes-deb.html>
+ <https://terminalroot.com.br/2019/01/ubuntu-i3gaps-albert-cava-polybar.html>
+ <https://github.com/clangen/musikcube/releases/download/0.65.0/musikcube_0.65.0_ubuntu_bionic_amd64.deb>
+ <https://terminalroot.com.br/2018/08/pos-install-arch-linux-i3-polybar-pywal.html>
+ <https://github.com/clangen/musikcube/wiki/installing>
+ <https://github.com/clangen/musikcube/wiki/user-guide>
+ <https://www.ostechnix.com/musikcube-cross-platform-commandline-music-player/>
    


