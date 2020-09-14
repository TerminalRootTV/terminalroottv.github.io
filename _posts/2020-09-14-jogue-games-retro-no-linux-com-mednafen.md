---
layout: post
title: "Jogue Games Retrô no Linux com Mednafen"
date: 2020-09-14 12:52:59
image: '/assets/img/games/mednafen.jpg'
description: 'Mednafen é um emulador de linha de comando para muitos sistemas diferentes.'
icon: 'dashicons:games'
iconname: 'games'
tags:
- games
- jogos
---

![Jogue Games Retro no Linux com Mednafen](/assets/img/games/mednafen.jpg)

Eu assim como todos os outros mortais também sou fã de [games](https://terminalroot.com.br/tags#games) , só que eu não me adapatei muito aos novos games e as novas plataformas.

As vezes eu ainda arrisco no Wii e jogos modernos de PC com meu filho, mas eu me divirto mesmo com os jogos retrô.

Antigamente eu usava os emuladores: **Gens** para o Mega-Drive, **ZNES** para o Super Nintendo e **Stella** para o Atari. Mas alguns desses emuladores foram descontinuados e eu achava ruim possuir 3 instalados para cada console.

Cheguei a tentar o [Retroarch](https://www.retroarch.com/) e outros. Mas encontrei alguns bugs bizarros, pelo menos pro sistema que eu uso: [Gentoo](https://terminalroot.com.br/tags#gentoo).

Daí navegando nas opções de emuladores da [documentação do Gentoo](https://wiki.gentoo.org/wiki/Games/emulation), conheci o [Mednafen](https://mednafen.github.io/). Pra testar primeiro testei no [Ubuntu](https://terminalroot.com.br/tags#ubuntu) que eu tenho em outra partição e segui o tutorial do [OSistemático](http://www.osistematico.com.br/2017/12/jogue-os-classicos-do-mega-drive-no.html) e deu certo.

Mas precisei ajustar o arquivo de configuração do Mednafen na mão porque a versão gráfica ainda possui alguns limites.

E decidi compartilhar com vocês aqui como instalar no Ubuntu e no Gentoo, além de configurações que não encontrei na internet e tive que me virar pra descobrir.

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

# Introdução

[Mednafen](https://mednafen.github.io/) é um emulador de linha de comando para muitos sistemas diferentes. Possui suporte total para gráficos OpenGL e SDL, jogo em rede, configuração de entrada remapecável, suporte para joystick e teclado, estados de salvamento, retrocesso do jogo, reprodução de GSF e capturas de tela. Os sistemas suportados pela Mednafen são:
+ Atari Lynx
+ Neo Geo Pocket
+ Neo Geo Pocket Color
+ WonderSwan
+ Game Boy
+ Game Boy Color
+ Game Boy Advance
+ Nintendo Entertainment System/Famicom
+ Super Nintendo Entertainment System/Super Famicom
+ Virtual Boy
+ PC Engine/TurboGrafx 16 (CD)
+ SuperGrafx
+ PC-FX
+ Sega Game Gear
+ Sega Genesis/Megadrive
+ Sega Master System
+ Sega Saturn
+ Sony PlayStation

---

# Instalação no Ubuntu
Como eu disse para vocês eu testei também no Ubuntu e segui esses passos:
Instalei o emulador e a interface gráfica para escolher o consoole, configurações, games,...

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

{% highlight bash %}
sudo apt install mednafen mednaffe
{% endhighlight %}

E depois abri ele pelo Dash digitando: **mednaffe**. E funcionou legal, mas percebi que o Mega-Drive, logo o que eu mais gosto 😞 , só era possível jogar com 3 botões e deixei pra resolver isso no Gentoo que me sinto mais à vontade para resolver esses tipos de problemas relacionados à investigação !

---

# Instalação no Gentoo
Bom, no Gentoo também foi simples a instalação, mas teve algumas diferenças. Primeiramente compilei os pacotes:
- `games-emulation/mednafen` - Emulador.
- `games-emulation/mednaffe` - Interface para configuração do emulador.
No Gentoo ainda há o `games-server/mednafen-server` que é um servidor para o Mednafen.

Após compilar e instalar me deparei com o primeiro problema. A versão atual(de acordo com a data que eu testei) é a *0.9.46* e o Mednaffe não abre para essa versão.

Daí fui pesquisar [nesse link](https://packages.gentoo.org/packages/games-emulation/mednafen) se havia um `ebuild` novo, o mantenedor disse que ainda não foi implementada, mas que é possível atualizar diretamente:

![A versão 1.24.3 está disponível no upstream. Por favor, considere atualizar!](/assets/img/games/update-mednafen-gentoo.png)

Então baixei a nova versão e compilei, mas antes renomeie a versão anterior para que o Mednaffe pudesse pegar do novo caminho:
> Lembrando que é **64-bit**, para Linux só há essa opção.

{% highlight bash %}
su -c "mv /usr/bin/mednafen /usr/bin/mednafen_old"
wget https://mednafen.github.io/releases/files/mednafen-1.21.3.tar.xz
tar Jxvf mednafen-1.21.3.tar.xz
cd mednafen
./configure
make
su -c "make install"
{% endhighlight %}

Prontinho, a versão agora é **1.21.3**:
{% highlight bash %}
mednafen --version
Starting Mednafen 1.21.3
 Build information:
   Compiled with gcc 9.3.0
   Compiled against zlib 1.2.11, running with zlib 1.2.11(flags=0x000000a9)
   Compiled against SDL 2.0.12(hg-13609:34cc7d3b69d3), running with SDL 2.0.12(hg-13609:34cc7d3b69d3)
   Running with libsndfile-1.0.29
 Base directory: ${HOME}/.mednafen
 Emulation modules: nes snes gb gba pce lynx md pcfx ngp psx ss ssfplay vb wswan sms gg snes_faust pce_fast demo cdplay
 Opening lockfile...
 Loading settings from "${HOME}/.mednafen/mednafen.cfg"...
  Loaded 7396 valid settings and 129 unknown settings.
Unrecognized argument: --version
{% endhighlight %}

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

Então consegui abrir o Mednaffe:

![Mednaffe rodando](/assets/img/games/mednaffe-running.png)

Adicionei uma ROM em **File > Open ROM** , lembrando que não precisa descompactar a ROM que você baixou. Um site legal pra fazer download de jogos/ROMs é o [Cool ROM](https://coolrom.com.au/) , se quiser pesquisar games de um console específico vá em **Arquivos ROM**, [aqui](https://coolrom.com.au/roms/genesis/) um exemplo de link para pesquisar e encontrar jogos para o Mega-Drive.

Bom, até aí tudo certo, mas então apareceu uma "nova barreira", o Mega-Drive só "enxergava" 3 botões, mas consegui resolver esse problema e vou lhe mostrar como resolvi no tópico abaixo.

# Configurando o Mega-Drive para 6 Botões
Bom, você pode configurar: Fullscren, teclado, ... de acordo com o console que você deseja customizar através do Mednaffe indo na aba **Systems**, selecionando o console e na aba **Input** clicar em **Controller Setup** e definir as teclas que você deseja para ser: Pra cima, →, ↓, ←, botão: A, B, C e start.

Mas há uma limitação na parte gráfica(Mednaffe) que não é possível configurar os botões: X, Y e Z, assim como o desenvolvedor [disse aqui](https://forum.fobby.net/index.php?t=msg&&th=1637&goto=5354#msg_5354).

O diretório de configuração do Mednafen fica em: `~/.mednafen` e o arquivo principal é o `~/.mednafen/mednafen.cfg` e ele é gerado assim que você abre um game para rodar. Você pode obter toda documentação [nesse link](https://mednafen.github.io/documentation/).

Segundo há um comentário de outro membro do fórum, basta você editar o arquivo de configuração e definir para `gamepad6`, mas não ficou bem claro, então vou resumir:
+ **1º** - No arquivo de configuração `~/.mednafen/mednafen.cfg` as linhas referentes ao Mega-Drive possuem início: **md** de **M**ega**D**rive depois é seguido de `input` em seguida a porta, nesse caso o número do controle, para o player 1 seria: `port1 gamepad` e depois seguem as linhas subsequentes com o mesmo padrão com que com novos parametros que definem as teclas.

Mas a linha que não possuem novos parametros é justamente a que define qual modelo de teclado você deseja e por padrão ela está somente `gamepad`. se quiser que o Mega Drive aceite 6 botões é s'substituir `gamepad` por `gamepad6`, se quiser rode esse comando pelo terminal que fará isso automáticamente:
{% highlight bash %}
sed -i 's/^md.input.port1 gamepad$/md.input.port1 gamepad6/' ~/.mednafen/mednafen.cfg
{% endhighlight %}

Mas as teclas possuem um numeração peculiar diferente das saídas do `showkey` por exemplo. Então, você terá que descobrir alterar pela parte gráfica e descobrindo os números.

Por exemplo, no meu caso eu defini as teclas do teclado: `a`, `s` e `d` para serem os botões **A**, **B** e **C** do Mega Drive. E as teclas do tecldo: `x`, `c` e `v` para serem o **X**, **Y** e **Z** do Mega Drive. E as teclas direcionais para serem: para cima, para baixo, ...

Se quiser poupar tempo, use meu arquivo de configuração, basta rodar esse comando:
{% highlight bash %}
wget https://terminalroot.com.br/downs/mednafen.cfg -O ~/.mednafen/mednafen.cfg
{% endhighlight %}

E pronto, abra e tente jogar um games e utilize as teclas que eu informei!

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Futuramente vou gravar uns *gameplays* e postar no [meu canal da Twitch](https://www.twitch.tv/TerminalRootTV), segue lá se quiser acompanhar.

Ah! Quase ia esquecendo, **Alt + Enter** altera para tela cheia! 😃 Espero ter ajudado!

![Play Mednafen Gentoo bspwm](/assets/img/games/mednafen-mega-drive-play.png)

# Fui!

