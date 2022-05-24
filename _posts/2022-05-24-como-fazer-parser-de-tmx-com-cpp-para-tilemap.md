---
layout: post
title: "Como Fazer Parser de .tmx com C++ para TileMap"
date: 2022-05-24 18:05:00
image: '/assets/img/cppdaily/loadtmx.jpg'
description: 'Cansado de utilizar diversas soluções que só me deram dor de cabeça, resolvi escrever um parser de .tmx que funciona da maneira mais simples possível'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
- gamedev
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Cansado de utilizar diversas soluções que só me deram dor de cabeça, resolvi escrever um parser de `.tmx` que funciona da maneira mais simples possível.

Trata-se de somente uma classe que possui uma função-membro estática(para não precisa instanciar) e ele retorna um `vector<vector<int>>` para implementar rapidamente.

A única dependência é o **TinyXML2** que detalharemos mais à frente.

Para mais informações sobre o TinyXML2, veja essa publicação:
## [Como fazer parser de XML com TinyXML2 C++](https://terminalroot.com.br/2022/03/como-fazer-parser-de-xml-com-tinyxml2-cpp.html)

---

# Como utilizar o parser
Para utilizá-lo, você precisa ou instalar o [TinyXML2](https://github.com/leethomason/tinyxml2) ou usá-lo sem instalar [nesse repositório](https://github.com/terroo/tinyxml2) resumido que eu fiz um *fork*.

Só que o mais indicado mesmo é você instalá-lo no seu sistema. Abaixo exemplo de instalação no [Ubuntu](https://terminalroot.com.br/tags#ubuntu) e derivados:

{% highlight sh %}
sudo apt install libtinyxml2-dev
{% endhighlight %}

Agora basta clonar com seu controle de versão preferido, exemplo com [Git](https://terminalroot.com.br/tags#git)

{% highlight sh %}
git clone https://github.com/terroo/loadtmx
{% endhighlight %}
> E copiar o arquivo `loadtmx.hpp` para seu projeto.

Para implementar basta criar um arquivo qualquer, incluir o `loadtmx.hpp` e utilizar ou o `std::vector<std::vector<int>>` ou o `auto`, exemplo:

> `vim main.cpp`
{% highlight cpp %}
#include "loadtmx.hpp"

int main( int argc , char **argv ){
  auto map = LoadTmx::tilemap("file.tmx");
}
{% endhighlight %}

Suponhamos que você possua [esse `.tmx`](https://gist.github.com/terroo/875d1b41a823c35b20c7c3cdb3004753) e deseje fazer o parser de cada número dele:
> Para fazer o download desse exemplo use o *raw* do Gist ou rodar o comando abaixo:
{% highlight sh %}
wget https://cutt.ly/tilemaptmx -O tilemap.tmx
{% endhighlight %}

Agora adicione ele ao seu código e imprima cada posição com um loop `for`:

{% highlight cpp %}
#include "loadtmx.hpp"

int main( int argc , char **argv ){
  auto map = LoadTmx::tilemap("tilemap.tmx");

  for(auto &line : map){
    for(auto &col : line){
      std::cout << col; 
    } 
    std::cout << '\n';
  }
  return 0;
}
{% endhighlight %}

Para compilar rode:
{% highlight sh %}
g++ main.cpp -ltinyxml2
./a.out
{% endhighlight %}
> A possível saída será justamente os números das posições que foram armazenados em `line` e `col`

Se quiser usar um loop clássico, seria:

{% highlight cpp %}
for(std::size_t i{}; i < map.size(); ++i){
  for(std::size_t j{}; j < map[i].size(); ++j){
    std::cout << map[i][j];
  } 
  std::cout << '\n';
}
{% endhighlight %}

Se estiver usando o TinyXML2 local em vez de instalado no seu sistema, compile junto com o arquivo `.cpp` do TinyXML2, exemplo: `g++ main.cpp tinyxml2/tinyxml2.cpp`.

> **Observação**: Ele já inclui o `<iostream>` e `<vector>` por padrão, então incluindo ele você já pode remover qualquer outra utilização dessas bibliotecas no seu código para evitar sobrecarga.

