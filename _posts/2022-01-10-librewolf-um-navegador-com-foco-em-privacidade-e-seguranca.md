---
layout: post
title: "LibreWolf, um navegador com foco em privacidade e segurança"
date: 2022-01-10 12:26:16
image: '/assets/img/web/librewolf.png'
description: 'Disponível para Linux, OpenBSD, Windows e macOS.'
icon: 'ion:terminal-sharp'
iconname: 'Web Browser'
tags:
- firefox
- web
---

![LibreWolf, um navegador com foco em privacidade e segurança](/assets/img/web/librewolf.png)

---

**LibreWolf** é um navegador que é fork independente do [Firefox](https://terminalroot.com.br/tags#firefox), com os objetivos principais de privacidade, segurança e liberdade do usuário.

O LibreWolf foi projetado para aumentar a proteção contra técnicas de rastreamento e impressão digital, ao mesmo tempo que inclui algumas melhorias de segurança.

Isso é obtido por meio das configurações e [patches](https://terminalroot.com.br/2021/06/como-criar-aplicar-e-usar-o-comando-patch.html) voltados para privacidade e segurança. LibreWolf também visa remover toda a telemetria, coleta de dados e incômodos, bem como desabilitar recursos anti-liberdade como DRM.


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

# Instalação
O LibreWolf está disponível para [Linux](https://terminalroot.com.br/tags#linux), [OpenBSD](https://terminalroot.com.br/tags#openbsd), [Windows](https://terminalroot.com.br/tags#windows) e [macOS](https://terminalroot.com.br/tags#macos) .

No Linux existem procedimentos padrão para as seguintes [distribuições](https://terminalroot.com.br/tags#distros):

## [Ubuntu](https://terminalroot.com.br/tags#ubuntu) 20.{04,10} e [Linux Mint](https://terminalroot.com.br/tags#mint)
Basta adicionar o *source.list* do LibreWolf e instalar. Para isso faça:
{% highlight sh %}
echo "deb [arch=amd64] http://deb.librewolf.net focal main" | sudo tee /etc/apt/sources.list.d/librewolf.list
sudo wget https://deb.librewolf.net/keyring.gpg -O /etc/apt/trusted.gpg.d/librewolf.gpg
sudo apt update
sudo apt install librewolf -y
{% endhighlight %}

## No [Debian](https://terminalroot.com.br/tags#gentoo)
Para a versão 11 use:
{% highlight sh %}
echo "deb [arch=amd64] http://deb.librewolf.net $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/librewolf.list
sudo wget https://deb.librewolf.net/keyring.gpg -O /etc/apt/trusted.gpg.d/librewolf.gpg
sudo apt update
sudo apt install librewolf -y
{% endhighlight %}

Para outras versões do [Debian](https://terminalroot.com.br/tags#debian)(Unstable):
{% highlight sh %}
echo 'deb http://download.opensuse.org/repositories/home:/bgstack15:/aftermozilla/Debian_Unstable/ /' | sudo tee /etc/apt/sources.list.d/home:bgstack15:aftermozilla.list
curl -fsSL https://download.opensuse.org/repositories/home:bgstack15:aftermozilla/Debian_Unstable/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_bgstack15_aftermozilla.gpg > /dev/null
sudo apt update
sudo apt install librewolf -y
{% endhighlight %}

Se não der certo e você não conseguir instalar, limpe a bagunça:
{% highlight sh %}
sudo rm -f /etc/apt/sources.list.d/librewolf.list /etc/apt/trusted.gpg.d/librewolf.gpg 
{% endhighlight %}
> Há outra maneira usando AppImage, veja em um dos blocos abaixo desse artigo.


<!-- RECTANGLE 2 - OnParagragraph -->
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

## No [Gentoo](https://terminalroot.com.br/tags#gentoo)
Crie um repositório no caminho e arquivo: `/etc/portage/repos.conf/librewolf.conf` e insira esse conteúdo abaixo:
{% highlight sh %}
[librewolf]
priority = 50
location = <repo-location>/librewolf
sync-type = git
sync-uri = https://gitlab.com/librewolf-community/browser/gentoo.git
auto-sync = Yes
{% endhighlight %}

Agora altere a localização do repositório para um caminho de sua escolha e execute:
{% highlight sh %}
emaint -r librewolf sync
{% endhighlight %}
> o [Portage](https://wiki.gentoo.org/wiki/Portage) deve agora encontrar e atualizar o repositório.

Você também pode usar o `eselect` com o comando:
{% highlight sh %}
sudo eselect repository add librewolf git https://gitlab.com/librewolf-community/browser/gentoo.git
emaint -r librewolf sync
{% endhighlight %}

## No [Arch Linux](https://terminalroot.com.br/tags#arch)
Você pode usar o [AUR](https://terminalroot.com.br/2020/12/como-instalar-pacotes-do-aur-via-yay-no-arch-linux.html):
{% highlight sh %}
yay -S librewolf
{% endhighlight %}

## No [Fedora](https://terminalroot.com.br/tags#fedora)
{% highlight sh %}
sudo rpm --import https://keys.openpgp.org/vks/v1/by-fingerprint/034F7776EF5E0C613D2F7934D29FBD5F93C0CFC3
sudo dnf config-manager --add-repo https://rpm.librewolf.net
sudo dnf update
sudo dnf install librewolf
{% endhighlight %}

## via [AppImage](https://terminalroot.com.br/2020/05/conheca-o-app-get-um-gerenciador-de-appimages-via-linha-de-comando.html) para qualquer [distro](https://terminalroot.com.br/tags#distros)
**OBSERVAÇÃO**
> Esse AppImage provavelmente só funcionará se seu ambiente estiver rodando sob o [Wayland](https://terminalroot.com.br/2020/12/wayfire-um-compositor-3d-wm-instalacao-no-arch-linux.html) . Se você estiver sob [Xorg](https://terminalroot.com.br/2020/10/copie-e-cole-via-linha-de-comando-do-linux-com-xclip.html) você precisará(mais recomendado) usar o [AppImageLauncher](https://github.com/TheAssassin/AppImageLauncher)

{% highlight sh %}
wget -q https://gitlab.com/api/v4/projects/24386000/packages/generic/librewolf/95.0.2-1/LibreWolf.x86_64.AppImage
chmod +x LibreWolf.x86_64.AppImage
./LibreWolf.x86_64.AppImage
{% endhighlight %}

## Para instalar em outros sistemas operacionais
+ Para OpenBSD [veja aqui](https://librewolf.net/installation/openbsd/)
+ Para Windows [veja aqui](https://librewolf.net/installation/windows/)
+ e Para macOS [veja aqui](https://librewolf.net/installation/macos/)


---

Para mais informações, relatar issues e entre outros consulte os links:
+ <https://librewolf.net/>
+ <https://gitlab.com/librewolf-community>
+ <https://www.reddit.com/r/LibreWolf>
+ <https://lemmy.ml/c/librewolf>



