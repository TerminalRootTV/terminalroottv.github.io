---
layout: post
title: "As várias 'faces' de const C++"
date: 2024-01-12 18:27:11
image: '/assets/img/cppdaily/const.jpg'
description: "3 regrinhas básicas já dá pra 'pegar' a lógica pra muita coisa!"
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Sim, o [C++](https://terminalroot.com.br/tags#cpp) é grande. Mas, você não precisa saber de tudo para escrever grandes ou bons códigos, principalmente se levarmos em conta o tamanho da [STL](https://en.wikipedia.org/wiki/Standard_Template_Library). No entanto, se você compreender as regras básicas de forma detalhada, todas as outras coisas que irão te levar para um caminho "quase infinito" serão sempre as mesmas regras com especificações intuitivas.

Uma das coisas básicas do [C++](https://terminalroot.com.br/cpp) é o uso da palavra-chave `const`(constante, valor não modificável). Assim como sabemos, ela é imutável/read only, ou seja, uma vez atribuido um valor, a declaração não pode ser modificada.

Mas, existem contextos de uso. Vamos ver "algumas faces" do const C++!

---

# Regra 1
Se declarou, precisa inicializá-la imediatamante! 

Se você fizer isso abaixo:
{% highlight cpp %}
const int x;
{% endhighlight %}

**Por padrão, não compila.** Obterá erro :
> `■ Default initialization of an object of const type 'const int' (fix available)`. 

Se você for muito teimoso, pode usar a flag [-fpermissive](https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-fpermissive) e conseguirá compilar. Não sei porque existe essa `flag`, mas eu aconselho a nunca usá-la.

Se quiser compilar, precisa inicializá-la:
{% highlight cpp %}
const int x = 10;
{% endhighlight %}
> Um valor qualquer inicial precisa ser definido no momento da delaração da constante.


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

# Regra 2
As posições da palavra-chave `const` são intercambiáveis para valores de *não endereços*!

Não há, absolutamente, nenhuma diferença entre as declarações abaixo:
{% highlight cpp %}
const int x = 0;
int const y = 0;
{% endhighlight %}
> A única forma errada é pôr `const` ao final do *lvalue*: ~`int x const = 0;`~.

Mas, essa regra só vale para *não endereços*, pois quando você está declarando [ponteiros](https://terminalroot.com.br/2022/01/entenda-ponteiros-em-c-cpp-e-como-a-memoria-ram-funciona.html), a posição tem resultados diferentes, Ou seja:

1º. Isso:
{% highlight cpp %}
const int * x = &value1;
{% endhighlight %}

2º. É diferente de:
{% highlight cpp %}
int * const y = &value1;
{% endhighlight %}

No primeiro, você **NÃO** consegue modificar o ENDEREÇO que ponteiro está associando:
{% highlight cpp %}
*x = &value2;     ■ Read-only variable is not assignable
{% endhighlight %}
> Mas, consegue modificar o VALOR que o ponteiro está apontando: `x = &value2;`. E lembre-se que endereços são diferentes de valores, logo, isso: `x = value2;`, sem o sinal de (des)referência(`&`), independente de `const`, é outro tipo de erro: **Erro de lógica!**

Para o segundo caso, é o inverso das explicações do primeiro!

Você ainda pode combinar(usar duas vezes) a palavra-chave `const` na mesma declaração, ou seja, tornar tanto o endereço quanto o valor imutáveis:
{% highlight cpp %}
const int * const z = &value1;
{% endhighlight %}
> Com isso, nenhuma outra modificação, seja do valor ou do endereço, não funcionará.

---

# Regra 3
Usar a palavra-chave `const` ao final da declaração de uma **FUNÇÃO-MEMBRO**(destaquei, pois isso não funciona em funções não-membros), você só não pode modificar algum outro membro de uma classe. Exemplo:

{% highlight cpp %}
class MyClass {
  std::string m_str;
  public:
    void member() const {
      this->m_str = "Hello"; ■ No viable overloaded '='
    }
};
{% endhighlight %}
> Isso não compila!

A menos que você use `const` no início:
{% highlight cpp %}
class MyClass {
  std::string m_str;
  public:
    const void member() {
      this->m_str = "Hello";
    }
};
{% endhighlight %}

Ou use outra palavra-chave: `mutable` para o membro da classe:
{% highlight cpp %}
class MyClass {
  mutable std::string m_str;
  public:
    void member() const {
      this->m_str = "Hello";
    }
};
{% endhighlight %}
> As palavra-chave: `mutable` e `const` não podem ser misturadas, por uma questão lógica!

Uma vez um inscrito no [Curso de C++ Moderno](https://terminalroot.com.br/cpp) me questionou o "porque" de conseguir modificar uma variável que recebe o valor retornado de uma função(membro ou não-membro):
{% highlight cpp %}
const int myFunction(const int& z){
  return z + 2;
}

int main(){
  int myVar = myFunction(9);
  myVar = 3;
}
{% endhighlight %}
Parece meio sem sentido, mas a tarefa de `const` nesse caso só tem haver com "não modificações" em tempo de execução. Bom, isso realmente soa estranho e pode confundir bastante, seria mais um tipo de "estilo" de escrita!

No entanto, as regras para os parâmetros passados para funcões: `int myFunction(const int a)`(constante `a`, nesse caso), são as mesmas se não fossem parâmetro de função. 

---

# Conclusão
Pode ser "muita coisa" pra uns e "pouca coisa" para outros. Mas, essas 3 regrinhas básicas servem para *constextualizar* que posições e locais de utilização no C++, pode ou não influenciar no resultado final.

Caso queira se aprofundar ainda mais, sugiro os links abaixo:
+ <https://en.cppreference.com/w/cpp/language/cv>
+ <https://learn.microsoft.com/pt-br/cpp/cpp/const-cpp?view=msvc-170>
+ <https://en.cppreference.com/w/cpp/language/member_functions#Member_functions_with_cv-qualifiers>

<!--
https://www.youtube.com/watch?v=ntTX7VZrLNQ&ab_channel=LogicalProgrammer
https://www.youtube.com/watch?v=8a3HyL1VN0Q
https://www.youtube.com/results?search_query=const+c%2B%2B
https://stackoverflow.com/questions/16449889/why-using-the-const-keyword-before-and-after-method-or-function-name
-->

