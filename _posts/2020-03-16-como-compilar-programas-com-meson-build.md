---
layout: post
title: "Como Compilar Programas com Meson Build"
date: 2020-03-16 08:57:43
image: '/assets/img/cpp/meson-build.jpg'
description:
tags:
---

# Como Compilar Programas com Meson Build
![Como Compilar Programas com Meson Build](meson-build.jpg)


[Meson](https://mesonbuild.com/) é uma ferramenta de software para automatizar a construção (compilação) de software. Ele é um front-end para o [Ninja](https://terminalroot.com.br/2020/03/como-compilar-programas-com-ninja-build.html). Meson é um software livre e de código aberto escrito em Python , sob a Apache License 2.0 .

O [Meson](https://en.wikipedia.org/wiki/Meson_(software)) suporta as linguagens [C](https://terminalroot.com.br/2014/12/linguagem-c-utilizando-as-funcoes-fopen.html), [C++](https://terminalroot.com.br/cpp), CUDA, D, Objective-C, Fortran, [Java](https://terminalroot.com.br/2019/10/jython-a-linguagem-que-mistura-java-com-python.html), C# , Rust e Vala, e possui um mecanismo para lidar com dependências chamado Wrap.

O Meson suporta GNU Compiler Collection, Clang, Microsoft Visual Studio e outros.

# Como compilar um programa com Meson
Para uma forma simples de entendimento, vamos criar um exemplo para um programa [Olá, Mundo!](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html) em [C++](https://terminalroot.com.br/cpp). Supondo que você possui o seguinte arquivo:
```cpp
#include <iostream>

int main(){
    std::cout << "Hello, World! Meson Build!" << '\n';
    return 0;
}
```

No mesmo diretório do seu arquivo/projeto código você deve criar um arquivo de nome **meson.build**: `vim meson.build`
```meson
project('tutorial', 'cpp')
executable('demo', 'main.cpp')
```

Vamos criar o arquivo: **tutorial**, a linguagem é **cpp**(C++), o arquivo binário final terá o nome: **demo** e o arquivo que vamos compilar é o **main.cpp**.

Feito isso o próximo passo é rodar o comando:
```sh
meson builddir
```

A saída será similar a essa:
```sh
marcos@gentoo ~$ meson builddir
The Meson build system
Version: 0.53.1
Source dir: /home/marcos/teste-meson-ninja
Build dir: /home/marcos/teste-meson-ninja/builddir
Build type: native build
Project name: tutorial
Project version: undefined
C++ compiler for the host machine: c++ (gcc 9.2.0 "c++ (Gentoo 9.2.0-r2 p3) 9.2.0")
C++ linker for the host machine: c++ GNU ld.bfd 2.33.1
Host machine cpu family: x86_64
Host machine cpu: x86_64
Build targets in project: 1

Found ninja-1.9.0.git.kitware.dyndep-1.jobserver-1 at /usr/bin/ninja
marcos@gentoo ~$ 
```

Ele irá criar um diretório com o nome **builddir** e precisamos entrar nele para efetuar a compilação:
```sh
cd builddir
ninja
```

Após isso é só rodar o arquivo executável gerado:
```sh
./demo
Hello, World! Meson Build!
```

Para mais informações e detalhes veja a [documentação oficial](https://mesonbuild.com/Tutorial.html).

Simples, né? Abraços!
