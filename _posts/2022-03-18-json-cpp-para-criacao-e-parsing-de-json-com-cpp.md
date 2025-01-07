---
layout: post
title: "Json C++ - Para criação e parsing de JSON com C++"
date: 2022-03-18 07:50:49
image: '/assets/img/cppdaily/json-cpp.jpg'
description: 'JSON C++ é um utilitário para C++ Moderno'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
- json
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**JSON C++** é um utilitário para [C++ Moderno](https://terminalroot.com.br/cpp) que serve para criar e ler arquivos [JSON](https://terminalroot.com.br/2022/01/visualize-json-de-forma-interativa-pelo-terminal.html).

# Instalação
Para instalar você pode procurar o `nlohmann/json` através da ferramenta de pesquisa do seu *gerenciador de pacotes*. 

Exemplo usando o *APT* no [Ubuntu](https://terminalroot.com.br/tags#ubuntu):
```bash
sudo apt install nlohmann-json3-dev
```

Outra forma também é clonar, compilar e instalar a a partir do [repositório do GitHub](https://github.com/nlohmann/json), seguindo os passos:

Certifique-se de já possuir o [Git](https://terminalroot.com.br/tags#git), [GCC](https://terminalroot.com.br/tags#gcc) ou [Clang](https://terminalroot.com.br/tags#clang), [CMake](https://terminalroot.com.br/tags#cmake), [GNU Make](https://terminalroot.com.br/tags#make) instalados no seu sistema.

Em seguida clone, construa e instale com os seguintes comandos:
{% highlight sh %}
git clone https://github.com/nlohmann/json
cd json
mkdir build && cd build
cmake ..
make
sudo make install
{% endhighlight %}

Ele será Copiado/Instalado nos diretórios similares aos abaixo:
{% highlight sh %}
-- Install configuration: ""
-- Up-to-date: /usr/local/include
-- Installing: /usr/local/include/nlohmann
-- Installing: /usr/local/include/nlohmann/json.hpp
-- Installing: /usr/local/lib64/cmake/nlohmann_json/nlohmann_jsonConfig.cmake
-- Installing: /usr/local/lib64/cmake/nlohmann_json/nlohmann_jsonConfigVersion.cmake
-- Installing: /usr/local/lib64/cmake/nlohmann_json/nlohmann_jsonTargets.cmake
-- Installing: /usr/local/lib64/pkgconfig/nlohmann_json.pc
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

# Exemplo básico de utilização
Para criar um JSON básico.

> `vim hello-json.cpp`

{% highlight cpp %}
#include <iostream>
#include <nlohmann/json.hpp>

int main(){
  nlohmann::json j;
  j.push_back("Hello");
  j.emplace_back("World");
  std::cout << j << '\n';
}
{% endhighlight %}
> `g++ hello-json.cpp` e rode: `./a`

> Possível saída:
{% highlight sh %}
["Hello","World"]
{% endhighlight %}

Imprimindo somente o primeiro elemento do JSON:
{% highlight cpp %}
#include <iostream>
#include <nlohmann/json.hpp>

int main(){
  nlohmann::json j;
  j.push_back("Hello");
  j.emplace_back("World");
  std::cout << j[0] << '\n';
}
{% endhighlight %}
> Possível saída: `"Hello"`

---

# Fazendo parsing
Exemplo de um arquivo JSON `example.json` :

{% highlight json %}
{
  "number": 42,
  "website": "Terminal Root",
  "author": "Marcos Oliveira",
  "parsing": true,
  "details": {
    "tutorial": "json C++",
    "id": 1
  },
  "other": null
}
{% endhighlight %}

Imprimir todo o conteúdo:
{% highlight cpp %}
#include <iostream>
#include <nlohmann/json.hpp>
#include <fstream>

int main(){
  std::ifstream file("./example.json");
  nlohmann::json j;
  file >> j;
  std::cout << j << '\n';
}
{% endhighlight %}
> Possível saída, **note que a exibição foi alterada para ordem alfabética**:
{% highlight sh %}
{"author":"Marcos Oliveira","details":{"id":1,"tutorial":"json C++"},"number":42,"other":null,"parsing":true,"website":"Terminal Root"}
{% endhighlight %}

---

Imprimir o conteúdo com formatação:
{% highlight cpp %}
#include <iostream>
#include <nlohmann/json.hpp>
#include <fstream>

int main(){
  std::ifstream file("./example.json");
  nlohmann::json j;
  file >> j;
  std::cout << std::setw(2) << j << '\n';
}
{% endhighlight %}
> Possível saída,**note que a exibição foi alterada para ordem alfabética** :
{% highlight json %}
{
  "author": "Marcos Oliveira",
  "details": {
    "id": 1,
    "tutorial": "json C++"
  },
  "number": 42,
  "other": null,
  "parsing": true,
  "website": "Terminal Root"
}
{% endhighlight %}

---

Imprimir somente o conteúdo de *website*
{% highlight cpp %}
#include <iostream>
#include <nlohmann/json.hpp>
#include <fstream>

int main(){
  std::ifstream file("./example.json");
  nlohmann::json j;
  file >> j;
  std::string website = j["website"];
  std::cout << website << '\n';
}
{% endhighlight %}
> Possível saída: `Terminal Root` .

---

Imprimir o conteúdo de `{"details": {"tutorial"}}`:
{% highlight cpp %}
#include <iostream>
#include <nlohmann/json.hpp>
#include <fstream>

int main(){
  std::ifstream file("./example.json");
  nlohmann::json j;
  file >> j;
  std::string jstr = j["details"]["tutorial"];
  std::cout << jstr << '\n';
}
{% endhighlight %}
> Possível saída: `json C++` .

---

Para uma documentação completa acesse o [repositório](https://github.com/nlohmann/json) e a [página oficial](https://json.nlohmann.me/) .

