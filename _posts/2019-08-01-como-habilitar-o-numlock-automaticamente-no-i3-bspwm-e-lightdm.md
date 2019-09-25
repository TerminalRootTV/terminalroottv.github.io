---
layout: post
title: "Como Habilitar o Numlock no i3wm, bspwm e no LightDM e +2 dicas bônus"
date: 2019-08-01 09:41:10
image: '/assets/img/dicas/numlock-linux.jpg'
description: 'Poupe sua paciência e veja como torná-lo padrão no seu Linux ou Unix-like.'
main-class: 'unix'
tags:
- numlock
- unix
- dicas
---

![Numlock](/assets/img/dicas/numlock-linux.jpg "Numlock")

Muitas vezes quando você inicia o [LightDM]() para logar no sistema e tenta usar [Numlock](https://pt.wikipedia.org/wiki/Num_lock) (teclado numérico), se sua senha possuir números, você acaba errando a senha ou tendo que habilitá-lo manulamente porque o mesmo não está habilitado por padrão.

A mesma coisa acontece quando você loga no sistema e percebe que o numlock não foi habilitado automáticamente .

Então nesse tutorial vamos usar de cobaia o [i3wm]() e o [bspwm]() e nesses dois exemplos, você pode adaptar a qualquer [WM]() ou interface gráfica que não esteja habilitado e você deseja que isso aconteça por padrão.

## Introdução

Existem várias formas de habilitar o numlock via linha de comando, veja alternativas ao final desse artigo, mas aqui vamos utilizar a forma mais estável e confiável. Para isso vamos utilizar o [NumlockX]() . Até poque muitas formas dependerão da distribuição, sistemas de inicialização e shell.

Logo, esse método, podemos dizer que é infalível! =)

Primeiro certifique-se que possui o [numlockx]() instalado no seu sistema:

> Se retornar somente o caminho do numlockx, ex: `/usr/bin/numlockx` , é porque está instalado, se aparecer, ex.: `which: no numlockx in (/usr/lib/llvm/8/bin:/usr/lib/llvm/7/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bin)` , é porque não está instalado.

{% highlight bash %}
which numlockx
{% endhighlight %}

Se não estiver instalado, instale via o gerenciador de repositório da sua distro, exemplos:

{% highlight bash %}
emerge numlockx # Gentoo, Funtoo e similares
sudo apt install numlockx # Debian, Ubuntu, Linux Mint e similares
sudo pacman -S numlockx # Arch Linux, Manjaro e similares
sudo yum install numlockx # Red Hat, CentOS e similares
sudo dnf install numlockx # Fedora
{% endhighlight %}

## Utilizando

1. Para habilitar o Numlock basta rodar o comando: `numlockx` ou `numlockx on`
2. Para desabilitar: `numlockx off`
3. E para alternar, ou seja, se estiver habilitado → desabilita , e se estiver desabilitado → habilita, use: `numlockx toggle`

## Adicionar o NumlockX ao i3wm i, bspwm  e LightDM ao iniciar a sessão

1. No i3 basta abrir o arquivo `vi ~/.config/i3/config` e adicionar a linha: `exec numlockx on`, ou simplesmente rodar esse comando:

{% highlight bash %}
echo 'exec numlockx on' >> ~/.config/i3/config
{% endhighlight %}

2. No bspwm basta abrir o arquivo `vi ~/.config/bspwm/bspwmrc` e adicionar a linha: `/usr/bin/numlockx on`, ou simplesmente rodar esse comando:

{% highlight bash %}
echo '/usr/bin/numlockx on' >> ~/.config/bspwm/bspwmrc
{% endhighlight %}

