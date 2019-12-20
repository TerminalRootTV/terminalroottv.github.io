---
layout: post
title: "GCC vs LLVM: Qual é o melhor compilador ?"
date: 2019-12-20 11:51:51
image: '/assets/img/cpp/gnu-vs-llvm.jpg'
description: 'Como compilar em cada um, benchmarks, quem usa e outros.'
tags:
- gcc
- llvm
- clang
- cpp
- linguagemc
- compiladores
---

![GCC vs LLVM](/assets/img/cpp/gnu-vs-llvm.jpg)

## Introdução
O **[GCC](https://gcc.gnu.org/)** é o compilador mais utilizado e confiável no mundo. Diversos dos softwares mais utilizados do mundo foram(e são) compilados por ele.

No entanto, os desenvolvedores são movidos à novidades e de alguma maneira à especulações . E muitos já ouviram do **[LLVM](https://llvm.org/)** e na maioria das vezes, obtiveram boas informações. Desta forma, muitos tem passado à utilizá-lo, mas ainda tem receio sobre 3 quesitos essenciais:

+ **Segurança**;
+ **Velocidade**;
+ e **Confiabilidade**.

Vamos ver informações e testes com análises(benchmarks) nesse artigo e chegaremos a uma conclusão.

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

## Compilando com o GCC:
### Linguagem C:
+ Único arquivo:
{% highlight bash %}
gcc main.c -o binary
{% endhighlight %}

+ Múltiplos arquivos:
{% highlight bash %}
gcc main.c outro.c -o binary
{% endhighlight %}
> Você pode trocar o comando `gcc` por somente `cc` que é um link simbólico para ele:

{% highlight bash %}
which cc
# /usr/bin/cc
ls -l /usr/bin/cc
## lrwxrwxrwx 1 root root 42 nov 23 19:41 /usr/bin/cc -> /usr/x86_64-pc-linux-gnu/gcc-bin/9.2.0/gcc
{% endhighlight %}

### Linguagem C++:
+ Único arquivo:
{% highlight bash %}
g++ main.cpp -o binary
{% endhighlight %}

+ Múltiplos arquivos:
{% highlight bash %}
g++ main.cpp outro.cpp -o binary
{% endhighlight %}
> Você pode trocar o comando `g++` por somente `c++` que é um link simbólico para ele:

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

{% highlight bash %}
ls -l $(which c++)
lrwxrwxrwx 1 root root 42 nov 23 19:41 /usr/bin/c++ -> /usr/x86_64-pc-linux-gnu/gcc-bin/9.2.0/c++
{% endhighlight %}

## Compilando com LLVM:
> Clang é um front-end de um compilador para as linguagens C, C++, Objective-C e Objective-C++ que utiliza o LLVM como back-end.

### Linguagem C:
+ Único arquivo:
{% highlight bash %}
clang main.c -o binary
{% endhighlight %}

+ Múltiplos arquivos:
{% highlight bash %}
clang main.c outro.c -o binary
{% endhighlight %}

### Linguagem C++:
+ Único arquivo:
{% highlight bash %}
clang++ main.cpp -o binary
{% endhighlight %}

+ Múltiplos arquivos:
{% highlight bash %}
clang++ main.cpp outro.cpp -o binary
{% endhighlight %}

---

## Conceito do GCC:
O GNU Compiler Collection (chamado usualmente por GCC) é um conjunto de compiladores de linguagens de programação produzido pelo projeto GNU para construir um sistema operativo semelhante ao Unix livre. Faz parte do sistema operativo GNU e FSF, sendo uma das ferramentas essenciais para manter o software livre, pois permite compilar o código-fonte em binários executáveis para as várias plataformas informáticas mais comuns. É distribuído pela Free Software Foundation (FSF) sob os termos da GNU GPL, disponível para sistemas operativos UNIX e Linux e certos sistemas operativos derivados tais como o Mac OS X.

O GCC foi escrito principalmente em C.

## Conceito do LLVM:
LLVM (anteriormente Low Level Virtual Machine) é uma infraestrutura de compilador desenvolvida para otimizar em tempos de compilação, ligação e execução de programas escritos em linguagens de programação variadas. Implementada originalmente para C e C++, sua arquitetura permitiu a expansão para outras linguagens posteriormente, incluindo Objective-C, Fortran, Ada, Haskell, bytecode Java, Python, Ruby, ActionScript, GLSL, Julia, Kotlin entre outras.

O LLVM foi escrito em C++.

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

---

## História do GCC:
O compilador GCC foi escrito por Richard Stallman em 1987 para servir de compilador para o Projeto GNU. Em 1997, um grupo de desenvolvedores descontentes com o ritmo lento e a natureza fechada do desenvolvimento oficial do compilador GCC, formou-se o projeto EGCS, que juntou várias bifurcações experimentais num único projeto bifurcado do GCC. O desenvolvimento do EGCS, ao provar-se suficientemente mais vital que o GCC, foi finalmente "abençoado" como a versão oficial do GCC em Abril de 1999. O projeto GCC é agora mantido por um grupo variado de programadores de todo o mundo e até à data tem sido adaptado a mais tipos de processadores e sistemas operacionais que qualquer outro compilador.

## História do LLVM:
O projeto LLVM começou em 2000 na Universidade de Illinois em Urbana – Champaign , sob a direção de Vikram Adve e Chris Lattner .Em 2005, a Apple Inc. contratou Lattner e formou uma equipe para trabalhar no sistema LLVM para vários usos nos sistemas de desenvolvimento da Apple.

---

## Linguagens suportadas pelo GCC:
Ada (GCC for Ada ou GNAT), C, C++ (GCC for C++ ou G++), Fortran (GCC for Fortran ou GFortran), Java (GCC for Java ou GCJ), Objective-C e Pascal.

## Linguagens suportadas pelo LLVM:
Ada , C , C ++ , D , Delphi , Fortran , Haskell , Julia , Objective-C , Rust e Swift usando vários front-ends , alguns derivados das versões 4.0.1 e 4.2 da GNU Compiler Collection (GCC ).

---

## Quem usa o GCC:
[NASA](https://www.nccs.nasa.gov/nccs-users/instructional/using-discover/compilation-software/compilers), Intel, MIT(Massachusetts Institute of Technology), AMD, Linux, IBM, Dell, Red Hat, GNOME, KDE e [entre outros](https://gcc.gnu.org/wiki/CompileFarm#History_and_Sponsors). O número de Universidades, Instituições, Empresas que usam é [muito extenso](https://gcc.gnu.org/wiki/cauldron2016) e não há um local que consegue reunir todos.

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

## Quem usa o LLVM:
Apple, Adobe, Ageia Technologies, Google, Intel, NVIDIA, Sony, Universidade da Califórnia, Stanford, Universidade de Nova Iorque, Ericsson e [entre muitas outras](https://llvm.org/Users.html).

---

## Arquiteturas suportadas pelo GCC:
Alpha, ARM, AVR, Blackfin, Epiphany (GCC 4.8), H8/300, HC12, IA-32 (x86), IA-64 (Intel Itanium), MIPS, Motorola 68000, PA-RISC, PDP-11, PowerPC, R8C / M16C / M32C, SPARC, SPU, SuperH, System/390 / zSeries, VAX, x86-64, 68HC11, A29K, CR16, C6x, D30V, DSP16xx, ETRAX CRIS, FR-30, FR-V, Intel i960, IP2000, M32R, MCORE, MIL-STD-1750A, MMIX, MN10200, MN10300, Motorola 88000, NS32K, IBM ROMP, RL78, Stormy16, V850, Xtensa, Cortus APS3, ARC, AVR32, C166 and C167, D10V, EISC, eSi-RISC, Hexagon, LatticeMico32, LatticeMico8, MeP, MicroBlaze, Motorola 6809, MSP430, NEC SX architecture, Nios II and Nios, OpenRISC, PDP-10, PIC24/dsPIC, PIC32, Propeller, RISC-V, Saturn (HP48XGCC), System/370, TIGCC (m68k variant), TriCore, Z8000 e ZPU.

## Arquiteturas suportadas pelo LLVM:
X86, X86-64, PowerPC, PowerPC-64, ARM, Thumb, SPARC, Alpha, CellSPU, MIPS, MSP430, SystemZ, WebAssembly e XCore.

---

## Testes de desempenho por um especialista em Compiladores
Esses testes e análises foram feitos por [Mike Kinghan](https://stackoverflow.com/users/1362568/mike-kinghan) um Engenheiro de Software da [Oxford]().

Os testes foram realizados em diferentes arquiteturas e também em diferentes quantidades de núcleos do processador . Com as versões **GCC 4.7.2** e o **Clang 3.2** . Pode se notar que o Clang(LLVM) leva a melhor em maiores quantidades de núcleos e o GCC para quantidades menores e/ou híbridas .

> Os números estão representados em microssegundos, ex.: **0.000231 secs** .

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

| Compilador | -O2 | -O3 | O2/O3 |
|---|---|---|---|
GCC-4.7.2 | 231 | 237 |0.97 |
Clang-3.2 | 234 | 186 |1.25 |

Palavras do Mike Kinghan
> Comparei o desempenho do equipamento de teste entre o **GCC 4.7.2** e o **Clang 3.2**, todos iguais, exceto os pré-processadores. No **Clang 3.2**, não era mais necessária nenhuma diferenciação de pré-processador entre os intervalos de código que o GCC compilaria e as alternativas do Clang. Criei na mesma biblioteca C++ (GCC) em cada caso e executei todas as comparações consecutivamente na mesma sessão do terminal.
>
> O nível de otimização padrão para minha versão é **-O2**. Também testei com êxito compilações em **-O3**. Testei cada configuração três vezes consecutivas e calculei a média dos três resultados, com os seguintes resultados. O número em uma célula de dados é o número médio de microssegundos consumidos pelo executável **coan** para processar cada um dos **~70K** arquivos de entrada (leitura, análise e saída e diagnóstico de gravação).

---

## Conclusão
Eu sei que não dá pra chegar muito longe com essa comparação. Existem diversos quesitos que estão longe do nosso entendimento pelo fato de ser técnico demais.

Mas tentei resumir tudo que pesquisei, documentei para relatar aqui de forma mais simples possível. Eu particularmente uso os dois (para meus programas pequenos) e acho os dois excelentes. Inclusive eu compilei o LLVM com o GCC!

Eu estava pensando em alterar as variáveis do `make.conf` do meu [Gentoo](https://gentoo.org/) para o [LLVM/Clang] , mas daí eu pensei, para quê mudar algo que está dando certo ? No entanto, acho muito legal essa iniciativa de um substituto pro GCC, aliás, quanto mais alternativas houverem, melhor pra gente.

Espero que vocês tenham gostado dessa análise. Resumindo, as escolhas ficam por conta de cada um, o que na maioria das vezes são feitas por motivos *extra-software* :) !!!

Abraços!

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

## Referências
+ <http://gcc.gnu.org/wiki/CompileFarm>
+ <https://cfarm.tetaneutral.net/>
+ <https://en.m.wikipedia.org/wiki/GNU_Compiler_Collection>
+ <https://en.wikipedia.org/wiki/LLVM>
+ <https://gcc.gnu.org/>
+ <https://gcc.gnu.org/cgi-bin/search.cgi?cmd=Search&m=all&np=7&q=sponsors&s=DRP>
+ <https://gcc.gnu.org/cgi-bin/search.cgi?cmd=Search&m=all&np=9&q=who+uses&s=DRP>
+ <https://gcc.gnu.org/cgi-bin/search.cgi?q=java&cmd=Search&m=all&s=DRP>
+ <https://gcc.gnu.org/cgi-bin/search.cgi?q=sponsors&cmd=Search&m=all&s=DRP>
+ <https://gcc.gnu.org/cgi-bin/search.cgi?q=who+uses&cmd=Search&m=all&s=DRP>
+ <https://gcc.gnu.org/install/specific.html>
+ <https://gcc.gnu.org/ml/gcc/1998-01/msg01165.html>
+ <https://gcc.gnu.org/ml/gcc-bugs/1999-10n/msg00017.html>
+ <https://gcc.gnu.org/wiki>
+ <https://gcc.gnu.org/wiki/cauldron2016>
+ <https://gcc.gnu.org/wiki/CompileFarm>
+ <https://gcc.gnu.org/wiki/CompileFarm#History_and_Sponsors>
+ <https://gcc.gnu.org/wiki/People>
+ <https://github.com/gcc-mirror/gcc>
+ <https://llvm.org/Features.html>
+ <https://llvm.org/Users.html>
+ <https://pt.wikipedia.org/wiki/Clang>
+ <https://pt.wikipedia.org/wiki/GCJ>
+ <https://pt.wikipedia.org/wiki/GNU_Compiler_Collection>
+ <https://pt.wikipedia.org/wiki/Low_Level_Virtual_Machine>
+ <https://stackoverflow.com/questions/3187414/clang-vs-gcc-which-produces-better-binaries>
+ <https://stackoverflow.com/users/1362568/mike-kinghan>
+ <https://wiki.gentoo.org/wiki/Talk:GCC_optimization>
+ <https://www.fsf.org/news/fsf-announces-new-fiscal-sponsorship-for-seagl-conference>
+ <https://www.fsf.org/patrons>
+ <https://www.fsf.org/patrons/fy2017>
+ <https://www.fsf.org/patrons/fy2018>
+ <https://www.fsf.org/patrons/fy2019>
+ <https://www.gccforensics.com/sponsors>
+ <https://www.gnuhealthcon.org/2019-liege/sponsors.html>
+ <https://www.gnu.org/thankgnus/>
+ <https://www.gnu.org/thankgnus/2019supporters.html>
+ <https://www.gnu.org/thankgnus/2019supporters.html#TOCother>
+ <https://www.linuxfoundation.org/blog/2018/10/gcc-a-world-class-compiler-optimizing-linux-and-more/>
+ <https://www.nccs.nasa.gov/nccs-users/instructional/using-discover/compilation-software/compilers>
