---
layout: post
title: "Olá Mundo em 28 Linguagens de Programação: Proposta, Docs e Links."
date: 2019-10-19 13:35:40
image: '/assets/img/'
description: 'Bom pra você que quer decidir qual aprender para seus projetos pessoais ou business.'
tags:
- programacao
- desenvolvimento
- codigo
- assembly
- c
- cpp
- go
- bash
- awk
- vimscript
- sql
- lua
- perl
- php
- python
- javascript
- java
- rust
- swift
- dart
- kotlin
- r
- julia
- ruby
- elixir
- vala
- csharp
- gambas
---

Selecione as linguagens mais utilizadas no mercado com dados que podem lhe fazer estudar/conehcer melhor para fazer sua escolha, seja para o mercado de trabalho ou para construção de projetos pessoais ou de negócios:

+ Uma breve descrição e/ou curiosidade de cada uma;
+ a extensão que cada uma usa;
+ um **Olá, Mundo!**;
+ como rodar, compilar e/ou interpretar;
+ dependências;
+ link com exemplo;

Segue:

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

### [![Assembly](/assets/img/dev/langs/assembly.png) 01. Assembly](https://curlie.org/Computers/Programming/Languages/Assembly/)
<https://curlie.org/Computers/Programming/Languages/Assembly/>
> Arquivo: `vim hello-world.asm`
Assembly ou linguagem de montagem é uma notação legível por humanos para o código de máquina que uma arquitetura de computador específica usa, utilizada para programar códigos entendidos por dispositivos computacionais, como microprocessadores e microcontroladores. O código de máquina torna-se legível pela substituição dos valores em bruto por símbolos chamados mnemónicos.    
{% highlight asm %}
section     .text
global      _start

_start:

    mov     edx,len
    mov     ecx,msg
    mov     ebx,1
    mov     eax,4
    int     0x80

    mov     eax,1
    int     0x80

section     .data

