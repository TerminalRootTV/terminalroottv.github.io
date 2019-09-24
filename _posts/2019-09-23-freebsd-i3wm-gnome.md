---
layout: post
title: "Como Instalar e Configurar o i3wm e GNOME no FreeBSD"
date: 2019-09-23 16:39:42
image: '/assets/img/'
description: 'Atendendo à dois pedidos num só vídeo/tutorial.'
main-class: 'bsd'
tags:
- freebsd
- i3wm
- gnome
---

![Como Instalar e Configurar o i3wm e GNOME no FreeBSD](/assets/img/freebsd/freebsd-i3wm-gnome.jpg)

# Como Instalar e Configurar o i3wm no FreeBSD

O [i3wm](https://terminalroot.com.br/2018/07/como-instalar-e-configurar-o-i3wm-e-o-i3blocks.html) é um dos melhores gerenciadores de janelas para sistemas baseados em [Unix](https://terminalroot.com.br/2016/11/blog-linux-unix.html) . É leve e rápido!

Para instalar no FreeBSD, via [pkg](https://www.freebsd.org/doc/pt_BR/books/handbook/pkgng-intro.html) , rode os comandos com o usuário *root*:

{% highlight bash %}
pkg update && pkg -f upgrade
pkg install xorg i3 dbus hal
{% endhighlight %}

> Se quiser mais velocidade no download, adicione um mirror do Brasil [Clique aque nesse link](https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/mirrors-ftp.html#mirrors-br-ftp) . Edite o arquivo: `vim /etc/pkg/FreeBSD.conf` e as configurações em `/usr/local/etc/pkg.conf` .

> O `dbus` e o `hal`, são opcionais, mas já instalei, pois mais pra frente vamos precisar instalá-los.

Depois entre com seu *usuário* e crie o arquivo *~/.xinitrc* , nesse caso ainda adicionei a linha: `setxkbmap -layout br -variant abnt2` para o teclado ficar em Português Brasileiro.


{% highlight bash %}
exit # user
echo -e 'setxkbmap -layout br -variant abnt2\nexec i3' > ~/.xinitrc
reboot
startx
i3-msg exit # para sair
{% endhighlight %}

Agora vamos editar o arquivo `ee /etc/rc.conf` e adicionar as linhas abaixo:

> Verifique no arquivo se o *daemon* **moused** já está habilitado, geralmente ele já está lá.

{% highlight bash %}
moused_enable="YES"
dbus_enable="YES"
hald_enable="YES
{% endhighlight %}

Depois disso, recomendo você reiniciar ,`reboot`, (apesar de já funcionar) , pra na inicialização carregar alguns *daemons*, e após reiniciar e logar, basta rodar o comando `startx` , para sair do i3 abra o terminal (SUPER+enter) e rode o comando `i3-msg exit`

Você vai perceber que a *i3bar* não terá os dados do *i3status* porque não instalamos , mas se quiser instalar , fique à vontade, ou qualquer outra *barra de status* .

> Observação: o arquivo `~/.config/i3/config` do Pkg FreeBSD é bem *cru* , logo, muitos comandos não funcionarão, por isso já dei a dica de como você sair via comando. Mas pra deixar tudo [lindo](http://files.rindo-no-maximo.webnode.com/system_preview_detail_200000280-8689687838-public/que%20lindo%20cara.jpg) , eu recomendo você usar as configurações do próximo tópico.

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

#### Resolvendo problemas, se existir

Se você estiver num sistema 32-bit (i386) , e/ou possuir uma placa de vídeo Radeon e/ou estiver qualquer problema para startar o i3 , recomendo você instalar/reinstalar os pacotes: `libX11 libXft libXinerama gcc` e tentar informar o display para o Xorg, rodando esse comando:

{% highlight bash %}
X :0 -configure
{% endhighlight %}

Será gerado um arquivo exemplo: `xorg.conf.new` no diretório raíz do usuário *root*: `/root/xorg.conf.new` e depois é só copiá-lo para o diretório para configuração do Xorg: `cp /root/xorg.conf.new /usr/local/etc/X11/xorg.conf` , veja esse tópico da documentação: [Configuração do Xorg no FreeBSD](https://www.freebsd.org/doc/pt_BR/books/handbook/x-config.html#x-config-manual-configuration) .

## Pós configuração Terminal Root Style

 Nessa parte vamos instalar um *pancada* de software que você pode até excluir uns caso você deseje. E também vamos utilizar arquivos, pré-criados por mim para agilizar todo o processo. E no final ele vai ficar igual a [screenshot da imagem dessa postagem](https://terminalroot.com.br/), vamos lá então!

### Instalar Aplicativos

Primeiramente vamos instalar todos os softwares necessários para essa façanha, então rode o comando abaixo que irá instalar tudo de uma vez (recomendo você fazer outra coisa até a finalização da instalação!) , adicione ou remova alguns softwares ao seu gosto!

{% highlight bash %}
pkg install bash bash-completion bat feh fish font-awesome git gotop neofetch perl5 pgpgpg qutebrowser rofi dmenu rxvt-unicode sudo texinfo vim subversion virtualbox-ose-additions
{% endhighlight %}

Vamos analisar cada um dos softwares:

+ [bash](https://terminalroot.com.br/bash) , apesar de você possuir o [Shell](https://terminalroot.com.br/shell) escolhido durante a instalação, acho que o bash é interessantes possuir instalado, caso haja alguma necessidade, pela fácil sintaxe, e também para que está acostumado.
+ [bash-completion](https://github.com/scop/bash-completion) , muito importante para ao começar a digitar um comando, basta pressionar [TAB] e o bash-completion irá auto-completar o nome do comando pra você.
+ [bat](https://www.diolinux.com.br/2019/01/bat-clone-cat-comando-linux.html) , é similar ao comando `cat`, mas como formatação e syntax highlight!
+ [feh](https://feh.finalrewind.org/) , para definir o papel de parede e visualizar imagens;
+ [fish](https://terminalroot.com.br/2018/01/fish-shell-mais-produtividade-no-seu-shell-script.html) , outra alternativa de Shell, mais amigável;
+ [font-awesome](https://fontawesome.com/), um pacotes de fonts e glyphicons;
+ [git](https://git-scm.com) , controle de versão e utilitário para instalar programas;
+ [gotop](https://terminalroot.com.br/2019/07/instale-o-gotop-um-monitor-grafico-do-sistema-via-terminal.html), monitor gráfico de sistema via terminal;
+ [neofetch](https://terminalroot.com.br/2019/01/como-criar-um-fetch-estilo-screenfetch-e-neofetch-em-shell-script.html) , um software *legalzinho* para exibir dados do sistema;
+ [perl5](https://www.freebsd.org/doc/en_US.ISO8859-1/books/porters-handbook/using-perl.html), versão 5 da linguagem de programação [Perl](https://www.perl.org) , pode ser que ela já esteja instalada, mas como ela é muito importante para funcionamento de muita coisa, não custa nada incluí-la na lista para que não haja dúvidas, se ela já estiver instalada o *pkg* irá ignorar a reinstalação por padrão.
+ [pgpgpg](https://www.gnupg.org/) , a versão PGP do GNU, é importante caso haja algum arquivo que precisamos encriptar;
+ [qutebrowser](https://terminalroot.com.br/2019/06/qutebrowser-um-navegador-estilo-vim-muito-veloz.html), um navegador estilo [Vim](https://terminalroot.com.br/vim) , muito veloz!
+ [rofi](https://terminalroot.com.br/2018/11/como-customizar-o-polybar-rofi-e-outros.html), um launcher bem leve e opcional a ele também instalaremos o [dmenu](https://github.com/stilvoid/dmenu) , caso você prefira utilizá-lo.
+ [sudo](https://pt.wikipedia.org/wiki/Sudo) , para não ficar toda hora precisando logar com o *root* pra executar alguns comandos de privilégios a nível de super-usuário, da Tela Preta! =)
+ [texinfo](https://pt.wikipedia.org/wiki/Texinfo), muitos pacotes utilizam ele para sintaxe de typesetting e muitos esquecem de incluí-lo na lista das dependências e acaba gerando problemas;
+ [vim](https://terminalroot.com.br) , [o melhor editor de texto de todos os tempos](https://terminalroot.com.br/2017/11/editores-de-texto-linux.html) !
+ [subversion](https://terminalroot.com.br/2019/09/como-clonar-somente-um-subdiretorio-com-git-ou-svn.html) - O Apache Subversion (também conhecido por SVN) é um sistema de controle de versão , ou seja, uma outra alternativa ao Git.

> *Observação*: Se você estiver instalando numa máquina virtual, é insteresante também você incluir o [virtualbox-ose-additions](https://www.freebsd.org/doc/handbook/virtualization-guest-virtualbox.html) para conseguir uma tela maior, principalmente quando usarmos o comando [xrandr](https://www.freebsd.org/doc/pt_BR/books/handbook/x-config.html#x-config-monitors) para captar automáticamente o máximo possível que a tela suporta para que não exiba *scrollbar* com a opção `--auto` após identificar qual o conecter (VGA-0, VGA1,... ) rodando `xrandr` puro. 


Após instalar o `sudo`, é necessário incluir seu usuário ao arquivo `vim /usr/local/etc/sudores` , procure a linha que começa com a palavra *root* : `/^root` , copie ela no Vim: `[ESC]yy` e cole abaixo: `[ESC]p` e mude o nome *root* pelo nome do seu usuário na nova linha copiada.

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

### Baixar Pacote Terminal Root

Próximo passo agora é baixar um [pkg-i3-freebsd.tar.gz](https://terminalroot.com.br/downs/pkg-i3-freebsd.tar.gz) que possui diversos arquivos necessários para o funcionamento (por isso também os aplicativos acima listados são importantes, para que não haja problema na execução desse passo). Para isso, rode os comandos na ordem:

{% highlight bash %}
fetch https://terminalroot.com.br/downs/pkg-i3-freebsd.tar.gz
tar zxvf pkg-i3-freebsd.tar.gz
cd pkg-i3-freebsd/
mv i3.config ~/.config/i3/config
mv rxvt.file ~/.config/.Xresources
mv xiniti.rc ~/.xinitrc
mkdir -p ~/.local/bin
mv the_it_crowd.sh ~/.local/bin/
chmod -R +x ~/.local/bin/
mv bash.rc ~/.bashrc
mv fish_prompt.fish ~/.config/fish/functions/
feh --bg-scale freebsd-wall.jpg
svn export https://github.com/terroo/fonts/trunk/fonts
mkdir -p ~/.local/share/fonts
mv fonts/ ~/.local/share/
fc-cache -fv
curl -L https://get.oh-my.fish | fish
omf theme install yimmy
{% endhighlight %}

Outro detalhe é que instalamos o [Oh My Fish](https://github.com/mrshu/oh-my-fish) , se quiser sabe como alterar o tema (prompt do terminal) no Fish, ou como deixá-lo como padrão para seu usuário, veja esse artigo: [Como Instalar e configurar o Oh My Fish](https://terminalroot.com.br/), alternativamente você pode fazer o mesmo no [Bash](https://terminalroot.com.br/bash) , para isso veja esse artigo: [Conheça e Instale o Oh My Bash!](https://terminalroot.com.br/2019/05/conheca-e-instale-o-oh-my-bash.html) .

Pronto, agora só mais um passo para ficar *bão* mesmo, se quiser, vamos lá!

### Alterar o i3wm pelo i3-gaps

Você deve estar se perguntando: "*- Pra quê esse cara instalou o i3wm, se ele vai remover pra instalar o i3-gaps ?!!*" , pergunta feita com razão, mas minha resposta também será com razão! =) Seguinte:

1. Esse passo é opcional, ele vai servir mais pra quem gosta do i3wm no estilo [bspwm](https://terminalroot.com.br/2018/09/bspwm-review.html) , mas instalei o i3wm porque ele já instala diversas dependências que o [i3-gaps](https://terminalroot.com.br/2019/01/ubuntu-i3gaps-albert-cava-polybar.html) precisa e algumas não foram descritas e podem reclamar como falta! ^^

2. Vamos [compilar o i3-gaps via Ports do FreeBSD](https://terminalroot.com.br/2018/02/como-compilar-programas-no-freebsd-via-ports.html) , ou seja, somente o Ports possui a versão mais recente! =)

3. Nosso arquivo config do i3 possui algumas linhas comentadas que foram adicionadas justamente para o i3-gaps! :D

Mesmo se você já possua a árvore do Ports, que você pode escolher adicioná-la durante a [Instalação do FreeBSD](https://terminalroot.com.br/2017/09/como-instalar-o-freebsd-11-1.html) , é extremamente recomendado atualizá-la antes de instalarmos o **i3-gaps** . Pois além de possuir a versão mais recente, possui também mais estabilidade ao compilar .

> Nem fica na *pira* que compilação demora! Eu mesmo nunca fico olhando pro PC quando instalo um programa ou quando atualizo o sistema, faço inúmeras coisas enquanto isso acontece, principalmente leio a documentação do software que está compilando e em 99% dos casos, a compilação termina bem antes da minha *gostosa leitura* terminar! Ou seja, essa "demora" é na verdade, uma oportunidade! E *cá pra nois* , só vai demorar mesmo se seu PC for um [Ábaco](https://abaco.com) !!! =)

Para atualizar/instalar a árvore do Ports, rode os comandos:

{% highlight bash %}
portsnap fetch update
portsnap extract
{% endhighlight %}

Feito isso, vamos compilar o i3-gaps !!! \o/

Mas antes precismos remover o i3wm senão não consiguiremos: `sudo pkg remove i3`

Entre no diretório `/usr/ports/x11-wm/i3-gaps` e rode o comando `make install clean`

{% highlight bash %}
cd /usr/ports/x11-wm/i3-gaps
make install clean
{% endhighlight %}

Agora abra o arquivo `~/.config/i3/config` e descomente (tirar o caractere **#** tralha da frente), deixando assim:

{% highlight bash %}
for_window [class=".*"] border pixel 2 #*
gaps inner 10
gaps outer 1
smart_borders on
smart_borders no_gaps
{% endhighlight %}

Se quiser que a janela do terminal seja sempre aberta como *float*, descomente também essa linha: `for_window [instance="rxvt"] floating enable` .

E ainda instalar o [Compton](https://github.com/yshui/compton) , um compositor de janelas que gera transparência e efeitos suaves:

{% highlight bash %}
sudo pkg install compton
{% endhighlight %}

Se quiser que seja iniciado automáticamente quando você logar no i3, basta adicionar essa linha `exec compton &` no arquivo `vim ~/.config/i3/config` , ou simplesmente rodar esse comando:

{% highlight bash %}
echo 'exec compton &' >> ~/.config/i3/config
{% endhighlight %}

Tá vendo ?!! Nem doeu e foi rapidão! :)

> Se tiver algum problema, veja o vídeo ao final desse artigo!

Se quiser também adicionar a [Barra da Polybar](https://www.youtube.com/watch?v=vAfJr9AddAQ) , basta instalar via pkg: `sudo pkg install polybar` e para adicioná-la por padrão, configure o *arquivo config* do **i3** e crie um *launch* para ele! Nesse caso eu não fiz porque é um estilo mais limpo e sem barras.

Se você queria só saber do i3wm, ta aí !!! Mas se você também que saber do [GNOME](https://terminalroot.com.br/2018/02/como-customizar-a-aparencia-do-gnome.html) , vamos ao próximo tópico!

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

![Rice FreeBSD i3wm](/assets/img/freebsd/freebsd-i3wm-rice.jpg)

---

# Como Instalar e Configurar o GNOME no FreeBSD

Outra dúvida que muitos possuem é como instalar e configurar o [GNOME](https://www.gnome.org/) no **FreeBSD** .

É uma tarefa simples, mas é necessário se atentar a alguns detalhes. Vamos aos procedimentos!

Você pode também instalar via [Ports](https://www.freebsd.org/ports/) , caso deseje, veja esse artigo: [Como Compilar Programas no FreeBSD via Ports](https://terminalroot.com.br/2018/02/como-compilar-programas-no-freebsd-via-ports.html) .

Mas aqui vamos utilizar o [pkg](https://www.freebsd.org/doc/pt_BR/books/handbook/pkgng-intro.html) que instala pacotes binários. 

1. Para isso, primeiro atualize todo o sistema (com o *root* `su` antes, nesse caso):

{% highlight bash %}
pkg update && pkg -f upgrade
{% endhighlight %}

2. Após atualização, rode os comandos:

> Se o [Xorg](https://www.x.org/wiki/) já estiver instalado o [FreeBSD](https://www.freebsd.org/ports/) não irá reinstalá-lo!

{% highlight bash %}
pkg install gnome-desktop gdm xorg gnome3
{% endhighlight %}

> Dependendo da largura da banda da sua internet, essa instalação pode demorar pra caramba !!! :O

Após instalado, precisamos editar o arquivo `sudo vim /etc/rc.conf` e adicionar as seguintes linhas:

> Nesse caso assumi que você tem o Vim e o sudo instalado e configurado.

{% highlight bash %}
gnome_enable="YES"
moused_enable="YES"
dbus_enable="YES"
hald_enable="YES"
gdm_enable="YES"
{% endhighlight %}

Ignore as linhas: **moused_enable="YES"**, **dbus_enable="YES"** e **hald_enable="YES"** se você já possuir as mesmas já inclusas no arquivo.

Também precisamos editar o nosso arquivo `vim /etc/fstab` e incluir na última linha o seguinte conteúdo:

{% highlight bash %}
proc /proc procfs rw 0 0
{% endhighlight %}

O painel de configurações do GNOME não funciona tão bem como esperado no FreeBSD, logo, se você alterar o item **Region and Language** para *Português Brasil* o idioma e o teclado, bem como o **Date and Time** , talvez não funcione, logo, recomendo você fazer isso via linha de comando editando o arquivo:
`sudo vim /usr/local/etc/gdm/locale.conf` altere tudo que estiver como *en_US* para *pt_BR* , no editor Vim basta usar esse comando:

{% highlight vim %}
:% s/en_US/pt_BR/g
:wq
{% endhighlight %}

Agora é só reiniciar a sua máquina: `sudo reboot` e desfrutar do GNOME, veja screenshots abaixo!

![GNOME FreeBSD](/assets/img/freebsd/gnome-freebsd-1.jpg)
![GNOME FreeBSD](/assets/img/freebsd/gnome-freebsd-2.jpg)

# Assista ao vídeo demonstando o i3 e o GNOME no FreeBSD

<iframe width="920" height="400" src="https://www.youtube.com/embed/jkwZYQoXYeA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

- 📇 Cupons para o Curso de Shell Script na Udemy: <http://bit.ly/ShellCupons>
- 📖 Cupons para o Curso de Vim na Udemy: <http://bit.ly/VimCuponsUdemy>
- 🔖 Cupons para o Curso de Sed na Udemy: <http://bit.ly/SedCupons>
- ♟️  Cupons para o Curso de Expressões Regulares Udemy: <http://bit.ly/RegexCupons>
- 🎁 Todos os Cursos na Udemy: <http://bit.ly/UdemyTerminalRoot>

Curtiu o artigo ? Compartilhe para nos ajudar !!! 

Quer agradecer, acrescentar ou relatar algo ? Use nossos comentários!

Abraços!

## Links úteis

+ → Playlist Youtube FreeBSD: <http://bit.ly/play-freebsd>
+ <https://feh.finalrewind.org/>
+ <https://fontawesome.com/>
+ <https://get.oh-my.fish>
+ <https://github.com/scop/bash-completion>
+ <https://github.com/stilvoid/dmenu>
+ <https://github.com/terroo/fonts/trunk/fonts>
+ <https://github.com/yshui/compton>
+ <https://git-scm.com>
+ <https://pt.wikipedia.org/wiki/Sudo>
+ <https://pt.wikipedia.org/wiki/Texinfo>
+ <https://terminalroot.com.br/>
+ <https://terminalroot.com.br/2016/11/blog-linux-unix.html>
+ <https://terminalroot.com.br/2017/09/como-instalar-o-freebsd-11-1.html>
+ <https://terminalroot.com.br/2017/11/editores-de-texto-linux.html>
+ <https://terminalroot.com.br/2018/01/fish-shell-mais-produtividade-no-seu-shell-script.html>
+ <https://terminalroot.com.br/2018/02/como-compilar-programas-no-freebsd-via-ports.html>
+ <https://terminalroot.com.br/2018/02/como-customizar-a-aparencia-do-gnome.html>
+ <https://terminalroot.com.br/2019/01/como-criar-um-fetch-estilo-screenfetch-e-neofetch-em-shell-script.html>
+ <https://terminalroot.com.br/2019/01/ubuntu-i3gaps-albert-cava-polybar.html>
+ <https://terminalroot.com.br/2019/05/conheca-e-instale-o-oh-my-bash.html>
+ <https://terminalroot.com.br/2019/07/instale-o-gotop-um-monitor-grafico-do-sistema-via-terminal.html>
+ <https://terminalroot.com.br/2019/09/como-clonar-somente-um-subdiretorio-com-git-ou-svn.html>
+ <https://terminalroot.com.br/downs/pkg-i3-freebsd.tar.gz>
+ <https://terminalroot.com.br/shell>
+ <https://terminalroot.com.br/vim>
+ <https://www.diolinux.com.br/2019/01/bat-clone-cat-comando-linux.html>
+ <https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/mirrors-ftp.html#mirrors-br-ftp>
+ <https://www.freebsd.org/doc/pt_BR/books/handbook/pkgng-intro.html>
+ <https://www.freebsd.org/doc/pt_BR/books/handbook/x-config.html#x-config-manual-configuration>
+ <https://www.freebsd.org/doc/pt_BR/books/handbook/x-config.html#x-config-monitors>
+ <https://www.gnupg.org/>
+ <https://www.perl.org>
+ <https://www.youtube.com/watch?v=vAfJr9AddAQ>

