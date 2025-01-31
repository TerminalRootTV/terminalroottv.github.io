---
layout: post
title: "Conheça o Clang REPL, um C++ via prompt de comando"
date: 2024-08-19 09:50:29
image: '/assets/img/cppdaily/clang-repl.jpg'
description: "🚀 Adequado para programação exploratória e em locais onde o tempo para obter insights é importante."
icon: 'ion:terminal-sharp'
iconname: 'Clang'
tags:
- clang
- llvm
- cpp
- linguagemc
- repl
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Nós já publicamos sobre o [Cling](https://terminalroot.com.br/2022/02/cling-rode-c-cpp-como-script.html) que possui recurso similar ao **Clang REPL**, mas o Clang [REPL](https://terminalroot.com.br/2024/08/para-que-serve-instalacao-e-uso-da-biblioteca-readline.html) é uma alternativa já disponível para quem já possui o [Clang/LLVM](https://terminalroot.com.br/tags#clang) instalado em seu próprio sistema. Se você ainda não tem instalado, veja os links abaixo:
+ [Como Instalar o Clang no Windows com um único comando](https://terminalroot.com.br/2024/07/como-instalar-o-clang-no-windows-com-um-unico-comando.html)
+ [Como Instalar o Clang Binário em Qualquer Distro GNU/Linux](https://terminalroot.com.br/2023/01/como-instalar-o-clang-binario-em-qualquer-distro-gnu-linux.html)

**Clang-Repl** é um interpretador [C++](https://terminalroot.com.br/tags#cpp) interativo que permite compilação incremental.

Clang-Repl é adequado para programação exploratória e em locais onde o tempo para obter insights é importante. Clang-Repl é um projeto inspirado no trabalho do [Cling](https://terminalroot.com.br/2022/02/cling-rode-c-cpp-como-script.html), um interpretador [C](https://terminalroot.com.br/tags#linguagemc)/C++ baseado em [LLVM](https://terminalroot.com.br/tags#llvm). 


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

## Utilização
Para iniciar o Clang REPL basta digitar esse comando no terminal:
{% highlight bash %}
clang-repl
{% endhighlight %}

Automaticamente será iniciada uma *sub-shell* que você pode rodar os comando, mas primeiramente é preciso incluir a biblioteca desejada. Por exemplo, para usar o `std::cout` precisamos incluir a biblioteca `iostream`:

{% highlight bash %}
clang-repl> #include <iostream>
{% endhighlight %}

E em seguida, basta testar imprimindo alguma coisa:
{% highlight bash %}
clang-repl> std::cout << "Olá, CLANG REPL!\n"; 
Olá, CLANG REPL!
clang-repl> 
{% endhighlight %}

Para sair do `clang-repl` basta teclar `%quit`:
{% highlight bash %}
clang-repl> %quit
{% endhighlight %}

Ou seja, simples e intuitivo!
> Lembrando que o `clang-repl` não interpreta [Backspace] e não usa a lib [readline](https://terminalroot.com.br/2024/08/para-que-serve-instalacao-e-uso-da-biblioteca-readline.html) para armazenar comandos no histórico.

---

Para mais informações acesse o endereço: <https://clang.llvm.org/docs/ClangRepl.html>.


