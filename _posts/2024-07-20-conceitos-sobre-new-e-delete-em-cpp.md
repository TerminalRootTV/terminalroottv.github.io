---
layout: post
title: "Conceitos sobre new e delete em C++"
date: 2024-07-20 15:15:48
image: '/assets/img/cppdaily/class-new-cpp.jpg'
description: "⚪ Não são mais recomendados usar, mas é importante entendê⁻los!"
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Qual a diferença de usar assim?
> Sem o `new`.
{% highlight cpp %}
Base * base;
{% endhighlight %}

E assim?
> Com o `new`, mas **SEM** parênteses em `Base`.
{% highlight cpp %}
Base * base = new Base;
{% endhighlight %}

Ou assim?
> Com o `new`, mas **COM** parênteses em `Base`.
{% highlight cpp %}
Base * base = new Base();
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

## Conceitos iniciais
Primeiramente, a diferença entre **usar** `new` e `delete` e **não usar** envolve a alocação dinâmica de memória versus a [alocação automática](https://terminalroot.com.br/2022/08/entenda-ponteiros-inteligentes-em-cpp-smart-pointers.html) (ou alocação estática se for variável global ou membro de uma classe).

Quando você usa `new`, está alocando memória dinamicamente no *heap*, e quando usa `delete`, está liberando essa memória. 

Ou seja, o programador é responsável pela alocação e liberação da memória. Isso permite um controle mais fino sobre o tempo de vida do objeto, isso é mais indicado para aplicações de tempo real, onde a alocação automática pode influenciar significativamente no desempenho.

No entanto, dependendo das *habilidades* do programador, isso pode ser classificado como comportamento de risco, onde facilta o programador esquecer de desalocar e gerar problemas futuros de espaço na memória.

O ideal não é *deletar* somente no *destrutor*, mas sim logo após usar e saber que não irá mais usar membros ou funções-membro do objeto alocado.

{% highlight bash %}
// Má ideia
Base * base1 = new Base();
base1->call();

Base * base2 = new Base();
base2->call();

delete base1;
delete base2;
{% endhighlight %}

{% highlight bash %}
// Boa ideia
Base * base1 = new Base();
base1->call();
delete base1;

Base * base2 = new Base();
base2->call();
delete base2;
{% endhighlight %}

Não usar ponteiros, faz a alocação na *Stack*, exemplo:
{% highlight bash %}
Base base;
{% endhighlight %}

---

## Diferença entre modos de aplicação
Em [C++](https://terminalroot.com.br/tags#cpp), o uso de parênteses na expressão `new Base()` ou `new Base` ao alocar um objeto dinamicamente tem algumas sutilezas, especialmente em relação ao que é chamado de *value initialization* e *default initialization*.

### Sem parênteses
{% highlight cpp %}
Base* base = new Base;
{% endhighlight %}
Esta expressão realiza a *default initialization* do objeto `Base`, ela se comporta de maneira diferente dependendo do contexto da classe `Base`. 

Se `Base` é uma classe com um construtor definido pelo usuário, o construtor é chamado. Se Base é uma classe sem um construtor definido pelo usuário, os membros não triviais da classe não são inicializados.

---

### Com parênteses
{% highlight cpp %}
Base* base = new Base();
{% endhighlight %}
Esta expressão realiza a *value initialization* do objeto `Base`, ela também se comporta de maneira diferente dependendo do contexto da classe Base.

Se `Base` tem um construtor definido pelo usuário, o construtor é chamado. Se Base não tem um construtor definido pelo usuário, todos os membros são inicializados para seus valores padrão (`0` para tipos fundamentais, `nullptr` para ponteiros, etc.). 

---

### Exemplos
{% highlight cpp %}
#include <iostream>

class Base{
  public:
    int x;
    Base(){
      std::cout << "Construtor foi chamado!\n";
    }
};

int main(){
  Base * base1 = new Base; // O valor de x pode sair com dados incorretos ou nullptr
  std::cout << "O valor de x é: " << base1->x << '\n';
  delete base1;

  Base * base2 = new Base(); // O valor de x será 0(zero)
  std::cout << "O valor de x é: " << base2->x << '\n';
  delete base2;
}
{% endhighlight %}

Dependendo do seu sistema operacional e/ou versão do seu compilador, em ambos os casos podem aparecer `0`(zero), mas em outros casos de usuários que usarão seu software, correm risco de dados errôneos.


Usar assim: `Base * base;`(sem `new`), logicamente haverá uma `Falha de segmentação` ao tentar imprimir o `x`.


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

## Conclusão
O ideal mesmo é usar [smart pointeirs](https://terminalroot.com.br/2022/08/entenda-ponteiros-inteligentes-em-cpp-smart-pointers.html), mas caso esteja desenvolvendo uma aplicação de tempo real e o desempenho estiver comprometido, prefira usar **COM PARÊNTESES**: `Base * base = new Base();`.