2. No LightDM você precisa editar o arquivo `/etc/lightdm/lightdm.conf` e alterar a linha que possui a informação: `greeter-setup-script` que fica na tag **[Seat:*]**, descomentar (tirar a tralha **#** da frente, se houver) e atribuir o comando: `/usr/bin/numlockx on`, ficando assim:

{% highlight bash %}
greeter-setup-script=/usr/bin/numlockx on
{% endhighlight %}

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

### Alternativamente no LightDM , ele lê o arquivo: `~/.xprofile` ao iniciar a sessão, logo, bastar você adicionar o comando ao mesmo:

{% highlight bash %}
echo 'numlockx on' >> ~/.xprofile
{% endhighlight %}

Se não estiver usando LightDM e estiver logando via `startx` , basta usar o mesmo comando para seu `~/.xinitrc`

## Outras alternativas

Como havia dito existem outras alternativas, mas pode ser que não funcione, pois depende de alguns fatores, bem como:
- Permissão
- Distribuição
- Sistema de inicialização

E em outros *Display Managers* (alternativas ao LightDM) , também tem seus modos particulares. Mas em resumo, outras opções são:

1. Usando o comando `setleds`
{% highlight bash %}
su -c "/usr/bin/setleds -D +num < /dev/tty1"
{% endhighlight %}

Vai pedir sua senha de `root` , você pode até *setar* o numlock em TTYs com posições definidas, para ver como rode esse comando ` man setleds | grep -A 4 -B 1 '\[1-8\]'` , a saída será similar a essa:
> Onde mostra que você pode criar [Shell Scrip]() para isso
{% highlight bash %}
marcos@gentoo ~ $ man setleds | grep -A 4 -B 1 '\[1-8\]'
       One might use setleds in /etc/rc to define the initial and default state of NumLock, e.g. by
            INITTY=/dev/tty[1-8]
            for tty in $INITTY; do
                 setleds -D +num < $tty
            done

marcos@gentoo ~ $ 
{% endhighlight %}

Lembrando também que você precisa saber o número do **tty** , para descobrir você pode usar os comandos para descobrir:
> *Observação*: o número do pseudoterminal **pts**(`/dev/pts/[NÚMERO]`) pode não coincidir com o do **tty**(`/dev/tty[NÚMERO]`)
- `tty`
- `who`
- Ou simplesmente, rodar o comando: `w`

2. Você também pode extrair as configurações do seu `xkb` rodando o comando `xkbcomp $DISPLAY myconf.xkb` , isso vai criar um arquivo no diretório que você estiver como o nome **myconf.xkb**, onde você pode ver as configurações do mesmo e alterar a linha que exemplo:

{% highlight bash %}
indicator "Num Lock" {
	!allowExplicit;
	whichModState= locked;
	modifiers= NumLock;
};
{% endhighlight %}

Altere a linha que tem `!allowExplicit` retirando o sinal de exclamação do final: `allowExplicit` , depois é só reler o arquivo: `xkbcomp myconf.xkb $DISPLAY`.

3. Usar o `xset` , talvez até depois de alterar seu `xkb`, assim:

{% highlight bash %}
xset led named 'Num Lock'
{% endhighlight %}

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

## Bônus 1
### Deixando seu teclado em em *Português Brasil*

Para isso rode os comandos:

- `setxkbmap -model abnt2 -layout br -variant abnt2` ou adicione ao config do seu bspwm, .xinitrc, .xprofile , somente no i3wm que você possa ter algum tipo de problema, mas você pode alternar para um script.

## Bônus 2
### Habilitando cursor theme e/ou Policikit

Se você possui Polybar e usa Polybar , mas também tem o GNOME nessa máquina do Gentoo, mas o sistema, principalmente o Polybar não reconhece o tema do seu cursor, use essa linha no seu `bspwmrc` : `/usr/libexec/gsd-xsettings &` .

E se você não consegue abrir uma aplicação por conta de privilégios usando user normal ou root, ou sudo, inclua o policikit no seu `bspwmrc` ou config do i3 `exec_always --no-startup-id /usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &`

Dica, verifique antes se existe esse arquivo, pois você pode está usando outro gerenciador de políticas de sessão: `ls /usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1` se retornar o caminho, é porque você utiliza, se não, descubra qual seu software e substitua o caminho.

## Conclusão

É uma tarefa simples e existe diversas alternativas, mas como sempre é bom saber o que está fazendo pra não acabar *comprando gato por lebre* . Para mais informações use o manual do próprio sistema:

{% highlight bash %}
man {numlockx,setleds,xkb,xkbcomp,setxkbmap} | less
{% endhighlight %}

## Links úteis

+ <https://www.tldp.org/HOWTO/Keyboard-and-Console-HOWTO-10.html>
+ <https://wiki.gentoo.org/wiki/Automatic_login_to_virtual_console>
+ <https://wiki.archlinux.org/index.php/Activating_Numlock_on_Bootup_(Portugu%C3%AAs)>
