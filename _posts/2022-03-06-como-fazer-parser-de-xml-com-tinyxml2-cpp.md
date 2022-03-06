---
layout: post
title: "Como fazer parser de XML com TinyXML2 C++"
date: 2022-03-06 13:04:09
image: '/assets/img/cppdaily/tinyxml2.png'
description: "Uma ferramenta simples e funcional para ler os tilemaps dos seus games."
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
- devgames
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Nós já publicamos sobre o [Expat XML](https://terminalroot.com.br/2021/05/como-fazer-parser-de-xml-com-expat-em-c-cpp.html) que é também uma alternativa para fazer parser de [XML](http://en.wikipedia.org/wiki/XML).

No entanto, o **TinyXML2** é mais simples e tão eficiente quanto o Expat . 

[TinyXML2](https://github.com/leethomason/tinyxml2) analisa um documento XML e constrói a partir dele um Document Object Model (DOM) que pode ser lido, modificado e salvo.

O TinyXML2 é uma melhoria do TinyXML 1, mas implementação do analisador do TinyXML2 é mais apropriado para uso em [games](https://terminalroot.com.br/tags#games). Ele usa menos memória, é mais rápido e usa muito menos alocações de memória.

---

# Instalando a biblioteca no seu projeto
Eu fiz um fork do projeto original para que o repositório possua menos arquivos e demore menos de você implementar, até porque a biblioteca em si são somente 2 arquivos:o header(`tinyxml2.hpp`) e o source(`tinyxml2.cpp`).
> Na versão original o header é com extensão `.h` eu renomeei para `tinyxml2.hpp`, ou seja, extensão `.hpp` .

Para implementar utilize o [Git](https://terminalroot.com.br/tags#git) para clonar e usar os arquivos `tinyxml2.hpp` e `tinyxml2.cpp` para seu projeto.
{% highlight cpp %}
mkdir meuprojeto
cd meuprojeto
git clone https://github.com/terroo/tinyxml2/
{% endhighlight %}

Nos exemplos abaixo vamos simular um blog em vez de um game que fica mais fácil de entendermos de acordo com artigos .


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

### 1. Fazendo parser de um XML com somente uma tag
Primeiro exemplo de um arquivo XML:
>`primeiro.xml`
{% highlight xml %}
<?xml version="1.0" encoding="UTF-8"?>
<!-- Isso aqui é um comentário e será ignorado pelo TinyXML2-->
<title>Como fazer parser de XML com TinyXML2 C++</title>
{% endhighlight %}

> Arquivo com a função `main()` com o código: `primeiro.cpp`
{% highlight cpp %}
#include <iostream>
#include "tinyxml2/tinyxml2.hpp"

int main(){
  tinyxml2::XMLDocument doc;
  doc.LoadFile("primeiro.xml");
  tinyxml2::XMLElement * p_root_element = doc.RootElement();
  std::cout << p_root_element->GetText() << '\n';
  return 0;
}
{% endhighlight %}
> Compile: `g++ primeiro.cpp tinyxml2/tinyxml2.cpp` e rode: `./a.out`

Possível e provável saída:
{% highlight cpp %}
Como fazer parser de XML com TinyXML2 C++
{% endhighlight %}

Note que o **elemento root**(`*p_root_element`) é o `<title>` .

---

### 2. Fazendo parser de um XML com duas tags em hierarquia
O elemento root agora é a tag `<artigo>`
> `segundo.xml`
{% highlight xml %}
<?xml version="1.0" encoding="UTF-8"?>
<artigo>
  <title>Como fazer parser de XML com TinyXML2 C++</title>
</artigo>
{% endhighlight %}

Consequentemente precisamos criar um [ponteiro](https://terminalroot.com.br/2022/01/entenda-ponteiros-em-c-cpp-e-como-a-memoria-ram-funciona.html) para o elemento root e informar a tag
> `segundo.cpp`
{% highlight cpp %}
#include <iostream>
#include "tinyxml2/tinyxml2.hpp"

int main(){
  tinyxml2::XMLDocument doc;
  doc.LoadFile("segundo.xml");

  tinyxml2::XMLElement * p_root_element = doc.RootElement();
  tinyxml2::XMLElement * p_title = p_root_element->FirstChildElement("title");

  std::cout << p_title->GetText() << '\n';
  return 0;
}
{% endhighlight %}
Possível e provável saída:
{% highlight cpp %}
Como fazer parser de XML com TinyXML2 C++
{% endhighlight %}

Se seu artigo tiver diversos elementos, exemplo:
{% highlight xml %}
<?xml version="1.0" encoding="UTF-8"?>
<artigo>
  <title>Como fazer parser de XML com TinyXML2 C++</title>
  <description>Uma ferramenta simples e funcional para ler os tilemaps dos seus games.</description>
  <date>2022-03-04</date>
  <time>13:40</time>
  <tag>c++</tag>
</artigo>
{% endhighlight %}

Seu código seria assim:
{% highlight cpp %}
#include <iostream>
#include "tinyxml2/tinyxml2.hpp"

int main(){
  tinyxml2::XMLDocument doc;
  doc.LoadFile("segundo.xml");

  tinyxml2::XMLElement * p_root_element = doc.RootElement();
  tinyxml2::XMLElement * p_title = p_root_element->FirstChildElement("title");
  tinyxml2::XMLElement * p_desc = p_root_element->FirstChildElement("description");
  tinyxml2::XMLElement * p_date = p_root_element->FirstChildElement("date");
  tinyxml2::XMLElement * p_time = p_root_element->FirstChildElement("time");
  tinyxml2::XMLElement * p_tag = p_root_element->FirstChildElement("tag");

  std::cout << p_title->GetText() << '\n';
  std::cout << p_desc->GetText() << '\n';
  std::cout << p_date->GetText() << '\n';
  std::cout << p_time->GetText() << '\n';
  std::cout << p_tag->GetText() << '\n';

  return 0;
}
{% endhighlight %}


Se quiser deixar seu código mais *LIKE A BOSS!*, use um `vector`:
{% highlight cpp %}
#include <iostream>
#include <vector>
#include "tinyxml2/tinyxml2.hpp"

int main(){
  tinyxml2::XMLDocument doc;
  doc.LoadFile("segundo.xml");

  std::vector<const char*> elems = {"title", "description", "date", "time", "tag"};

  tinyxml2::XMLElement * p_root_element = doc.RootElement();

  for (std::size_t i{}; i < elems.size(); ++i){
    tinyxml2::XMLElement * ptr = p_root_element->FirstChildElement(elems[i]); 
    std::cout << ptr->GetText() << '\n';
  }

  return EXIT_SUCCESS;
}
{% endhighlight %}

Possível e provável saída:
{% highlight cpp %}
Como fazer parser de XML com TinyXML2 C++
Uma ferramenta simples e funcional para ler os tilemaps dos seus games.
2022-03-04
13:40
c++
{% endhighlight %}
> Se usar `std::string` no seu `vector`, converta o `elems[i]` para `c_str()` assim: `elems[i].c_str()`. 

A partir daqui vamos usar essa sintaxe **LIKE A BOSS!** para os próximos exemplos!


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

### 3. Selecionando diversos artigos
O elemento root agora é o `<blog>`:

> `terceiro.xml`
{% highlight xml %}
<?xml version="1.0" encoding="UTF-8"?>
<blog>
  <artigo>
    <title>Como fazer parser de XML com TinyXML2 C++</title>
    <description>Uma ferramenta simples e funcional para ler os tilemaps dos seus games.</description>
    <date>2022-03-04</date>
    <time>13:40</time>
    <tag>c++</tag>
  </artigo>
  <artigo>
    <title>Conheça os detalhes dos Estilos de Indentação</title>
    <description>O estilo de recuo não é obrigatório na maioria das linguagens de programação.</description>
    <date>2022-02-13</date>
    <time>08:27</time>
    <tag>codigo</tag>
  </artigo>
</blog>
{% endhighlight %}

E o código:
{% highlight cpp %}
#include <iostream>
#include <vector>
#include "tinyxml2/tinyxml2.hpp"

int main(){
  tinyxml2::XMLDocument doc;
  doc.LoadFile("segundo.xml");

  std::vector<const char*> elems = {"title", "description", "date", "time", "tag"};

  tinyxml2::XMLElement * p_root_element = doc.RootElement();
  tinyxml2::XMLElement * p_artigo = p_root_element->FirstChildElement("artigo"); 

  while(p_artigo){
    for (std::size_t i{}; i < elems.size(); ++i){
      tinyxml2::XMLElement * ptr = p_artigo->FirstChildElement(elems[i]); 
      std::cout << elems[i] << ": " << ptr->GetText() << '\n';
      std::cout << ( i == elems.size() - 1 ? "\n" : "");
    }
    p_artigo = p_artigo->NextSiblingElement("artigo");
  }

  return EXIT_SUCCESS;
}
{% endhighlight %}
> Note que o ponteiro `*p_artigo` obtém o primeiro elemento do root e o `*ptr` obtém dele. Para pularmos para o próximo artigo, usamos: `p_artigo = p_artigo->NextSiblingElement("artigo");` dentro e ao final do loop `while` . A condição ternária foi só para separar os artigos.

Possível e provável saída:
{% highlight cpp %}
title: Como fazer parser de XML com TinyXML2 C++
description: Uma ferramenta simples e funcional para ler os tilemaps dos seus games.
date: 2022-03-04
time: 13:40
tag: c++

title: Conheça os detalhes dos Estilos de Indentação
description: O estilo de recuo não é obrigatório na maioria das linguagens de programação.
date: 2022-02-13
time: 08:27
tag: codigo
{% endhighlight %}

---

### 4. Filtrando os dados dentro de um elemento sub root
Imagine se houvesse mais um elemento `<data>` após o root para fazer uma hierarquia mais expressiva, exemplo:
{% highlight xml %}
<?xml version="1.0" encoding="UTF-8"?>
<blog>
  <data>
    <artigo>
      <title>Como fazer parser de XML com TinyXML2 C++</title>
      <description>Uma ferramenta simples e funcional para ler os tilemaps dos seus games.</description>
      <date>2022-03-04</date>
      <time>13:40</time>
      <tag>c++</tag>
    </artigo>

    <artigo>
      <title>Conheça os detalhes dos Estilos de Indentação</title>
      <description>O estilo de recuo não é obrigatório na maioria das linguagens de programação.</description>
      <date>2022-02-13</date>
      <time>08:27</time>
      <tag>codigo</tag>
    </artigo>
  </data>

  <data>
    <artigo>
      <title>Primeiro post da segunda data</title>
      <description>Somente um exemplo de descrição.</description>
      <date>2019-02-11</date>
      <time>00:43</time>
      <tag>c</tag>
    </artigo>

    <artigo>
      <title>Segundo post da segunda data</title>
      <description>Exemplo de descrição 2.</description>
      <date>2021-08-04</date>
      <time>10:05</time>
      <tag>mais</tag>
    </artigo>
  </data>
</blog>
{% endhighlight %}

No código teríamos dois loop `while` e `*p_artigo` agora obteria o `FirstChildElement()` de `*p_data` :

{% highlight cpp %}
#include <iostream>
#include <vector>
#include "tinyxml2/tinyxml2.hpp"

int main(){
  tinyxml2::XMLDocument doc;
  doc.LoadFile("segundo.xml");

  std::vector<const char*> elems = {"title", "description", "date", "time", "tag"};

  tinyxml2::XMLElement * p_root_element = doc.RootElement();
  tinyxml2::XMLElement * p_data = p_root_element->FirstChildElement("data"); 

  while(p_data){
    tinyxml2::XMLElement * p_artigo = p_data->FirstChildElement("artigo"); 
    while(p_artigo){
      for (std::size_t i{}; i < elems.size(); ++i){
        tinyxml2::XMLElement * ptr = p_artigo->FirstChildElement(elems[i]); 
        std::cout << elems[i] << ": " << ptr->GetText() << '\n';
        std::cout << ( i == elems.size() - 1 ? "\n" : "");
      }
      p_artigo = p_artigo->NextSiblingElement("artigo");
    }
    p_data = p_data->NextSiblingElement("data");
  }
  return EXIT_SUCCESS;
}
{% endhighlight %}

Possível e provável saída:
{% highlight cpp %}
title: Como fazer parser de XML com TinyXML2 C++
description: Uma ferramenta simples e funcional para ler os tilemaps dos seus games.
date: 2022-03-04
time: 13:40
tag: c++

title: Conheça os detalhes dos Estilos de Indentação
description: O estilo de recuo não é obrigatório na maioria das linguagens de programação.
date: 2022-02-13
time: 08:27
tag: codigo

title: Primeiro post da segunda data
description: Somente um exemplo de descrição.
date: 2019-02-11
time: 00:43
tag: c

title: Segundo post da segunda data
description: Exemplo de descrição 2.
date: 2021-08-04
time: 10:05
tag: mais

{% endhighlight %}

---

Ainda é possível alterar conteúdos, obter nomes de tags, números de linhas e entre outras funcionalidades. Para uma documentação completa veja [esse link](https://tinyxml2.docsforge.com/) .

# Links úteis
+ <https://leethomason.github.io/tinyxml2/>
+ <https://github.com/leethomason/tinyxml2>
+ <https://tinyxml2.docsforge.com/>
+ <https://github.com/terroo/tinyxml2>
+ <https://www.codingpanel.com/a-complete-guide-to-tinyxml-using-cpp/>



