---
layout: post
title: "Crie Jogos 2D com HaxeFlixel"
date: 2023-04-25 10:09:06
image: '/assets/img/gamedev/haxeflixel.jpg'
description: 'Escrito com a linguagem de programação Haxe que também pode compilar para: JavaScript , C++ , Java, PHP, C#, Python, Lua e Node.js.'
icon: 'ion:terminal-sharp'
iconname: 'GameDev'
tags:
- gamedev
- ocaml
- haxe
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**HaxeFlixel** é um motor de jogos 2D multiplataforma gratuito e fácil de usar desenvolvido com a linguagem de programação [Haxe](https://haxe.org/) e o framework [OpenFL](https://openfl.org/).

Está disponível para diversas plataformas, tais como: [Windows](https://terminalroot.com.br/tags#windows), [macOS](https://terminalroot.com.br/tags#macos), [Android](https://terminalroot.com.br/tags#android), iOS, [Web](https://terminalroot.com.br/tags#html) e [GNU/Linux](https://terminalroot.com.br/tags#gnu).

A linguagem de programação **Haxe** é de alto nível que pode produzir aplicativos e código-fonte para muitas plataformas de computação diferentes a partir de uma base de código, dentre elas: [JavaScript](https://terminalroot.com.br/tags#javascript) , [C++](https://terminalroot.com.br/tags#cpp) , [Java](https://terminalroot.com.br/tags#java), [PHP](https://terminalroot.com.br/tags#php), [C#](https://terminalroot.com.br/tags#csharp), [Python](https://terminalroot.com.br/tags#python), [Lua](https://terminalroot.com.br/tags#lua) e [Node.js](https://terminalroot.com.br/tags#nodejs).

É um software livre e de código aberto , lançado sob a licença MIT. O compilador, escrito em [OCaml](https://terminalroot.com.br/tags#ocaml), é lançado sob a **GNU General Public License (GPL) versão 2**.


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
Para utilizar o HaxeFlixel primeiramente você precisará da linguagem de programação Haxe instalada no seu sistema. O procedimento para todos os sistemas operacionais pode ser encontrado na página de [download](https://haxe.org/download/), para Windows por exemplo já há binários pré-compilados, ou seja, basta rodar um arquivo `.exe` e depois adicionar o caminhos à variável de ambiente.

Alguns exemplos rápidos de instalação:

{% highlight bash %}
choco install haxe # Windows com Chocolatey
brew install haxe # macOs via Brew
sudo apt install haxe # Debian, Ubuntu, Mint e similares
sudo pacman -S haxe # Arch, Manjaro e similares
sudo dnf install haxe # Fedora
sudo zypper install haxe # OpenSUSE
{% endhighlight %}

Após devidamente instalada a linguagem de programação Haxe, agora basta instalar o HaxeFlixel da seguinte forma:

Use o gerenciador de pacotes do Haxe([haxelib](https://lib.haxe.org/)) que já estará disponivel e instale os seguintes pacotes:

{% highlight bash %}
haxelib install lime openfl flixel
{% endhighlight %}

---

# Criando um exemplo básico
Crie um projeto/pasta e entre no mesmo e pelo terminal: [Windows Terminal](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701), [PowerShell](https://terminalroot.com.br/tags#powershell), [Terminal do Ubuntu](https://terminalroot.com.br/tags#terminal),... rode o comando:

{% highlight bash %}
flixel tpl -n "HelloWorld"
{% endhighlight %}
> Isso criará uma pasta de nome **HelloWorld** como todos os arquivos necessários para seu projeto.

Dentro da pasta *HelloWorld* no seu projeto haverá uma subpasta de nome `source` e nela uma arquivo: `PlayState.hx`, abra esse arquivo com seu [editor de código]() preferido;
> Lembrando que existem extensões para o Haxe no [VS Code](https://terminalroot.com.br/tags#vscode), [Vim](https://terminalroot.com.br/tags#vim), [Neovim](https://terminalroot.com.br/tags#neovim) e entre muitos outros, incluindo para o IDE [Visual Studio](https://marketplace.visualstudio.com/items?itemName=nadako.vshaxe).

Insira esse código ao arquivo

{% highlight haxe %}
package;

import flixel.FlxState;

class PlayState extends FlxState {
  override public function create() {
    super.create();

    var text = new flixel.text.FlxText(0, 0, 0, "Hello World", 64);
    text.screenCenter();
    add(text);
  }

  override public function update(elapsed:Float)    {
    super.update(elapsed);
  }
}
{% endhighlight %}

Agora pelo terminal, rode:
{% highlight bash %}
lime test html5
{% endhighlight %}

O provável resultado será similar a imagem abaixo:

![HaxeFlixel HelloWorld](https://haxeflixel.com/documentation/images/00_getting_started/hello-world.png) 

Veja demos rodando no navegador: <https://haxeflixel.com/demos/>.

Para mais informações consulte os links abaixo:
+ <https://haxeflixel.com/>
+ <https://haxe.org/>



