---
layout: post
title: "GDB - A melhor ferramenta para encontrar suas: Falha de segmentação"
date: 2020-06-25 16:12:33
image: '/assets/img/cpp/segment-fault.jpg'
description: 'O bug do ódio.'
icon: 'cib:gnu'
iconname: 'gnu'
tags:
- gnu
- cpp
- linguagemc
- programacao
---

![SEGMENTATION FAULT on Verifone SC 5000](/assets/img/cpp/segment-fault.jpg)

Quem que trabalha com [C](https://terminalroot.com.br/tags/#linguagemc)/[C++](https://terminalroot.com.br/tags/#cpp) nunca se deparou com um *erro* chato de **Falha de segmentação** ? Suas irritações podem acabar quando você utilizar o [GDB: The GNU Project Debugger](https://www.gnu.org/software/gdb/)

# Introdução
O GDB, o depurador do [GNU Project](https://terminalroot.com.br/tags/#gnu), permite que você veja o que está acontecendo dentro de outro programa enquanto ele é executado - ou o que outro programa estava fazendo no momento em que caiu.

O GDB pode fazer quatro tipos principais de coisas (além de outras coisas) para ajudá-lo a detectar bugs:
+ Inicie seu programa, especificando qualquer coisa que possa afetar seu comportamento.
+ Faça seu programa parar em condições especificadas.
+ Examine o que aconteceu quando o seu programa parou.
+ Mude as coisas no seu programa, para que você possa experimentar a correção dos efeitos de um bug e aprender sobre outro.

Esses programas podem estar em execução na mesma máquina que o GDB (nativo), em outra máquina (remota) ou em um simulador. O GDB pode ser executado nas variantes [UNIX](https://terminalroot.com.br/tags/#unix) e [Microsoft Windows](https://terminalroot.com.br/tags/#windows) mais populares, bem como no [macOS](https://terminalroot.com.br/tags/#macos).

<!-- LISTA MIN -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# Quais idiomas o GDB suporta?
O GDB suporta os seguintes idiomas (em ordem alfabética):

+ Ada
+ [Assembly](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html)
+ [C](https://terminalroot.com.br/tags/#linguagemc)
+ [C++](https://terminalroot.com.br/cpp)
+ D
+ Fortran
+ Go
+ Objetivo-C
+ OpenCL
+ Modula-2
+ Pascal
+ Rust

# Instalação
A maioria dos sistemas baseados em UNIX como Linux e BSD possui o GDB no repositório das distros, então basta você instalar via o comando de instalação de pacotes da sua distro, exemplo no [Gentoo](https://terminalroot.com.br/tags/#gentoo)
{% highlight cpp %}
emerge gdb
{% endhighlight %}

# Como utilizar o GDB
Bom, o problema mais comum fica geralmente fica confuso do programador descobrir é a famosa **Falha de segmentação** . Vejamos aqui um exemplo.

Supondo que você possua o seguinte código escrito em C++ :
{% highlight cpp %}
#include <iostream>

class TerminalRoot {
  public:
    int min2sec( int * min ){
       return *(min) * 60; 
    }
};

int main(){
  TerminalRoot ter;
  int *num = NULL;
  std::cout << ter.min2sec( num ) << '\n';
  return 0;
}
{% endhighlight %}

E seu cófigo compila normalmente sem erros ou warnings, mas quando você tentar rodar, obtém a falha de segmentação:

![Falha de segmentação](/assets/img/cpp/falha-de-segmentacao.png)

Ou seja, fica ainda mais difícil sem a ajuda do compilador, é aí que entra o trabalho do GDB!

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

+ Primeiramente use o GDB indicando o binário:
{% highlight cpp %}
gdb ./binario
{% endhighlight %}
![GDB 1](/assets/img/cpp/gdb-1.png)

+ Depois rode o comando `run` dentro do GDB e percebemos que ele não mostra muito sobre o erro, nem usando o comando `backtrace`.
> Para saber mais sobre os comandos do GDB rode o comando `help`

![GDB 2](/assets/img/cpp/gdb-2.png)

+ Quando isso acontece, preciso recompilar com o parâmetro `-g3` que removemos a otimização do compilador e ficará mais fácil de verificar. Mas antes tente o comando `frame` e também o `info line *$rip` do GDB:
> Para sair do GDB tecle `quit`

Recompilei com o `-g3` e pronto, está lá o erro é na linha 6 e verificando percebemos que o ponteiro está NULO 😀️

![GDB 3](/assets/img/cpp/gdb-3.png)

# Conlusão
Talvez esse exemplo ou a simplicidade do mesmo dificultou um pouco de ver o poder do GDB. Mas posso lhe garantir que ele já me salvou várias vezes.

Para mais informações use o manual e o help do GDB:
{% highlight cpp %}
gdb --help
man gdb
{% endhighlight %}
# Links úteis
+ <https://sourceware.org/gdb/>
+ <https://www.gnu.org/software/gdb/>
+ <https://en.wikipedia.org/wiki/Segmentation_fault>


Valeu!



