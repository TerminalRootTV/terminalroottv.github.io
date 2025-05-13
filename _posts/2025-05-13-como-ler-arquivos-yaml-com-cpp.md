---
layout: post
title: "Como Ler Arquivos YAML com C++"
date: 2025-05-13 14:57:45
image: '/assets/img/cppdaily/yaml-cpp.jpg'
description: "🚀 Simples, rápido e prático!"
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cppdaily
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

O `yaml-cpp` é um parser para YAML com [C++](https://terminalroot.com.br/tags#cpp).

Com ele você consegue ler arquivos YAML de forma rápida através do código [C++](https://terminalroot.com.br/cpp).


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

## Instalação
Para instalar basta clonar com [git](https://terminalroot.com.br/tags#git), compilar e instalar com [CMake](https://terminalroot.com.br/tags#cmake), rode os comando abaixo:

{% highlight bash %}
git clone https://github.com/jbeder/yaml-cpp
cd yaml-cpp
cmake -B build .
cmake --build build
sudo cmake --install build
{% endhighlight %}

<details>
 <summary>Veja aqui os arquivos que são instalados</summary>

{% highlight cpp %}
-- Install configuration: ""
-- Installing: /usr/local/lib/libyaml-cpp.a
-- Up-to-date: /usr/local/include
-- Installing: /usr/local/include/yaml-cpp
-- Installing: /usr/local/include/yaml-cpp/emitterstyle.h
-- Installing: /usr/local/include/yaml-cpp/eventhandler.h
-- Installing: /usr/local/include/yaml-cpp/binary.h
-- Installing: /usr/local/include/yaml-cpp/emitterdef.h
-- Installing: /usr/local/include/yaml-cpp/yaml.h
-- Installing: /usr/local/include/yaml-cpp/null.h
-- Installing: /usr/local/include/yaml-cpp/contrib
-- Installing: /usr/local/include/yaml-cpp/contrib/anchordict.h
-- Installing: /usr/local/include/yaml-cpp/contrib/graphbuilder.h
-- Installing: /usr/local/include/yaml-cpp/ostream_wrapper.h
-- Installing: /usr/local/include/yaml-cpp/anchor.h
-- Installing: /usr/local/include/yaml-cpp/parser.h
-- Installing: /usr/local/include/yaml-cpp/emitfromevents.h
-- Installing: /usr/local/include/yaml-cpp/emittermanip.h
-- Installing: /usr/local/include/yaml-cpp/traits.h
-- Installing: /usr/local/include/yaml-cpp/exceptions.h
-- Installing: /usr/local/include/yaml-cpp/fptostring.h
-- Installing: /usr/local/include/yaml-cpp/node
-- Installing: /usr/local/include/yaml-cpp/node/parse.h
-- Installing: /usr/local/include/yaml-cpp/node/type.h
-- Installing: /usr/local/include/yaml-cpp/node/ptr.h
-- Installing: /usr/local/include/yaml-cpp/node/node.h
-- Installing: /usr/local/include/yaml-cpp/node/convert.h
-- Installing: /usr/local/include/yaml-cpp/node/impl.h
-- Installing: /usr/local/include/yaml-cpp/node/emit.h
-- Installing: /usr/local/include/yaml-cpp/node/iterator.h
-- Installing: /usr/local/include/yaml-cpp/node/detail
-- Installing: /usr/local/include/yaml-cpp/node/detail/memory.h
-- Installing: /usr/local/include/yaml-cpp/node/detail/node.h
-- Installing: /usr/local/include/yaml-cpp/node/detail/impl.h
-- Installing: /usr/local/include/yaml-cpp/node/detail/node_data.h
-- Installing: /usr/local/include/yaml-cpp/node/detail/node_iterator.h
-- Installing: /usr/local/include/yaml-cpp/node/detail/iterator_fwd.h
-- Installing: /usr/local/include/yaml-cpp/node/detail/iterator.h
-- Installing: /usr/local/include/yaml-cpp/node/detail/node_ref.h
-- Installing: /usr/local/include/yaml-cpp/dll.h
-- Installing: /usr/local/include/yaml-cpp/stlemitter.h
-- Installing: /usr/local/include/yaml-cpp/noexcept.h
-- Installing: /usr/local/include/yaml-cpp/depthguard.h
-- Installing: /usr/local/include/yaml-cpp/mark.h
-- Installing: /usr/local/include/yaml-cpp/emitter.h
-- Installing: /usr/local/lib/cmake/yaml-cpp/yaml-cpp-targets.cmake
-- Installing: /usr/local/lib/cmake/yaml-cpp/yaml-cpp-targets-noconfig.cmake
-- Installing: /usr/local/lib/cmake/yaml-cpp/yaml-cpp-config.cmake
-- Installing: /usr/local/lib/cmake/yaml-cpp/yaml-cpp-config-version.cmake
-- Installing: /usr/local/lib/pkgconfig/yaml-cpp.pc
{% endhighlight %}

</details>

---

## Exemplo básico
Suponhamos que você possua esse arquivo de exemplo do tipo YAML: `example.yaml`:
{% highlight yaml %}
pessoa:
  nome: Marcos
  sobrenome: Oliveira
  idade: 39
  profissao: Programador
  altura: 1.73
{% endhighlight %}

E aqui o código C++ que irá fazer o parser: `main.cpp`
{% highlight cpp %}
#include <print>
#include <fstream>
#include <yaml-cpp/yaml.h>

int main(){
  YAML::Node doc = YAML::LoadFile("./example.yaml");

  YAML::Node pessoa = doc["pessoa"];

  std::string nome = pessoa["nome"].as<std::string>();
  std::string sobrenome = pessoa["sobrenome"].as<std::string>();
  int idade = pessoa["idade"].as<int>();
  std::string profissao = pessoa["profissao"].as<std::string>();
  double altura = pessoa["altura"].as<double>();

  std::println("Nome: {}", nome);
  std::println("Sobrenome: {}", sobrenome);
  std::println("Idade: {}", idade);
  std::println("Profissão: {}", profissao);
  std::println("Altura: {}", altura);

  return EXIT_SUCCESS;
}
{% endhighlight %}
> Lembrando que nesse exemplo usei [std::println](https://terminalroot.com.br/2025/04/como-instalar-o-gcc-14-e-usar-o-cpp23.html) em vez de `iostream`.

Compile usando a flag para o `yaml-cpp`:
{% highlight bash %}
g++ main.cpp -lyaml-cpp
{% endhighlight %}

E após rodar o binário a saída será:
{% highlight bash %}
Nome: Marcos
Sobrenome: Oliveira
Idade: 39
Profissão: Programador
Altura: 1.73
{% endhighlight %}

Fácil, né?! Para mais informações acesse o [repositório](https://github.com/jbeder/yaml-cpp) e os [exemplos para uso da API](https://github.com/jbeder/yaml-cpp/wiki/How-To-Parse-A-Document-(Old-API)).

