---
layout: post
title: "Como Utilizar Valgrind para Verificar Memória em C/C++"
date: 2023-07-08 14:13:46
image: '/assets/img/cpp/valgrind.jpg'
description: 'Uma ferramenta de depuração de memória!'
icon: 'ion:terminal-sharp'
iconname: 'C/C++'
tags:
- memtool
- cpp
- linguagemc
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Nós já publicamos sobre o [GNU GDB](https://terminalroot.com.br/2020/06/gdb-a-melhor-ferramenta-para-encontrar-suas-falha-de-segmentacao.html) que serve para debugar em tempo de execução.

Também já publicamos sobre o [CppCheck](https://terminalroot.com.br/2023/04/como-fazer-analise-estatica-de-c-cpp-com-cppcheck.html) que serve para fazer análise estática.

Nesse artigo vamos conhecer e saber como utilizar o **Valgrind**, que é uma ferramenta de programação para depuração de memória, detecção de vazamento de memória e "criação de perfil".

O [Valgrind](https://valgrind.org/) roda seu código numa máquina virtual, ou seja nada do programa original é executado diretamente no processador! Em vez disso, Valgrind primeiro traduz o programa em um formulário temporário e mais simples chamado representação intermediária (IR), que é um formulário baseado em formulário de atribuição única estático neutro do processador.

Valgrind foi originalmente projetado para ser uma ferramenta de depuração de memória livre para arquiteturas x86, mas desde então evoluiu para se tornar uma estrutura genérica para criar ferramentas de análise dinâmica, como verificadores e criadores de perfil.

Valgrind é, em essência, uma máquina virtual que usa técnicas de compilação just-in-time , incluindo recompilação dinâmica. 

Valgrind é um [Software Livre](https://terminalroot.com.br/tags#freesoftware) licenciado sob os termos da licença: [GNU GPLv2](http://www.gnu.org/licenses/gpl-2.0.html).


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

No [Windows](https://terminalroot.com.br/tags#windows) você vai precisar ter o [MinGW]() instalado([veja aqui como]()) e depois fazer o download(ou compilar) de acordo com [esse procedimento](https://sourceforge.net/p/valgrind4win/wiki/DevelopmentEnvironment/).


Em distribuições [GNU](https://terminalroot.com.br/tags#gnu)/[Linux](https://terminalroot.com.br/tags#linux)
{% highlight bash %}
# Debian, Ubuntu, Mint e similares
sudo apt install valgrind

# Arch, Manjaro e similares
sudo pacman -S valgrind

# Fedora e similares
sudo dnf install valgrind

# No Gentoo, Funtoo e similares
sudo emerge dev-util/valgrind

# Snap
sudo snap install valgrind --classic
{% endhighlight %}

---

# Utilização
Suponhamos que você possua o código abaixo que é um mini programa que faz a soma de dois números como parâmetros via linha de comando. O código utiliza [Smart Pointers](https://terminalroot.com.br/2022/08/entenda-ponteiros-inteligentes-em-cpp-smart-pointers.html) e está tudo funcionando normalmente!

### Utilizando Smart Pointers(Pointeiros inteligentes)

{% highlight cpp %}
#include <iostream>
#include <memory> // PARA SMART POINTERS
#include <algorithm>

struct Math {
  private:
    int num1, num2;
  public:
    Math(const int &inum1, const int &inum2) 
      : num1(inum1), num2(inum2) {}
    int result(){
      return num1 + num2;
    }
};

bool is_number(const std::string& s){
  return !s.empty() && std::find_if(s.begin(), 
      s.end(), [](unsigned char c) { 
        return !std::isdigit(c); 
      }) == s.end();
}

int main(int argc, char **argv){
  if(argc > 2){
    const std::string a = argv[1], b = argv[2];

    if( !is_number(a) || !is_number(b) ){
      std::cerr << "Use only numbers.\n";
      return 1;
    }

    // USANDO SMART POINTERS
    auto math = std::make_shared<Math>(
        std::stoi(a), 
        std::stoi(b)
    );

    std::cout << math->result() << '\n';
  }else{
    std::cerr << "Use: " <<
      argv[0] << " num1 num2\n";
    return 1;
  }
  return 0;
}
{% endhighlight %}

Após compilar você roda seu código e resolve testar com Valgrind com o comando e parâmetros: 

{% highlight bash %}
valgrind -s --leak-check=yes ./a.out 1 2
{% endhighlight %}

O Valgrind não detecta nenhuma falha e retorna ao final da saída abaixo: `ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 from 0)`, ou seja, nenhum erro!
{% highlight bash %}
==5659== Memcheck, a memory error detector
==5659== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
==5659== Using Valgrind-3.18.1 and LibVEX; rerun with -h for copyright info
==5659== Command: ./a.out 1 2
==5659== 
3
==5659== 
==5659== HEAP SUMMARY:
==5659==     in use at exit: 0 bytes in 0 blocks
==5659==   total heap usage: 3 allocs, 3 frees, 73,752 bytes allocated
==5659== 
==5659== All heap blocks were freed -- no leaks are possible
==5659== 
==5659== ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 from 0)
{% endhighlight %}

---

### Alocando memória
Agora você decide modificar seu código e alocar memória com a declaração `new`, mas esquece de desalocar com `delete`. Foi removido o cabeçalho `<memory>` e substituido o `make_shared` no código abaixo


{% highlight cpp %}
#include <iostream>
#include <algorithm>

struct Math {
private:
  int num1, num2;

public:
  Math(const int &inum1, const int &inum2) : num1(inum1), num2(inum2) {}
  int result() { return num1 + num2; }
};

bool is_number(const std::string &s) {
  return !s.empty() && std::find_if(s.begin(), s.end(), [](unsigned char c) {
                         return !std::isdigit(c);
                       }) == s.end();
}

int main(int argc, char **argv) {
  if (argc > 2) {
    const std::string a = argv[1], b = argv[2];

    if (!is_number(a) || !is_number(b)) {
      std::cerr << "Use only numbers.\n";
      return 1;
    }

    Math * math = new Math(std::stoi(a), std::stoi(b));
    std::cout << math->result() << '\n';
    // AQUI DEVERIA HAVER O delete PARA DESALOCAR
  } else {
    std::cerr << "Use: " << argv[0] << " num1 num2\n";
    return 1;
  }
  return 0;
}
{% endhighlight %}

Além disso, além de compilar sem flags, você inclui todas as possíveis para detecção de erro: 
{% highlight bash %}
g++ -Wall -Werror -Wextra -Wpedantic main.cpp
{% endhighlight %}
> Mas, mesmo assim, nenhuma falha foi detectada.

Então, você recolve rodar novamente o Valgrind:
{% highlight bash %}
valgrind -s --leak-check=yes ./a.out 1 2
{% endhighlight %}

No entanto, dessa vez aparece o erro detectado conforme listado na saída abaixo:

{% highlight bash %}
==5857== Memcheck, a memory error detector
==5857== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
==5857== Using Valgrind-3.18.1 and LibVEX; rerun with -h for copyright info
==5857== Command: ./a.out 1 2
==5857== 
3
==5857== 
==5857== HEAP SUMMARY:
==5857==     in use at exit: 8 bytes in 1 blocks
==5857==   total heap usage: 3 allocs, 2 frees, 73,736 bytes allocated
==5857== 
==5857== 8 bytes in 1 blocks are definitely lost in loss record 1 of 1
==5857==    at 0x4845013: operator new(unsigned long) (in /usr/libexec/valgrind/vgpreload_memcheck-amd64-linux.so)
==5857==    by 0x109377: main (in /home/marcos/a.out)
==5857== 
==5857== LEAK SUMMARY:
==5857==    definitely lost: 8 bytes in 1 blocks
==5857==    indirectly lost: 0 bytes in 0 blocks
==5857==      possibly lost: 0 bytes in 0 blocks
==5857==    still reachable: 0 bytes in 0 blocks
==5857==         suppressed: 0 bytes in 0 blocks
==5857== 
==5857== ERROR SUMMARY: 1 errors from 1 contexts (suppressed: 0 from 0)
{% endhighlight %}

Note que a `Memcheck`, uma ferramenta do Valgrind detectou que você esqueceu de desalocar o espaço reservado!

Caso seu Valgrind apareça um erro de saída: `Fatal error at startup` recomendo você instalar a biblioteca `libc6-dbg`, por exemplo:
{% highlight bash %}
sudo apt install libc6-dbg:i386
{% endhighlight %}
> A definição da arquitetura `i386` é importante!

Para mais informações use o `help` e o manual:
{% highlight bash %}
valgrind --help
man valgrind
{% endhighlight %}

<!-- Links úteis:

Para mais informações acesse os links abaixo:
+ https://stackoverflow.com/questions/15721919/install-valgrind-fatal-error-at-startup
+ https://valgrind.org/docs/manual/quick-start.html
+ https://en.wikipedia.org/wiki/Valgrind

-->


