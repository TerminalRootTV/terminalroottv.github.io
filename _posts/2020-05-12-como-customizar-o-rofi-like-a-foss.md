---
layout: post
title: "Como Customizar o ROFI, Like a FOSS!"
date: 2020-05-12 03:32:07
image: '/assets/img/wm/rofi-like-a-foss.jpg'
description: 'Um dos melhores launchers também serve para inúmeras coisas.'
icon: 'dashicons:menu-alt3'
iconname: 'rofi'
tags:
- unixporn
- wm
- dicas
---

![Como Customizar o ROFI, Like a FOSS!](/assets/img/wm/rofi-like-a-foss.jpg)

[Rofi](https://github.com/davatorium/rofi) é um launcher: alternador de janelas, iniciador de aplicativos. Existem diversas alternativas ao mesmo, no entanto, acredito que o Rofi é a melhor opção. Se quiser conhecer outras alternativas, veja esse link:

+ [Os 12 Melhores Launchers para Linux](https://terminalroot.com.br/2020/01/os-12-melhores-launchers-para-linux.html)

Ele é altamente customizável e você pode utilizá-lo para tarefas até que não dependem dele, como por exemplo:
+ Exibir data e hora;
+ Front-end para o MPD;
+ Interface para alterar configurações;
+ E muitas outras coisas.

E foi isso que o [adi1090x](https://github.com/adi1090x) fez, ele criou diversos temas para vários aplicativos, incluindo o o Rofi.

<!-- LISTA MIN -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Logo para instalar o tema basta seguir rodar os comando na ordem:
> Logicamente precisará do **Rofi** e [Git](https://terminalroot.com.br/git) instalados.
{% highlight bash %}
# 1. Go in rofi's config folder
cd ~/.config/rofi

# 2. Clone this repo
git clone https://github.com/adi1090x/rofi.git

# 3. Make sure the scripts are executables
cd rofi && chmod +x scripts/*

# 4. Copy necessary files to the right location
cp -r bin scripts themes config.rasi ~/.config/rofi

# 5. Clean up rofi's config folder
cd .. && rm -r rofi

# 6. Call the scripts (from the scripts folder)
cd scripts && ./backlight.sh

{% endhighlight %}

O último comando já exibe o exemplo de uso. Para mais formas de configurações , sugiro você assistir o vídeo abaixo

# Assista ao vídeo

<iframe width="1234" height="694" src="https://www.youtube.com/embed/cDDMrUwrce0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

# Veja também
+ [Uma Coleção de Temas Prontos para seu Polybar](https://terminalroot.com.br/2019/07/uma-colecao-de-temas-prontos-para-seu-polybar.html)

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




