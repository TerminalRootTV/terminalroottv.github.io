---
layout: post
title: "Utilize o Ccache e compile muito mais rápido"
date: 2024-05-07 16:42:11
image: '/assets/img/cpp/ccache.jpg'
description: 'Uma ferramenta para seu compilador voar!'
icon: 'ion:terminal-sharp'
iconname: 'Ccache'
tags:
- cpp
- linguagemc
- gcc
- clang
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**Ccache** é uma ferramenta de desenvolvimento de software que armazena em cache compilações para que na próxima vez a mesma compilação possa ser evitada e os resultados possam ser retirados do cache. 

Isso pode acelerar bastante o tempo de recompilação. A detecção é feita por [hash](https://terminalroot.com.br/2019/05/o-que-e-e-como-gerar-uma-hash.html) de diferentes tipos de informações que devem ser exclusivas para a compilação e, em seguida, usando a soma de *hash* para identificar a saída em cache. 

Ccache é licenciado sob a [Licença Pública Geral GNU](https://github.com/ccache/ccache/blob/master/LGPL-3.0.txt).

---

# Instalação
Para instalar o Ccache você pode construir do zero e instalar com as ferramentas [CMake](https://terminalroot.com.br/tags#cmake) e [GNU Make](https://terminalroot.com.br/tags#make) clonando o código fonte do repositório no [GitHub](https://terminalroot.com.br/tags#github):
{% highlight bash %}
git clone https://github.com/ccache/ccache
cd ccache
cmake -B build -D CMAKE_BUILD_TYPE=Release .
cd build && make
sudo make install
{% endhighlight %}

Mas, o Cache está disponível na maioria dos repositórios dos gerenciadores de pacotes. Por exemplo, para instalar no [Ubuntu](https://terminalroot.com.br/tags#ubuntu):
{% highlight bash %}
sudo apt install ccache
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

# Exemplo de uso
Sabemos que as compilações que usam [RegEx](https://terminalroot.com.br/tags#regex) tendem a demorar um pouco mais que o normal. Suponhamos que você possua [esse código]() em [C++](https://terminalroot.com.br/tags#cpp):
{% highlight cpp %}
#include <iostream>
#include <regex>

int main(){
  std::string html = "<a href=\"https://terminalroot.com.br/\">Esse é um link</a>";
  std::regex tags("<[^>]*>");
  std::string remove{};
  std::cout << std::regex_replace(html, tags, remove) << '\n';
  return 0;
}
{% endhighlight %}

Para acelerar a compilação, você deve passar para o `ccache` o comando de compilação:
{% highlight bash %}
ccache g++ regex.cpp
{% endhighlight %}
> Para compilar com [GCC](https://terminalroot.com.br/tags#gcc)

Ou, se for com [Clang](https://terminalroot.com.br/tags#clang):
{% highlight bash %}
ccache clang++ regex.cpp
{% endhighlight %}

---

Você pode linkar o `ccache` para ser usado como padrão, ex.: `ln -s ccache /usr/local/bin/g++`.

Para dicas de parâmetros e optimizações, consulte a ajuda ou o manual:
{% highlight bash %}
man ccache
ccache --help
{% endhighlight %}

Visite também o [repositório](https://github.com/ccache/ccache) e o site oficial: <https://ccache.dev/>.



