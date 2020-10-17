---
layout: post
title: "Como criar caixas de diálogo interativa com script shell"
date: '2015-08-02T19:17:00.000-07:00'
image: '/assets/img/bash/whiptail.jpg'
description: "Quando você instala um novo software no terminal, muitas vezes você pode ver as caixas de diálogo informativas aparecendo."
color: '#c2003a'
tags:
- shellscript
- terminal
- comandos
---

![Whiptail Blog Linux](/assets/img/bash/whiptail.jpg "Whiptail Blog Linux")


## COMO CRIAR CAIXAS DE DIÁLOGO INTERATIVA COM SCRIPT SHELL

Quando você instala um novo software no __terminal__, muitas vezes você pode ver as caixas de diálogo informativas aparecendo. O tipo de caixas de diálogo varia de simples sim/não , caixa de senha, lista, menu, e assim por diante. A vantagem de usar essas caixas de diálogo *user-friendly* é que elas podem orientá-lo para inserir as informações necessárias de uma forma intuitiva.

> Pré-instalado em todas as distribuições [Linux](http://www.terminalroot.com.br/tags#linux) modernas, um programa chamado __whiptail__ pode agilizar o processo de criação de diálogos baseados em terminais e caixas de mensagem dentro de um shell script, semelhante à forma como os códigos *Zenity* ou *xdialog* uma interface gráfica para scripts.

#### Criar uma caixa de mensagem:
{% highlight bash %}
whiptail --title "" --msgbox ""
{% endhighlight %}
Exemplo:
    
 

#### Criar uma caixa de Sim/Não:
{% highlight bash %}
whiptail --title "" --yesno ""
{% endhighlight %}

__Exemplo__:
{% highlight bash %}
#!/bin/bash
if (whiptail --title "Caixa teste de sim/nao" --yesno "Escolha Sim ou Não." 10 60) then
    echo "Você escolheu Sim. Saída com status $?."
else
    echo "Você escolheu Não. Saída com status $?."
fi
{% endhighlight %}

![Whiptail Blog Linux](/assets/img/bash/2.jpg "Whiptail Blog Linux")

#### Você ainda tem a opção de customizar os botões de sim/não:
{% highlight bash %}
#!/bin/bash
if (whiptail --title "Caixa teste de sim/nao" --yes-button "Vim" --no-button "Emacs" --yesno "Qual desses dois são melhores?" 10 60) then
    echo "Você escolheu Vim. Saída com status $?."
else
    echo "Você escolheu Emacs. Saída com status $?."
fi
{% endhighlight %}
![Whiptail Blog Linux](/assets/img/bash/3.jpg "Whiptail Blog Linux")

#### Criar uma caixa de formulário:
{% highlight bash %}
whiptail --title "" --inputbox ""
{% endhighlight %} 
Exemplo:
   

#### Criar uma caixa de senha:
{% highlight bash %}
whiptail --title "" --passwordbox ""
{% endhighlight %}
Exemplo:
{% highlight bash %}
#!/bin/bash
PASSWORD=$(whiptail --title "Test caixa de senha" --passwordbox "Insira sua senha." 10 60 3>&1 1>&2 2>&3)
 
exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "Sua senha é:" $PASSWORD
else
    echo "Você cancelou."
fi
{% endhighlight %}
![Whiptail Blog Linux](/assets/img/bash/5.jpg "Whiptail Blog Linux")

#### Criar um MENU:
{% highlight bash %}
whiptail --title "" --menu ""    [   ] . . .
{% endhighlight %}
Exemplo:
   

#### Criar um input radio:
{% highlight bash %}
whiptail --title "" --radiolist ""    [    ] . . .
{% endhighlight %}

{% highlight bash %}
#!/bin/bash
DISTROS=$(whiptail --title "Teste Checklist Dialogo" --radiolist \
"Qual sua distro preferida?" 15 60 4 \
"debian" "Debian" ON \
"ubuntu" "Ubuntu" OFF \
"centos" "CentOS" OFF \
"mint" "Mint" OFF 3>&1 1>&2 2>&3)
 
exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "Sua distro é:" $DISTROS
else
    echo "Você cancelou."
fi
{% endhighlight %}


![Whiptail Blog Linux](/assets/img/bash/7.jpg "Whiptail Blog Linux")

#### Criar uma barra de progresso:
{% highlight bash %}
whiptail --gauge ""
{% endhighlight %}
    

#### Para mais informações:
{% highlight bash %}
man whiptail
{% endhighlight %}







<!--Via: http://xmodulo.com/create-dialog-boxes-interactive-shell-script.html-->



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



