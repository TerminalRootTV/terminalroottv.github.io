---
layout: post
title: "Customize o LightDM do Arch Linux"
date: 2020-12-06 19:40:41
image: '/assets/img/themes/lightdm-theme.jpg'
description: 'O LightDM usa vários front-ends para desenhar interfaces de login, também chamados de Greeters.'
icon: 'carbon:screen'
iconname: 'lightdm'
tags:
- lightdm
- arch
---

![Customize o LightDM do Arch Linux](/assets/img/themes/lightdm-theme.jpg)

O LightDM é um gerenciador de exibição X que tem como objetivo ser leve, rápido, extensível e multi-desktop. Ele usa vários front-ends para desenhar interfaces de login, também chamados de Greeters.

Nesse artigo/vídeo vamos instalar um *greeter webkit2* e customizá-lo com o tema **Glorious**.

Primeiramente você vai precisa ter instalado o [LightDM](https://terminalroot.com.br/2016/05/como-instalar-o-gdm3-ou-configurar-o.html), [Git](https://terminalroot.com.br/git/), [Wget](https://terminalroot.com.br/2019/05/aprenda-a-explorar-o-comando-wget.html) e o [Greeter WebKit2](https://www.archlinux.org/packages/community/x86_64/lightdm-webkit2-greeter/):

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

{% highlight bash %}
pacman -S lightdm lightdm-webkit2-greeter wget
{% endhighlight %}

Após isso é necessário configurar o *greeter* para o LightDM: `sudo vim /etc/lightdm/lightdm.conf` , procure a linha que tem a palavra: `greeter-session` e defina o valor para: `lightdm-webkit2-greeter`.

Depois só adicionar o LightDM para iniciar automaticamente:
{% highlight bash %}
sudo systemctl enable lightdm.service
{% endhighlight %}
E reinicie seu PC. Após reiniciar o LightDM já será incializado e com o tema *default* **antergos**.

# Alterar o tema do WebKit2
Para alterar para o tema [Glorious](https://github.com/manilarome/lightdm-webkit2-theme-glorious), primeiro faça o download do tema com o comando:
{% highlight bash %}
wget git.io/webkit2 -O tema.tar.gz
{% endhighlight %}

Crie um diretório para que os arquivos após descopactados não fiquem espalhados:
{% highlight bash %}
mkdir glorious
mv tema.tar.gz glorious/
cd glorious
tar zxvf tema.tar.gz
rm tema.tar.gz
cd ..
{% endhighlight %}

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

Mova o diretório para o diretório de temas do LightDM:
{% highlight bash %}
sudo mv glorious/ /usr/share/lightdm-webkit/themes/
{% endhighlight %}

Agora vamos alterar para o novo tema, edite o arquivos: `sudo vim /etc/lightdm/lightdm-webkit2-greeter.conf`

+ Habilite o modo *debug* para caso haja alguma falha, basta clicar com o botão direito para deslogar: `debug_mode = true`
+ Altere o nome *antergos* para **glorious**: `webkit_theme = glorious`

Agora é só reiniciar para ver se as alterações funcionaram:
{% highlight bash %}
sudo reboot
{% endhighlight %}

Se tiver algum problema no funcionamento, recomendo instalar [essas fontes](https://github.com/terroo/fonts) .

# Para mais detalhes assista ao vídeo

<iframe width="910" height="390" src="https://www.youtube.com/embed/g72DFjJ5eWM" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> 

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


