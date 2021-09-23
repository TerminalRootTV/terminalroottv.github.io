---
layout: post
title: "Conheça o ChaiScript - Uma Linguagem de Script para C++"
date: 2021-09-23 14:50:08
image: '/assets/img/cppdaily/chaiscript.jpg'
description: 'Vale a pena conhecer!'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![Conheça o ChaiScript - Uma Linguagem de Script para C++](/assets/img/cppdaily/chaiscript.jpg)

**ChaiScript** é uma das únicas linguagens de script incorporadas projetadas desde o início para atingir diretamente o [C++](https://terminalroot.com.br/cpp) e aproveitar as vantagens das técnicas modernas de desenvolvimento C++. Por ser um aplicativo C++ nativo, tem algumas vantagens sobre as linguagens de script incorporadas existentes:

+ Ele usa uma abordagem apenas de cabeçalho, o que facilita a integração com projetos existentes.
+ Ele mantém a segurança de tipo entre seu aplicativo C++ e os scripts do usuário.
+ Ele oferece suporte a uma variedade de técnicas C++, incluindo *callback*, funções sobrecarregadas, métodos de classe e contêineres STL.


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

## Instalação
Para instalar o ChaiScript script é bem simples, basta fazer o download na [página de releases](https://github.com/ChaiScript/ChaiScript/releases) e adicionar às suas bibliotecas.

De acordo com a data de publicação desse artigo, a versão mais recente é a **6.1.0** .

No [Linux](https://terminalroot.com.br/linux) você pode instalar da seguinte forma:
{% highlight sh %}
cd /tmp
wget https://github.com/ChaiScript/ChaiScript/archive/refs/tags/v6.1.0.tar.gz
tar zxvf v6.1.0.tar.gz
sudo mv ChaiScript-6.1.0/include/chaiscript/ /usr/local/include/
{% endhighlight %}

Você também pode usar o [vcpkg](https://terminalroot.com.br/2021/09/instale-o-vcpkg-um-gerenciador-de-pacotes-para-c-cpp.html) para instalar
{% highlight sh %}
sudo vcpkg install chaiscript
{% endhighlight %}

---

## Exemplo básico de uso
{% highlight cpp %}
#include <chaiscript/chaiscript.hpp>

std::string hello_world(const std::string &t_name) {
  return "Olá " + t_name + "!\n";
}

int main() {
  chaiscript::ChaiScript chai;
  chai.add(chaiscript::fun(&hello_world), "hello_world");

  chai.eval(R"(
    puts(hello_world("Terminal Root"));
  )");
}
{% endhighlight %}

---

## Compilando
Compilando via linha de comando:
{% highlight sh %}
g++ -ldl -pthread main.cpp
{% endhighlight %}

Se você usou [esse procedimento via vcpkg para instalar](https://terminalroot.com.br/2021/09/instale-o-vcpkg-um-gerenciador-de-pacotes-para-c-cpp.html), use assim:
{% highlight sh %}
g++ -I/usr/local/include/vcpkg/ -ldl -pthread main.cpp
{% endhighlight %}

Alternativamente, você pode compilar sem suporte a threading:
{% highlight sh %}
gcc main.cpp -ldl -DCHAISCRIPT_NO_THREADS
{% endhighlight %}

---

## Para mais exemplos de uso consulte os links:
+ [Cheat Sheet](https://github.com/ChaiScript/ChaiScript/blob/develop/cheatsheet.md)
+ [Doxygen](https://codedocs.xyz/ChaiScript/ChaiScript/)
+ [Repositório no GitHub](https://github.com/ChaiScript/ChaiScript)
+ [Site Oficial](http://chaiscript.com/)