msg     db  'Olá, Mundo!',0xa 
len     equ $ - msg
{% endhighlight %}
> *Precisa possuir um compilador e um linker: [nasm](https://www.nasm.us/) e [ld](https://www.gnu.org/software/binutils/).*
Rodar: `nasm -f elf64 -o hello-world.o hello-world.asm && ld hello-world.o -o hello-world && ./hello-world`
Exemplo: <http://asm.sourceforge.net/intro/hello.html>

<span class="brain">————————— ◆ —————————</span>

### [![C](/assets/img/dev/langs/c.png) 02. C](https://www.iso.org/standard/74528.html)
<https://www.iso.org/standard/74528.html>
> Arquivo: `vim hello-world.c`
C é uma linguagem de programação compilada de propósito geral, estruturada, imperativa, procedural, padronizada por Organização Internacional para Padronização (ISO), criada em 1972 por Dennis Ritchie na empresa AT&T Bell Labs para desenvolvimento do sistema operacional Unix (originalmente escrito em Assembly).

C é uma das linguagens de programação mais populares e existem poucas arquiteturas para as quais não existem compiladores para C. C tem influenciado muitas outras linguagens de programação (por exemplo, a linguagem Java), mais notavelmente C++, que originalmente começou como uma extensão para C.

A linguagem C encontra-se na versão/padrão internacional C18 standard revision (ou ISO/IEC 9899:2018) lançada em junho de 2018, substituindo a versão C11 (standard ISO/IEC 9899:2011), disponível em ISO e IEC e com suporte para GCC8 e Clang LLVM6.
    
{% highlight c %}
#include <stdio.h>
int main() {
 printf("Olá, Mundo!\n");
 return 0;
}
{% endhighlight %}
> *Precisa possuir um compilador instalado, ex.: [gcc](https://gcc.gnu.org/).*
Rodar: `gcc hello-world.c -o hello-world.o && ./hello-world.o`
> Exemplo: <https://terminalroot.com.br/2011/10/ola-mundo.html>

<span class="brain">————————— ◆ —————————</span>

### 03. C++
<https://isocpp.org/>
> Arquivo: `vim hello-world.cpp`, `vim hello-world.c++` ou `vim hello-world.cc`
C++ (em português: lê-se "cê mais mais", em inglês lê-se see plus plus) é uma linguagem de programação compilada multi-paradigma (seu suporte inclui linguagem imperativa, orientada a objetos e genérica) e de uso geral. Desde os anos 1990 é uma das linguagens comerciais mais populares, sendo bastante usada também na academia por seu grande desempenho e base de utilizadores.

Bjarne Stroustrup desenvolveu o C++ (originalmente com o nome C with Classes, que significa C com classes em português) em 1983 no Bell Labs como um adicional à linguagem C. Novas características foram adicionadas com o tempo, como funções virtuais, sobrecarga de operadores, herança múltipla, gabaritos e tratamento de exceções. Após a padronização ISO realizada em 1998 e a posterior revisão realizada em 2003, uma nova versão da especificação da linguagem foi lançada em dezembro de 2014, conhecida informalmente como C++17.
{% highlight cpp %}
#include <iostream>
int main() {
std::cout << "Olá, Mundo!" << std::endl;
return 0;
}
{% endhighlight %}
> *Precisa possuir um compilador instalado, ex.: [gcc](https://gcc.gnu.org/).*
Rodar: `g++ hello-world.cpp -o hello-world.o && ./hello-world.o`
> Exemplo: <https://en.cppreference.com/book/intro/hello_world>

<span class="brain">————————— ◆ —————————</span>

### 04. Go
<https://golang.org/>
> Arquivo: `vim hello-world.go`
>
Go é uma linguagem de programação criada pela Google e lançada em código livre em novembro de 2009. É uma linguagem compilada . É possível programar orientado a objetos, mas não da forma mais comum, pois Go não utiliza classes e sim estruturas. Na orientação a objetos, são criados métodos sem classes, interface sem hierarquia, e reutilização de código sem herança.
{% highlight go %}
package main

import "fmt"

func main() {
    fmt.Printf("Olá, Mundo!\n")
}
{% endhighlight %}
> *Precisa possuir um compilador e um linker: [nasm](https://www.nasm.us/) e [ld](https://www.gnu.org/software/binutils/).*
Rodar: `go build hello-world.go && ./hello-world`
> Exemplo: <https://tour.golang.org/welcome/1>

<span class="brain">————————— ◆ —————————</span>

### 05. Bash
<https://www.gnu.org/software/bash/>
Arquivo: `vim hello-world.sh` ou `vim hello-world.bash`
O bash é uma linguagem de script ou interpretador de comandos, um entre os diversos tradutores( [CSH](), [Korn Shell]() , [ZSH]() , [Fish]() , ... ) entre o usuário e o sistema operacional conhecidos como shell. Acrônimo para "**B**ourne-**A**gain **SH**ell", o bash é uma evolução retro-compatível muito mais interativa do Bourne Shell [SH]().
{% highlight bash %}
#!/bin/bash
echo 'Olá, Mundo!'
{% endhighlight %}
Rodar: `bash hello-world.sh` , `sh hello-world.sh` , `source hello-world.sh` , `chmod +x ./hello-world.sh && ./hello-world.sh`
> Exemplo: <http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO-2.html>

<span class="brain">————————— ◆ —————————</span>

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

### 06. Awk
<https://www.gnu.org/software/gawk/>
> Arquivo: `vim hello-world.awk`
A linguagem de programação AWK foi criada em 1977 pelos cientistas Alfred Aho, Peter J. Weinberger e Brian Kernighan no laboratório Bell Labs. A palavra AWK é uma abreviatura das iniciais dos sobrenomes dos criadores da linguagem (**A**ho, **W**einberger e **K**ernighan).

Baseada na linguagem C, é utilizada frequentemente por desenvolvedores para processar textos e manipular arquivos. Tem como os paradigmas linguagem de script, procedural e orientada a eventos. Esta linguagem é considerada por muitos um importante marco para história da programação, tendo tido bastante influência na criação de outras linguagens de programação, como Perl e Lua. 
{% highlight awk %}
#!/usr/bin/env awk
BEGIN {print "Olá, Mundo!"}
{% endhighlight %}
> *Existem diversas variantes do Awk: [Saiba mais aqui](https://terminalroot.com.br/2014/12/tutorial-basico-de-awk.html).*
Rodar: `awk -f hello-world.awk`
> Exemplo: <https://www.gnu.org/software/gawk/manual/gawk.html#BEGIN_002fEND>

<span class="brain">————————— ◆ —————————</span>

### 07. VimScript
<https://www.vim.org/>
> Arquivo: `vim hello-world.vim`
A linguagem de script do Vim, conhecida como Vimscript, é uma linguagem imperativa dinâmica típica que oferece a maioria dos recursos de linguagem comuns: variáveis, expressões, estruturas de controle, funções integradas, funções definidas pelo usuário, cadeias de primeira classe, estruturas de dados de alto nível (listas e dicionários), E/S de terminal e arquivo, correspondência de padrão regex, exceções e um depurador integrado.
{% highlight vim %}
:echo "Olá. Mundo!"
{% endhighlight %}
> *Precisa possuir [vim](https://www.vim.org/) instalado.*
Rodar: `vim -u hello-world.vim +qall`
> Curso de Vim e VimScript: <terminalroot.com.br/vim>

<span class="brain">————————— ◆ —————————</span>

### 08. SQL
<https://sigmod.org/#standards>
> Arquivo: `vim hello-world.sql`
Structured Query Language, ou Linguagem de Consulta Estruturada ou SQL, é a linguagem de pesquisa declarativa padrão para banco de dados relacional (base de dados relacional). Muitas das características originais do SQL foram inspiradas na álgebra relacional.
{% highlight sql %}
SELECT "Olá, Mundo!"
{% endhighlight %}
> *Precisa possuir o MySQL para esse exemplo: [MySQL](https://www.mysql.com).*
Rodar: ` mysql -u root -p < hello-world.sql` ou diretamente: `mysql -u root -p -e "SELECT 'Olá, Mundo'"`
> Usos: <https://terminalroot.com.br/2011/10/curso-certificacao-linux-lpi-102.html>

<span class="brain">————————— ◆ —————————</span>

### 09. Lua
<https://www.lua.org/>
> Arquivo: `vim hello-world.lua`
Lua é uma linguagem de script de multiparadigma, pequena, reflexiva e leve, projetada para expandir aplicações em geral, por ser uma linguagem extensível (que une partes de um programa feitas em mais de uma linguagem), para prototipagem e para ser embarcada em softwares complexos, como jogos. Assemelha-se com Python, Ruby e entre outras.

Lua foi criada por um time de desenvolvedores do Tecgraf da PUC-Rio, a princípio, para ser usada em um projeto da Petrobras. Devido à sua eficiência, clareza e facilidade de aprendizado, passou a ser usada em diversos ramos da programação, como no desenvolvimento de jogos (a Blizzard Entertainment, por exemplo, usou a linguagem no jogo World of Warcraft), controle de robôs, processamento de texto, etc. Também é frequentemente usada como uma linguagem de propósito geral. 
{% highlight lua %}
#!/usr/bin/env lua
print "Olá, Mundo!"
{% endhighlight %}
> *Precisa possuir Lua instalada.*
Rodar: `lua hello-world.lua` ou `chmod +x hello-world.lua && ./hello-world.lua`
> Exemplo: <https://terminalroot.com.br/2016/11/blog-linux-lua.html>

<span class="brain">————————— ◆ —————————</span>

### 10. Perl
<https://www.perl.org/>
> Arquivo: `vim hello-world.pl`
Perl é uma família de duas linguagens de programação multiplataforma, Perl 5 e Perl 6. Originalmente, Perl foi desenvolvida por Larry Wall em 1987; desde então, a linguagem passou por muitas atualizações e revisões até chegar à versão Perl 5 em 1994. Perl 6, desenvolvido a partir do Perl 5 em 2000, eventualmente evoluiu para uma linguagem distinta. Ambas as linguagens continuam a ser desenvolvidas independentemente por equipes diferentes.

Perl é usada em aplicações de CGI para a web, para administração de sistemas linux e por várias aplicações que necessitam de facilidade de manipulação de strings. Permite a criação de programas em ambientes UNIX, MSDOS, Windows, Macintosh, OS/2 e outros sistemas operacionais. Além de ser muito utilizada para programação de formulários www e em tarefas administrativas de sistemas UNIX - onde a linguagem nasceu e se desenvolveu -, possui funções muito eficientes para manipulação de textos. Seu slogan "There's more than one way to do it" (Existe mais de uma maneira de fazer isso) demonstra exatamente o propósito da linguagem: sua flexibilidade e capacidade de fazer códigos funcionais. 
{% highlight perl %}
#!/usr/bin/env perl
print "Olá, Mundo!\n";
{% endhighlight %}
> *Precisa possuir Perl instalado.*
Rodar: `perl hello-world.pl` ou `chmod +x hello-world.pl && ./hello-world.pl`
> Exemplo: <https://metacpan.org/pod/Perl::Tutorial::HelloWorld>

<span class="brain">————————— ◆ —————————</span>

### 11. PHP
<https://www.php.net/>
> Arquivo: `vim hello-world.EXT`
PHP (um acrônimo recursivo para "PHP: Hypertext Preprocessor", originalmente Personal Home Page) é uma linguagem interpretada livre, usada originalmente apenas para o desenvolvimento de aplicações presentes e atuantes no lado do servidor, capazes de gerar conteúdo dinâmico na World Wide Web. Figura entre as primeiras linguagens passíveis de inserção em documentos HTML, dispensando em muitos casos o uso de arquivos externos para eventuais processamentos de dados.

O código é interpretado no lado do servidor pelo módulo PHP, que também gera a página web a ser visualizada no lado do cliente. A linguagem evoluiu, passou a oferecer funcionalidades em linha de comando, e além disso, ganhou características adicionais, que possibilitaram usos adicionais do PHP, não relacionados a web sites. É possível instalar o PHP na maioria dos sistemas operacionais, gratuitamente. Concorrente direto da tecnologia ASP pertencente à Microsoft, o PHP é utilizado em aplicações como o MediaWiki, Facebook, Drupal, Joomla, WordPress, Magento e o Oscommerce.
{% highlight php %}
#!/usr/bin/env php
<?="Olá, Mundo!\n"?>
{% endhighlight %}
> *Precisa possuir PHP instalado.*
Rodar: `php hello-world.php` ou `chmod +x hello-world.php && ./hello-world.php`
> Exemplo: <https://terminalroot.com.br/2011/12/como-criar-chat-com-sockets-em-php-no.html>

<span class="brain">————————— ◆ —————————</span>

### 12. Python
<https://www.python.org/>
> Arquivo: `vim hello-world.EXT`
Python é uma linguagem de programação de alto nível, interpretada, de script, imperativa, orientada a objetos, funcional, de tipagem dinâmica e forte. Foi lançada por Guido van Rossum em 1991. Atualmente possui um modelo de desenvolvimento comunitário, aberto e gerenciado pela organização sem fins lucrativos Python Software Foundation. Apesar de várias partes da linguagem possuírem padrões e especificações formais, a linguagem como um todo não é formalmente especificada.
{% highlight python %}
#!/usr/bin/env python
print("Olá, Mundo!")
{% endhighlight %}
> *É possível rodar Python diretamente no prompt: `python`.*
Rodar: `python hello-world.py` ou `chmod +x hello-world.py && ./hello-world.py`
> Exemplo: <https://terminalroot.com.br/2016/12/script-basico-de-python-para-aprendizado.html>

<span class="brain">————————— ◆ —————————</span>

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

### 13. JavaScript
<http://www.ecma-international.org/publications/standards/Ecma-262.htm>
> Arquivo: `vim hello-world.js`
JavaScript, frequentemente abreviado como JS, é uma linguagem de programação interpretada de alto nível, caracterizada também, como dinâmica, fracamente tipificada, prototype-based e multi-paradigma. Juntamente com HTML e CSS, o JavaScript é uma das três principais tecnologias da World Wide Web. JavaScript permite páginas da Web interativas e, portanto, é uma parte essencial dos aplicativos da web. A grande maioria dos sites usa, e todos os principais navegadores têm um mecanismo JavaScript dedicado para executá-lo.

É atualmente a principal linguagem para programação client-side em navegadores web. É também bastante utilizada do lado do servidor através de ambientes como o node.js. 
{% highlight javascript %}
console.log("Olá, Mundo!");
{% endhighlight %}
> *Precisa possuir o [Node.js]() instalado, ou rodar num [Navegador da Web].*
Rodar: `node hello-world.js`
> Exemplo: <https://terminalroot.com.br/2011/11/alguns-codigos-simples-de-javascript.html>

<span class="brain">————————— ◆ —————————</span>

### 14. Java
<https://www.java.com/>
> Arquivo: `vim hello-world.java`
Java é uma linguagem de programação desenvolvida por engenheiros da Sun Microsystems. É uma linguagem orientada a objetos e projetada para rodar em várias plataformas sem a necessidade de recompilar o código em cada uma delas. Embora Java possa ser compilado como um programa nativo, a maior parte da popularidade do Java pode ser atribuída à sua portabilidade, junto com outras características, como coleta de lixo. Para tornar a independência de plataforma possível, o compilador do Java compila o código Java para uma representação intermediária, chamada "Java bytecode" que roda em um JRE (Java Runtime Environment) e não diretamente no sistema operacional.

+ **JRE** - **J**ava **R**untime **E**nvironmenté um plug-in necessário para a execução de programas Java.
+ **JDK** - **J**ava **D**evelopment **K**it é necessário para desenvolver aplicativos java.
O JRE é menor que o JDK, portanto, ele necessita de menos espaço em disco.

OpenJDK é uma implementação livre e gratuita da plataforma Java, Edição Standard. É o resultado dos esforços da Comunidade Java para a evolução atemporal da linguagem. Serve como incubadora de novas ideias que normalmente são implementadas no JDK comercial da Oracle para serem rentabilizadas posteriormente. Licença: GPL+linking exception .
{% highlight java %}
class OlaMundo {
    public static void main(String args[]) {
        System.out.println("Olá, Mundo!");
    }
}
{% endhighlight %}
> *Precisa possuir um compilador e um linker: [nasm](https://www.nasm.us/) e [ld](https://www.gnu.org/software/binutils/).*
Rodar: `javac hello-world.java && java OlaMundo` , o **javac** cria um arquivo com o nome da *classe*(dentro do mesmo diretório onde você o rodou), nesse caso **OlaMundo** com a extensão **.class**(`OlaMundo.class`) , mas pra rodar não informa o *.class* .
> OpenJDK: <https://openjdk.java.net/>

<span class="brain">————————— ◆ —————————</span>

### 15. Rust
<https://www.rust-lang.org>
> Arquivo: `vim hello-world.rs`
Rust é uma linguagem de programação multiparadigma compilada desenvolvida pela Mozilla Research. É projetada para ser "segura, concorrente e prática", suportando os estilos puramente funcional, procedural, e orientado a objetos. Possui suporte nativo ao WebAssembly.

A linguagem apareceu como um projeto pessoal de Graydon Hoare, empregado da Mozilla. A organização começou a apoiar o projeto em 2009 e anunciou-o em 2010. No mesmo ano, os esforços mudaram do compilador original (escrito em OCaml) para um auto-hospedado feito em Rust. Conhecido por rustc, conseguiu compilar-se pela primeira vez em 2011 e utiliza o LLVM como back-end. Foi lançada pela primeira vez uma versão numerada pré-alfa em 2012. Rust 1.0, a primeira versão estável, foi lançada em 15 de Maio de 2015.

Foi considerada pelo público a linguagem "mais amada" por quatro anos consecutivos, de acordo com uma pesquisa conduzida pelo site Stack Overflow em 2016, 2017, 2018 e 2019, e está entre as 25 linguagens mais populares, de acordo com uma pesquisa conduzida pela RedMonk. 
{% highlight rust %}
fn main() {
    println!("Olá Mundo!");
}
{% endhighlight %}
> *Precisa possuir o compilador: [rustc](https://doc.rust-lang.org/rustc/index.html).*
Rodar: `rustc hello-world.rs && ./hello-world`
> Exemplo: <https://doc.rust-lang.org/stable/rust-by-example/hello.html>

<span class="brain">————————— ◆ —————————</span>

### 16. Swift
<https://swift.org/>
> Arquivo: `vim hello-world.swift`
Swift é uma linguagem de programação desenvolvida pela Apple para desenvolvimento no iOS, macOS, watchOS, tvOS e Linux. Swift foi desenvolvida para manter compatibilidade com a API Cocoa e com código existente em Objective-C. O compilador usa a infraestrutura do LLVM e é distribuído junto do Xcode desde a versão 6.
{% highlight swift %}
print("Olá, Mundo!")
{% endhighlight %}
> *Precisa possuir o [swift](https://github.com/apple/swift).*
Rodar: `swift build && .build/debug/hello-world` , isso dentro de um diretório com Sources
> Exemplo: <https://swift.org/getting-started/#installing-swift>

### 17. Dart
<https://dart.dev/>
> Arquivo: `vim hello-world.dart`
Dart (originalmente denominada Dash) é uma linguagem de script voltada à web desenvolvida pela Google. Ela foi lançada na GOTO Conference 2011, que aconteceu de 10 a 11 de outubro de 2011 em Aarhus, na Dinamarca. O objetivo da linguagem Dart foi inicialmente a de substituir a JavaScript como a linguagem principal embutida nos navegadores. Programas nesta linguagem podem tanto serem executados em uma máquina virtual quanto compilados para JavaScript. 
{% highlight dart %}
main() {
  print('Olá, Mundo!');
}
{% endhighlight %}
> *Precisa de [dependências](https://dart.dev/tutorials/server/get-started).*
Rodar: `dart hello-world.dart`
> Exemplo: <https://dart.dev/#try-dart>

<span class="brain">————————— ◆ —————————</span>

### 18. Kotlin
<https://kotlinlang.org/>
> Arquivo: `vim hello-world.kt`
[Kotlin](https://github.com/andrewoma/kotlin-script) é uma Linguagem de programação multiplataforma que compila para a Máquina virtual Java e que também pode ser traduzida para JavaScript e compilada para código nativo. Desenvolvida pela JetBrains, seu nome é baseado na ilha de Kotlin, onde se situa a cidade russa de Kronstadt, próximo a São Petersburgo. A versão da JVM (Java Virtual Machine) de sua biblioteca padrão depende da Java Class Library, mas a inferência de tipos permite que sua sintaxe seja mais concisa. O Kotlin tem como alvo principal a JVM, mas também compila para JavaScript ou código nativo (via LLVM).

Apesar de a sintaxe de Kotlin diferir da de Java, Kotlin é projetada para ter uma interoperabilidade total com codigo Java. Foi considerada pelo público a 2ª linguagem "mais amada", de acordo com uma pesquisa conduzida pelo site Stack Overflow em 2018. Kotlin é patrocinado pela JetBrains e Google através da Fundação Kotlin.

Kotlin é oficialmente suportado pela Google para desenvolvimento móvel no Android. Desde o lançamento do Android Studio 3.0 em outubro de 2017, o Kotlin é incluído como uma alternativa ao compilador Java padrão. O compilador Kotlin do Android permite que o usuário escolha entre o código de bytes compatível com Java 6 ou Java 8. 
{% highlight kotlin %}
#!/usr/bin/env kotlins
package hello

fun main() {
    println("Olá, Mundo!")
}
{% endhighlight %}
> *Precisa possuir [dependências](https://kotlinlang.org/docs/tutorials/command-line.html).*
Rodar: `kotlinc hello-world.kt -include-runtime -d hello-world.jar && java -jar hello-world.jar`
> Exemplo: <https://kotlinlang.org/docs/tutorials/kotlin-for-py/compiling-and-running.html>

<span class="brain">————————— ◆ —————————</span>

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:50px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

### 19. R
<https://www.r-project.org/>
> Arquivo: `vim hello-world.r`
R é um ambiente computacional e uma linguagem de programação que vem progressivamente se especializando em manipulação, análise e visualização gráfica de dados. Na atualidade é considerado o melhor ambiente computacional para essa finalidade. O nome R provém em parte das iniciais dos criadores (Ross e Robert) e também de um jogo figurado com a linguagem S (da Bell Laboratories, antiga AT&T).

O código fonte do R está disponível sob a licença GNU GPL e as versões binárias pré-compiladas são fornecidas para Windows, Macintosh, e muitos sistemas operacionais Unix/Linux. 
{% highlight r %}
#!/usr/bin/env Rscript
OlaMundo <- function(){
   print('Olá, Mundo!')
}

OlaMundo()
{% endhighlight %}
> *Precisa possuir [R](https://cran.r-project.org/mirrors.html) instalado.*
Rodar: `Rscript hello-world.r`
> Exemplo: <https://cran.r-project.org/doc/manuals/r-release/R-intro.html>

<span class="brain">————————— ◆ —————————</span>

### 20. Julia
<https://julialang.org/>
> Arquivo: `vim hello-world.jl`
Julia é uma linguagem de programação dinâmica de alto nível projetada para atender os requisitos da computação de alto desempenho numérico e científico, sendo também eficaz para a programação de propósito geral. Julia é escrito em C, C++, e Scheme, usando a estrutura do compilador LLVM, enquanto a maior parte da biblioteca padrão de Julia é implementada na própria Julia.

Julia se inspira significativamente em Matlab e vários dialetos de Lisp , incluindo Scheme e Common Lisp , e compartilha muitas características com Dylan - uma outra linguagem dinâmica múltipla orientada a expedição com a sintaxe - e Fortress (linguagem de programação), outra linguagem de programação numérica com expedição múltipla e um sofisticado sistema de tipo paramétrico . Julia também funciona através de scripts e em modo interativo direto no prompt do Shell.>
{% highlight julia %}
#!/usr/bin/env julia
println("Olá, Mundo!")
{% endhighlight %}
> *Para usar a forma compilada precisa do compilador [JIT](https://www.gnu.org/software/lightning/).*
Rodar: `julia hello-world.jl`
> Exemplo: <https://docs.julialang.org/en/v1/manual/getting-started/>

<span class="brain">————————— ◆ —————————</span>

### 21. Ruby
<https://www.ruby-lang.org/>
> Arquivo: `vim hello-world.rb`
Ruby é uma linguagem de programação interpretada multiparadigma, de tipagem dinâmica e forte, com gerenciamento de memória automático, originalmente planejada e desenvolvida no Japão em 1995, por Yukihiro "Matz" Matsumoto, para ser usada como linguagem de script.
{% highlight ruby %}
#!/usr/bin/env ruby
puts "Olá, Mundo!"
{% endhighlight %}
> *Precisa possuir um compilador e um linker: [nasm](https://www.nasm.us/) e [ld](https://www.gnu.org/software/binutils/).*
Rodar: `ruby hello-world.rb`
> Exemplo: <https://www.ruby-lang.org/pt/documentation/>

<span class="brain">————————— ◆ —————————</span>

### 23. Elixir
<https://elixir-lang.org/>
> Arquivo: `vim hello-world.exs`
Elixir é uma linguagem de programação funcional, concorrente, de propósito geral que executa na máquina virtual Erlang (BEAM). Elixir compila em cima de Erlang para fornecer aplicações distribuídas, em tempo real suave, tolerante a falhas, non-stop, mas também a estende para suportar metaprogramação com macros e polimorfismo via protocolos. Foi criada pelo brasileiro: José Valim . 
{% highlight elixir %}
IO.puts "Hello world from Elixir"
{% endhighlight %}
> *Precisa possuir Elixir instalado.*
Rodar: `elixir hello-world.exs`
> Exemplo: <https://elixir-lang.org/getting-started/introduction.html>

<span class="brain">————————— ◆ —————————</span>

### 24. Vala
<https://wiki.gnome.org/Projects/Vala>
> Extensão: `vim hello-world.vala`
Vala é uma linguagem de programação orientada a objetos, com sintaxe [inspirada em C#](https://wiki.gnome.org/Projects/Vala/ValaForCSharpProgrammers). Com um compilador auto-hospedado que gera código em C que usa GObject, foi criada para ser usada no desenvolvimento de aplicações para GNOME. 
{% highlight c %}
class Sample : Object {
    static void main (string[] args) {
        stdout.printf ("Olá, Mundo!\n");
    }
}
{% endhighlight %}
> *Precisa possuir um compilador e um linker: [nasm](https://www.nasm.us/) e [ld](https://www.gnu.org/software/binutils/).*
Rodar: `valac hello-world.vala -o hello-world`
> Exemplo: <https://www.vala-project.org/doc/vala/Overview.html#Getting_started>

<span class="brain">————————— ◆ —————————</span>

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

### 25. C#
<http://msdn.microsoft.com/pt-br/vcsharp/default.aspx>
> Arquivo: `vim hello-world.EXT`
C# é uma linguagem de programação, multiparadigma, de tipagem forte, desenvolvida pela Microsoft como parte da plataforma .NET. A sua sintaxe orientada a objetos foi baseada no C++ mas inclui muitas influências de outras linguagens de programação, como Object Pascal e, principalmente, Java. O código fonte é compilado para Common Intermediate Language (CIL) que é interpretado pela máquina virtual Common Language Runtime (CLR). C# é uma das linguagens projetadas para funcionar na Common Language Infrastructure da plataforma .NET Framework. 
{% highlight c %}
using System; 
namespace HelloWorldApp { 
    class Geeks { 
	    static void Main(string[] args) {
           Console.WriteLine("Olá, Mundo!"); 
	       Console.ReadKey(); 
	    } 
    } 
} 
{% endhighlight %}
> *Precisa possuir o [dotnet](https://visualstudio.microsoft.com/pt-br/), ex. no [Gentoo](): `layman dotnet && emerge mono monodevelop`.*
+ <https://github.com/gentoo/dotnet>
+ <https://wiki.gentoo.org/wiki/Project:Dotnet>
+ <http://en.terminalroot.com.br/how-to-install-programs-via-layman-in-gentoo/>
Rodar: `RUN hello-world.EXT`
> Exemplo: <https://docs.microsoft.com/pt-br/dotnet/csharp/>

<span class="brain">————————— ◆ —————————</span>

### 26. Gambas (Visual Basic para Linux)
<http://gambas.sourceforge.net/>
> Arquivo: `vim hello-world.gambas`
Gambas é um ambiente de desenvolvimento integrado (IDE) para Linux uma alternativa Open Source ao Visual Basic do Microsoft Windows. Gambas é um Interpretador BASIC com extensões de orientação a objetos. Isto torna Gambas uma boa escolha para desenvolvedores VB para aqueles que querem usar os seus conhecimentos em uma base GNU.
{% highlight vb %}
Message.Info("Olá, Mundo!")
{% endhighlight %}
> *Precisa possuir Gambas, ex.: `sudo apt install gambas3` <https://www.youtube.com/watch?v=xezNqM2zrbY>.*
Rodar: `gambas hello-world.gambas`
> Exemplo: <https://terminalroot.com.br/2016/10/gambas-o-visual-basic-open-source-para.html>

<span class="brain">————————— ◆ —————————</span>

<style>
span.brain {margin: auto; text-align: center;}
</style>
