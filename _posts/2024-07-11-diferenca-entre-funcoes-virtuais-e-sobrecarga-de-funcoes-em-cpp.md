---
layout: post
title: "Diferença entre Funções Virtuais e Sobrecarga de funções em C++"
date: 2024-07-11 11:48:35
image: '/assets/img/cppdaily/virtuais-vs-sobrecargas.jpg'
description: "🗞️ O conceito pode atrapalhar o entendimento de alguns."
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Um dos inscritos do [Curso de C++ Moderno](https://terminalroot.com.br/cpp) questionou a diferença entre **Funções-membro Virtuais** e **Sobrecarga de Funções**. Eu respondi, no entanto, os recursos para ilustrar a explicação são meio limitados lá na [Udemy](https://cutt.ly/CppAvancado). Como são dois assuntos distintos, infelizmente não fiz um vídeo que compara os dois casos.

Acabei enviando alguns links, mas além de não ser em Português, os exemplos de muitos endereços não são tão bons assim. Então, eu preferi criar esse artigo com meus próprios exemplos e ficar mais fácil de entender!

Funções virtuais em [C++](https://terminalroot.com.br/cpp) são <u>funções membro de uma classe base</u> que podem ser substituídas (`overridde`n) por funções membro de uma classe derivada. 

Elas são declaradas usando a palavra-chave `virtual` na classe base. 

O principal objetivo das funções virtuais é permitir o polimorfismo em tempo de execução, ou seja, permitir que a chamada a uma função membro seja resolvida em tempo de execução com base no tipo do objeto para o qual a função está sendo chamada, e não no tipo da referência ou ponteiro que está sendo usado para acessar o objeto.

Aqui estão alguns exemplos para ilustrar o conceito de funções virtuais:

**Observação**: Funções-membro virtuais **NÃO FUNCIONA COM TEMPLATE**, e lógico, só funcionam em Programação Orientada a Objetos!


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

## Exemplo Básico de Funções Virtuais
Veja nesse exemplo que a classe `Derivada` herda os membros `public`(e se houvessem, os `protected` também) da classe `Base`.

Note que ambas possuem a **função-membro**: `void show()`, e mesmo usando [ponteiros](https://terminalroot.com.br/2022/01/entenda-ponteiros-em-c-cpp-e-como-a-memoria-ram-funciona.html)(tanto faz ser ou não [smart pointers](https://terminalroot.com.br/2022/08/entenda-ponteiros-inteligentes-em-cpp-smart-pointers.html), é a mesma coisa) para criar o objeto, ao chamar `show()`, o conteúdo da `Base` é que é exibido:

{% highlight cpp %}
#include <iostream>

class Base {
  public:
    void show() {
      std::cout << "Eu sou o show() da classe Base.\n";
    }
    // Destrutor para permitir a limpeza adequada de objetos derivados
    ~Base() = default;
};

class Derivada : public Base {
  public:
    void show() {
      std::cout << "AGORA SIM! Eu sou o show() da classe Derivada.\n";
    }
};

int main() {
  Base * base;
  Derivada derivada;
  base = &derivada;

  // A função show() da classe Derivada é chamada, embora o ponteiro seja de tipo Base*
  base->show();

  return 0;
}
{% endhighlight %}
Saída após compilar e rodar `g++ nao-virtual.cpp && ./a.out`:
{% highlight bash %}
Eu sou o show() da classe Base.
{% endhighlight %}

Para conseguirmos exibir o `show()` da `Derivada`, bastava declararmos a `show()` da `Base` como `virtual`, mas para sabermos que estamos sobreescrvendo uma função-membro virtual, o correto é também declararmos o `show()` da `Derivada` com a palavra-chave `overridde`, ou seja, nosso código ficaria assim:

**OBSERVAÇÃO**: Somente nos casos em que o objeto é criado com ponteiros, como foi dito acima!

{% highlight cpp %}
#include <iostream>

class Base {
  public:
    virtual void show() {
      std::cout << "Eu sou o show() da classe Base.\n";
    }
    // Destrutor para permitir a limpeza adequada de objetos derivados
    ~Base() = default;
};

class Derivada : public Base {
  public:
    void show() override {
      std::cout << "AGORA SIM! Eu sou o show() da classe Derivada.\n";
    }
};

int main() {
  Base * base;
  Derivada derivada;
  base = &derivada;

  // A função show() da classe Derived é chamada, embora o ponteiro seja de tipo Base*
  base->show();

  return 0;
}
{% endhighlight %}
Agora sim, a saída após compilar e rodar `g++ nao-virtual.cpp && ./a.out` será o `show()` da `Derivada`:
{% highlight bash %}
AGORA SIM! Eu sou o show() da classe Derivada.
{% endhighlight %}

Esse conceito também é muito utilizado como **Destrutores virtuais**, ou seja, para seu software não ficar chamando vários Destrutores recursivamente. Por isso note que eu declarei: `~Base() = default`, mas se tivéssemos declarando como: `virtual ~Base();`, o destrutor da `Derivada`, se houvesse, prevaleceria!
> Isso é importante também para evitar *vazamentos de memória* e outros problemas relacionados à *limpeza adequada dos recursos*, principalmente em casos de múltiplas hieraquias de classes, ex,: `class Shape(); → class RectangleShape(); → class SquareShape();`.

Funções virtuais são um mecanismo fundamental para o polimorfismo em C++ e permitem que você escreva código mais flexível e extensível.

---

## Sobrecarga de funções
Um outro conceito em [C++](https://terminalroot.com.br/tags#cpp) é **Sobrecarga de funções**, que em resumo é: "Usar funções de mesmo nome, mas com tipos parâmetros diferentes, mas só diferença de tipo de retorno, não!".

Exemplo, note que abaixo temos as funções `show()` de mesmo nome mas tipos de parâmetros diferentes:
{% highlight cpp %}
#include <iostream>

void show(){
  std::cout << "void sem parâmetros\n";
}

void show(const std::string& str){
  std::cout << "str é: " << str << '\n';
}

std::string show(const std::string& str, int c){
  return str;
}

int main() {
  void();
  void("Oi.");
  std::cout << show("Olá!", 1) << '\n';
}
{% endhighlight %}
Isso compila e roda!

No entanto se tivéssemos essa função:
{% highlight cpp %}
void show(const std::string& str, int c){  // ■ Functions that differ only in their return type cannot be overloaded
  std::cout << "message" << '\n';
}
{% endhighlight %}
Não compilará, pois apesar de ter um **tipo de retorno** diferente: `void`, ela possui os mesmos argumentos que uma função que já existe que é a : `std::string show(const std::string& str, int c);`.

Isso funciona também para funções-membro em Programação Orientada a Objetos!

---

Note que **Funções Virtuais** é TOTALMENTE diferente de **Sobrecarga de funções**. Talvez a similaridade que alguns podem ver é o fato de usar mesmo nome de funções.

Espero ter ajudado! E em um futuro próximo pretendo alterar e adicionar vários vezes dos [Cursos de C++](https://terminalroot.com.br/cpp), com exemplos ainda melhores!


