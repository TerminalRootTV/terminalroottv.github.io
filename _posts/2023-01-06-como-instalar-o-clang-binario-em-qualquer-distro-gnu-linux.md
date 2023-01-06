---
layout: post
title: "Como Instalar o Clang Binário em Qualquer Distro GNU/Linux"
date: 2023-01-06 12:58:47
image: '/assets/img/llvm/clang.jpg'
description: 'Para os comandos clang, clang++ e diversos outros incluindo llvm.'
icon: 'ion:terminal-sharp'
iconname: 'Clang'
tags:
- llvm
- clang
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

[Clang](https://terminalroot.com.br/tags#clang) é um compilador(front-end) para as linguagens [C](https://terminalroot.com.br/tags#linguagemc), [C++](https://terminalroot.com.br/tags#cpp), [Objective-C](https://pt.wikipedia.org/wiki/Objective-C) e [Objective-C++](https://en.wikipedia.org/wiki/Objective-C) que utiliza o [LLVM](https://terminalroot.com.br/tags#llvm) como back-end . 

Tem como objetivo ser mais uma alternativa ao [GCC](https://terminalroot.com.br/tags#gcc), o conjunto de compiladores do [GNU](https://terminalroot.com.br/tags#gnu).

---

# Instalação
Baixe a versão mais recente [aqui](https://github.com/llvm/llvm-project/releases), o nome do pacote deverá ser: `clang+llvm-<VERSION>-x86_64-linux-gnu-ubuntu-18.04.tar.xz`(apesar de ter o nome `ubuntu` e uma versão antiga, funciona para qualquer distro), de acordo com a data de publicação desse artigo, a versão mais recente é a `15.0.6`, exemplo:
> O pacote tem diversos binários, incluindo o `clang` e `clang++`

{% highlight bash %}
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-15.0.6/clang+llvm-15.0.6-x86_64-linux-gnu-ubuntu-18.04.tar.xz
{% endhighlight %}

Extraia:
{% highlight bash %}
tar xJf clang+llvm-15.0.6-x86_64-linux-gnu-ubuntu-18.04.tar.xz
{% endhighlight %}

Mova para `/opt` renomeando para o diretório com nome mais curto, exemplo: `clang`
{% highlight bash %}
sudo mv clang+llvm-15.0.6-x86_64-linux-gnu-ubuntu-18.04/ /opt/clang
{% endhighlight %}

Exporte para sua `$PATH`
{% highlight bash %}
echo 'export PATH="${PATH}:/opt/clang/bin"' | sudo tee -a /etc/profile
source /etc/profile
{% endhighlight %}

---


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

Teste:

> `vim main.cpp`

{% highlight cpp %}
#include <iostream>

int main( int argc , char **argv ){
  std::cout << "Hello, World!\n";
  return 0;
}
{% endhighlight %}

Compile:
{% highlight bash %}
clang++ main.cpp
{% endhighlight %}

Aproveite e conte essa nova instalação para sua [GNU Glibc](https://www.gnu.org/software/libc/), fazendo o seguinte:

+ **01.** Crie um arquivo de nome `libs.conf` e insira o caminho da `lib` para ela:
> `vim libs.conf` 

E cole o caminho abaixo dentro desse arquivo:
{% highlight bash %}
/opt/clang/lib
{% endhighlight %}

+ **02.** Salve e mova para o diretório de *novas libs*:
{% highlight bash %}
sudo mv libs.conf /etc/ld.so.conf.d/
{% endhighlight %}

+ **03.** Faça a leitura de tudo:
{% highlight bash %}
sudo ldconfig
{% endhighlight %}

E seja feliz! 😃 
> Principalmente você que usa [Gentoo](https://terminalroot.com.br/tags#gentoo) e **NÃO** vai mais precisar compilar o **Clang** toda vez que há uma nova versão!!! Demora pakas! 😛 



