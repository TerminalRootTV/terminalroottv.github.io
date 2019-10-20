---
layout: post
title: "Olá Mundo em 25 Linguagens de Programação: Proposta, Docs e Links."
date: 2019-10-19 13:35:40
image: '/assets/img/dev/linguagens-de-programacao.jpg'
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

![Olá Mundo em 25 Linguagens de Programação: Proposta, Docs e Links.](/assets/img/dev/linguagens-de-programacao.jpg)

Selecione as linguagens mais utilizadas no mercado com dados que podem lhe fazer estudar/conehcer melhor para fazer sua escolha, seja para o mercado de trabalho ou para construção de projetos pessoais ou de negócios:

+ Uma breve descrição e/ou curiosidade de cada uma;
+ a extensão que cada uma usa;
+ um **Olá, Mundo!**;
+ como rodar, compilar e/ou interpretar;
+ dependências;
+ link com exemplo;

Segue:


***


### ![Assembly](/assets/img/dev/langs/assembly.png) 01. Assembly
<https://curlie.org/Computers/Programming/Languages/Assembly/>

> Arquivo: `vim hello-world.asm`

Assembly ou linguagem de montagem é uma notação legível por humanos para o código de máquina que uma arquitetura de computador específica usa, utilizada para programar códigos entendidos por dispositivos computacionais, como microprocessadores e microcontroladores. 
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

***

## ![C](/assets/img/dev/langs/c.png)
### 02. C
<https://www.iso.org/standard/74528.html>

> Arquivo: `vim hello-world.c`

C é uma linguagem de programação compilada de propósito geral, estruturada, imperativa, procedural, padronizada por Organização Internacional para Padronização (ISO), criada em 1972 por Dennis Ritchie na empresa AT&T Bell Labs para desenvolvimento do sistema operacional Unix (originalmente escrito em Assembly).
    
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

***

## ![C++](/assets/img/dev/langs/cpp.png)
### 03. C++
<https://isocpp.org/>

> Arquivo: `vim hello-world.cpp`, `vim hello-world.c++` ou `vim hello-world.cc`

C++ (em português: lê-se "cê mais mais", em inglês lê-se see plus plus) é uma linguagem de programação compilada multi-paradigma (seu suporte inclui linguagem imperativa, orientada a objetos e genérica) e de uso geral. 
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

***

## ![Go](/assets/img/dev/langs/go.png)
### 04. Go
<https://golang.org/>

> Arquivo: `vim hello-world.go`

Go é uma linguagem de programação criada pela Google e lançada em código livre em novembro de 2009. É uma linguagem compilada .
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

***

## ![Bash](/assets/img/dev/langs/bash.png)
### 05. Bash
<https://www.gnu.org/software/bash/>
Arquivo: `vim hello-world.sh` ou `vim hello-world.bash`

O bash é uma linguagem de script ou interpretador de comandos, um entre os diversos tradutores.
{% highlight bash %}
#!/bin/bash
echo 'Olá, Mundo!'
{% endhighlight %}

Rodar: `bash hello-world.sh` , `sh hello-world.sh` , `source hello-world.sh` , `chmod +x ./hello-world.sh && ./hello-world.sh`

> Exemplo: <http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO-2.html>

***

## ![Awk](/assets/img/dev/langs/awk.png)
### 06. Awk
<https://www.gnu.org/software/gawk/>

> Arquivo: `vim hello-world.awk`

A linguagem de programação AWK foi criada em 1977 pelos cientistas Alfred Aho, Peter J. Weinberger e Brian Kernighan no laboratório Bell Labs.
{% highlight awk %}
#!/usr/bin/env awk
BEGIN {print "Olá, Mundo!"}
{% endhighlight %}

