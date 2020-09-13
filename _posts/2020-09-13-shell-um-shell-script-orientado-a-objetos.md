---
layout: post
title: "Shell++ - Um Shell Script Orientado a Objetos"
date: 2020-09-13 17:07:16
image: '/assets/img/cpp/shellpp.jpg'
description: 'Shell++ possui uma mistura de BASH com C++'
icon: 'vscode-icons:file-type-cpp3'
iconname: 'bash + cpp'
tags:
- cpp
- bash
- programacao
- desenvolvimento
---

![Shell++ - Um Shell Script Orientado a Objetos](/assets/img/cpp/shellpp.jpg)

# Shell++ - Um Shell Script Orientado a Objetos

[Shell++](https://github.com/alexst07/shell-plus-plus) é uma linguagem de programação que visa trazer funcionalidades desde linguagens modernas, como facilidade de manipulação de estruturas de dados, programação orientada a objetos, programação funcional e outras inclusive Shell Script.

# Instalação
Clone o repositório de forma recursiva:
{% highlight bash %}
git clone --recurse-submodules -j8 https://github.com/alexst07/shell-plus-plus
{% endhighlight %}

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Após clonado, percebemos que ele utiliza o [CMake](https://terminalroot.com.br/2019/12/como-compilar-seus-programas-com-cmake.html) , se você exportar a variável CXX, talvez você consiga utilizar outro compilador, mas você precisará do: CMake, [GCC](https://terminalroot.com.br/2019/12/gcc-vs-llvm-qual-e-o-melhor-compilador.html) e [GNU Make](https://terminalroot.com.br/2019/12/como-criar-um-makefile.html).

Algumas distros oferecem o pacote com as ferramentas essenciais para construção de binários, se você usa [Debian](https://terminalroot.com.br/tags#debian), [Ubuntu](https://terminalroot.com.br/tags#ubuntu), [Mint](https://terminalroot.com.br/tags#mint) e simlares, basta instalar o pacote: `build-essentials`. Se você usa [Gentoo](https://terminalroot.com.br/tags#gentoo), não precisa instalar nada.

{% highlight bash %}
# você pode mudar o compilador com esse comando:
export CXX=$(which clang++)

mkdir build && cd build
cmake ..
make
{% endhighlight %}

Feita a construção do binário , ele pode ser localizado em: `./shell/shpp` . Você pode rodar um:
{% highlight bash %}
sudo make install
{% endhighlight %}
> Lembrando que também pode executar o binário diretamente.

---

Exemplo básico de uso:
# 1. Hello, World!
{% highlight bash %}
cat << EOF > hello.sh
print("Olá, Shell++")
EOF
shpp hello.sh
{% endhighlight %}

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

E entre várias outras formas de uso que podemos ver aqui na documentação do [repositório do projeto](https://github.com/alexst07/shell-plus-plus).

# Outras alternativas à Shell com POO
+ [Bash Infinity Framework](https://github.com/niieani/bash-oo-framework)
+ [Bash OOP](https://github.com/lenormf/bash-oop)
+ [Skull](https://github.com/tomas/skull)
+ [Bashoo](https://github.com/kjkuan/bashoo)

Entre outras opções:
+ <http://hipersayanx.blogspot.com/2012/12/object-oriented-programming-in-bash.html>
+ <https://developpaper.com/object-oriented-shell-script/>
+ <http://blog.fpmurphy.com/2010/05/ksh93-using-types-to-create-object-orientated-scripts.html>

# Assista ao Vídeo

<iframe width="1234" height="694" src="https://www.youtube.com/embed/0Av5wG2Lkl8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> 


