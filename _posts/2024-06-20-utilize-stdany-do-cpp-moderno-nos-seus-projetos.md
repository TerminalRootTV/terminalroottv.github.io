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
> **— Ah, cara! De boa. Para esses casos eu uso o `void *`.**

Sim, realmente você tem razão, mas você já viu como a nova geração está em relação a *segurança de memória* ???
> Lembrando que o termo *segurança* é usado em Português, pois não existe uma palavra que se adeque a tradução para `Safe`, ou seja: `Safe` **!=** `Seguro`)! 😛 

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
> **— Tá! E se eu quiser acabar o tempo de vida do `std::any` manualmente?**

Basta usar a estrutura de união `reset` ou até mesmo com o operador de incialização:

{% highlight cpp %}
some_data.reset();
// Ou
some_data = {};
{% endhighlight %}

> **— E pra verificar se `std::any` está vazio?**
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

## Exemplo na vida real
Imagine você ter um código que precisa concatenar vários tipos e retornar uma string. No entanto, um dos tipos pode ser: int, double ou std::string.

Se usar `std::any_cast<T>` no retorno assim:
> Exemplo:

{% highlight cpp %}
#include <iostream>
#include <any>
#include <sstream>

enum class Message {
  SUCCESS,
  WARNING,
  ERROR,
  UNKNOW
};

std::string add_info(Message, const std::string&, std::any, int);

int main(){
  std::any obj;

  obj = std::string("Start");
  std::cout << add_info(Message::SUCCESS, " do tipo string: ", obj, 3) << '\n';

  obj = 6;
  std::cout << add_info(Message::WARNING, " do tipo int: ", obj, 9) << '\n';

  obj = 3.14;
  std::cout << add_info(Message::ERROR, " do tipo double: ", obj, 0) << '\n';

  obj.reset();
  std::cout << add_info(Message::UNKNOW, " sem tipo: ", obj, 9) << '\n';

  obj = "CONST_CHAR";
  std::cout << add_info(Message::SUCCESS, " sem tipo: ", nullptr, 9) << '\n';

  return 0;
}

std::string add_info(Message msg, const std::string& out, std::any object, int num){
  return std::any_cast<std::string>(msg) + out + "'" + std::any_cast<std::string>(object) + "' " + std::to_string(num);
}
{% endhighlight %}
> Compile: `g++ -Wall -Wextra -pedantic -g -fsanitize=address main.cpp`.

Terá um `std::bad_any_cast` na saída:
{% highlight bash %}
terminate called after throwing an instance of 'std::bad_any_cast'
  what():  bad any_cast
Abortado
{% endhighlight %}

Ambas conversões(da `msg` e da `object`) estão incorretas:
{% highlight cpp %}
std::any_cast<std::string>(msg) + ...
// Quanto
std::any_cast<std::string>(object)
{% endhighlight %}

Você precisa fazer um `switch case` para o enumerador e no caso do parâmetro `object`: Precisará usar o `has_value()`, armazenar o `type()` em `std::type_info&` e usar um `std::stringstream` para atribuir o tipos de retorno com união ao: `str()`, assim:

{% highlight cpp %}
#include <iostream>
#include <any>
#include <sstream>

enum class Message {
  SUCCESS,
  WARNING,
  ERROR,
  UNKNOW
};

std::string add_info(Message, const std::string&, std::any, int);

int main(){
  std::any obj;

  obj = std::string("Start");
  std::cout << add_info(Message::SUCCESS, " do tipo string: ", obj, 3) << '\n';

  obj = 6;
  std::cout << add_info(Message::WARNING, " do tipo int: ", obj, 9) << '\n';

  obj = 3.14;
  std::cout << add_info(Message::ERROR, " do tipo double: ", obj, 0) << '\n';

  obj.reset();
  std::cout << add_info(Message::UNKNOW, " sem tipo: ", obj, 9) << '\n';

  obj = "CONST_CHAR";
  std::cout << add_info(Message::SUCCESS, " sem tipo: ", nullptr, 9) << '\n';

  return 0;
}

std::string add_info(Message msg, const std::string& out, std::any object, int num){
  std::string local_msg {"NOTHING"};
  std::stringstream ss;

  switch (msg){
    case Message::SUCCESS:
      local_msg = "SUCCESS";
      break;
    case Message::WARNING:
      local_msg = "WARNING";
      break;
    case Message::ERROR:
      local_msg = "ERROR";
      break;
    case Message::UNKNOW:
      local_msg = "UNKNOW";
      break;
  }

  
  if (object.has_value()) {
    const std::type_info& type = object.type();
    if (type == typeid(std::string)) {
      ss << std::any_cast<std::string>(object);
    } else if (type == typeid(int)) {
      ss << std::any_cast<int>(object);
    } else if (type == typeid(double)) {
      ss << std::any_cast<double>(object);
    } else {
      ss << "null";
    }
  } else {
    ss << "[no object]";
  }

  return local_msg + out + "'" + ss.str() + "' " + std::to_string(num);
}
{% endhighlight %}

Que função!!! :O , mas assim seu código ficará safe! Compile: `g++ -Wall -Wextra -pedantic -g -fsanitize=address main.cpp` e após rodar `./a.out`, a saída será o esperado:

{% highlight bash %}
SUCCESS do tipo string: 'Start' 3
WARNING do tipo int: '6' 9
ERROR do tipo double: '3.14' 0
UNKNOW sem tipo: '[no object]' 9
SUCCESS sem tipo: 'null' 9
{% endhighlight %}

Parece trabalhoso, mas essa é a forma correta de você finalizar o tempo de vida de um tipo qualquer!

---

Além de totalmente **SAFE**, o `std::any` é muito prático e uma mão na roda! 

Para mais informações acesse: <https://en.cppreference.com/w/cpp/utility/any>

