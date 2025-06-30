---
layout: post
title: "Automatize seus projetos com Premake"
date: 2025-06-30 14:48:25
image: '/assets/img/compiladores/premake.jpg'
description: "🚀 Gere facilmente arquivos para o comando make, Visual Studio, Xcode e entre outros."
icon: 'ion:terminal-sharp'
iconname: 'Build System'
tags:
- compiladores
- gcc
- visualstudio
- cmake
- make
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Nós já falamos de uma ferramenta similar que é o [Xmake](https://terminalroot.com.br/2021/09/compile-para-c-cpp-com-xmake-baseado-em-lua.html), o Premake é similar, mas automatiza arquivos para IDEs como Visual Studio e Xcode.

**Premake** é uma ferramenta de automação de *build* [open-source](https://terminalroot.com.br/tags#opensource) que gera arquivos de projeto (como [Makefiles](https://terminalroot.com.br/tags#make), [Visual Studio](https://terminalroot.com.br/2023/06/como-compilar-com-msvc-via-linha-de-comando.html), Xcode etc.) a partir de scripts escritos em **Lua**.

Premake automatiza a criação de projetos para múltiplas plataformas e [IDEs](https://terminalroot.com.br/2021/12/os-32-melhores-ides-editores-de-texto-para-cpp.html). Ele **não compila** diretamente, mas **gera** os arquivos de build apropriados para ferramentas como:

* `make` (GNU)
* `Visual Studio`
* `Xcode`
* `GNU Make`
* `Code::Blocks`
* `CMake` (indiretamente, com wrappers)

Útil principalmente em projetos [C](https://terminalroot.com.br/tags#c)/[C++](https://terminalroot.com.br/tags#cpp) multiplataforma.

As versões possuem configurações diferentes nos arquivos `premakeNUM.lua`, ou seja, um `premake4.lua` não é compatível com o `premake5.lua`.


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
No [Windows](https://terminalroot.com.br/tags#windows) já há a versão 5 disponível para [WinGet](winget install --id=Premake.Premake.5.Beta  -e), basta rodar:

{% highlight powershell %}
winget install --id=Premake.Premake.5.Beta  -e
{% endhighlight %}

No entanto, nem todas as distros GNU/Linux possuem a versão mais recente nos repositórios, no Ubuntu, por exemplo, só há versão 4, exemplo de instalação:

{% highlight bash %}
sudo apt install premake4
{% endhighlight %}

Mas, você pode clonar, compilar e instalar direto do código fonte:

{% highlight sh %}
sudo apt install git build-essential
git clone --depth=1 https://github.com/premake/premake-core.git
cd premake-core
make -f Bootstrap.mak linux
sudo cp bin/release/premake5 /usr/local/bin/
premake5 --version
{% endhighlight %}

---

## Utilização
O procedimento para utilizar o Premake pode diferir dependendo da versão. Exemplo de criação de projeto com Premake4:

{% highlight bash %}
mkdir -p MeuProjeto/src
cd MeuProjeto
vim src/main.cpp # Hello, World!
{% endhighlight %}

Crie o arquivo para o Premake4, ex.: `vim premake4.lua`
{% highlight lua %}
solution "MeuProjeto"
   configurations { "Debug", "Release" }

project "MeuApp"
   language "C++"
   kind "ConsoleApp"
   location "build"
   files { "src/**.cpp", "include/**.hpp" }
   includedirs { "include" }

configuration "Debug"
   targetdir "bin/Debug"

configuration "Release"
   targetdir "bin/Release"
{% endhighlight %}

Agora gere com o comando:
{% highlight bash %}
premake4 gmake # Unix
{% endhighlight %}

E depois é só compilar e rodar:
{% highlight bash %}
make
./bin/Debug/MeuApp
{% endhighlight %}

#### Versão 5
Crie um arquivo de nome: `premake5.lua` e inclua o código abaixo

Exemplo básico:

{% highlight lua %}
workspace "MeuProjeto"
   configurations { "Debug", "Release" }
   language "C++"
   location "build"

project "MeuApp"
   kind "ConsoleApp"
   files { "src/**.cpp", "include/**.h" }
   includedirs { "include" }
   targetdir "bin/%{cfg.buildcfg}"
{% endhighlight %}


Gerar arquivos para uma IDE

{% highlight sh %}
premake5 vs2022       # Visual Studio 2022
premake5 gmake2       # Makefiles para Linux
premake5 xcode4       # Xcode
{% endhighlight %}

Compilar
* Visual Studio: abra `.sln` e compile.
* Linux:

{% highlight sh %}
premake5 gmake2
cd build
make config=release
{% endhighlight %}

---

Para mais informações acesse os links abaixo e o *help*:
* Site oficial: [https://premake.github.io/](https://premake.github.io/)
* GitHub: [https://github.com/premake/premake-core](https://github.com/premake/premake-core)
* Lista de ações: `premake5 --help`


