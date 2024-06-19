---
layout: post
title: "Crie Janelas de modo imediato em Linguagem C com MicroUI"
date: 2024-06-19 12:27:40
image: '/assets/img/c/microui.jpg'
description: "🪟 Uma pequena biblioteca de UI de modo imediato."
icon: 'ion:terminal-sharp'
iconname: 'Linguagem C'
tags:
- linguagemc
- gui
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Para quem já conhece o [Dear ImGui](https://terminalroot.com.br/tags#imigui), o **MicroUI** é uma alternativa simplista para [Linguagem C](https://terminalroot.com.br/tags#linguagemc).

Características do **MicroUI**:
+ Minúsculo: próximo `1100 sloc`(Linhas de Código Fonte) de ANSI C;
+ Funciona em uma região de memória de tamanho fixo: nenhuma memória adicional é alocada;
+ Controles integrados: janela, painel rolável, botão, controle deslizante, caixa de texto, rótulo, caixa de seleção, texto quebrado;
+ Funciona com qualquer sistema de renderização que possa desenhar retângulos e texto;
+ Projetado para permitir que o usuário adicione facilmente controles personalizados;
+ Sistema de layout simples.


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

# Utilização
Para usar o MicroUI você precisará de:
+ [Um compilador para Linguagem C](https://terminalroot.com.br/2023/07/lista-dos-10-melhores-compiladores-c-cpp.html)
+ [SDL2](https://terminalroot.com.br/tags#sdl2)
+ e do [OpenGL](https://terminalroot.com.br/tags#opengl)

Devidamente instalados na sua máquina ou através do [Conan](https://terminalroot.com.br/2021/02/conan-um-gerenciador-de-pacotes-para-c-cpp.html) ou [Vcpkg](https://terminalroot.com.br/2021/09/instale-o-vcpkg-um-gerenciador-de-pacotes-para-c-cpp.html), além do [Git](https://terminalroot.com.br/tags#git) para clonar o repositório:

{% highlight bash %}
git clone https://github.com/rxi/microui
{% endhighlight %}

Após clonado. Para testar, você pode entrar no subdiretório do exemplo:

{% highlight bash %}
cd microui/demo
{% endhighlight %}

Compilar e rodar:
{% highlight bash %}
gcc main.c renderer.c ../src/microui.c -I../src -Wall -std=c11 -pedantic `sdl2-config --libs` -lGL -lm
./a.out # Rodar
{% endhighlight %}
> Alternativamente há um `build.sh` no mesmo diretório!

A possível e provável exibição das janelas do demo:

[![MicroUI rodando](/assets/img/c/microui-running.png)](/assets/img/c/microui-running.png)
> Abra a imagem em uma nova guia para uma maior resolução.

Para mais iformações veja o [usage.md](https://github.com/rxi/microui/blob/master/doc/usage.md) do [repositório do MicroUI no GitHub](https://github.com/rxi/microui/).

---

## [Aprenda Linguagem C](https://terminalroot.com.br/c):
### <https://terminalroot.com.br/c>



