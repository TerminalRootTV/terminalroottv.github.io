---
layout: post
title: "SerenityOS - Um NOVO Sistema Operacional feito com C++"
date: 2021-09-13 11:10:04
image: '/assets/img/sistemas/serenityos.jpg'
description: 'Um sistema com gostinho dos anos 90 e estilo UNIX'
icon: 'ion:terminal-sharp'
iconname: 'SerenityOS'
tags:
- cpp
- sistemasoperacionais
---

![SerenityOS - Um NOVO Sistema Operacional feito com C++](/assets/img/sistemas/serenityos.jpg)


O SerenityOS, como o próprio site deles o descreve:

> É um sistema operacional que possui interface gráfica e semelhante ao Unix para computadores desktop!
> 
> SerenityOS é uma "carta de amor" às interfaces de usuário dos anos 90 com um núcleo personalizado do tipo Unix. Ele lisonjeia com sinceridade, roubando belas idéias de vários outros sistemas.

> Á grosso modo, podemos dizer que o objetivo é um casamento entre a estética do software de produtividade do final dos anos 1990 e a acessibilidade do usuário avançado do final dos anos 2000 .

Foi criado pelo desenvolvedor: **Andreas Kling**, mas conta com uma lista de quase 500 contribuidores.

O sistema está disponível sob os termos da licença BSD.

O desenvolvedor publicou em seu blog que: [Saiu do emprego emprego para ter mais tempo para se dedicar ao SerenityOS em tempo integral](https://awesomekling.github.io/I-quit-my-job-to-focus-on-SerenityOS-full-time/)

Seu site oficial é: <http://serenityos.org/>


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

## Instalação

1. Instruções:
{% highlight sh %}
xdg-open https://github.com/SerenityOS/serenity/blob/master/Documentation/BuildInstructions.md
{% endhighlight %}

2. Dependências
{% highlight sh %}
sudo apt install build-essential cmake curl libmpfr-dev libmpc-dev libgmp-dev e2fsprogs ninja-build qemu-system-i386 qemu-utils ccache rsync genext2fs unzip
{% endhighlight %}

3. Versão do *gcc >= 10*
{% highlight sh %}
eselect gcc list
{% endhighlight %}

4. Clone
{% highlight sh %}
git clone https://github.com/SerenityOS/serenity
cd serenity
{% endhighlight %}

5. Construir
{% highlight sh %}
Meta/serenity.sh rebuild-toolchain
{% endhighlight %}
> Vai fazer download das ferramentas necessárias para construir o sistema e em seguida começar a compilar os dados.

6. Rode
{% highlight sh %}
Meta/serenity.sh run
{% endhighlight %}

7. Se houver essa falha:
{% highlight sh %}
[0/2] Re-checking globbed directories...
[0/1] cd /home/marcos/serenity/Build/i686 && /usr/bin/cmake -E env SERENITY_ARCH=i686 /home/marcos/serenity/Meta/run.sh
die: Please install QEMU version 5.0 or newer or use the Toolchain/BuildQemu.sh script.
FAILED: CMakeFiles/run /home/marcos/serenity/Build/i686/CMakeFiles/run 
cd /home/marcos/serenity/Build/i686 && /usr/bin/cmake -E env SERENITY_ARCH=i686 /home/marcos/serenity/Meta/run.sh
ninja: build stopped: subcommand failed.
{% endhighlight %}

Rode esse comando:
{% highlight sh %}
Toolchain/BuildQemu.sh
{% endhighlight %}

E depois rode esse comando de novo:
{% highlight sh %}
Meta/serenity.sh run
{% endhighlight %}

# Assista ao vídeo

<iframe width="1253" height="705" src="https://www.youtube.com/embed/DS4_Vkvqwtc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

