---
layout: post
title: "Como Instalar e Jogar Games MS-DOS no Linux"
date: 2019-10-30 17:34:22
image: '/assets/img/ms-dos/dosbox.png'
description: 'Com links para diversos games!'
tags:
- dosbox
- ms-dos
- windows
- games
---

![Como Instalar e Jogar Games MS-DOS no Linux](/assets/img/ms-dos/dosbox.png)

Games retrô, ASCII e modo terminal/console é minha "pira" . Aqui no blog sempre haverá mais dicas de games nesse sentido. E os games do MS-DOS não ficam fora dessa. Existe até um grupo no Facebook muito bom sobre MS-DOS que eu participo que o grupo é bem ativo e posta diversas dicas bem bacanas. Participa lá se você tiver interesse: <https://www.facebook.com/groups/2209352733/> .

Uma das formas de rodar games do MS-DOS no Linux (e a maneira mais simples, na minha opinião) é você utilizar o [DOSBox](https://www.dosbox.com/) . 

## Introdução

O DOSBox é um emulador que emula (vagamente "simula") um computador IBM PC compatível rodando em cima deste um antigo sistema operacional, o MS-DOS. Muitas placas de vídeo e placas de som originarias do IBM PC também são emuladas. Isso significa que programas feitos originalmente para o MS-DOS podem rodar em computadores modernos por via do software. O DOSBox foi projetado especialmente para executar jogos antigos. O DOSBox é um software livre escrito principalmente em C++ e distribuído sob a GNU General Public License.

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

## Instalação

A maioria das distribuições Linux já possuem o DOSBox no repositório, logo, para instalar basta utilizar o gerenciador de pacotes da sua distribuição, exemplos:
{% highlight bash %}
emerge dosbox # Gentoo, Funtoo,...
sudo apt install dosbox # Ubuntu, Debian, Mint,...
sudo yum install dosbox # Red Hat, CentOS, Fedora(use o dnf),...
sudo pacman -S dosbox # Arch, Manjaro,...
{% endhighlight %}

Após instalado, você pode procurá-lo no dashboard da sua distro ou por algum [launcher](https://terminalroot.com.br/2018/11/como-customizar-o-polybar-rofi-e-outros.html), ou simplesmente rodando via terminal o comando:
{% highlight bash %}
dosbox
{% endhighlight %}

![OSBox](/assets/img/ms-dos/dosbox-open.png)

> Encontrando o DOSBox no Dash do GNOME:
![GNOME DOSBox](/assets/img/ms-dos/gnome-dosbox.jpg)

> Encontrando em um launcher, exemplo: [Rofi]()
![Rofi Launcher DOSBox](/assets/img/ms-dos/rofi-dosbox.jpg)

O DOSBox será aberto numa tela menor e não redimensionável, no entanto, há como você alterar pressionando a combinação de teclas: **Alt + Enter** . Ou editando o arquivo de configuração que fica no seu diretório pessoal: `vim ~/.dosbox/dosbox-*.conf` e mude a linha correspondente à **fullscreen=false** para **fullscreen=true** , salve e agora quando abrir o DOSBox , o mesmo abrirá em Tela Cheia por padrão, se quiser diminuir, tecle **Alt + Enter** .

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

## Rodando um game

+ **1**. Primeiramente você precisa de um game pra testar. O mais simples é , na minha opinião é o [Mario Bros VGA](https://www.dosgames.com/game/mario-bros-vga):
![](/assets/img/ms-dos/mario.gif)
Vá até o site(<https://www.dosgames.com/game/mario-bros-vga>) e clique no botão: ![DOWNLOAD THE FREE GAME](/assets/img/ms-dos/download-the-free-game.png) Para efetuar o download do game.

Após baixar descompacte o arquivo e mova para um diretório personalizado para o DOSBox conseguir enxergar, exemplo:
{% highlight bash %}
unzip -d mario mariovga.zip
mkdir -p ~/.dosgames
mv mario/ ~/.dosgames/
{% endhighlight %}

+ **2**. Agora **dentro o DOSBox** vamos montar o diretório que a gente criou. Rode esse comando: `Z:\>mount d ~/.dosgames`, como na imagem:
> A opção **d** diz que vamos montar nosso diretório `~/.dosgames` na partição **D** do MS-DOS
> 
> *Observação:* Se não conseguir usar a tecla til(`~`) no DOSBox por conta do teclado , informe o caminho completo, exemplo: `Z:\>mount d /home/nome_do_seu_usuario/.dosgames` , a tecla dois pontos **;**  geralmente é o barra **/** quando o teclado está desconfigurado.

![MOUNT DOSBox](/assets/img/ms-dos/mount.png)

+ **3**. Após monstar tecle a letra **d:** seguida de dois pontos, automáticamente você entrará na partição **D:** que dentro dela está o diretório do seu Linux e depois é só entrar na pasta do mario: `cd mario` e executar o Mario Bros VGA com o comando: `mario.exe`, veja todos os comandos na imagem abaixo:

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

![Comandos DOSBox](/assets/img/ms-dos/commands.png)

## Dicas pro joguinho de teste Mario Bros VGA

Para jogar esse game é só esperar a introdução, depois apertar **Enter** e depois **Backspace** para iniciar, as teclas do games são:
> Tecle **1** se quiser que o Mário tenha *5 vidas* , **2** para *20 vidas* ou **3** para *80 vidas*.
+ **z** - vai para esquerda;
+ **x** - vai para direita;
+ **Alt** - Pula.

Mas se quiser modificar, no painel que mostra as teclas(logo após pressionar Enter depois da introdução) , tecle **K** e pressione as teclas que deseja para Esquerda, Direta e Pular ! 😀

A pira do game é pular com a cabeça no **POW** para derrubar as *tartaruguinhas* e quando elas estiverem com o "casco virado"(sem conseguir andar) é só se aproximar delas para derrubá-las e consequentemente eliminá-las .

É um jogo bem simples(uma versão VGA do Mário Bros, bem simplista) , mas se quiser mais games visite os sites:i
+ <https://www.dosgamesarchive.com/>
+ <https://archive.org/details/softwarelibrary_msdos_games?tab=collection>

> Dá até pra jogar online, caso queira!

Espero que tenham gostado! Abraços!
