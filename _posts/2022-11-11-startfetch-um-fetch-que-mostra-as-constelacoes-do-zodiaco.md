---
layout: post
title: "Startfetch - Um fetch que mostra as Constelações do Zodíaco"
date: 2022-11-11 11:45:28
image: '/assets/img/terminal/starfetch.jpg'
description: 'Uma ferramenta escrita em C++ para linha de comando.'
icon: 'ion:terminal-sharp'
iconname: 'Terminal'
tags:
- cpp
- unixporn
- terminal
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

`starfetch` é uma ferramenta que imprime um esquema de uma determinada <u>constelação</u> e algumas informações sobre ela: 
+ seu quadrante, 
+ sua ascensão reta, 
+ sua declinação, 
+ sua área 
+ e seu número de estrelas principais.

Indicado para quem deseja ter esses dados para fácil acesso e também para os [unixporners](https://terminalroot.com.br/tags#unixporn) de plantão!

---

# Instalação
O `starfetch` foi escrito em [C++](https://terminalroot.com.br/tags#cpp), logo você vai precisar de um [compilador](https://terminalroot.com.br/tags#gcc) e também do [Git](https://terminalroot.com.br/tags#git) para compilar e, consequentemente, instalar no seu sistema.

Para isso basta rodar os comandos abaixo:

{% highlight bash %}
git clone https://github.com/Haruno19/starfetch
cd starfetch
make
sudo make install
{% endhighlight %}
> Remova o diretório clonado após instalaçao, ex.: `cd .. && rm -rf starfetch`


<!-- SQUARE - GAMES ROOT -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# Utilizando
Após instalado basta rodar o comando:

{% highlight bash %}
starfetch
{% endhighlight %}

Para obter o *fetch* de uma constelação específica do zodíaco use o parâmetro `-n` e em seguida o nome que deseja, exemplo para áries:
{% highlight bash %}
starfetch -n aries
{% endhighlight %}

Provável saída:
{% highlight txt %}
┌───── A R I E S  ─────┐
│                      │
│                      │      Aries
│    ✦                 │      
│                      │      Quadrant: NQ1
│              ✦       │      Right ascension: 01h 46m 37.3761s to –03h 29m 42.4003s
│                      │      Declination: +31.2213154° to –10.3632069°
│                ✦     │      Area: 441 sq.deg. (39th)
│               ✦      │      Main stars: 4, 9
│                      │
│                      │
└──────────────────────┘
{% endhighlight %}

Para mais informações use o `starfetch --help` e acesse o [repositório](https://github.com/Haruno19/starfetch).

---

# Veja também:
+ [Um fetch escrito em Perl para seu rice](https://terminalroot.com.br/2021/08/um-fetch-escrito-em-perl-para-seu-rice.html)
+ [Onefetch - Gere um fetch do seu repositório Git](https://terminalroot.com.br/2020/10/onefetch-gere-um-fetch-do-seu-repositorio-git.html)
+ [Ufetch - Simplicidade no seu Linux ou Unix-like](https://terminalroot.com.br/2019/09/ufetch.html)
+ [5 Ferramentas para você usar no seu WM](https://terminalroot.com.br/2019/04/5-ferramentas-para-voce-usar-no-seu-wm.html)
+ [Como Criar um FETCH, estilo ScreenFetch e Neofetch em SHELL SCRIPT](https://terminalroot.com.br/2019/01/como-criar-um-fetch-estilo-screenfetch-e-neofetch-em-shell-script.html)

