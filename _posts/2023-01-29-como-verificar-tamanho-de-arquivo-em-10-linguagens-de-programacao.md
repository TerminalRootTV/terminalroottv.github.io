---
layout: post
title: "Como Verificar Tamanho de Arquivo em 10 Linguagens de Programação"
date: 2023-01-29 09:01:13
image: '/assets/img/programacao/filesize.jpg'
description: 'C, C++, Java, Lua, Perl, Python, PHP, C#, JavaScript/Nodejs e Go.'
icon: 'ion:terminal-sharp'
iconname: 'Programação'
tags:
- langs
- cpp
- linguagemc
- java
- csharp
- lua
- perl
- php
- python
- javascript
- nodejs
- go
- programacao
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Hoje, mais uma vez, vamos exercitar nossos conhecimentos criando rotinas que podem ser úteis em diversas situações. E dessa vez veremos como saber o tamanho de um arquivo em 10 linguagens de programação diferentes, são elas: [C](https://terminalroot.com.br/tags#linguagemc), [C++](https://terminalroot.com.br/tags#cpp), [Java](https://terminalroot.com.br/tags#java), [C#](https://terminalroot.com.br/tags#csharp), [PHP](https://terminalroot.com.br/tags#php), [Lua](https://terminalroot.com.br/tags#lua), [Perl](https://terminalroot.com.br/tags#perl), [Python](https://terminalroot.com.br/tags#python), [JavaScript](https://terminalroot.com.br/tags#bash)/[Node.js](https://terminalroot.com.br/tags#nodejs) e [Go/Golang](https://terminalroot.com.br/tags#go).

Assim como nos artigos:
+ [Como Obter o Diretório atual em 10 Linguagens de Programação diferentes](https://terminalroot.com.br/2022/10/como-obter-o-diretorio-atual-em-10-linguagens-de-programacao-diferentes.html)
+ [Como verificar se um diretório existe em: C, C++, Python e Lua](https://terminalroot.com.br/2021/11/como-verificar-se-um-diretorio-existe-em-c-cpp-python-e-lua.html)

Vou somente postar o código de cada uma delas!

O arquivo `file.iso` é fictício e você deve substituir por um arquivo válido em seu computador para efetivar os testes.

Você pode comparar o resultado usando o comando: `du -h file.iso`.

---

# 01. [C](https://terminalroot.com.br/tags#linguagemc)
> `filesize.c`

{% highlight c %}
#include <stdio.h>

int main(){
  FILE * file = fopen("file.iso", "rb");
  fseek(file, 0, SEEK_END);
  int size = ftell(file);
  fclose(file);
  printf("%d MB\n", (size / 1024) / 1024);
  return 0;
}
{% endhighlight %}
> `gcc filesize.c && ./a.out`

---

# 02. [C++](https://terminalroot.com.br/tags#cpp)
> `filesize.cpp`

{% highlight cpp %}
#include <iostream>
#include <fstream>

int main(){
  std::ifstream file("file.iso", std::ios::in | std::ios::binary);
  file.seekg(0, std::ios::end);
  std::cout << (file.tellg() / 1024) / 1024 << " MB\n";
  return 0;
}
{% endhighlight %}
> `g++ filesize.cpp && ./a.out`

---

# 03. [Java](https://terminalroot.com.br/tags#java)
> `FileSize.java`

{% highlight java %}
import java.io.File;

public class FileSize {
  public static void main(String[] args) {
    String path = "file.iso";
    long size = new File(path).length();
    System.out.println(( size / 1024 ) / 1024 + " MB");
  }
}
{% endhighlight %}
> `javac FileSize.java && java FileSize`

---

# 04. [Lua](https://terminalroot.com.br/tags#lua)
> `filesize.lua`

{% highlight lua %}
file = io.open("file.iso", "r")
size = math.floor((file:seek("end") / 1024) / 1024)
print(size .. " MB")
{% endhighlight %}
> `lua filesize.lua`

---


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

# 05. [Perl](https://terminalroot.com.br/tags#perl)
> `filesize.pl`

{% highlight perl %}
$path = "file.iso";
my $x = -s $path;
$x = ($x / 1024) / 1024;
$x = int($x);
print("$x MiB\n");
{% endhighlight %}
> `perl filesize.pl`

---

# 06. [Python](https://terminalroot.com.br/tags#python)
> `filesize.py`

{% highlight python %}
import os
path = "file.iso"
size = os.path.getsize(path)
print( str( int( (size / 1024) / 1024) ) + " MB")
{% endhighlight %}
> `python filesize.py`

---

# 07. [PHP](https://terminalroot.com.br/tags#php)
> `filesize.php`

{% highlight php %}
<?php
$path = "file.iso";
$x = filesize($path) / 1024 / 1024; 
echo intval($x) . " MB\n";
{% endhighlight %}
> `php filesize.php`

---

# 08. [C#](https://terminalroot.com.br/tags#csharp)
> `dotnet new console -o FileSize && cd FileSize && vim Program.cs`

{% highlight csharp %}
string path = "file.iso";
long size = new System.IO.FileInfo(path).Length;
Console.WriteLine( (size/1024) / 1024 + " MB" );
{% endhighlight %}
> `dotnet run`

---

# 09. [JavaScript](https://terminalroot.com.br/tags#javascript)/[Node.js](https://terminalroot.com.br/tags#nodejs)
> `filesize.js`

{% highlight js %}
const {readFileSync: read} = require ('fs')
const path = "file.iso"
let size = read(path).length
size = (size / 1024) / 1024
console.log(parseInt(size) + " MB")
{% endhighlight %}
> `node filesize.js`

---

# 10. [Golang/Go](https://terminalroot.com.br/tags#go)
> `filesize.go`

{% highlight go %}
package main

import("fmt";"os")

func main(){
  file, err := os.Stat("file.iso")
  _ = err
  size := file.Size()
  fmt.Println( (size/1024) / 1024,"MB")
}
{% endhighlight %}
> `go build filesize.go && ./filesize` ou `go run filesize.go`

---

Até o próximo artigo!


