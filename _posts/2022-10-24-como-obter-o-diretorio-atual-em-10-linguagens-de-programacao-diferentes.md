---
layout: post
title: "Como Obter o Diretório atual em 10 Linguagens de Programação diferentes"
date: 2022-10-24 11:53:56
image: '/assets/img/programacao/current-dir.jpg'
description: 'Em: C++, C, Lua, Java, Bash, JavaScript, Python, PHP, Golang e Ruby.'
icon: 'ion:terminal-sharp'
iconname: 'Programação'
tags:
- programacao
- langs
- cpp
- linguagemc
- lua
- bash
- javascript
- python
- php
- go
- ruby
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Algumas tarefas básicas muitas vezes servem para memorizarmos conceitos fundamentais.

Sendo assim, nesse artigo de hoje veremos como **Obter o diretório atual em 10 linguagens de programação diferentes** . Dentre elas: [C++](https://terminalroot.com.br/tags#cpp), [C](https://terminalroot.com.br/tags#linguagemc), [Lua](https://terminalroot.com.br/lua), [Java](https://terminalroot.com.br/tags#java), [Bash](https://terminalroot.com.br/tags#bash), [JavaScript](https://terminalroot.com.br/tags#javascript), [Python](https://terminalroot.com.br/tags#python), [PHP](https://terminalroot.com.br/tags#php), [Golang](https://terminalroot.com.br/tags#go) e [Ruby](https://terminalroot.com.br/tags#ruby).

Todas foram usadas da forma mais simples possível e de forma moderna. Servirá para também revisarmos como concatenar e sintaxe básica.

Em cada código também haverá comentário de acordo com a linguagem para compilar e/ou interpretar via [linha de comando](https://terminalroot.com.br/tags#comandos).

---

# C++
{% highlight cpp %}
#include <iostream>
#include <filesystem>

int main(){
  std::cout << "O diretório atual é: " 
    << std::filesystem::current_path() << '\n';
  return 0;
}
// g++ -std=c++17 current.cpp && ./a.out
{% endhighlight %}

---

# C 
{% highlight c %}
#include <stdio.h>
#include <unistd.h>
#include <limits.h>

int main() {
  char cwd[PATH_MAX];
  getcwd(cwd, sizeof(cwd));
  printf("O diretório atual é: %s\n", cwd);
  return 0;
}
// gcc current.c && ./a.out
{% endhighlight %}

---

# Lua 
{% highlight lua %}
print("O diretório atual é: " .. os.getenv("PWD"))
--lua current.lua
{% endhighlight %}

---

# Java
{% highlight java %}
public class current {
  public static void main(String[] args) {
    System.out.println("O diretório atual é: " + System.getProperty("user.dir"));
  }
}
// javac current.java && java current 
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

# Bash
{% highlight bash %}
echo "O diretório atual é: ${PWD}"
# bash current.sh
{% endhighlight %}

---

# JavaScript
> [Node.js](https://terminalroot.com.br/tags#nodejs)

{% highlight js %}
console.log("O diretório atual é: " + process.cwd() )
// node current.js
{% endhighlight %}

---

# Python
{% highlight python %}
import os
print("O diretório atual é: " + os.getcwd())
# python current.py
{% endhighlight %}

---

# PHP
{% highlight php %}
<?php echo "O diretório atual é: " . getcwd() . "\n";
# php current.php
{% endhighlight %}

---

# Golang
{% highlight go %}
package main

import (
  "fmt"
  "os"
)

func main(){
  dir,err := os.Getwd() ; _ = err
  fmt.Println("O diretório atual é: " + dir)
}
// go build current.go && ./current 
{% endhighlight %}


<!-- RECTANGLE 2 - OnParagragraph -->
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

---

# Ruby
{% highlight ruby %}
puts "O diretório atual é: " + Dir.pwd
# ruby current.rb
{% endhighlight %}

---

Acompanhe o [Blog](https://terminalroot.com.br/newsletter) para ver novos artigos similares à esse, além de outros!

<!--
Veja também: <https://programming-idioms.org/idiom/106/get-program-working-directory>

{% highlight rs %}
use std::env;

fn main() {
    println!("O diretório atual é: {:?}", env::current_dir().unwrap());
}
// rustc current.rs && ./current

{% endhighlight %}
-->


