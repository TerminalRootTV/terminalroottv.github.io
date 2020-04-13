---
layout: post
title: "Como compilar programas com Ninja Build"
date: 2020-03-16 08:41:05
image: '/assets/img/cpp/ninja-build.jpg'
description: 'É um sistema de compilação pequeno , com foco na velocidade.'
icon: 'logos:c-plusplus'
iconname: 'c++'
tags:
- ninja
- meson
- cpp
- linguagemc
- compiladores
---

![Como compilar programas com Ninja Build](/assets/img/cpp/ninja-build.jpg)

[Ninja](https://ninja-build.org/) é um sistema de compilação pequeno , com foco na velocidade. Em essência, o Ninja é uma alternativa ao [Make](https://terminalroot.com.br/2019/12/como-criar-um-makefile.html) . O Ninja é utilizado por diversos projetos, tendo como seu principal cliente o [Google Chrome](https://www.google.pt/intl/pt-BR/chrome/) e o [Android](https://www.android.com/intl/pt-BR_br/), e é usado pela maioria dos desenvolvedores que trabalham no [LLVM](https://terminalroot.com.br/2019/12/gcc-vs-llvm-qual-e-o-melhor-compilador.html).

Ao contrário do Make , um "gerador de compilação" deve ser usado para gerar arquivos de compilação Ninja. [Gyp](https://en.m.wikipedia.org/wiki/GYP_(software)) , [CMake](https://terminalroot.com.br/2019/12/como-compilar-seus-programas-com-cmake.html) , [Meson](https://terminalroot.com.br/2020/03/como-compilar-programas-com-meson-build.html) e [gn](https://gn.googlesource.com/gn/) são ferramentas populares de software de gerenciamento de compilação que suportam a criação de arquivos de compilação para o Ninja.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# Como compilar com o Ninja?
O processo é bem parecido com o do [Make](https://terminalroot.com.br/2019/12/como-criar-um-makefile.html).
## Compilando em [C](https://terminalroot.com.br/2014/12/linguagem-c-utilizando-as-funcoes-fopen.html), único arquivo:
Supondo que você tenha esse código([Olá, Mundo!](https://pt.wikipedia.org/wiki/Programa_Olá_Mundo)) em **C**: `vim main.c` . Nesse exemplo utilizamos o comando [gcc](https://terminalroot.com.br/2019/12/tutorial-definitivo-do-gnu-autotools-para-iniciantes.html) para compilar um único arquivo, mas logo abaixo veja com múltiplos arquivos em C++, que só muda o comando e a quantidade de arquivos.
{% highlight c %}
#include<stdio.h>

int main(int argc, char **argv) {
  printf("Olá, Mundo!\n");
  return 0;
}
{% endhighlight %}

Para compilar com o Ninja, você precisará criar um arquivo **build.ninja** com o seguinte conteúdo: `vim build.ninja`
{% highlight make %}
rule cc
  command = gcc -c -o $out $in
  description = CC $out
 
rule link
  command = gcc -o $out $in
  description = LINK $out
 
build src.o: cc main.c
build demo-c: link src.o
{% endhighlight %}

<!-- LISTA MIN -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


Analisando o arquivo acima, de acordo com conhecimentos prévios sobre o [Make](https://terminalroot.com.br/2019/12/como-criar-um-makefile.html), por exemplo, conseguimos notar que o arquivo que será compilado definimos como: **main.c** , o arquivo temporário chamamos de **src.o** e o arquivo binário final nomeamos como **demo-c**.

Agora, basta estar no diretório que você salvou e via linha de comando rodar:
{% highlight bash %}
ninja
{% endhighlight %}
E depois é só rodar o programa:
{% highlight bash %}
./demo-c
{% endhighlight %}

Existem diversas opções como limpar o(s) arquivo(s) temporários e entre outras opções, para mais detalhes acesse o [manual](https://ninja-build.org/manual.html).

## Compilando em [C++](https://terminalroot.com.br/cpp), múltiplos arquivos:
Para esse exemplo vamos utilizar o [Dec2Bin](https://github.com/terroo/utilscpp/tree/master/dec2bin) , um mini programa que converte decimal para binário em [C++](https://github.com/terroo/utilscpp) . Nesse exemplo utilizamos o comando [g++](https://terminalroot.com.br/2019/12/tutorial-definitivo-do-gnu-autotools-para-iniciantes.html) para compilar múltiplos arquivos. São **3 arquivos** , sendo que **1** é somente uma biblioteca `.hpp`:
> `vim main.cpp`
{% highlight cpp %}
#include <iostream>
#include <string>
#include "dectobin.hpp"

int main( int argc , char** argv ) {
  Dectobin db;
  std::cout << ( argc > 1 ? db.dtob( argv[1] ) : db.get_m_help() ) << "\n";
  return 0;
}
{% endhighlight %}
> `vim dectobin.hpp`
{% highlight cpp %}
#ifndef DEC_TO_BIN_H
#define DEC_TO_BIN_H
class Dectobin{
    public:
        std::string dtob( char * num );
        void set_m_help();
        std::string get_m_help();

    private:
        const static int m_max{20};
        int m_number;
        int m_modules[ m_max ];
        int m_i;
        std::string m_output;
        std::string m_help;
};
#endif
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

> `vim dectobin.cpp`
{% highlight cpp %}
#include <iostream>
#include <string>
#include "dectobin.hpp"

std::string Dectobin::dtob( char * num ){
      m_number = std::stoi( num );
      if ( m_number == 0 ) {
        m_output = "0";
      }else{
        for (m_i = 0; m_number > 0; m_i++) {
          m_modules[m_i] = m_number % 2;
          m_number = m_number / 2;
        }
        for (m_i = m_i - 1; m_i >= 0; m_i--) {
          m_output += std::to_string( m_modules[m_i] );
        }
      }
    return m_output;
}

void Dectobin::set_m_help(){
    m_help = "Enter a number.";
}

std::string Dectobin::get_m_help(){
    set_m_help();
    return m_help;
}
{% endhighlight %}

Salvamos os arquivos dentro do diretório **dec2bin**:
{% highlight bash %}
cd dec2bin/
ls
dectobin.cpp  dectobin.hpp  main.cpp
{% endhighlight %}

<!-- RETANGULO LARGO -->
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

Da mesma forma que a anterior, vamos criar um arquivo **build.ninja**, só com as seguintes configurações:
{% highlight make %}
rule cc
  command = g++ -c -o $out $in
  description = CC $out
 
rule link
  command = g++ -o $out $in
  description = LINK $out
 
build source1.o: cc main.cpp
build source2.o: cc dectobin.cpp
build program-cpp: link source1.o source2.o
{% endhighlight %}

Depois é só rodar o comando `ninja` e o arquivo `program-cpp` ficará pronto no mesmo diretório. Veja a saída na imagem abaixo onde aproveitamos o programinha para converter o número decimal: **9** em binário: **1001**:
![Dec2Bin compilado com g++ via Ninja Build](/assets/img/cpp/ninja-cpp.png)

Simples, né? Abraços!
