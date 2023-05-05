---
layout: post
title: "Como Usar std::function em C++"
date: 2023-05-05 09:43:04
image: '/assets/img/cpp/function.jpg'
description: 'Um wrapper de função polimórfica de uso geral.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

O modelo de classe `std::function` é um wrapper de função polimórfica de uso geral. Instâncias de `std::function` podem armazenar, copiar e invocar qualquer destino: expressões [lambda]() , expressões de ligação ou outros objetos de função, bem como ponteiros para funções de membro e ponteiros para membros de dados.

`std::function` é um tipo de objeto de eliminação. Isso significa que ele apaga os detalhes de como algumas operações acontecem e fornece uma interface de tempo de execução uniforme para elas.

---

# Utilização
Para usar `std::function` é necessário incluir o cabeçalho: `<functional>`. 

## Exemplo 01
O uso mais básico seria o exemplo abaixo:
> Nesse caso ela armazena a função `quadrado` sem precisar informar os parâmetros, nesse caso ela recebe um `int` dentro dos *parênteses* e retorna um `int` dentro dos `colchetes angulares`.

{% highlight cpp %}
#include <iostream>
#include <functional>

int quadrado(int x){
  return x * x;
}

int main(){
  std::function<int(int)> fn = quadrado;
  std::cout << fn(3) << '\n';
}
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

## Exemplo 02
Nesse caso ela armazena dois `int` e retorna um `double`:

{% highlight cpp %}
#include <iostream>
#include <functional>

int soma(int x, int y){
  return x + y;
}

int main(){
  std::function<double(int, int)> fn = soma;
  std::cout << fn(6, 9) << '\n';
}
{% endhighlight %}

---

## Exemplo 03
Similar ao acima, mas agora ela é um ponteiro de função para o endereço de `&soma`:

{% highlight cpp %}
#include <iostream>
#include <functional>

int soma(int x, int y){
  return x + y;
}

int main(){
  std::function<double(int, int)> fn = &soma;
  std::cout << fn(6, 9) << '\n';
}
{% endhighlight %}

---

## Exemplo 04
No cabeçalho `<functional>` também está disponível `std::negate`, nesse caso, usando `std::negate` ela inverte o valor da saída:

{% highlight cpp %}
#include <iostream>
#include <functional>

int main(){
  std::function<int(int)> fn = std::negate<int>();
  std::cout << fn(42) << '\n';
}
{% endhighlight %}
> Saída: `-42`.

---

## Exemplo 05
Ela também pode ser usada em conjunto com [lambda](), dessa forma a assinatura dela torna possível identificar a lambda:

{% highlight cpp %}
#include <iostream>
#include <functional>

int main(){
  std::function<int(int)> fn = [&](int x){ 
    return x * 2; 
  };
  std::cout << fn(9) << '\n';
}
{% endhighlight %}

---

Ou seja, é mais um recurso da STL que pode ser útil em diversos casos em que o desempenho é fundamental, mas o debug também. Para mais informações [veja nesse link](https://en.cppreference.com/w/cpp/utility/functional/function).

