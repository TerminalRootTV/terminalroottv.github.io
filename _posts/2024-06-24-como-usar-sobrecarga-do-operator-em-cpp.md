---
layout: post
title: "Como usar sobrecarga do operator em C++"
date: 2024-06-24 11:53:31
image: '/assets/img/cppdaily/operator-cpp.jpg'
description: "🏗️ Você pode definir ou redefinir a maneira como os operadores funcionam para tipos de dados definidos pelo usuário."
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Em [C++](https://terminalroot.com.br/tags#cpp), um "`operator`"(operador) é uma função especial que é usada para realizar operações em objetos. 

Os operadores podem ser sobrecarregados, o que significa que você pode definir ou redefinir a maneira como os operadores funcionam para tipos de dados definidos pelo usuário. 

Vamos ver alguns exemplos comuns de operadores e como eles podem ser sobrecarregados em [C++](https://terminalroot.com.br/cpp)!


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

## Operadores Aritméticos
Os operadores aritméticos realizam operações matemáticas básicas.
> Exemplo de Sobrecarga do Operador de Adição (`+`)

{% highlight cpp %}
#include <iostream>

class Complex {
  public:
    float real, imag;

    Complex(float r = 0, float i = 0) : real(r), imag(i) {}

    // Sobrecarga do operador +
    Complex operator + (const Complex& obj) {
      return Complex(real + obj.real, imag + obj.imag);
    }
};

int main() {
  Complex c1(3.0, 4.0), c2(1.0, 2.0);
  Complex c3 = c1 + c2;
  std::cout << "Resultado: " << c3.real << " + " << c3.imag << "i" << std::endl;
  return 0;
}
{% endhighlight %}

---

## Operadores Relacionais
Os operadores relacionais comparam dois valores.
> Exemplo de Sobrecarga do Operador de Igualdade (`==`)

{% highlight cpp %}
#include <iostream>

class Complex {
  public:
    float real, imag;

    Complex(float r = 0, float i = 0) : real(r), imag(i) {}

    // Sobrecarga do operador ==
    bool operator == (const Complex& obj) {
      return (real == obj.real && imag == obj.imag);
    }
};

int main() {
  Complex c1(3.0, 4.0), c2(3.0, 4.0);
  if (c1 == c2) {
    std::cout << "Os números complexos são iguais." << std::endl;
  } else {
    std::cout << "Os números complexos são diferentes." << std::endl;
  }
  return 0;
}
{% endhighlight %}

---

## Operadores de Atribuição
Os operadores de atribuição atribuem um valor a uma variável.
> Exemplo de Sobrecarga do Operador de Atribuição (`=`)

{% highlight cpp %}
#include <iostream>

class Complex {
  public:
    float real, imag;

    Complex(float r = 0, float i = 0) : real(r), imag(i) {}

    // Sobrecarga do operador =
    Complex& operator = (const Complex& obj) {
      if (this != &obj) {
        real = obj.real;
        imag = obj.imag;
      }
      return *this;
    }
};

int main() {
  Complex c1(3.0, 4.0), c2;
  c2 = c1;
  std::cout << "c2: " << c2.real << " + " << c2.imag << "i" << std::endl;
  return 0;
}
{% endhighlight %}


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

---

## Operadores de Inserção e Extração
Os operadores de inserção (`<<`) e extração (`>>`) são usados para entrada e saída de dados.
> Exemplo de Sobrecarga do Operador de Inserção (`<<`)

{% highlight cpp %}
#include <iostream>

class Complex {
  public:
    float real, imag;

    Complex(float r = 0, float i = 0) : real(r), imag(i) {}

    // Sobrecarga do operador <<
    friend std::ostream& operator << (std::ostream& out, const Complex& obj) {
      out << obj.real << " + " << obj.imag << "i";
      return out;
    }
};

int main() {
  Complex c1(3.0, 4.0);
  std::cout << "Número complexo: " << c1 << std::endl;
  return 0;
}
{% endhighlight %}

---

## Operadores Unários
Os operadores unários operam em um único operando.
> Exemplo de Sobrecarga do Operador de Negação (`-`)

{% highlight cpp %}
#include <iostream>

class Complex {
  public:
    float real, imag;

    Complex(float r = 0, float i = 0) : real(r), imag(i) {}

    // Sobrecarga do operador unário -
    Complex operator - () const {
      return Complex(-real, -imag);
    }
};

int main() {
  Complex c1(3.0, 4.0);
  Complex c2 = -c1;
  std::cout << "c2: " << c2.real << " + " << c2.imag << "i" << std::endl;
  return 0;
}
{% endhighlight %}

---

Esses são apenas alguns exemplos de operadores em [C++](https://terminalroot.com.br/tags#cpp) e como eles podem ser sobrecarregados. A sobrecarga de operadores permite que você defina o comportamento dos operadores para tipos de dados personalizados, tornando o código mais intuitivo e legível.

Nós já fizemos um vídeo mostrando como funcionam as sobrecargas de operadores que possuem também outras dicas como: `const type&`, estruturas de união,... Para assistir veja o vídeo abaixo:

<iframe width="1253" height="705" src="https://www.youtube.com/embed/NfymBdyGOss" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

> O código está disponível na postagem aqui no blog: [Como Criar sua própria Classe de Vectores em C++](https://terminalroot.com.br/2022/04/como-criar-sua-propria-classe-de-vectores-em-cpp.html).

---

# Links úteis
+ <https://en.cppreference.com/w/cpp/language/operators>
+ <https://en.wikipedia.org/wiki/Operators_in_C_and_C++>

