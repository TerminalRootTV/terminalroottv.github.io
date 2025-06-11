---
layout: post
title: "Conheça a Linguagem Beef - Específica para Desenvolvedores de Jogos"
date: 2025-06-11 18:14:16
image: '/assets/img/gamedev/beef.jpg'
description: "🐮 Uma 'carne bovina' parecida com CSharp e feita com C++"
icon: 'ion:terminal-sharp'
iconname: 'GameDev'
tags:
- gamedev
- programacao
- csharp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**Beef** é uma linguagem open‑source, compilada e voltada a alto desempenho, especialmente desenhada para o desenvolvimento de aplicações em tempo real como jogos, unindo desempenho com produtividade.

• Sintaxe inspirada em [C#](https://terminalroot.com.br/tags#csharp), com controle manual de memória inspirado em [C](https://terminalroot.com.br/tags#linguagemc) e [C++](https://terminalroot.com.br/tags#cpp), e ergonomia moderna inspirada por [Swift](https://terminalroot.com.br/tags#swift) e [Go](https://terminalroot.com.br/tags#go).

+ Projeto bem pensado, com IDE própria (Windows); 
+ Compilador CLI (Linux/macOS);
+ Debugger;
+ Assistentes de código;
+ e Hot‑compiling.

Beef é ideal para quem precisa de desenvolvimento rápido e controle fino de recursos, principalmente:
+ Desenvolvedores de Jogos e Motores de Jogos (console, desktop, WASM).
+ Projetos que exigem depuração eficiente, código hot‑reload, ergonomia orientada a produtividade.

Existe binário pré-compilado para [Windows](https://terminalroot.com.br/tags#windows), basta fazer o download e executar o `.exe`. 

Mas, no [macOS](https://terminalroot.com.br/tags#macos) e distros [GNU/Linux](https://terminalroot.com.br/tags#gnulinux) precisa compilar do zero.

Abaixo veremos o procedimento para compilar e instalar em distros [GNU](https://terminalroot.com.br/tags#gnu)/Linux.


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

## [Dependências](https://www.beeflang.org/docs/getting-start/building/#building-on-linux-and-macos)
Antes de mais nada, você vai precisar das seguintes ferramentas instaladas no seu sistema:

+ [CMake](https://terminalroot.com.br/tags#cmake) versão `3.15` ou mais recente
+ [LLVM](https://terminalroot.com.br/tags#llvm) versão `18` ou mais recente
+ [Git](https://terminalroot.com.br/tags#git)
+ [LibFFI](https://github.com/libffi/libffi)
+ [LibEdit](https://github.com/cdesjardins/libedit)
+ [ZLIB](https://terminalroot.com.br/2021/06/como-utilizar-a-biblioteca-zlib-com-cpp.html)
+ [zstd](https://github.com/facebook/zstd)
+ [LibCurl++](https://terminalroot.com.br/2025/01/como-consumir-apis-com-curl-e-cpp-no-terminal.html)
+ e [LibXML2](https://github.com/GNOME/libxml2)

Exemplo de instalação das dependências usando o `APT`:

{% highlight bash %}
sudo apt install clang-18 llvm-18 build-essential cmake git \
  libffi-dev libedit-dev zlib1g-dev zstd libcurlpp-dev libxml2-dev
{% endhighlight %}

Após isso é só clonar e [construir](https://www.beeflang.org/docs/getting-start/building/#build-steps-1):

{% highlight bash %}
git clone https://github.com/beefytech/Beef
cd Beef
./bin/build.sh
{% endhighlight %}

Antes dos testes aparecerá:
{% highlight bash %}
[******************************]
TIMING: Beef compiling: 37.2s
Frontend time: 23.48s
Comptime execution time: 3.67s
Linking BeefBuild_bootd...
SUCCESS
Building BeefBuild_d
[******************************]
Beef compilation time: 41.44s
Frontend time: 21.56s
Comptime execution time: 3.49s
Executing Command: ReadFile("$(WorkspaceDir)/../IDE/dist/IDEHelper_libs_d.txt", "IDEHelperLibs")
Testing IDEHelper/Tests in BeefBuild_d
{% endhighlight %}

Após finalizada a compilação, teste um [Hello, World!](https://www.beeflang.org/docs/getting-start/#creating-an-ide-based-hello-world) via linha de comando:

+ Entre na pasta que foi criado o binário:
{% highlight bash %}
cd IDE/dist
{% endhighlight %}

+ Crie um [novo projeto](https://www.beeflang.org/docs/ide/commandline/#beef-ide-command-line-arguments)

{% highlight bash %}
./BeefBuild -new
{% endhighlight %}
> Aparecerá na saída: `Created new workspace in '/home/$USER/Beef/IDE/dist'`

Isso criará os arquivos:

+ `BeefProj.toml`, com o conteúdo:
{% highlight toml %}
FileVersion = 1

[Project]
Name = "dist"
StartupObject = "dist.Program"
{% endhighlight %}

+ `BeefSpace.toml`, com o conteúdo:
{% highlight toml %}
FileVersion = 1
Projects = {dist = {Path = "."}}

[Workspace]
StartupProject = "dist"
{% endhighlight %}

+ `src/` (pasta vazia)

Para criar um arquivo em `src/`, rode:
{% highlight bash %}
./BeefBuild -generate
{% endhighlight %}

Isso vai gerar a pasta `build/` e também o arquivo `Program.bf` dentro da pasta `src/Program.bf`. Mas, não tem um **Hello, World!** dentro do arquivo.

Edite o arquivo: `vim src/Program.bf` e insira um: `Console.WriteLine("Hello, world!");` dentro da função `Main()`, ficando assim:
{% highlight csharp %}
using System;

namespace dist;

class Program
{
	public static int Main(String[] args)
	{
    Console.WriteLine("Hello, world!");
		return 0;
	}
}
{% endhighlight %}

Agora rode o arquivo com o argumento `-run`:
{% highlight bash %}
./BeefBuild -run
{% endhighlight %}
> Aparecerá: `Hello, world!`.

---

## Instalação
Limpe os arquivos criados:

{% highlight bash %}
rm -rf src/ BeefSpace.toml build/ BeefProj.toml ../../.git ../../.gitignore
{% endhighlight %}

> Na verdade vc só precisará desses diretórios: 
+ `📁 BeefLibs/`
+ `📁 IDE/`
+ `📁 IDEHelper/`
+ `📁 jbuild/`
+ e `📁 jbuild_d/`

Mas, todos eles somam: `1,4GB` com os demais vão para `1,6GB`, então, se quiser só remova os arquivos gerados pelo teste realizado(*Hello, World!*) e os arquivos do Git.

Mova para `/opt/`:

{% highlight bash %}
cd ..
sudo mv Beef/ /opt/
{% endhighlight %}

Crie os links simbólicos para o *binário* e para as *libs*:

{% highlight bash %}
sudo ln -sf /opt/Beef/IDE/dist/BeefBuild /usr/local/bin/beef
sudo ln -sf /opt/Beef/jbuild/Release/bin/libhunspell.so /usr/local/lib/libhunspell.so
sudo ln -sf /opt/Beef/jbuild/Release/bin/libBeefRT.a /usr/local/lib/libBeefRT.a
sudo ln -sf /opt/Beef/jbuild/Release/bin/libBeefRT.a /opt/Beef/IDE/dist/libBeefRT.a
sudo ldconfig
{% endhighlight %}

Teste:
{% highlight bash %}
beef -version
{% endhighlight %}
> `BeefBuild 0.43.6`

Teste um novo projeto:
{% highlight bash %}
mkdir MyGameBeef
cd MyGameBeef/
beef -new
beef -generate
{% endhighlight %}

Modifique o arquivo `vim src/Program.bf`:
> Se quiser Syntax Highlight similar ao do CSharp no Vim: `:set filetype=cs` 

{% highlight csharp %}
using System;

namespace MyGameBeef {
  class Program {
    static void Main() {
      Console.WriteLine("My first game with Beef!");
    }
  }
}
{% endhighlight %}

Rode:
{% highlight bash %}
beef -run
{% endhighlight %}

Eu [testei o desempenho](https://terminalroot.com.br/2023/01/testei-o-desempenho-de-10-linguagens-de-programacao-ranking-final.html) do tempo gasto de mil ciclos para o [loop for](https://www.beeflang.org/docs/language-guide/statements/#for) com esse código:
{% highlight csharp %}
for(int i = 0; i <= 1000000; ++i){
  Console.Write(scope $"{i}Ok\r");
}
{% endhighlight %}

O resultado foi:
{% highlight bash %}
1000000Ok
real	0m6,767s
user	0m2,717s
sys	0m3,292s
{% endhighlight %}


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

---

Para mais informações acesse o endereço oficial em: <https://www.beeflang.org/> e o repositório: <https://github.com/beefytech/Beef>.

