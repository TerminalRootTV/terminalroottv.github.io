---
layout: post
title: "Como Instalar e Configurar o BSPWM com Temas para POLYBAR"
date: 2021-06-26 10:15:20
image: '/assets/img/wm/bspwm-polybar-ubuntu.jpg'
description: 'Em 7 míseros passos!'
icon: 'ion:terminal-sharp'
iconname: 'bspwm + polybar'
tags:
- bspwm
- polybar
- ubuntu
---

![Como Instalar e Configurar o BSPWM com Temas para POLYBAR](/assets/img/wm/bspwm-polybar-ubuntu.jpg)

🔊 Nesse vídeo instalamos e configuramos o BSPWM com um COLEÇÃO DE TEMAS para a POLYBAR . Além de aplicativos como: FEH, ROFI, COMPON, NUMLOCKX com configuração DARK do ema para GTK e RESOLVEMOS PROBLEMAS de TEARING e mais outras dicas. Vale muito à pena assistir!

<iframe width="910" height="390" src="https://www.youtube.com/embed/CivY-yfRBeY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

# Comandos e arquivos utilizados no vídeo

## 1º - Atualize o sistema
{% highlight bash %}
sudo apt update && \
sudo apt upgrade -y && \
sudo apt clean && \
sudo apt autoclean && \
sudo apt autoremove -y
{% endhighlight %}

---

## 2º - Instalar e Configurar o BSPWM
+ Instalar
{% highlight bash %}
sudo apt install bspwm sxhkd
{% endhighlight %}

+ Configurar
{% highlight bash %}
mkdir -p ~/.config/{bspwm,sxhkd}
cp /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/
cp /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/
chmod +x ~/.config/bspwm/bspwmrc ~/.config/sxhkd/sxhkdrc
sed -i 's/urxvt/gnome-terminal/g' ~/.config/sxhkd/sxhkdrc
{% endhighlight %}

Deslogar e alterar para iniciar sessão com BSPWM.

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

## 3º - Instalar e Configurar: Feh, Rofi e Compton
Alterar menu e roll do gnome-terminal e/ou ajustar cores do terminal para transparência.
+ Instalar
{% highlight bash %}
sudo apt install feh rofi
{% endhighlight %}

+ Configurar
{% highlight bash %}
rofi-theme-selector # [android_notification by Rasi ] Alt-a
# Para mais temas do Rofi, veja esse vídeo: https://www.youtube.com/watch?v=cDDMrUwrce0
vim ~/.config/sxhkd/sxhkdrc
# program launcher
# super + d
#         rofi -show drun -show-icons
# :wq
# super + ESC
wget git.io/sam123 -O samurai.jpg
feh --bg-scale samurai.jpg
echo '${HOME}/.fehbg' >> ~/.config/bspwm/bspwmrc
echo 'compton &' >> ~/.config/bspwm/bspwmrc
{% endhighlight %}
> Se quiser crie comandos para os modos: window, combi, keys e run

---

## 4º - Escolhendo o tema e deixando Dark 
{% highlight bash %}
vim ~/.config/gtk-3.0/settings.ini
{% endhighlight %}

Configuração:
{% highlight bash %}
[Settings]
gtk-icon-theme-name = Yaru-Cinnamon
gtk-theme-name = Yaru-Cinnamon-Dark
gtk-application-prefer-dark-theme = true
{% endhighlight %}
> Deslogue e logue para ver funcionando.

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


---

## 5º Resolvendo tearing no BSPWM
{% highlight bash %}
mkdir -p /etc/X11/xorg.conf.d
sudo vim /etc/X11/xorg.conf.d/20-intel.conf
{% endhighlight %}
Conteúdo:
{% highlight bash %}
Section "Device"
    Identifier  "Intel Graphics"
    # BSPWM
    Driver      "intel"
    Option      "AccelMethod"    "sna"
    Option      "DRI"          "2"
    Option     	"TearFree"     "true" 
    #Option     "Backlight"    "Intel_backlight"
    
    # GNOME
    #Driver      "modesetting"
    #Option      "AccelMethod"    "glamor"
    #Option      "DRI"          "3"
    #Option      "TearFree"     "true" 
EndSection
{% endhighlight %}

---

## 6º Opcional tema Dracula e NumLockx
{% highlight bash %}
sudo apt install numlockx
vim ~/.config/bspwm/bspwmrc
{% endhighlight %}

{% highlight bash %}
# Dracula: https://draculatheme.com/bspwm
bspc config normal_border_color "#44475a"
bspc config active_border_color "#bd93f9"
bspc config focused_border_color "#ff79c6"
bspc config presel_feedback_color "#6272a4"
# Ou
#bspc config active_border_color "#6272a4"
#bspc config focused_border_color "#8be9fd"

# which numlockx
/usr/bin/numlockx on
{% endhighlight %}

---

## 7º Polybar
+ Instale
{% highlight bash %}
sudo apt install polybar
{% endhighlight %}

+ Configure
{% highlight bash %}
mkdir -p ~/.config/polybar
cp /usr/share/doc/polybar/config ~/.config/polybar/config
#Teste para ver se está funcionando: 
polybar -c ~/.config/polybar/config example & # [Ctrl + D, ...]
{% endhighlight %}

+ Tornar definitivo ao logar
> `vim ~/.config/polybar/launch.sh`
{% highlight bash %}
#!/usr/bin/env sh
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar -c ~/.config/polybar/config example &
{% endhighlight %}
> `chmod +x ~/.config/polybar/launch.sh`
> 
> `echo '${HOME}/.config/polybar/launch.sh &' >> ~/.config/bspwm/bspwmrc`
> 
> Deslogue e logue para ver funcionando. 

---

## 8º Temas para a Polybar
+ Antes instale fonts e git

{% highlight bash %}
sudo apt install git
git clone https://github.com/terroo/fonts
cd fonts
mv fonts ~/.local/share/
fc-cache -fv
{% endhighlight %}

+ Agora clone o repositório dos temas:
{% highlight bash %}
git clone --depth=1 https://github.com/adi1090x/polybar-themes.git
cd polybar-themes
chmod +x setup.sh
./setup.sh
rm -rf polybar-themes
{% endhighlight %}

+ Uso:
{% highlight bash %}
$ bash ~/.config/polybar/launch.sh

Usage : launch.sh --theme

Available Themes :
--blocks    --colorblocks    --cuts      --docky
--forest    --grayblocks     --hack      --material
--panels    --pwidgets       --shades    --shapes
{% endhighlight %}
Vai aparecer essa falha do MPD porque não temos o MPD instalado, se quiser saber como instalar e configurar, veja esse vídeo: <https://www.youtube.com/watch?v=tholV10zDi0>

E se quiser tornar o tema que você escolheu definitivo, adicione o parametro ao seu `bspwmrc` vou deixar o `--forest` como padrão!

Se quiser adicionar ainda mais recursos, por exemplo:
+ Bloqueio de tela, veja esse artigo: <https://terminalroot.com.br/2019/08/como-criar-um-bloqueio-tela-no-i3-ou-bspwm.html>
+ Adicionar ferramentas: <https://terminalroot.com.br/2019/04/5-ferramentas-para-voce-usar-no-seu-wm.html>
+ Monitorar bateria e criar Notificações com Dunst: <https://terminalroot.com.br/2019/07/monitorando-a-bateria-do-notebook-via-shell-script-no-i3-bspwm-ou-outros.html>


