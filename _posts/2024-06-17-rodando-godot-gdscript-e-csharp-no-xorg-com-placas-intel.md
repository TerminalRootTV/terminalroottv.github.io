---
layout: post
title: "Rodando Godot GDScript e CSharp no Xorg com Placas Intel"
date: 2024-06-17 08:38:30
image: '/assets/img/godot/godot-dri-3-glamor.jpg'
description: "🤖 Se você tiver com esse mesmo problema, tente essas configurações!"
icon: 'ion:terminal-sharp'
iconname: 'Godot'
tags:
- godot
- gamedev
- dicas
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Eu costumo usar [gerenciadores de janelas](https://terminalroot.com.br/tags#wm) na minha máquina porque consomem menos recursos do computador: memória, processamento,... E com isso melhora o desempenho.

Mas, eu tinha um problemas relacionado a *Tearing*(a tela ficava "*cortando ao meio*"), principalmente quando fazia *screencast*.

Então, eu resolvi esse problema criando um arquivo de configuração em `/etc/X11/xorg.conf.d/20-intel.conf` e inserindo o conteúdo abaixo:

{% highlight bash %}
Section "Device"
    Identifier  "Intel Graphics"
    Driver      "intel"
    Option      "AccelMethod"    "sna"
    Option      "DRI"          "2"
    Option     	"TearFree"     "true" 
EndSection
{% endhighlight %}

No entanto, um dia eu decidi instalar o [Godot CSharp](https://terminalroot.com.br/tags#csharp) e ao abrir, ou até quando conseguia abrir, mas depois de tentar abrir um projeto, eu obtia o erro:

{% highlight bash %}
Your video card drivers seem not to support the required Vulkan version.

If possible, consider updating your video card drivers or using the OpenGL 3 driver.

You can enable the OpenGL 3 driver by starting the engine from the
command line with the command:

    "godot-csharp" --rendering-driver opengl3

If you recently updated your video card drivers, try rebooting.
{% endhighlight %}
![Godot erro](/assets/img/godot/err-godot.png)

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

Mesmo rodando via linha de comando conforme a mensagem indicava `godot-csharp --rendering-driver opengl3`, não funcionava:
{% highlight bash %}
Godot Engine v4.1.3.stable.mono.official.f06b6836a - https://godotengine.org
vulkan: No DRI3 support detected - required for presentation
Note: you can probably enable DRI3 in your Xorg config
ERROR: None of Vulkan devices supports both graphics and present queues.
   at: _create_physical_device (drivers/vulkan/vulkan_context.cpp:1278)
ERROR: Condition "err != OK" is true. Returning: ERR_CANT_CREATE
   at: _window_create (drivers/vulkan/vulkan_context.cpp:1681)
ERROR: Can't create a Vulkan window
   at: _create_window (platform/linuxbsd/x11/display_server_x11.cpp:5300)
libEGL warning: failed to get driver name for fd -1
...
{% endhighlight %}

Só que geralmente a gente ignora as mensagens e simplesmente resume em: "*- Ahhh! Deu erro.. :(*"

No entanto, na segunda tentativa eu decidi ler as *mensagens* da saída e note que nelas há a seguinte linha:
{% highlight bash %}
vulkan: No DRI3 support detected - required for presentation
{% endhighlight %}
> O **Vulkan** precisa dessa configuração!

Então pensei comigo: *— Ummm... já sei!!*.

Alterei o mesmo arquivo de configuração para **DRI 3**, mas após feito ainda estava meio estranho, então troquei o método de aceleração de *sna* para **glamor**.

Ao final meu arquivo: `/etc/X11/xorg.conf.d/20-intel.conf` ficou assim:
{% highlight bash %}
Section "Device"
    Identifier  "Intel Graphics"
    Driver      "intel"
    Option      "AccelMethod"    "glamor"
    Option      "DRI"          "3"
    Option     	"TearFree"     "true" 
EndSection
{% endhighlight %}

Bastou eu encerrar a sessão(deslogar) e entrar novamente que as coisas funcionaram:

![Godot C# rodando](/assets/img/godot/godot-csharp.jpeg) 

Se você tiver com esses memsmo problema, tente essas configurações!

Você ainda pode substituir algumas linhas como o: `Driver` ou até mesmo adicionar também `Backlight` para funcionar com o `MESA Intel`:
{% highlight bash %}
...
Driver      "modesetting"
Option     "Backlight"    "Intel_backlight"
...
{% endhighlight %}

Caso seja necessário!

**OBSERVAÇÃO**: 

Talvez você tenha chegado até aqui imaginando que aqui haveria solução para outro tipo problema: um bug do Godot que "*trava*" quando você salva qualquer modificação no seu projeto. 

Eu já pesquisei sobre isso, inclusive de pessoas que já rodaram oo [GDB](https://terminalroot.com.br/2020/06/gdb-a-melhor-ferramenta-para-encontrar-suas-falha-de-segmentacao.html) pra saber exatamente onde há essa falha. 

Se você usa distros [GNU/Linux](https://terminalroot.com.br/tags#gnulinux) muito provavelmente isso ocorre por conta da sua Interface Gráfica: [GNOME](https://terminalroot.com.br/tags#gnome), bem como as baseadas nela: [XFCE](https://xfce.org/), [Cinnamon](https://github.com/linuxmint/cinnamon),... incluindo os [gerenciadores de janelas](https://terminalroot.com.br/tags#wm). 

A boa notícia é que se você usar [KDE Plasma](https://kde.org/pt-br/plasma-desktop/), provavelmente não terá esse tipo de problema!

---

# Links úteis
+ <https://godotengine.org/>
+ <https://docs.godotengine.org/en/stable/tutorials/scripting/c_sharp/index.html>
+ <https://x.com/TerminalRootTV/status/1722975145512280507/photo/1>

