---
layout: post
title: "Compile seus programas C++ com Bazel do Google"
date: 2022-07-21 09:53:30
image: '/assets/img/cppdaily/bazel.jpg'
description: 'Incluindo programas escritos em Java e outras linguagens de programação.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
- java
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**Bazel** é uma ferramenta de software livre para automação de construção e teste de software desenvolvido pelo [Google](https://google.com) .

Ou seja, o Bazel é alternativa para o [Make](https://terminalroot.com.br/tags#make)(do projeto GNU) ou **Ant** e **Maven**, ambos para compilar programas em Java, desenvolvidas pela empresa: Apache .

Bazel foi escrito com a linguagem de programação [Starlark](https://bazel.build/rules/language) , um dialeto de [Python](https://terminalroot.com.br/tags#python) .

Bazel constrói quase todos os produtos do Google: Google Search, GMail, Google Docs, ...

### Qual o intuito de usar Bazel ?
Bazel foi desenvolvido para funcionar de forma padronizada nos produtos da Google . 

Geralmente empresas tendem a criar próprias soluções por motivos de padronização e também serve para evitar a "propaganda gratuita de produtos de outras empresas", ainda mais o Google que uma das suas principais fontes de receita é justamente a: publicidade .

Mas, você pode migrar seus projetos, caso deseje!

---

# Instalação
Existem diversas maneiras de você instalar. Você pode usar o gerenciador de pacotes do seu sistema operacional, exemplos abaixo:

{% highlight bash %}
emerge dev-util/bazel # Gentoo
sudo pacman -S bazel # Arch via AUR
sudo dnf install bazel4 # Fedora após instalar dnf-plugins-core
pkg install devel/bazel # FreeBSD via Ports
{% endhighlight %}

E entre outros, para uma lista mais completa veja [aqui](https://bazel.build/install) .

Você também pode usar o [npm](https://bazel.build/install/bazelisk) independente do sistema operacional:

{% highlight bash %}
sudo npm install -g @bazel/bazelisk
{% endhighlight %}


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
O exemplo mais básico de todos, nesse caso para [C++](https://terminalroot.com.br/tags#cpp), seria um projeto com 3 arquivos:
+ Seu programa: `main.cpp`
+ O arquivo `BUILD` que teria as macros para serem processadas
+ E um arquivo vazio de nome `WORKSPACE`, serve para indicar a raíz do projeto .

Em resumo:
{% highlight bash %}
MYPROJECT/
├── BUILD
├── WORKSPACE
└── main.cpp

0 directories, 3 files
{% endhighlight %}

O conteúdo exemplo para `main.cpp`, um *Hello, World!* básico:
{% highlight cpp %}
#include <iostream>

int main(){
  std::cout << "Olá, Mundo!" << '\n';
}
{% endhighlight %}

Conteúdo de `BUILD`:
{% highlight python %}
cc_binary(
    name = "hello-world",
    srcs = ["main.cpp"],
)
{% endhighlight %}

E o conteúdo de `WORKSPACE` vazio, para criar basta usar o comando:
{% highlight bash %}
> WORKSPACE
{% endhighlight %}

Agora para compilar rode:
{% highlight bash %}
bazel build hello-world
{% endhighlight %}

Ele terá uma saída similar à abaixo:
{% highlight bash %}
INFO: Analyzed target //:hello-world (37 packages loaded, 163 targets configured).
INFO: Found 1 target...
Target //:hello-world up-to-date:
  bazel-bin/hello-world
INFO: Elapsed time: 6.229s, Critical Path: 0.55s
INFO: 6 processes: 4 internal, 2 linux-sandbox.
INFO: Build completed successfully, 6 total actions
{% endhighlight %}

Para rodar use o parâmetro `run` seguido do *alvo* indicado em `BUILD`, nesse caso, usamos o nome de binário `hello-world`:

{% highlight bash %}
bazel run hello-world
{% endhighlight %}

Saída similar:
{% highlight bash %}
INFO: Analyzed target //:hello-world (36 packages loaded, 163 targets configured).
INFO: Found 1 target...
Target //:hello-world up-to-date:
  bazel-bin/hello-world
INFO: Elapsed time: 3.666s, Critical Path: 0.66s
INFO: 6 processes: 4 internal, 2 linux-sandbox.
INFO: Build completed successfully, 6 total actions
INFO: Build completed successfully, 6 total actions
Olá, Mundo!
{% endhighlight %}

Antes de imprimir é descrito os testes e análises efetuadas. Se quiser rodar somente o binário, rode:
{% highlight bash %}
./bazel-bin/hello-world
{% endhighlight %}

Após `build` ele cria alguns diretórios dentro do seu projeto, exemplo baseado acima:

{% highlight bash %}
$ ls
📁⠀bazel-MYPROJECT/  📁⠀bazel-bin/  📁⠀bazel-out/  📁⠀bazel-testlogs/  BUILD  main.cpp  WORKSPACE
{% endhighlight %}
> Use o comando `tree`(se tiver instalado) para mais detalhes .

---

# Exemplos mais completos
O exemplo que mostramos é uma forma "informal" de criar um projeto para ser compilado com Bazel . A forma correta mesma pode ser encontrada no [repositório do Bazel](https://github.com/bazelbuild/examples), exemplo:

{% highlight bash %}
git clone https://github.com/bazelbuild/examples
cd bazelbuild
tree cpp-tutorial

examples
└── cpp-tutorial
    ├──stage1
    │  ├── main
    │  │   ├── BUILD
    │  │   └── hello-world.cc
    │  └── WORKSPACE
    ├──stage2
    │  ├── main
    │  │   ├── BUILD
    │  │   ├── hello-world.cc
    │  │   ├── hello-greet.cc
    │  │   └── hello-greet.h
    │  └── WORKSPACE
    └──stage3
       ├── main
       │   ├── BUILD
       │   ├── hello-world.cc
       │   ├── hello-greet.cc
       │   └── hello-greet.h
       ├── lib
       │   ├── BUILD
       │   ├── hello-time.cc
       │   └── hello-time.h
       └── WORKSPACE
{% endhighlight %}

Entre no diretório `stage1` que possui o exemplo mais básico e depois analise e teste os demais, exemplo para o `stage1`:

{% highlight bash %}
cd stage1
bazel build //main:hello-world
{% endhighlight %}
> Note a sintaxe informando que o arquivo `BUILD` está dentro do diretório `📁⠀main`

Para mais informações acesse a página oficial: <https://bazel.build/> .



