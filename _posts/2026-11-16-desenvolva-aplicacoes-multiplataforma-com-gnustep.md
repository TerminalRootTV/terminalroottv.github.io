---
layout: post
title: "Desenvolva aplicações multiplataforma com GNUstep"
date: 2026-11-16 20:23:57
image: '/assets/img/gnu/gnustep.jpg'
description: "🔳 Um ambiente de desenvolvimento que permitindo criar aplicações utilizando principalmente Objective-C e outras linguagens."
icon: 'ion:terminal-sharp'
iconname: 'GNU'
tags:
- gnu
- programacao
- desenvolvimento
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

O **GNUstep** é uma plataforma de desenvolvimento livre e de código aberto que implementa frameworks inspirados nas tecnologias OpenStep e Cocoa, utilizadas historicamente no desenvolvimento de aplicações para sistemas Apple.

Disponibiliza diversos componentes, tais como:

- **Foundation:** classes fundamentais para manipulação de strings, coleções, datas, arquivos, gerenciamento de memória e outros recursos.
- **AppKit:** componentes para desenvolvimento de interfaces gráficas.
- **Base:** implementação das funcionalidades fundamentais do ambiente GNUstep.
- **GUI:** infraestrutura para desenvolvimento de aplicações gráficas.
- **Make:** ferramentas para compilação e gerenciamento de projetos.

Uma das grandes vantagens do GNUstep é permitir que desenvolvedores utilizem tecnologias do ecossistema OpenStep em sistemas como [GNU/Linux](https://terminalroot.com.br/tags#gnulinux), [Windows](https://terminalroot.com.br/tags#windows) e [macOS](https://terminalroot.com.br/tags#macos).

Mantido pela comunidade e distribuído sob licenças de software livre.


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

### Ubuntu e Debian
{% highlight bash %}
sudo apt update
sudo apt install gnustep gnustep-devel
{% endhighlight %}

### Arch Linux
{% highlight bash %}
sudo pacman -Syu
pacman -Ss gnustep
{% endhighlight %}

### Verificando a instalação
Após instalar o ambiente, configure as variáveis do GNUstep:

Para verificar se as ferramentas estão disponíveis:

{% highlight bash %}
gnustep-config --version
{% endhighlight %}

---

## 03. Primeiros passos
Para começar a desenvolver com GNUstep, é interessante conhecer o Objective-C e os frameworks Foundation e AppKit.

Crie um arquivo chamado `main.m`:

{% highlight c %}
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Olá, GNUstep!");
    }

    return 0;
}
{% endhighlight %}

Compile:
{% highlight bash %}
gcc $(gnustep-config --objc-flags) \
    -o hello main.m \
    $(gnustep-config --base-libs)
{% endhighlight %}

Rode: 
{% highlight bash %}
./hello
{% endhighlight %}

A saída esperada será semelhante a:

{% highlight text %}
Olá, GNUstep!
{% endhighlight %}

Depois de executar seu primeiro programa, você pode explorar outros recursos:

**Foundation:** experimente trabalhar com `NSString`, `NSArray`, `NSDictionary`, `NSDate` e operações com arquivos.

**AppKit:** comece a desenvolver interfaces gráficas utilizando janelas, botões, campos de texto e outros componentes.

**GNUstep Make:** conheça o sistema de construção de projetos, que facilita a organização, compilação e distribuição das aplicações.


---

Para mais informações acesse: <https://www.gnustep.org/>.


