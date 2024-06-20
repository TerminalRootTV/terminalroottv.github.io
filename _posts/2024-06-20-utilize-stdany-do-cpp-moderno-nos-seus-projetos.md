---
layout: post
title: "Utilize std::any do C++ Moderno nos seus projetos"
date: 2024-06-20 19:14:17
image: '/assets/img/cppdaily/std-any.jpg'
description: "🕳️ Dê adeus de uma vez por todas ao `void*`."
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

`std::any` é um recurso da biblioteca padrão C++ que foi introduzido no [C++17](https://terminalroot.com.br/tags#cppdaily). 

Este componente pertence ao conjunto de classes de contêineres com segurança de tipo, fornecendo um meio seguro para armazenar e manipular valores de qualquer tipo. 

Ele é especialmente útil quando você precisa lidar com situações em que o tipo da variável pode(pleonasmo): variar! 😃 

Aí você diz:
#### — Ah, cara! De boa. Para esses casos eu uso o `void *`.

Sim, realmente você tem razão, mas você já viu como a nova geração está em relação a *segurança de memória* ???
> Lembrando que o termo *segurança* é usado em Português, pois não existe uma palavra que se adeque a tradução para `Safe`, ou seja: `Safe` **≠** `Seguro`)! 😛 

Sem dizer que `void *` é realmente perigoso!

Se você fizer isso, funciona:
{% highlight cpp %}
void * some_data; // Péssima ideia

std::string str = "Oi";
int x = 3;
decltype(x) y = 6;

some_data = &str;
std::cout << *(std::string*)some_data << '\n';

some_data = &x;
std::cout << *(int*)some_data << '\n';

some_data = &y;
std::cout << "Tipo de y: " << typeid(y).name() << '\n'; // include typeinfo
{% endhighlight %}

Mas, a chance de isso dar `mer%$a` é grande! Ao final do uso dessas variáveis, `some_data` vai continuar existindo, ou seja, tempo de vida indefinido!

E é para subsitituir o `void*` que o `std::any` foi criado no C++ Moderno que, com certeza, é totalmente **Safe**!

Em outras palavras, ele é um *wrapper* que encapsula sua variável para um `shared_ptr`([ponteiros inteligentes](https://terminalroot.com.br/2022/08/entenda-ponteiros-inteligentes-em-cpp-smart-pointers.html)) da vida! Sim, e existe até um `std::make_any`!!! 


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

## Como utilizar o `std::any`
Primeiramente você precisa incluir o cabeçalho dele:
> Logicamente, só funciona a partir do C++17 como foi dito no início!

{% highlight cpp %}
#include <any>
{% endhighlight %}

E agora o mesmo código que foi apresentado acima, mas usando `std::any`:

{% highlight cpp %}
#include <iostream>
#include <any>

int main(){
  std::any some_data;

  std::string str = "Oi";
  int x = 3;
  auto y = std::make_any<decltype(x)>(6);

  some_data = str;
  std::cout << std::any_cast<std::string>(some_data) << '\n';

  some_data = x;
  std::cout << std::any_cast<int>(some_data) << '\n';

  some_data = y;
  std::cout << "Tipo de y: " << some_data.type().name() << '\n';
}
{% endhighlight %}

No código acima vimos que:
+ `std::any some_data;` - Declara a variável;
+ `std::any_cast<T>(some_data)` - Converte para o tipo desejado;
+ `std::make_any<T>` - Outra forma de criar objetos;
+ `some_data.type().name()` - Obtém o tipo de dado sem precisar de `typeinfo`.

E você pode usar pra absolutamente tudo: `std::vector`, [Lambda](https://terminalroot.com.br/2021/04/10-exemplos-de-uso-de-funcoes-lambda-em-cpp.html) e tudo que existir de tipo de dado!

E o cara pergunta outra coisa:
#### — Tá! E se eu quiser acabar o tempo de vida do `std::any` manualmente?

Basta usar a estrutura de união `reset` ou até mesmo com o operador de incialização:

{% highlight cpp %}
some_data.reset();
# Ou
some_data = {};
{% endhighlight %}

#### — E pra verificar se `std::any` está vazio?
Use `has_value()`:

{% highlight cpp %}
std::cout << (some_data.has_value() ? "Cheio!" : "Vazio.") << '\n';
{% endhighlight %}

O `type()` sem união com `name()` pode ser usado para comparar tipos:
{% highlight cpp %}
std::cout << (some_data.type() == typeid(void)) << '\n'; // 0 pra false
std::cout << (some_data.type() == typeid(int)) << '\n'; // 1 pra true
{% endhighlight %}
> Para usar os nomes *booleanos* use: `std::cout << std::boolalpha <<  (some_data.type() == typeid(int)) << '\n';`.

Para lançar exceções você deve usar o `std::bad_any_cast`:
{% highlight cpp %}
try {

  std::any any_str("Oiii");
  auto my_any{ std::make_any<std::string>(any_str.type().name()) };
  std::cout << std::any_cast<std::string>(my_any) << '\n';

}catch (const std::bad_any_cast& e) {
  std::cerr << "Error: " << e.what() << std::endl;
}
{% endhighlight %}

Para verificar se realmente tudo está entre os conformes, nunca se esqueça de usar as flags para seu compilador: `-Wall -Wextra -pedantic -g -fsanitize=address`.

---

Além de totalmente **SAFE**, o `std::any` é muito prático e uma mão na roda! 

Tinha um projeto da empresa que eu estava desenvolvendo, que passava um argumento de função e podia ser qualquer tipo, mas o retorno da função era `std::string` concatenada ao nome do objeto recebido.

E alguém havia criado um baita de um `switch case` para converter para `std::string`(*bizarro!*), eu subsititui para recebimento de parâmetro para `std::any` e converti com `std::any_cast<std::string>` e resolvi de forma: Moderna, Safe e Like a Boss! Exatamente isso que `std::any` é!!! 😃 

Para mais informações acesse: <https://en.cppreference.com/w/cpp/utility/any>


