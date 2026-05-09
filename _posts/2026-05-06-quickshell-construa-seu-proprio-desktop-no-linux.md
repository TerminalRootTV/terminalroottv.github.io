---
layout: post
title: "Quickshell: construa seu próprio desktop no Linux"
date: 2026-05-06 09:23:06
image: '/assets/img/gnulinux/img-quick-shell-800.jpg'
description: "🔳 Em vez de depender de soluções prontas (Waybar, Polybar, ...), você cria o seu próprio."
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- qt
- gnulinux
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

O **Quickshell** é um toolkit moderno feito com [C++](https://terminalroot.com.br/tags#cpp) para criar componentes de interface de desktop — barras, widgets, lock screens, launchers e até ambientes completos — usando [QtQuick + QML](https://terminalroot.com.br/tags#qt).


+ Não é um "programa de barra".
+ Também não é um desktop completo pronto.

É uma **base para construir um desktop customizado**, rodando junto com um compositor como Hyprland, Sway ou i3.

Na prática, ele substitui várias peças:

* barra (status bar)
* notificações
* widgets
* lockscreen
* display manager
* controles de sistema


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

## Exemplo

O Quickshell usa:

* **QtQuick (UI)**
* **QML (configuração/programação)**
* Hot reload (salvou → atualizou na hora) ([Quickshell][2])

Exemplo simples (barra):

{% highlight qml %}
PanelWindow {
  anchors {
    top: true
    left: true
    right: true
  }

  implicitHeight: 30

  Text {
    anchors.centerIn: parent
    text: "hello world"
  }
}
{% endhighlight %}

### Integrações nativas:

Um dos pontos fortes é já vir integrado com o sistema:

* Wayland + X11 (windowing)
* Hyprland, i3, Sway (workspaces)
* PipeWire (áudio)
* BlueZ (Bluetooth)
* UPower (bateria)
* MPRIS (players de mídia)
* system tray padrão

Isso elimina muito boilerplate.

---

## Instalação
+ Arch Linux / EndeavourOS / Manjaro
{% highlight bash %}
yay -S quickshell
### Ou
paru -S quickshell
{% endhighlight %}

Ou construa do zero em qualquer sistema:

Dependências:
{% highlight bash %}
sudo apt install cmake ninja-build qt6-base-dev qt6-declarative-dev \
qt6-wayland wayland-protocols libpipewire-0.3-dev \
libdbus-1-dev libxkbcommon-dev
{% endhighlight %}

Clone:
{% highlight bash %}
git clone https://github.com/quickshell-mirror/quickshell.git
cd quickshell
{% endhighlight %}

Construa:
{% highlight bash %}
cmake -B build -G Ninja
cmake --build build
{% endhighlight %}

Instale:
{% highlight bash %}
sudo cmake --install build
{% endhighlight %}

Rode:
{% highlight bash %}
quickshell
{% endhighlight %}

Configuração:

{% highlight bash %}
~/.config/quickshell/main.qml
{% endhighlight %}

Exemplo mínimo:

{% highlight qml %}
import QtQuick
import Quickshell

PanelWindow {
    anchors.top: true
    anchors.left: true
    anchors.right: true
    implicitHeight: 30

    Text {
        anchors.centerIn: parent
        text: "Quickshell funcionando"
    }
}
{% endhighlight %}

* Funciona melhor em **Wayland** (Hyprland, Sway, etc.)
* Em X11 pode ser limitado
* Ainda está em desenvolvimento → bugs são normais
* Sem config = tela vazia


---

Para mais informações acesse o [repositório](https://github.com/quickshell-mirror/quickshell).

---

## [Aprenda Qt](https://terminalroot.com.br/qt)
### <https://terminalroot.com.br/qt>
## [Aprenda C++ Completo](https://terminalroot.com.br/promo)
### <https://terminalroot.com.br/promo>



