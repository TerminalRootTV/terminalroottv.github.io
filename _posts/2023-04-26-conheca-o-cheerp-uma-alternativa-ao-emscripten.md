---
layout: post
title: "Conheça o Cheerp, uma alternativa ao Emscripten"
date: 2023-04-26 09:28:40
image: '/assets/img/web/cheerp.jpg'
description: 'Cheerp é um compilador C/C++ para aplicações Web - Compila para WebAssembly e JavaScript.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- linguagemc
- web
- webassembly
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**Cheerp** é um compilador [C](https://terminalroot.com.br/tags#linguagemc)/[C++](https://terminalroot.com.br/tags#cpp) de código aberto, com licença permissiva e de nível empresarial para aplicativos da [Web](https://terminalroot.com.br/tags#web). Permite compilar praticamente qualquer código C/C++ para [WebAssembly](https://terminalroot.com.br/tags#webassembly) e [JavaScript](https://terminalroot.com.br/tags#javascript).

Ele é baseado e integrado à infraestrutura [LLVM](https://terminalroot.com.br/tags#llvm)/[Clang](https://terminalroot.com.br/tags#clang), e apresentando várias etapas de otimização personalizadas para maximizar o desempenho e minimizar o tamanho da saída de JavaScript/WebAssembly compilada.

O Cheerp é usado principalmente para portar bibliotecas e aplicativos C/C++ existentes para [HTML5](https://terminalroot.com.br/tags#html), mas também pode ser usado para escrever aplicativos Web de alto desempenho e componentes WebAssembly do zero. 

![Cheerp](/assets/img/web/cheerp-meta.jpg) 


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
Existem binários prontos para [Windows](https://terminalroot.com.br/tags#windows), [Ubuntu/Debian](https://terminalroot.com.br/tags#ubuntu) e [macOS](https://terminalroot.com.br/tags#macos).

+ Para Windows você pode fazer o download da versão mais recente na página de [releases](https://github.com/leaningtech/cheerp-meta/releases) e executar o arquivo `https://github.com/leaningtech/cheerp-meta/releases/download/cheerp-3.0/Cheerp-3.0-Windows.exe`;

+ Para Debian e Ubuntu basta adicionar o repositório e instalar via APT:
{% highlight bash %}
# Adicione a seguinte linha a /etc/apt/sources.list
deb http://ppa.launchpad.net/leaningtech-dev/cheerp-ppa/ubuntu focal main

# E importe a chave para apt com o comando
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 84540D4B9BF457D5
sudo apt update

# Depois é só instalar
sudo apt install cheerp-core
{% endhighlight %}

+ Para macos você também pode fazer o download da versão mais recente na página de [releases](https://github.com/leaningtech/cheerp-meta/releases) e executar o arquivo `https://github.com/leaningtech/cheerp-meta/releases/download/cheerp-3.0/cheerp-macosx-3.0.dmg`;

Para construir do zero basta seguir as instruções [nesse link](https://docs.leaningtech.com/cheerp/Linux-build-instructions).

---

# Utilização
Um `Hello, World!` básico seria:

#### Criar um arquivo básico em [C++](https://terminalroot.com.br/tags#cpp), por exemploi, com ao seguinte código:
{% highlight cpp %}
#include <cheerp/clientlib.h>

void webMain(){
  client::console.log("Hello, World Wide Web!");
}
{% endhighlight %}

Compilar com o comando:
{% highlight bash %}
/opt/cheerp/bin/clang++ -target cheerp hello.cpp -o hello.js
{% endhighlight %}

E rodar com [Node.js](https://terminalroot.com.br/tags#nodejs):
{% highlight bash %}
nodejs hello.js
{% endhighlight %}

Você também pode utilizar seu próprio arquivo `index.html`:
{% highlight html %}
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Cheerp example 0: hello</title>
    <script defer src="hello.js"></script>
  </head>
  <body>
  <h1 id="pagetitle">Open the console log
	(Ctrl + Shift + J or Ctrl + Option + J)
	to read the output</h1>
  </body>
</html>
{% endhighlight %}
> Lembrando que alguns navegador não rodarão em ~`file:///`~, mas você pode usar o `python3 -m http.server` e em seguida abrir o arquivo.

---

Para mais informações consulte os links:
+ <https://leaningtech.com/cheerp/>
+ <https://github.com/leaningtech/cheerp-meta>



