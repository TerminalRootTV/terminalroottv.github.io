---
layout: post
title: "Conheça esse Motor de Jogos feito com Golang e Vulkan"
date: 2026-08-09 20:23:05
image: '/assets/img/gamedev/kaiju.jpg'
description: "🎮 Com UI personalizada, Shaders, jogos 3D e 2D, Editor e muito mais!"
icon: 'ion:terminal-sharp'
iconname: 'GameDev'
tags:
- gamedev
- go
- vulkan
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**Kaiju Engine* é um **motor de jogos de [código aberto](https://terminalroot.com.br/tags#opensource) para jogos 2D e 3D**, desenvolvido em [Go](https://terminalroot.com.br/tags#go) e com renderização baseada em [Vulkan](https://terminalroot.com.br/tags#vulkan). 

O Kaiju foi pensado para permitir dois estilos de desenvolvimento:

+ **Editor visual** — para trabalhar com cenas, assets, materiais, UI e efeitos.
+ **Code-first** — para quem prefere controlar o jogo diretamente através de código Go.

O engine possui suporte para **[Windows](https://terminalroot.com.br/tags#windows), [GNU/Linux](https://terminalroot.com.br/tags#gnulinux) e [macOS](https://terminalroot.com.br/tags#macos)**, além de possibilitar [desenvolvimento de jogos](https://terminalroot.com.br/tags#gamedev) 2D e 3D, ferramentas, protótipos, física, partículas, áudio e muito mais.


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

## Instalação
### no Windows
Para compilar o Kaiju no Windows, é necessário utilizar uma versão **64-bit do Go** e ter o Vulkan SDK instalado. A documentação também recomenda o [MinGW](https://terminalroot.com.br/2022/12/como-instalar-gcc-gpp-mingw-no-windows.html) para o ambiente de desenvolvimento.

Primeiro, clone o repositório:

{% highlight bash %}
git clone --recurse-submodules https://github.com/KaijuEngine/kaiju.git
cd kaiju/src
{% endhighlight %}

Verifique se o Go está utilizando a arquitetura correta:

{% highlight bash %}
go env GOARCH
{% endhighlight %}

O resultado esperado é:

{% highlight text %}
amd64
{% endhighlight %}

Depois, compile:

{% highlight bash %}
go build -tags="debug,editor,filedrop" -o ../ ./
{% endhighlight %}

Isso gera o executável do Kaiju no diretório raiz do projeto.

> Caso apareça um erro relacionado a `XINPUT1_3.dll`, pode ser necessário instalar o runtime do DirectX.

---

### no GNU/Linux
Você precisa ter o **Go**, o **Vulkan SDK**, o GCC e as bibliotecas [X11](https://terminalroot.com.br/2024/06/rodando-godot-gdscript-e-csharp-no-xorg-com-placas-intel.html) necessárias.

Depois de clonar o projeto:

{% highlight bash %}
git clone --recurse-submodules https://github.com/KaijuEngine/kaiju.git
cd kaiju/src
{% endhighlight %}

Compile com:

{% highlight bash %}
go build -tags="debug,editor,filedrop" -o ../ ./
{% endhighlight %}

Ou, para uma build sem os símbolos de debug:

{% highlight bash %}
go build -ldflags="-s -w" -tags="editor" -o ../ ./
{% endhighlight %}

A documentação oficial destaca a necessidade do GCC e das bibliotecas X11 para o desenvolvimento no Linux.

---

### no macOS
No macOS, comece instalando as ferramentas de linha de comando do Xcode:

{% highlight bash %}
xcode-select --install
{% endhighlight %}

Também é necessário instalar o **Vulkan SDK**.

Depois:

{% highlight bash %}
git clone --recurse-submodules https://github.com/KaijuEngine/kaiju.git
cd kaiju/src
{% endhighlight %}

Configure a variável `VULKAN_SDK` apontando para a instalação do SDK. Por exemplo:

{% highlight bash %}
export VULKAN_SDK=$HOME/Library/VulkanSDK/1.4.XXX.X/macOS
{% endhighlight %}

Depois, faça a compilação:

{% highlight bash %}
go build -tags="debug,editor,filedrop" -o ../ ./
{% endhighlight %}

Os detalhes do caminho do Vulkan SDK podem variar de acordo com a versão instalada.

---


<!-- RECTANGLE LARGE -->
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

## Primeiros passos
Depois de compilar o engine, você pode começar pelo **editor**, explorando cenas, assets, materiais, UI, partículas e shaders.

Outra opção é começar diretamente pelo código.

O Kaiju possui um fluxo **code-first**, no qual você pode criar o jogo utilizando Go sem depender do editor visual. Nesse caso, a documentação recomenda Go 1.22 ou superior, Git e um compilador C, já que o engine utiliza CGo.

O primeiro passo é clonar o projeto:

{% highlight bash %}
git clone --recurse-submodules https://github.com/KaijuEngine/kaiju.git
cd kaiju/src
{% endhighlight %}

Depois:

{% highlight bash %}
go build -o kaiju .
{% endhighlight %}

No Windows:

{% highlight bash %}
.\kaiju.exe
{% endhighlight %}

No Linux/macOS:

{% highlight bash %}
./kaiju
{% endhighlight %}

Na primeira execução, o engine pode criar o diretório `game_content` utilizando os assets padrão. O exemplo inicial apresenta uma esfera girando, servindo como um primeiro contato com o runtime.

A partir daí, você pode começar a substituir o conteúdo de exemplo, adicionar seus próprios assets e escrever a lógica do jogo em Go.

---

Para mais informações acesse o **repositório:** <https://github.com/KaijuEngine/kaiju>


