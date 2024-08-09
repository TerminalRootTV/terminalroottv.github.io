---
layout: post
title: "Como utilizar sf::Vertex em SFML"
date: 2024-08-09 19:43:44
image: '/assets/img/sfml/sf-vertex.png'
description: "🚀 Saber desenhar formas geométricas com código é uma das bases para aprender OpenGL e Vulkan."
icon: 'ion:terminal-sharp'
iconname: 'SFML'
tags:
- sfml
- gamedev
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Futuramente pretendo trazer mais conteúdos sobre [OpenGL](https://terminalroot.com.br/tags#opengl) e [Vulkan](https://terminalroot.com.br/tags#vulkan), no entanto, uma das melhores ferramentas para se "*preparar*" para essas próximas realidades é o [SFML](https://terminalroot.com.br/sfml).

Aliás, [SFML](https://terminalroot.com.br/tags#sfml) também é interessante para entrar no mundo do [desenvolvimento de games e gráficos](https://terminalroot.com.br/games), além de você passar a entender melhor outras bibliotecas, tais como: [SDL2](https://terminalroot.com.br/tags#sdl2), [Raylib](https://terminalroot.com.br/tags#raylib), [Allegro](https://terminalroot.com.br/tags#allegro), além de facilitar também o aprendizado de motores gráficos como: [Godot](https://terminalroot.com.br/tags#godot), [Unity](https://terminalroot.com.br/tags#unity) e entre outros.

E uma das ferramentas interessantes do SFML, para usar, é a `sf::Vertex`.

`sf::Vertex` é uma *classe* (ou mais precisamente, uma `struct`) do SFML que representa um único vértice no espaço 2D e armazena informações como: 
+ posição; 
+ cor; 
+ e coordenadas de textura.


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

## 01. O Básico do básico
Inciando do zero para entender como funciona de verdade o `sf::Vertex`.

+ **1.1.** Isso só mostra o fundo preto, mas note que em `draw` é necessário passar 3 parâmetros, além do `&vertex` como referência, pois ele não é *drawable*.
{% highlight cpp %}
...
sf::Vertex vertex;
...
window.draw(&vertex, 1, sf::Points);
...
{% endhighlight %}
Note que usamos o modelo: `sf::Points`, ele só desenha um único ponto. Existem outros modelos, veremos mais à frente.
> Ele está aparecendo na tela, no entanto, na posição: `0, 0`, ou seja, você não conseguirá notar. 

+ **1.2.** Para notar posicione ele mais para direita e para baixo. Para isso use a *estrutura de união*: `.position`, exemplo:
{% highlight cpp %}
vertex.position = sf::Vector2f(100.f, 100.f);
{% endhighlight %}
> Note que aparecerá um pontinho(1 único vértice) branco na tela!

![Só um ponto](/assets/img/sfml/only-point.png) 

Esse exemplo básico poderia ser substituído usando somente o construtor:
{% highlight cpp %}
sf::Vertex vertex(sf::Vector2f(100.f, 100.f));
{% endhighlight %}

+ **1.3.** Você também pode definir cor para o vertex usando a *estrutura de união* `.color`
{% highlight cpp %}
vertex.color = sf::Color::Red;
// Ou diretamente no construtor:
sf::Vertex vertex(sf::Vector2f(100.f, 100.f), sf::Color::Red);
{% endhighlight %}

+ **1.4.** Você notou que o construtor é sobrecarregado como a maioria das declarações no [SFML](https://terminalroot.com.br/tags#sfml). E há mais um argumento para o construtor que é a *estrutura de união*: `.texCoords`. 
![coordenadas](/assets/img/sfml/textCoords.png) 

Como o próprio nome sugere, ela é usada para definir **coord**enadas para uma possível **tex**tura que você queira "*encaixar*" ao seu vertex. Além de poder passá-la diretamente no construtor, você também pode definir posteriormente:
{% highlight cpp %}
vertex.textCoords = sf::Vector2f(0.f, 0.f);
{% endhighlight %}

Desenhar só um vértice pode até ter alguma utilidade, dependendo do que você está fazendo, mas geralmente não há utilidade na maioria dos casos. No próximo tópico veremos como usar múltiplos vertex(s).

---

## 02. Múltiplos vertex(s)
A forma correta de usar vertex é em conjunto. Nesse exemplo vamos posicionar um em cada ponto de um possível quadrado:
{% highlight cpp %}
sf::Vertex vertex[4] = {
  sf::Vertex(sf::Vector2f(100.f, 100.f), sf::Vector2f(0.f, 0.f)),     // Top-left
  sf::Vertex(sf::Vector2f(200.f, 100.f), sf::Vector2f(100.f, 0.f)),   // Top-right
  sf::Vertex(sf::Vector2f(200.f, 200.f), sf::Vector2f(100.f, 100.f)), // Bottom-right
  sf::Vertex(sf::Vector2f(100.f, 200.f), sf::Vector2f(0.f, 100.f))    // Bottom-left
};
{% endhighlight %}
E agora, como não é um único e sim 4 vertex, nao usamos mais referência para desenhar:
{% highlight cpp %}
window.draw(vertex, 4, sf::Points);
{% endhighlight %}
Vai renderizar assim:

![pontos](/assets/img/sfml/4-vertex.png) 

### Modelos para `sf::Vertex`
Nós usamos e falamos sobre o `sf::Points`, logicamente, ele só desenha pontos, mas existem outros. São eles:
+ `sf::Lines`, ele liga os pontos que estão na mesma linha:

![lines](/assets/img/sfml/sf-lines.png) 

+ `sf::LineStrip`, similar ao `sf::Lines`, mas ele faz uma ligação a mais em uma das verticais:

![LineStrip](/assets/img/sfml/sf-LineStrip.png) 

+ `sf::Quads`, ele preenche(*fill*) o conteúdo tomando os vértices como coordenada:

![Quads](/assets/img/sfml/sf-quads.png) 

+ `sf::Triangles`, similar ao `sf::Quads`, mas é para triângulos, lógico que seu array precisa ter 3 elementos agora: `sf::Vertex vertex[3]`:

![Triangles](/assets/img/sfml/sf-triangles.png) 

+ `sf::TriangleStrip`, voltamos para os 4 elementos para o array, e note que ele preenche, menos um formato de triângulo:

![TriangleStrip](/assets/img/sfml/sf-TriangleStrip.png) 

+ `sf::TriangleFan`, termina no mesmo vértice que inicio gerando um efeito similar ao `sf::Quads` com *fill*:
> Agora tem um vertex com 5 vértices:
{% highlight cpp %}
...
sf::Vertex vertex[5] = {
  sf::Vertex(sf::Vector2f(150, 150)),  // início
  sf::Vertex(sf::Vector2f(100, 100)),
  sf::Vertex(sf::Vector2f(150, 100)),
  sf::Vertex(sf::Vector2f(200, 100)),
  sf::Vertex(sf::Vector2f(150, 150))   // final
};
...
window.draw(vertex, 5, sf::TriangleFan);
...
{% endhighlight %}

![TriangleFan](/assets/img/sfml/sf-TriangleFan.png)

---

## Exemplos

### 01. Desenhando triângulo colorido estilo o exemplo básico do [OpenGL](https://terminalroot.com.br/tags#opengl)
{% highlight cpp %}
...
sf::Vertex vertex[3] = {
  sf::Vertex(sf::Vector2f(400.f, 100.f), sf::Color::Red),    // Topo (vermelho)
  sf::Vertex(sf::Vector2f(300.f, 300.f), sf::Color::Green),  // Esquerda (verde)
  sf::Vertex(sf::Vector2f(500.f, 300.f), sf::Color::Blue)    // Direita (azul)
};
...
window.clear(sf::Color::White);
window.draw(vertex, 3, sf::Triangles);
...
{% endhighlight %}

![Triâgulo colorido](/assets/img/sfml/triangle-colored.png) 


<!-- RECTANGLE LARGE -->
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


### 02. Criando um "*quase*" [C++](https://terminalroot.com.br/tags#cpp)
{% highlight cpp %}
#include <SFML/Graphics.hpp>

int main() {
  sf::RenderWindow window(
    sf::VideoMode(800, 450), 
    "C++ sf::Vertex",
    sf::Style::Titlebar | sf::Style::Close
  );

  sf::Vertex cPlusPlus[15];

  // "C"
  cPlusPlus[0] = sf::Vertex(sf::Vector2f(100.f, 200.f), sf::Color::Blue);     // Superior esquerdo
  cPlusPlus[1] = sf::Vertex(sf::Vector2f(200.f, 200.f), sf::Color::White);    // Superior direito
  cPlusPlus[2] = sf::Vertex(sf::Vector2f(200.f, 250.f), sf::Color::Blue);     // Inferior direito
  cPlusPlus[3] = sf::Vertex(sf::Vector2f(150.f, 250.f), sf::Color::White);    // Meio
  cPlusPlus[4] = sf::Vertex(sf::Vector2f(150.f, 300.f), sf::Color::Blue);     // Inferior direito
  cPlusPlus[5] = sf::Vertex(sf::Vector2f(100.f, 300.f), sf::Color::White);    // Inferior esquerdo
  cPlusPlus[6] = sf::Vertex(sf::Vector2f(100.f, 200.f), sf::Color::Blue);     // Fechando o C

  // 1º "+"
  cPlusPlus[7] = sf::Vertex(sf::Vector2f(250.f, 225.f), sf::Color::Blue);     // Meio esquerdo
  cPlusPlus[8] = sf::Vertex(sf::Vector2f(350.f, 225.f), sf::Color::White);    // Meio direito
  cPlusPlus[9] = sf::Vertex(sf::Vector2f(300.f, 175.f), sf::Color::Blue);     // Superior
  cPlusPlus[10] = sf::Vertex(sf::Vector2f(300.f, 275.f), sf::Color::White);   // Inferior

  // 2º "+"
  cPlusPlus[11] = sf::Vertex(sf::Vector2f(400.f, 225.f), sf::Color::Blue);    // Meio esquerdo
  cPlusPlus[12] = sf::Vertex(sf::Vector2f(500.f, 225.f), sf::Color::White);   // Meio direito
  cPlusPlus[13] = sf::Vertex(sf::Vector2f(450.f, 175.f), sf::Color::Blue);    // Superior
  cPlusPlus[14] = sf::Vertex(sf::Vector2f(450.f, 275.f), sf::Color::White);   // Inferior

  while (window.isOpen()) {
    sf::Event event;
    while (window.pollEvent(event)) {
      if (event.type == sf::Event::Closed)
        window.close();
    }
    window.clear(sf::Color::Black);
    window.draw(cPlusPlus, 7, sf::TriangleFan);
    window.draw(&cPlusPlus[7], 4, sf::Lines);
    window.draw(&cPlusPlus[11], 4, sf::Lines);
    window.display();
  }
  return 0;
}
{% endhighlight %}

![Quase C++](/assets/img/sfml/vertex-cpp.png) 

---

Existe um outro tipo também muito usado que é o `sf::VertexArray` veremos mais sobre ele no próximo artigo.

Para mais informações acesse: <https://www.sfml-dev.org/tutorials/2.5/graphics-vertex-array.php>.

## Aprenda [SFML](https://terminalroot.com.br/games) e crie 5 jogos para [Windows](https://terminalroot.com.br/tags#windows) e [Linux](https://terminalroot.com.br/tags#gnulinux)
### <https://terminalroot.com.br/sfml>


