---
layout: post
title: "Entenda como std::stack funciona em C++"
date: 2022-08-01 10:59:11
image: '/assets/img/cppdaily/stack.jpg'
description: 'Para incrementar seu código com ferramentas adequadas!'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

A `std::stack` é uma classe da biblioteca de contêineres(que há várias classes) implementada como `template` .

Em inglês stack significa: pilha, e é justamente isso que ela faz ela armazena os dados de forma empilhados .

Ou seja, uma pilha tem a estrutura de dados **LIFO**(**L**ast-**I**n, **F**irst-**O**ut), em português: "o último à entrar será o primeiro a sair".

Uma *pilha* é diferente de uma *lista*, a pilha tem a ideia conforme uma "*pilha de pratos*", se você EMPILHAR os pratos e tentar tirar o primeiro(que está no final da pilha, lá em baixo!), todos os de cima caem! Na lista não, você pode tirar de qualquer posição dependendo do subconjunto do tipo de lista que você criar na estruturação dos dados .

Logo, na pilha, você só pode remover o último elemento que você adicionou.

Algumas funções membro da `std::stack` são similares ou implementadas a partir de outras classes da biblioteca Conteiners, tais como:
+ `push()`
+ `pop()`
+ `empty()`

E entre outras.

Vamos ver como utilizá-las!

---

## Utilização e implementação
Para utilizar a `std::stack` você precisa primeiramente adicionar a biblioteca `<stack>`:
{% highlight cpp %}
#include <stack>
{% endhighlight %}

Declare a stack:
{% highlight cpp %}
std::stack<int> pilha;
{% endhighlight %}

Adicione itens/elementos à stack:
{% highlight cpp %}
pilha.push( 2 );
pilha.push( 4 );
pilha.push( 12 );
{% endhighlight %}

Saber quem está no topo da pilha, o último a ser adicionado:
{% highlight cpp %}
std::cout << pilha.top() << '\n';
{% endhighlight %}

Para deletar o último elemento(o do topo)
{% highlight cpp %}
pilha.pop();
std::cout << pilha.top() << '\n';
{% endhighlight %}

Verificar se está vazia, remover e imprimir:
{% highlight cpp %}
while( true ){
  if( !pilha.empty() ){
    std::cout << pilha.top() << '\n';
    pilha.pop();
  }else{
    std::cout << "A pilha está vazia!" << '\n';
    break;
  }
}
{% endhighlight %}

O código completo:
{% highlight cpp %}
#include <iostream>
#include <stack> 

int main( int argc , char **argv ){
  std::stack<int> pilha;

  pilha.push( 2 );
  pilha.push( 4 );
  pilha.push( 12 );

  pilha.pop();
  std::cout << pilha.top() << '\n';

  pilha.push( 11 );
  pilha.push( 13 );
  pilha.push( 17 );
  pilha.push( 8 );

  while( true ){
    if( !pilha.empty() ){
      std::cout << pilha.top() << '\n';
      pilha.pop();
    }else{
      std::cout << "A pilha está vazia!" << '\n';
      break;
    }
  }

  return 0;
}
{% endhighlight %}

Para mais dicas informações sobre `std::stack` acesse [aqui](https://en.cppreference.com/w/cpp/container/stack) .

