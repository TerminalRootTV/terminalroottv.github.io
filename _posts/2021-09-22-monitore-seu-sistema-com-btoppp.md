---
layout: post
title: "Monitore seu sistema com btop++"
date: 2021-09-22 10:57:42
image: '/assets/img/cpp/btop.png'
description: 'Escrito em C++'
icon: 'ion:terminal-sharp'
iconname: 'System'
tags:
- cpp
---

![Monitore seu sistema com btop++](/assets/img/cpp/btop.png)

**btop++** ou simplesmente **btop** é mais um monitor de sistema via [terminal](https://terminalroot.com.br/tags#terminal). Similar a alguns outros que nós já publicamos como: [gotop](https://terminalroot.com.br/2019/07/instale-o-gotop-um-monitor-grafico-do-sistema-via-terminal.html) e [bashtop](https://www.youtube.com/watch?v=HcZqbioaX9M), o diferencial dele é que é escrito em [C++](https://terminalroot.com.br/cpp), ou seja, tem um melhor desempenho.

# Instalação
Para instalar você precisará de um compilador para [C++](https://terminalroot.com.br/cpp), exemplo o [g++](https://gcc.gnu.org/):
{% highlight sh %}
sudo apt install g++
{% endhighlight %}

Em seguida, basta clonar e compilar o [Makefile](https://terminalroot.com.br/2019/12/como-criar-um-makefile.html):
{% highlight sh %}
https://github.com/aristocratos/btop
cd btop
make
sudo make install
{% endhighlight %}


<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# Utilização
Após instalado para abrir o btop++, basta rodar:
{% highlight sh %}
btop
{% endhighlight %}

Teclando `ESC` você pode escolher entre **Options**, **Help** ou sair do programa: **Quit** .

Veja os screenshots abaixo:

Quando usado em TTY:
![btop++ TTY](https://github.com/aristocratos/btop/raw/main/Img/tty.png)

Menu principal:
![btop++ menu](https://github.com/aristocratos/btop/raw/main/Img/main-menu.png)

Menu de ajuda:
![btop++ help](https://github.com/aristocratos/btop/raw/main/Img/options-menu.png)

---

Para mais informações consulte o repositório oficial:
## <https://github.com/aristocratos/btop>