> *Existem diversas variantes do Awk: [Saiba mais aqui](https://terminalroot.com.br/2014/12/tutorial-basico-de-awk.html).*

Rodar: `awk -f hello-world.awk`

> Exemplo: <https://www.gnu.org/software/gawk/manual/gawk.html#BEGIN_002fEND>

***

## ![Vim](/assets/img/dev/langs/vim.png)
### 07. VimScript
<https://www.vim.org/>

> Arquivo: `vim hello-world.vim`

A linguagem de script do Vim, conhecida como Vimscript, é uma linguagem imperativa dinâmica típica que oferece a maioria dos recursos de linguagem comuns.
{% highlight vim %}
:echo "Olá. Mundo!"
{% endhighlight %}

> *Precisa possuir [vim](https://www.vim.org/) instalado.*

Rodar: `vim -u hello-world.vim +qall`

> Curso de Vim e VimScript: <https://terminalroot.com.br/vim>

***

## ![SQL](/assets/img/dev/langs/sql.png)
### 08. SQL
<https://sigmod.org/#standards>

> Arquivo: `vim hello-world.sql`

Structured Query Language, ou Linguagem de Consulta Estruturada ou SQL, é a linguagem de pesquisa declarativa padrão para banco de dados relacional (base de dados relacional).
{% highlight sql %}
SELECT "Olá, Mundo!"
{% endhighlight %}

> *Precisa possuir o MySQL para esse exemplo: [MySQL](https://www.mysql.com).*

Rodar: ` mysql -u root -p < hello-world.sql` ou diretamente: `mysql -u root -p -e "SELECT 'Olá, Mundo'"`

> Usos: <https://terminalroot.com.br/2011/10/curso-certificacao-linux-lpi-102.html>

***

## ![Lua](/assets/img/dev/langs/lua.png)
### 09. Lua
<https://www.lua.org/>

> Arquivo: `vim hello-world.lua`

Lua é uma linguagem de script de multiparadigma, pequena, reflexiva e leve, projetada para expandir aplicações em geral, por ser uma linguagem extensível (que une partes de um programa feitas em mais de uma linguagem), para prototipagem e para ser embarcada em softwares complexos, como jogos. Assemelha-se com Python, Ruby e entre outras.
{% highlight lua %}
#!/usr/bin/env lua
print "Olá, Mundo!"
{% endhighlight %}

> *Precisa possuir Lua instalada.*

Rodar: `lua hello-world.lua` ou `chmod +x hello-world.lua && ./hello-world.lua`

> Exemplo: <https://terminalroot.com.br/2016/11/blog-linux-lua.html>

***

## ![Perl](/assets/img/dev/langs/perl.png)
### 10. Perl
<https://www.perl.org/>

> Arquivo: `vim hello-world.pl`

Perl é uma família de duas linguagens de programação multiplataforma, Perl 5 e Perl 6.
{% highlight perl %}
#!/usr/bin/env perl
print "Olá, Mundo!\n";
{% endhighlight %}

> *Precisa possuir Perl instalado.*

Rodar: `perl hello-world.pl` ou `chmod +x hello-world.pl && ./hello-world.pl`

> Exemplo: <https://metacpan.org/pod/Perl::Tutorial::HelloWorld>

***

## ![PHP](/assets/img/dev/langs/php.png)
### 11. PHP
<https://www.php.net/>

> Arquivo: `vim hello-world.EXT`

PHP (um acrônimo recursivo para "PHP: Hypertext Preprocessor", originalmente Personal Home Page) é uma linguagem interpretada livre, usada originalmente apenas para o desenvolvimento de aplicações presentes e atuantes no lado do servidor, capazes de gerar conteúdo dinâmico na World Wide Web.
{% highlight php %}
#!/usr/bin/env php
<?="Olá, Mundo!\n"?>
{% endhighlight %}

> *Precisa possuir PHP instalado.*

Rodar: `php hello-world.php` ou `chmod +x hello-world.php && ./hello-world.php`

> Exemplo: <https://terminalroot.com.br/2011/12/como-criar-chat-com-sockets-em-php-no.html>

***

## ![Python](/assets/img/dev/langs/python.png)
### 12. Python
<https://www.python.org/>

> Arquivo: `vim hello-world.EXT`

Python é uma linguagem de programação de alto nível, interpretada, de script, imperativa, orientada a objetos, funcional, de tipagem dinâmica e forte.
{% highlight python %}
#!/usr/bin/env python
print("Olá, Mundo!")
{% endhighlight %}

> *É possível rodar Python diretamente no prompt: `python`.*

Rodar: `python hello-world.py` ou `chmod +x hello-world.py && ./hello-world.py`

> Exemplo: <https://terminalroot.com.br/2016/12/script-basico-de-python-para-aprendizado.html>

***

## ![JavaScript](/assets/img/dev/langs/javascript.png)
### 13. JavaScript
<http://www.ecma-international.org/publications/standards/Ecma-262.htm>

> Arquivo: `vim hello-world.js`

JavaScript, frequentemente abreviado como JS, é uma linguagem de programação interpretada de alto nível, caracterizada também, como dinâmica, fracamente tipificada, prototype-based e multi-paradigma.
{% highlight javascript %}
console.log("Olá, Mundo!");
{% endhighlight %}

> *Precisa possuir o [Node.js]() instalado, ou rodar num [Navegador da Web].*

Rodar: `node hello-world.js`

> Exemplo: <https://terminalroot.com.br/2011/11/alguns-codigos-simples-de-javascript.html>

***

## ![Java](/assets/img/dev/langs/java.png)
### 14. Java
<https://www.java.com/>

> Arquivo: `vim hello-world.java`

Java é uma linguagem de programação desenvolvida por engenheiros da Sun Microsystems. É uma linguagem orientada a objetos e projetada para rodar em várias plataformas sem a necessidade de recompilar o código em cada uma delas.

+ **JDK** - **J**ava **D**evelopment **K**it é necessário para desenvolver aplicativos java.
O JRE é menor que o JDK, portanto, ele necessita de menos espaço em disco.

OpenJDK é uma implementação livre e gratuita da plataforma Java, Edição Standard. 
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

***

## ![Rust](/assets/img/dev/langs/rust.png)
### 15. Rust
<https://www.rust-lang.org>

> Arquivo: `vim hello-world.rs`

Rust é uma linguagem de programação multiparadigma compilada desenvolvida pela Mozilla Research. É projetada para ser "segura, concorrente e prática", suportando os estilos puramente funcional, procedural, e orientado a objetos. Possui suporte nativo ao WebAssembly.
{% highlight rust %}
fn main() {
    println!("Olá Mundo!");
}
{% endhighlight %}

> *Precisa possuir o compilador: [rustc](https://doc.rust-lang.org/rustc/index.html).*

Rodar: `rustc hello-world.rs && ./hello-world`

> Exemplo: <https://doc.rust-lang.org/stable/rust-by-example/hello.html>

***

## ![Swift](/assets/img/dev/langs/swift.png)
### 16. Swift
<https://swift.org/>

> Arquivo: `vim hello-world.swift`

Swift é uma linguagem de programação desenvolvida pela Apple para desenvolvimento no iOS, macOS, watchOS, tvOS e Linux.
{% highlight swift %}
print("Olá, Mundo!")
{% endhighlight %}

> *Precisa possuir o [swift](https://github.com/apple/swift).*

Rodar: `swift build && .build/debug/hello-world` , isso dentro de um diretório com Sources

> Exemplo: <https://swift.org/getting-started/#installing-swift>

***

## ![Dart](/assets/img/dev/langs/dart.png)
### 17. Dart
<https://dart.dev/>

> Arquivo: `vim hello-world.dart`

Dart (originalmente denominada Dash) é uma linguagem de script voltada à web desenvolvida pela Google.
{% highlight dart %}
main() {
  print('Olá, Mundo!');
}
{% endhighlight %}

> *Precisa de [dependências](https://dart.dev/tutorials/server/get-started).*

Rodar: `dart hello-world.dart`

> Exemplo: <https://dart.dev/#try-dart>

***

## ![Kotlin](/assets/img/dev/langs/kotlin.png)
### 18. Kotlin
<https://kotlinlang.org/>

> Arquivo: `vim hello-world.kt`

[Kotlin](https://github.com/andrewoma/kotlin-script) é uma Linguagem de programação multiplataforma que compila para a Máquina virtual Java e que também pode ser traduzida para JavaScript e compilada para código nativo.
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

***

## ![R](/assets/img/dev/langs/r.png)
### 19. R
<https://www.r-project.org/>

> Arquivo: `vim hello-world.r`

R é um ambiente computacional e uma linguagem de programação que vem progressivamente se especializando em manipulação, análise e visualização gráfica de dados.
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

***

## ![Julia](/assets/img/dev/langs/julia.png)
### 20. Julia
<https://julialang.org/>

> Arquivo: `vim hello-world.jl`

Julia é uma linguagem de programação dinâmica de alto nível projetada para atender os requisitos da computação de alto desempenho numérico e científico, sendo também eficaz para a programação de propósito geral.
{% highlight julia %}
#!/usr/bin/env julia
println("Olá, Mundo!")
{% endhighlight %}

> *Para usar a forma compilada precisa do compilador [JIT](https://www.gnu.org/software/lightning/).*

Rodar: `julia hello-world.jl`

> Exemplo: <https://docs.julialang.org/en/v1/manual/getting-started/>

***

## ![Ruby](/assets/img/dev/langs/ruby.png)
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

***

## ![Elixir](/assets/img/dev/langs/elixir.png)
### 22. Elixir
<https://elixir-lang.org/>

> Arquivo: `vim hello-world.exs`

Elixir é uma linguagem de programação funcional, concorrente, de propósito geral que executa na máquina virtual Erlang (BEAM).
{% highlight elixir %}
IO.puts "Hello world from Elixir"
{% endhighlight %}

> *Precisa possuir Elixir instalado.*

Rodar: `elixir hello-world.exs`

> Exemplo: <https://elixir-lang.org/getting-started/introduction.html>

***

## ![Vala](/assets/img/dev/langs/vala.png)
### 23. Vala
<https://wiki.gnome.org/Projects/Vala>

> Extensão: `vim hello-world.vala`

Vala é uma linguagem de programação orientada a objetos, com sintaxe [inspirada em C#](https://wiki.gnome.org/Projects/Vala/ValaForCSharpProgrammers).
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

***

## ![C#](/assets/img/dev/langs/csharp.png)
### 24. C#
<http://msdn.microsoft.com/pt-br/vcsharp/default.aspx>

> Arquivo: `vim hello-world.EXT`

C# é uma linguagem de programação, multiparadigma, de tipagem forte, desenvolvida pela Microsoft como parte da plataforma .NET. 
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

***

## ![Gambas](/assets/img/dev/langs/gambas.png)
### 25. Gambas (Visual Basic para Linux)
<http://gambas.sourceforge.net/>

> Arquivo: `vim hello-world.gambas`

Gambas é um ambiente de desenvolvimento integrado (IDE) para Linux uma alternativa Open Source ao Visual Basic do Microsoft Windows.
{% highlight vb %}
Message.Info("Olá, Mundo!")
{% endhighlight %}

> *Precisa possuir Gambas, ex.: `sudo apt install gambas3` <https://www.youtube.com/watch?v=xezNqM2zrbY>.*

Rodar: `gambas hello-world.gambas`

> Exemplo: <https://terminalroot.com.br/2016/10/gambas-o-visual-basic-open-source-para.html>

***

