---
layout: post
title: "Como Deixar sua Polybar com BSPWM Assim!"
date: 2021-08-12 12:21:08
image: '/assets/img/tv/dotfiles.jpg'
description: 'Minha Polybar e outras configurações para BSPWM no Linux'
icon: 'ion:terminal-sharp'
iconname: 'TerminalRootTV'
tags:
- polybar
- bspwm
- terminalroot
---

![Como Deixa sua Polybar com BSPWM Assim!](/assets/img/tv/dotfiles.jpg)

🔊 Algumas pessoas pediram a minha configuração da Polybar e do BSPWM, então fiz esse vídeo pra ficar mais fácil a forma como você deixar igual a minha.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# Assista ao Vídeo
<iframe width="910" height="390" src="https://www.youtube.com/embed/5UHDruEz7dI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

# Dependências
+ [bspwm](https://github.com/baskerville/bspwm)
+ [polybar](https://github.com/polybar/polybar)
+ [fonts](https://github.com/terroo/fonts) `rm -rf ~/.local/share/fonts`
+ [git](https://git-scm.com)
+ [feh](https://feh.finalrewind.org/) 
+ [Lua](https://www.lua.org/)
+ [wmctrl](http://tripie.sweb.cz/utils/wmctrl/) `sudo apt install wmctrl`
> A maioria das dependências mencionadas acima foram feitas neste vídeo: <https://www.youtube.com/watch?v=CivY-yfRBeY>

# Instalação
{% highlight bash %}
git clone https://github.com/terroo/dotfiles
cd dotfiles
{% endhighlight %}

Faça backup de seu Polybar se você já o tiver
{% highlight bash %}
tar -zcvf polybar-old.tar.gz ~/.config/polybar
{% endhighlight %}

Mover (e/ou remover) arquivos
{% highlight bash %}
rm -rf ~/.config/polybar
mv polybar $HOME/.config
mv Xresources $HOME/.Xresources
{% endhighlight %}

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


# Configurações
Adicione ao seu: `$HOME/.config/bspwm/bspwmrc`:
{% highlight bash %}
xrdb ${HOME}/.Xresources
$HOME/.config/polybar/launch.sh &
$HOME/.fehbg
{% endhighlight %}

Alterar o papel de parede:
{% highlight bash %}
mv wallpaper.jpg ~/Pictures
feh --bg-scale ~/Pictures/wallpaper.jpg
{% endhighlight %}

Mude o ícone do Gentoo de acordo com seu sistema, veja todos os ícones disponíveis executando o arquivo:
{% highlight bash %}
lua systems-icons.lua
{% endhighlight %}

Se desejar, altere o nome TERROO para o seu nome, por exemplo:
{% highlight bash %}
sed -i "s/TERROO/$USER/g" ~/.config/polybar/config
{% endhighlight %}

Se você deseja que as faixas de música apareçam na barra ao executar o MPD, verifique este vídeo: <https://www.youtube.com/watch?v=tholV10zDi0>

Deslogue e logue novamente!
{% highlight bash %}
bspc quit
{% endhighlight %}

Link do repositório:
## <https://github.com/terroo/dotfiles>


