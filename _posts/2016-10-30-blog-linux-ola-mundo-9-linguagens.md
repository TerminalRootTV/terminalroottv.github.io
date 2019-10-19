---
layout: post
title: "Olá Mundo em 9 linguagens de programação"
date: '2016-10-30T09:52:00.000-07:00'
image: '/assets/img/c/blog-linux-linguagens.jpg'
description: "Olá Mundo em 9 linguagens de programação"
main-class: 'dev'
tags:
- linguagem
- desenvolvimento
- web
---

![Olá Mundo em 9 linguagens de programação](/assets/img/c/blog-linux-linguagens.jpg) 

> O "Olá Mundo" ou "Alô Mundo" é um famoso programa de computador que imprime "Olá, Mundo!" (ou "Hello, World!"), usualmente seguido de uma quebra de linha, com algumas variações como inexistência do ponto de exclamação e letras em minúscula, no dispositivo de saída. É utilizado como um teste ou como um exemplo de código minimalista de uma linguagem de programação. Separamos o "Olá, Mundo!" em 9 linguagens mais usadas e admiradas . Confira abaixo.

###  Bash
<https://www.gnu.org/software/bash/>
Extensão: `vim hello-world.sh`
{% highlight bash %}
#!/bin/bash
echo 'Olá, Mundo!'
{% endhighlight %}
Rodar: `bash hello-world.sh`
Example: <http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO-2.html>

***

###  Python
{% highlight python %}
#!/usr/bin/env python
print "Olá, Mundo!"
{% endhighlight %}
Rodar: `python hello-world.py`

###  C
{% highlight c %}
#include <stdio.h>
int main()
{
 printf("Olá, Mundo!\n");
 return 0;
}
{% endhighlight %}

###  Rust
Extensão: `vim hello-world.rs`
{% highlight c %}
fn main() {
    println!("Hello World!");
}
{% endhighlight %}
Rodar: `rustc hello-world.rs`

###  C++
{% highlight c %}
#include <iostream>
int main()
{
std::cout << "Olá, Mundo!\n";
return 0;
}
{% endhighlight %}

###  Go
{% highlight c %}
package main

import "fmt"

func main() {  
    fmt.Println("!... Hello World ...!") 
} 
{% endhighlight %}

###  JavaScript
{% highlight html %}
document.write("Olá, Mundo!");
{% endhighlight %}

###  Java
{% highlight c %}
class HelloWorld {  
    public static void main(String args[]) { 
        System.out.println("Hello, World"); 
    } 
} 
{% endhighlight %}

###  CSharp
{% highlight c %}
using System; 
namespace HelloWorldApp { 
    class Geeks { 
	    static void Main(string[] args) {
           Console.WriteLine("Hello World!"); 
	       Console.ReadKey(); 
	    } 
    } 
} 
{% endhighlight %}

### 🐚️ Gambas
{% highlight c %}
Message.Info("Olá, Mundo!")
{% endhighlight %}


###  PHP
{% highlight php %}
<?php echo "Olá, Mundo!"; ?>
{% endhighlight %}


###  SQL
{% highlight c %}
SELECT "Olá, Mundo!";
{% endhighlight %}


###  Lua
{% highlight c %}
print "Olá, Mundo!"
{% endhighlight %}

###  Assembly
{% highlight c %}
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

msg     db  'Hello, world!',0xa 
len     equ $ - msg
{% endhighlight %}

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

<style>
hr {max-width: 600px;}
</style>
