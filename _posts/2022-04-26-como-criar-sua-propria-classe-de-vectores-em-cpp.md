---
layout: post
title: "Como Criar sua própria Classe de Vectores em C++"
date: 2022-04-26 08:50:46
image: '/assets/img/gamedev/vector2.jpg'
description: 'Nesse vídeo reforçaremos nosso conhecimento em POO além de como criar seu próprio std::cout além de outras dicas.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
- gamedev
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

🔊 Nesse vídeo veremos como criar nossa própria classe de vectores similar à do [SFML](https://terminalroot.com.br/games) que servirá para reforçarmos nosso conhecimento em **Programação Orientada à Objetos** bem como diminuir o excesso de código ganhando desempenho nas nossas aplicações. Além de "*recriação*" do `std::cout`, estruturas de união e entre outras  dicas.

+ ✅ Aprenda Desenvolvimento de Games: <https://terminalroot.com.br/games>
+ ✅ Aprenda C++ e Qt: <https://terminalroot.com.br/cpp>

### 🎁 Pacote Promocional C++: <https://terminalroot.com.br/promo>

## Assista ao Vídeo

<iframe width="1253" height="705" src="https://www.youtube.com/embed/NfymBdyGOss" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

## Código feito no vídeo
```cpp
#include <iostream>
#include <fstream>

template<class T>
class Vector2 {
  public:
    T x, y;
    Vector2(T xin, T yin) : x(xin), y(yin){}

    Vector2 operator + (const Vector2& rhs){
      return Vector2(x + rhs.x, y + rhs.y);
    }

    Vector2 operator - (const Vector2& rhs){
      return Vector2(x + rhs.x, y + rhs.y);
    }

    Vector2 operator * (const Vector2& rhs){
      return Vector2(x + rhs.x, y + rhs.y);
    }

    Vector2 operator / (const Vector2& rhs){
      return Vector2(x + rhs.x, y + rhs.y);
    }

    Vector2 operator -= (const Vector2& rhs){
      return Vector2(x + rhs.x, y + rhs.y);
    }

    Vector2 operator *= (const Vector2& rhs){
      return Vector2(x + rhs.x, y + rhs.y);
    }

    Vector2 operator /= (const Vector2& rhs){
      return Vector2(x + rhs.x, y + rhs.y);
    }

    void print(){
      std::cout << x << " " << y << '\n';
    }

    /*void increment(int number){
      x += number;
      y += number;
    }*/

    Vector2 & increment(int number){
      x += number;
      y += number;
      return *this;
    }

    friend std::ostream & operator << (
        std::ostream & stream, const Vector2 & v){
      return stream << v.x << " " << v.y;
    }
};

using Vector2f = Vector2<float>;
using Vector2i = Vector2<int>;
using Vector2u = Vector2<unsigned>;

int main(){
  Vector2 v1(1, 2), v2(3, 4);

  Vector2f v1f(1.2f, 2.1f), v2f(3.4f, 4.3f);
  Vector2i v1i(1, 2), v2i(3, 4);
  Vector2u v1u(1, 2), v2u(3, 4);

  Vector2 v3 = v1 + v2;

  std::cout << "v3.x: " << v3.x << '\n';
  std::cout << "v3.y: " << v3.y << '\n';
  v3.print();

  v3.increment(10)
    .increment(5)
    .increment(2);

  std::cout << v1 << '\n';

  return 0;
}
```

---

## 👀 Veja também:
+ 🔗 [Aprenda a Criar 5 Games com C++ e SFML](https://cutt.ly/8Fn0uno)
+ 🔗 [Crie facilmente Tabelas no Terminal com C++](https://cutt.ly/oFTmbMZ)
+ 🔗 [Baixe de graça 5 Tilesets para seus games](https://cutt.ly/0FM6aYS)
+ 🔗 [Desenhe fórmulas matemáticas em ASCII via linha de comando](https://terminalroot.com.br/2022/04/desenhe-formulas-matematica-em-ascii-via-linha-de-comando.html)
+ 🔗 [Baixe de graça 5 modelos de Menus para seus Games](https://terminalroot.com.br/2022/04/baixe-de-graca-5-modelos-de-menus-para-seus-games.html)
