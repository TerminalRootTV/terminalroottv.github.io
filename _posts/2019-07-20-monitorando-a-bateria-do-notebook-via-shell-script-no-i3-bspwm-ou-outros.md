---
layout: post
title: "Monitorando a Bateria do Notebook via Shell Script no i3, bspwm ou outros"
date: 2019-07-20 21:54:24
image: '/assets/img/dicas/notification.jpg'
description: 'Nesse tutorial vamos mostrar uma forma mais simples e interessante.'
main-class: 'i3'
tags:
- i3
- i3wm
- wm
---

![Monitorando a Bateria do Notebook via Shell Script no i3, bspwm ou outros](/assets/img/dicas/notification.jpg)

Existem diversos aplicativos que você pode instalar e configurar para atender essa necessidade, entre eles:

+ [upower](https://upower.freedesktop.org/)
+ [acpi](https://uefi.org/acpi/specs)
+ [TLP](https://linrunner.de/en/tlp/docs/tlp-linux-advanced-power-management.html)
+ [batstat](https://github.com/Juve45/batstat)

Mas nesse tutorial vamos mostrar uma forma que nem precisa de software. Todas as informações da sua bateria ficam no diretório: `/sys/class/power_supply/BAT[NUM]/` onde o *[NUM]* é um número que pode ser diferente no seu sistema, use *TAB* após rodar o comando até a palavra BAT para descobrir . Vamos assumir que é *BAT1* , pra obter todas as informações da sua bateria, rode: `cat /sys/class/power_supply/BAT1/*`:

{% highlight bash %}
marcos@gentoo ~ $ cat /sys/class/power_supply/BAT1/*
85000
45
Normal
2800000
3780000
1260000
692000
547
cat: /sys/class/power_supply/BAT1/device: É um diretório
SAMSUNG Electronics
SR Real Battery
cat: /sys/class/power_supply/BAT1/power: É um diretório
1
123456789
Discharging
cat: /sys/class/power_supply/BAT1/subsystem: É um diretório
Li-ion
Battery
POWER_SUPPLY_NAME=BAT1
POWER_SUPPLY_STATUS=Discharging
POWER_SUPPLY_PRESENT=1
POWER_SUPPLY_TECHNOLOGY=Li-ion
POWER_SUPPLY_CYCLE_COUNT=547
POWER_SUPPLY_VOLTAGE_MIN_DESIGN=11400000
POWER_SUPPLY_VOLTAGE_NOW=10980000
POWER_SUPPLY_CURRENT_NOW=692000
POWER_SUPPLY_CHARGE_FULL_DESIGN=3780000
POWER_SUPPLY_CHARGE_FULL=2800000
POWER_SUPPLY_CHARGE_NOW=1260000
POWER_SUPPLY_CAPACITY=45
POWER_SUPPLY_CAPACITY_LEVEL=Normal
POWER_SUPPLY_MODEL_NAME=SR Real Battery
POWER_SUPPLY_MANUFACTURER=SAMSUNG Electronics
POWER_SUPPLY_SERIAL_NUMBER=123456789
11400000
10980000
{% endhighlight %}

Se quiser saber somente em quantos por cento está no momento, use:

{% highlight bash %}
cat /sys/class/power_supply/BAT1/capacity
{% endhighlight %}

Se quiser saber se está descarregando, use:

{% highlight bash %}
cat /sys/class/power_supply/BAT1/status
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


E assim por diante, cada arquivo dentro do diretório armazena uma informação.

> Dica extra

Se estiver usando Polybar, crie um módulo no *config* do Polybar da seguinte, forma exemplo:


{% highlight bash %}
[module/menu]
type = custom/script
exec = ~/.config/polybar/bat.sh
click-left = ~/.config/bat.sh &
format-spacing = 1
{% endhighlight %}

Nesse caso, eu use no módulo *menu* , mas é do tipo *script*
> Obs.: É o único módulo script do meu config, se no seu caso não funcionar, use a condição abaixo num **module/script** que já exista.

E no arquivo `bat.sh` tem o seguinte script, detalhe para o comando *notify-send* que mostra uma notificação se a bateria estiver menor que 20% , para mais informações sobre notificações no seu desktop veja esse link: [LINK](https://terminalroot.com.br/2017/05/como-criar-um-alerta-em-bash-ao-final-de-um-evento.html)

{% highlight bash %}
#!/bin/bash
LEVEL=$(cat /sys/class/power_supply/BAT1/capacity)
STATUS=$(cat /sys/class/power_supply/BAT1/status)

if [[ $LEVEL -lt 20 ]] ; then
        if [[ "$STATUS" == "Discharging" ]]; then
          notify-send --urgency=critical --icon=battery-caution "Bateria baixa ${LEVEL}%" "Descarregando"
        fi
fi
{% endhighlight %}

A opção `&& "$STATUS" == "Discharging"` é importante para parar as notificações se você conectar a tomada.

Se quiser, você pode rodar o script em background assim que iniciar sessão, exemplos:

+ Para [bspwm](cse.google.com/bspwm) `vim $HOME/.config/bspwm/bspwmrc`

{% highlight bash %}
sh ~/caminho/para/script.sh &
{% endhighlight %}

+ Para [i3](cse.google.com/i3) `vim $HOME/.config/i3/config`

{% highlight bash %}
exec_always --no-startup-id $HOME/caminho/para/script.sh &
{% endhighlight %}

Ou qualquer outro caso, lembrando que o arquivo `~/.xprofile` pode ser criado se não existir e se você usar [LightDM](cse) como o script em background também, que funcionará em WMs e GUIs .

Pronto, agora o notebook não desligará mais por falta de energia!😁️

## Assista ao vídeo

# [Link para o Vídeo](https://www.youtube.com/watch?v=WcO74IUDOqg)
<iframe width="1275" height="717" src="https://www.youtube.com/embed/WcO74IUDOqg" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Vídeos e artigos recomendados

+ [crie-notificacoes-elegantes-no-seu-linux.md](crie-notificacoes-elegantes-no-seu-linux.md)
+ [Como Criar um Alerta em Bash ao Final de um Evento](https://www.youtube.com/watch?v=wube6BF6xvU)
+ [Como Criar uma Notificação no Desktop](https://www.youtube.com/watch?v=cwrSluiamR4)
+ [Criando um A L E R T A em Shell Script](https://terminalroot.com.br/2019/06/criando-um-a-l-e-r-t-a-em-shell-script.html)


