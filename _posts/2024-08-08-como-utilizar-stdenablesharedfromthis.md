---
layout: post
title: "Como utilizar std::enable_shared_from_this"
date: 2024-08-08 11:33:02
image: '/assets/img/cppdaily/shared_from_this.png'
description: "⚪ Juntamente com a função de retorno: shared_from_this();"
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

`std::enable_shared_from_this` é uma funcionalidade em [C++](https://terminalroot.com.br/tags#cpp), adicionada a partir do **C++11**, que permite a uma classe criar *instâncias* compartilhadas [`shared_ptr`](https://terminalroot.com.br/2022/08/entenda-ponteiros-inteligentes-em-cpp-smart-pointers.html) dela mesma. 

Esse mecanismo é útil quando você precisa criar um `shared_ptr` dentro de um método da própria classe, especialmente para evitar duplicação e manter a contagem de referências correta.


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

## Utilização
Antes de mais nada sua classe precisa **herdar publicamente**(`std::enable_shared_from_this<T>`) para o tipo da sua classe, exemplo:

{% highlight cpp %}
class MyClass : public std::enable_shared_from_this<MyClass> {
{% endhighlight %}

A função-membro dessa classe que possui tipo de retorno: `shared_ptr` não mais retornará `*this` e sim `shared_from_this()`, exemplo:
+ O uso de `*this` não é adequado, pois não incrementa a contagem de referências do `shared_ptr`; 
+ O uso de `*this` pode levar a problemas de gerenciamento de memória e possíveis *dangling pointers*(ou *wild pointers*, não apontam para locais adequados);
+ O uso de `*this` é somente adequado para ponteiros brutos e referências.

{% highlight cpp %}
// Péssima ideia
std::shared_ptr<MyClass> set_info() {
  return *this;
}

// Boa ideia
std::shared_ptr<MyClass> set_info() {
  return shared_from_this();
}
{% endhighlight %}

---

## Exemplos
Suponhamos que você possui esse código que soma e incrementa membros de uma classe, assim como vimos [nesse vídeo](https://youtu.be/NfymBdyGOss):

{% highlight cpp %}
#include <iostream>

template<class T>
class Vector2 {
  public:
    T x, y;
    Vector2(T xin, T yin) : x(xin), y(yin){}

    Vector2 operator + (const Vector2& rhs){
      return Vector2(x + rhs.x, y + rhs.y);
    }

    Vector2 & increment(int number){
      x += number;
      y += number;
      return *this;
    }

    void print(){
      std::cout << x << " e " << y << '\n';
    }
};

int main (){
  Vector2 v1(1, 2), v2(3, 4);
  Vector2 v3 = v1 + v2;
  std::cout << "v3.x: " << v3.x << '\n'; // 4
  std::cout << "v3.y: " << v3.y << '\n'; // 6
  // Ou somente:
  v3.print(); // 4 e 6
  v3.increment(5);
  v3.print(); // 9 e 11

  return 0;
}
{% endhighlight %}
Note que a class `Vector2` possui uma função-membro: `increment` que é uma referência para ela mesma e retorna um `*this`!

Traduzindo esse código para uso de `std::enable_shared_from_this`, ficaria assim:

{% highlight cpp %}
#include <iostream>
#include <memory>

template<class T>
class Vector2 : public std::enable_shared_from_this<Vector2<T>> {
public:
    T x, y;
    Vector2(T xin, T yin) : x(xin), y(yin) {}

    Vector2 operator + (const Vector2& rhs) {
        return Vector2(x + rhs.x, y + rhs.y);
    }

    std::shared_ptr<Vector2> increment(int number) {
        x += number;
        y += number;
        return this->shared_from_this();
    }

    void print() {
        std::cout << x << " e " << y << '\n';
    }
};

int main() {
    auto v1 = std::make_shared<Vector2<int>>(1, 2);
    auto v2 = std::make_shared<Vector2<int>>(3, 4);
    Vector2<int> v3 = *v1 + *v2;
    std::cout << "v3.x: " << v3.x << '\n'; // 4
    std::cout << "v3.y: " << v3.y << '\n'; // 6
    // Ou somente:
    v3.print(); // 4 e 6

    auto v3_ptr = std::make_shared<Vector2<int>>(v3);
    v3_ptr->increment(5);
    v3_ptr->print(); // 9 e 11

    return 0;
}
{% endhighlight %}
Note que herdamos publicamente: `std::enable_shared_from_this` e o tipo de `increment` agora é `std::shared_ptr` e retorna: `shared_from_this()`.

A partir desse código temos gerenciamento automático de referências e podemos até contá-las, exemplo:

{% highlight cpp %}
std::cout << "Qtd de referências(qts vezes instanciamos/criamos objeto/ponteiro) para v1: " 
  <<  v1.use_count() << '\n'; // 1

std::cout << "Qtd de referências(qts vezes instanciamos/criamos objeto/ponteiro) para v2: " 
  <<  v2.use_count() << '\n'; // 1

std::cout << "Qtd de referências(qts vezes instanciamos/criamos objeto/ponteiro) para v3_ptr: " 
  <<  v3_ptr.use_count() << '\n'; // 1
{% endhighlight %}

Muito mais moderno e *like a boss*!

Para mais informações acesse os links abaixo!

---

## Links úteis
+ <https://en.cppreference.com/w/cpp/memory/enable_shared_from_this>
+ <https://embeddedartistry.com/blog/2017/01/11/stdshared_ptr-and-shared_from_this/>
+ <https://en.wikipedia.org/wiki/Dangling_pointer>
+ <https://stackoverflow.com/questions/18565167/non-const-lvalue-references-cannot-be-bound-to-an-lvalue-of-different-type>
+ <https://www.google.com/search?q=%E2%96%A0+Non-const+lvalue+reference+to+type+cannot+bind+to+a+temporary+of+type+%27shared_ptr%3CT%3E%27>

