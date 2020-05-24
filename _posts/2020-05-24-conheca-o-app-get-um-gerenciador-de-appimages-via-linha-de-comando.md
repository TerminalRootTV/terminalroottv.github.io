---
layout: post
title: "Conheça o app-get - Um Gerenciador de AppImages via Linha de Comando"
date: 2020-05-24 00:47:41
image: '/assets/img/apps/app-get.jpg'
description: 'Gerencie seus AppImages de forma prática e pelo terminal.'
icon: 'entypo:keyboard'
iconname: 'linha-de-comando'
tags:
- shellscript
- comandos
- appimage
- git
- github
---

![Conheça o app-get - Um Gerenciador de AppImages via Linha de Comando](/assets/img/apps/app-get.jpg)

Gerencie seus AppImages de forma prática e pelo terminal.

# Instalação
{% highlight bash %}
git clone https://github.com/terroo/app-get up-app-get
cd up-app-get
./INSTALL && source ~/.bashrc
cd .. && rm -rf up-app-get/
{% endhighlight %}

# Uso
{% highlight bash %}
usage: app-get [options] [package]
  
  Options:
    ---list            Lists all available packages
    --nocolor          Disable colors
    --update           Checks and updates this program
    --info [package]   Describes data for an available package
    --remove [package] Removes the informed package
    -h,--help          Show this content
    -v,--version       Show version

  Example, install qbittorrent: $ app-get qbittorrent  
{% endhighlight %}

# Contribua
Veja como diretamente no repositório oficial do programa:
## <https://github.com/terroo/app-get>

> Se tiver problemas com exibição de fonts, recomendo instalar essas fontes: <https://github.com/terroo/fonts>

<!-- LISTA MIN -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# Assista o vídeo
<iframe width="1234" height="694" src="https://www.youtube.com/embed/F0rsjX7xoOQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

# Veja também:
🔗 [Musicalypse - Um reprodutor de áudio e servidor criado com ElectronJs](https://terminalroot.com.br/2020/05/instale-o-musicalypse-um-reprodutor-de-audio-e-servidor-criado-com-electron.html)

