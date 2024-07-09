---
layout: post
title: "Por que e como utilizar Classes Aninhadas em C++"
date: 2024-07-09 12:17:34
image: '/assets/img/cppdaily/classes-aninhadas.jpg'
description: "🪺 Mais conhecidas em inglês como: Nested classes."
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Em [C++](https://terminalroot.com.br/tags#cpp) uma classe pode ser declarada dentro do escopo de outra classe, essa prática é conhecida como: "*classes aninhadas*". 

Classes aninhadas são consideradas dentro do escopo da classe envolvente e estão disponíveis para uso dentro desse escopo. Para se referir a uma classe aninhada de um escopo diferente do seu escopo envolvente imediato, você deve usar um nome totalmente qualificado.

---

## Exemplo básico de uso
Veja esse exemplo, onde a class `B` está dentro da classe `A`. Podemos tanto criar o objeto da classe `A` como também criar um objeto da classe `B` utilizado a resolução de escopo da classe `A`.

{% highlight cpp %}
#include <iostream>

class A {
  public:
    class B {
      public:
        B(){}
        void print(){
          std::cout << "Eu sou B\n";
        }
    };
};

int main(){
  A::B b;
  b.print();
}
{% endhighlight %}

Os membros e funções-membro são intercambiáveis entre essas duas classes, e os mesmos podem ser sobrecarregados. Por exemplo, se tivéssemos uma função-membro de mesmo nome e tipo em `A`, eu poderia utilizá-la sem nenhum problema:

{% highlight cpp %}
#include <iostream>

class A {
  public:
    void print(){
      std::cout << "Eu sou A\n";
    }
    class B {
      public:
        B(){}

        void print(){
          std::cout << "Eu sou B\n";
        }
    };
};

int main(){
  A a;
  a.print();
  A::B b;
  b.print();
}
{% endhighlight %}

E lógico, os privilégios de acesso também se mantém, se uma dessas funções-membro fosse `private`, a regra de não acesso se mantém.


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

## Por que usar classes aninhadas?
O principal motivo de usar classes aninhadas é justamente pelo fato de *ocultar* dados, ou seja, sabe aquelas API's públicas que você pode instanciar uma classe através de uma URL? Então, elas fazem uso de classes aninhadas, e lógico, com todas as medidas de proteção de dados também, além de não poluírem o `namespace`.

---

Para mais informações sobre classes aninhadas acesse:
+ <https://en.cppreference.com/w/cpp/language/nested_types>
+ <https://learn.microsoft.com/en-us/cpp/cpp/nested-class-declarations?view=msvc-170>



