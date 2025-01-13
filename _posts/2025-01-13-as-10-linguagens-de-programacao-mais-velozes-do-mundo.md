---
layout: post
title: "As 10 Linguagens de Programação mais velozes do mundo"
date: 2025-01-13 13:49:59
image: '/assets/img/programacao/fast-langs/fast-langs.png'
description: "🚀 No mundo atual e futuro onde a quantidade de informação é muito grande é notável a necessidade de ferramentas que condizem com essa realidade."
icon: 'ion:terminal-sharp'
iconname: 'Programação'
tags:
- programacao
- cpp
- linguagemc
- fortran
- ada
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

No mundo atual e futuro onde a quantidade de informação é muito grande: [Big Data](https://en.wikipedia.org/wiki/Big_data) é notável a necessidade de ferramentas que condizam com essa realidade, por isso a velocidade das [linguagens de programação](https://terminalroot.com.br/tags#programacao) é fundamental.

Existem diversas formas de testar a velocidade das linguagens, dentre elas há uma forma simples que é checar com o comando [GNU time](https://www.gnu.org/software/time/) o tempo de execução, por exemplo, de um [loop for](https://terminalroot.com.br/2021/04/cppdaily-loop-for-ranged-based.html) para realizar 1000 ciclos. E nós já fizemos isso numa série com 3 vídeos no [Youtube](https://www.youtube.com/TerminalRootTV?sub_confirmation=1):
+ [Testei o Desempenho de 10 Linguagens de Programação com Ranking](https://terminalroot.com.br/2021/03/testei-o-desempenho-de-10-linguagens-de-programacao-com-ranking.html)
+ [Testei o Desempenho de 10 Linguagens de Programação com Ranking - Parte 2](https://terminalroot.com.br/2022/05/testei-o-desempenho-de-10-linguagens-de-programacao-com-ranking-parte-2.html)
+ [Testei o Desempenho de 10 Linguagens de Programação - Ranking FINAL](https://terminalroot.com.br/2023/01/testei-o-desempenho-de-10-linguagens-de-programacao-ranking-final.html)

> **Observação**: Como os testes foram realizados em vídeo, havia o [screencast](https://terminalroot.com.br/2011/12/como-fazer-screencasts-e-conversoes-de.html) ligado e o desempenho com gravação de tela é um pouco maior do que se for feito sem. E isso não é um detalhe, mas sim um informação necessária.

Nos testes realizados acima foram feitos com 30 linguagens de programação, dentre elas: [C++](https://terminalroot.com.br/tags#cpp), [C](https://terminalroot.com.br/tags#linguagemc), [JavaScript](https://terminalroot.com.br/tags#javascript), [Python](https://terminalroot.com.br/tags#python), [Lua](https://terminalroot.com.br/tags#lua), [Swift](https://terminalroot.com.br/tags#swift), [Java](https://terminalroot.com.br/tags#java), [Go](https://terminalroot.com.br/tags#go) e dentre outras.

Não fizemos comparativos com [Assembly](https://terminalroot.com.br/tags#assembly), pois, com certeza, Assembly seria primeira colocada. Apesar de C, C++, Zig e outras transpilarem o código final para Assembly, não é a mesma coisa que escrever em Assembly puro, pois essas linguagens criam um link [dinâmico](https://terminalroot.com.br/2024/09/diferenca-entre-bibliotecas-estatica-e-dinamica.html) para outros código, onde no final, influencia muito no resultado final, por isso Assembly é sempre a mais veloz.

No entanto, o ranking final teve algumas surpresas e nesse artigo veremos, em ordem decrescente, as **10 linguagens de programação mais velozes** de acordo com esse teste. Lembrando que fiz o mesmo teste com algumas que não estão na lista e que se desempenharam bem e vamos incluir na lista, pois ficaram no **TOP10**.


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

## 10° POSIÇÃO: [Dlang](https://dlang.org/)
![Dlang](/assets/img/programacao/fast-langs/dlang.png) 

Dlang ou simplesmente: D, é uma linguagem de programação de uso geral projetada por *Walter Bright* da *Digital Mars*. 

É baseada majoritariamente em [C++](https://terminalroot.com.br/cpp), apesar de não ser apenas uma variante. A versão estável da primeira especificação (*v1.0*) foi lançada em janeiro de 2007. O código D nativo é geralmente tão rápido quanto o código.

---

## 09° POSIÇÃO: [Swift](https://terminalroot.com.br/tags#swift)
![Swift](/assets/img/programacao/fast-langs/swift.png) 

Swift é uma linguagem de programação compilada, multiparadigma e de alto nível, de uso geral, criada por [Chris Lattner](https://nondot.org/sabre/) em 2010 para a *Apple Inc.* e mantida pela comunidade de código aberto. 

Swift compila para código de máquina e usa um compilador baseado em [LLVM](https://terminalroot.com.br/tags#llvm), também criado pelo *Chris Lattner*. Swift foi lançado pela primeira vez em junho de 2014.

Swift substituiu todo o código *Objective-C* e *Objective-C++* da Apple em poucos meses de existência, isso acabou incentivando o Rust(baseou-se nas ideias do Swift) tentar o mesmo feito, ou seja, tentar substituir o código C e C++, mas a comunidade ainda não abraçou essa ideia como na Apple que é uma empresa fechada e privada.

Hoje em dia, Swift está disponível para qualquer sistema operacional e arquitetura, e não somente para dispositivos da Apple.

> Após lançamento das novas versões do Swift, eu refiz os testes e a mesma subiu de posição!

---

## 08° POSIÇÃO: [Lua](https://terminalroot.com.br/lua)
![Lua](/assets/img/programacao/fast-langs/lua.png) 

Lua é uma linguagem de programação interpretada, de script em alto nível, com tipagem dinâmica e multiparadigma, reflexiva e leve, projetada por **Tecgraf** da **PUC-Rio**(criada por brasileiros) em 1993 para expandir aplicações em geral, de forma extensível (que une partes de um programa feitas em mais de uma linguagem), para prototipagem e para ser [embarcada em softwares complexos](https://terminalroot.com.br/2023/10/como-rodar-arquivos-lua-dentro-do-cpp.html), como [jogos](https://terminalroot.com.br/games). Assemelha-se com [Python](https://terminalroot.com.br/tags#python), [Ruby](https://terminalroot.com.br/tags#ruby) e *Icon**, entre outras.

---

## 07° POSIÇÃO: [Rust](https://terminalroot.com.br/tags#rust)
![Rust](/assets/img/programacao/fast-langs/rust.png) 

Rust é uma linguagem de programação de propósito geral que enfatiza desempenho, segurança de tipo e simultaneidade. O desempenho do Rust está diretamente ligado ao uso do [LLVM](https://terminalroot.com.br/tags#llvm) que demorou cerca de 20 anos para ficar pronto e é escrito em [C++](https://terminalroot.com.br/mylang).

O Rust baseou suas ideias no Swift(*Memory Sanitize* de forma automática) e mesclou a sintaxe de linguagens como: [C++](https://terminalroot.com.br/tags#cpp)(uso de `std`, `main`, ...) e OCaml.

No ano de 2022 o Rust envolveu-se em polêmicas por conta do seu **logo**, o mesmo foi declarado com direitos autorais, atitude que chegou a haver problemas com o sistema operacional: Debian GNU/Linux que não aceita esse tipo de licença.


<!-- RECTANGLE LARGE -->
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

## 06° POSIÇÃO: [Perl](https://terminalroot.com.br/tags#perl)
![Perl](/assets/img/programacao/fast-langs/perl.png) 

Perl é uma família de duas linguagens de programação multiplataforma, Perl 5 e Perl 6i, e mais tarde passou-se a se chamar: Raku. 

Originalmente, Perl foi desenvolvida por Larry Wall em 1987.

Perl é considerada a linguagem de programação para scripts mais veloz já criada até hoje. Perl também foi a base para o desenvolvimento da linguagem de programação: [PHP](https://terminalroot.com.br/tags#php), com uma sintaxe bem similar.

---

## 05° POSIÇÃO: [Ada](https://www.adaic.org/)
![Ada](/assets/img/programacao/fast-langs/ada.png) 

Ada é uma linguagem de programação de alto nível estruturada, estaticamente tipada, imperativa e orientada a objetos, inspirada em **Pascal** e outras linguagens.

Foi a primeira linguagem de programação projetada para *Memory Safe*(ou mais correto: *Memory Sanitize*), ou seja, facilita para o programador desalocação de dados de forma dinâmica, teste de overflow em tempode compilação, destruição de objetos não utilizados de forma automática.

Ada foi originalmente projetada por uma equipe liderada pelo cientista da computação francês *Jean Ichbiah* da Honeywell sob contrato com o **Departamento de Defesa dos Estados Unidos**(DoD) de 1977 a 1983 para substituir mais de 450 linguagens de programação usadas pelo DoD naquela época. 

Ada foi nomeada em homenagem a Ada Lovelace (1815–1852), que foi creditada como a primeira programadora de computador.

---

## 04° POSIÇÃO: [Vala](https://vala.dev/)
![Vala](/assets/img/programacao/fast-langs/vala.png) 

Vala é uma linguagem de programação orientada a objetos com um compilador auto-hospedado que gera código C e usa o sistema [GObject](https://terminalroot.com.br/2021/03/aprenda-a-criar-um-aplicativo-grafico-com-cpp-e-gtkmm.html).

Vala é sintaticamente similar ao [C#](https://terminalroot.com.br/tags#csharp).

Ela foi desenvolvida pela [GNOME](https://terminalroot.com.br/2021/03/aprenda-a-criar-um-aplicativo-grafico-com-cpp-e-gtkmm.html) e visa trazer recursos modernos para desenvolvedores GNOME sem impor quaisquer requisitos de tempo de execução adicionais e sem usar uma ABI diferente.

---

## 03° POSIÇÃO: [Fortran](https://fortran-lang.org/)
![Fortran](/assets/img/programacao/fast-langs/fortran.png) 

Fortran, acrônimo de IBM Mathematical **FOR**mula **TRAN**slation System, é uma linguagem de programação voltada para computação científica e técnica e que especialmente projetada pela execução eficiente em tempo de execução numa ampla variedade de processadores.

Foi inicialmente desenvolvida na década de 1950 e normatizada em 1966. Atualmente é a terceira linguagem de programação mais popular na computação de alto desempenho

---

## 02° POSIÇÃO: [C](https://terminalroot.com.br/tags#linguagemc)
![C](/assets/img/programacao/fast-langs/c.png) 

C é considerada a *mãe* de quase todas as linguagens de programação modernas.

O desenvolvimento inicial de C ocorreu no AT&T Bell Labs entre 1969 e 1973, criada unicamente por Dennis Ritchie. O [primeiro livro sobre Linguagem C](https://terminalroot.com.br/2022/09/10-livros-da-linguagem-c-que-vale-a-pena-voce-ler.html) teve ajuda do Brian Kernighan. [Esse livro](https://terminalroot.com.br/2022/09/10-livros-da-linguagem-c-que-vale-a-pena-voce-ler.html) é o livro que mais obteve vendas no mundo quando o assunto é programação.

Você pode aprender C com esse nosso curso completo: <https://terminalroot.com.br/c>

---

## 01° POSIÇÃO: [C++](https://terminalroot.com.br/cpp)
![C++](/assets/img/programacao/fast-langs/cpp.png) 

E na primeiríssima colocação foi o [C++](https://terminalroot.com.br/tags#cpp).

C++ é uma linguagem de programação que além de baseada na linguagem de programação [Simula](https://en.wikipedia.org/wiki/Simula) e [C](https://terminalroot.com.br/tags#linguagemc)(além de também compilar o código C).

Originalmente C++ foi chamada de "C com Classes", mas logo depois foi alterada para C++(um C incrementado: `++`, como loop for, por exemplo).

Nós possuímos diversos Cursos de C++, tais como:
+ [Curso de Criação de Linguagem de Programação](https://terminalroot.com.br/mylang)
+ [Curso de C++ Moderno para Iniciantes](https://terminalroot.com.br/cpp)
+ [Curso de C++ Moderno Avançado](https://terminalroot.com.br/c++)
+ [Curso de Criação de Games com SFML e C++](https://terminalroot.com.br/sfml)
+ [Curso de Qt Moderno com C++](https://terminalroot.com.br/cpp)
+ [Curso de OpenCV com C++](https://terminalroot.com.br/opencv)

---

Lembrando que os códigos utilizados para os testes de desempenho podem ser encontrados no repositório: <https://github.com/terroo/langs-test-loop>.


