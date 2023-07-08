---
layout: post
title: "Primeiros Passos com a Linguagem de Programação Zig"
date: 2021-11-26 11:45:54
image: '/assets/img/programacao/zig.jpg'
description: 'Um dos principais objetivos do Zig é melhorar a Linguagem C'
icon: 'ion:terminal-sharp'
iconname: 'Zig'
tags:
- zig
- programacao
---

![Primeiros Passos com a Linguagem de Programação Zig](/assets/img/programacao/zig.jpg)

[Zig](https://ziglang.org/) é uma linguagem de programação de sistema compilada, de uso geral , tipada, projetada por Andrew Kelley. A linguagem é projetada para "robustez, otimização e facilidade de manutenção", suportando genéricos em tempo de compilação e reflexão , compilação cruzada e gerenciamento de memória manual . 

Um dos principais objetivos da linguagem é melhorar a [linguagem C](https://terminalroot.com.br/tags#linguagemc) , ao mesmo tempo que se inspira em [Rust](https://terminalroot.com.br/tags#rust) , entre outros. 


O compilador de estágio 1 é escrito em Zig e [C++](https://terminalroot.com.br/cpp) ,usando LLVM 11 como back-end, suportando muitos de seus alvos nativos. 

O compilador é [open source](https://terminalroot.com.br/tags#opensource) sob a licença MIT .

O compilador Zig expõe a capacidade de compilar [C](https://terminalroot.com.br/tags#linguagemc) e [C++](https://terminalroot.com.br/tags#cpp) de forma semelhante ao Clang com os comandos "`zig cc`" e "`zig c++`" .


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

# Instalação 
Zig está disponível para quase todos os sistemas operacionais e distribuições [Linux](https://terminalroot.com.br/tags#distros), veja abaixo como instalar com o seu gerenciador de pacotes.

Para [GNU](https://terminalroot.com.br/tags#gnu)/[Linux](https://terminalroot.com.br/linux):
{% highlight sh %}
emerge dev-lang/zig # Gentoo, Funtoo,...
sudo pacman -S zig # Arch Linux, Artix, ...
sudo xbps-install -Su zig # Void Linux 
sudo dnf install zig # Fedora, Red Hat, ...
nix-env -i zig # NixOS
# Ubuntu e qualquer distro que possui o snap instalado
snap install zig --classic --beta 
{% endhighlight %}

Para [Windows](https://terminalroot.com.br/tags#windows) 
{% highlight su %}
choco install zig # Utilizando Chocolatey
scoop install zig # Utilizando o Scoop
pacman -S mingw-w64-x86_64-zig # Utilizando o msys2
{% endhighlight %}


Para [macOS](https://terminalroot.com.br/tags#macos):
{% highlight sh %}
brew install zig # Utilizando o Homwbrew
port install zig # Utilizando o MacPorts
{% endhighlight %}

Você também pode compilar o código fonte do [repositório](https://github.com/ziglang/zig/) ou instalar manualmente um binário somente para seu usuário sem usar `sudo` ou `root`:
> Nesse exemplo vamos fazer o download [daqui](https://ziglang.org/download/) da versão *0.8.1* da branch master/main para arquitetura **x86_64**.

{% highlight sh %}
wget https://ziglang.org/builds/zig-linux-x86_64-0.9.0-dev.1678+7747bf07c.tar.xz
tar Jxvf zig-linux-x86_64-0.9.0-dev.1678+7747bf07c.tar.xz
rm zig-linux-x86_64-0.9.0-dev.1678+7747bf07c.tar.xz
mkdir -p ~/.local/bin
mv ~/zig-linux-x86_64-0.9.0-dev.1678+7747bf07c ~/.local/bin/zig
echo 'alias zig="${HOME}/.local/bin/zig/zig"' >> ~/.bashrc
source ~/.bashrc
zig version
{% endhighlight %}


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

# Primeiros Passos 
Criando um **Hello, world!**

> `vim main.zig`

{% highlight zig %}
const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Hello, {s}!\n", .{"world"});
}
{% endhighlight %}

Compilando:
{% highlight sh %}
zig build-exe main.zig
{% endhighlight %}
> E rode o binário com o mesmo nome do arquivo, nesse caso: `./main`, a saída será: `Hello, world!`.

Comentários em Zig é similar à C++ , usando `// comentário` .

Zig possui diversas particularidades para utilizar tipos estáticos e entre outros, para mais detalhes e documentação visite <https://ziglang.org/documentation/master/> .



