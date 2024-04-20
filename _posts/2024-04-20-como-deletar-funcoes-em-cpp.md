---
layout: post
title: "Como 'deletar' funções em C++"
date: 2024-04-20 20:39:58
image: '/assets/img/cpp/delete-cpp.jpg'
description: 'Evitando sobrecargas desnecessárias.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Em [C++](https://terminalroot.com.br/tags#cpp), a palavra-chave `delete` é usada em duas situações diferentes, dependendo do contexto:

### 1. Operador `delete` pode ser usado para liberar memória alocada dinamicamente: 
> Quando você aloca memória dinamicamente usando `new`, é necessário liberar essa memória quando não precisar mais dela para evitar vazamentos de memória. O operador `delete` é usado para liberar a memória alocada dinamicamente. Em contrapartida e para uso automático pode ser(e deve sempre que puder) usar [ponteiros inteligentes(smart pointers)](https://terminalroot.com.br/2022/08/entenda-ponteiros-inteligentes-em-cpp-smart-pointers.html).

### 2. Operador `delete` para funções:
Quando você declara uma função usando `delete`, está declarando que essa função é excluída e não pode ser usada. Isso é útil para classes com funções-membro que você deseja impedir que sejam chamados ou herdados.


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

# Exemplo de como deletar funções em C++
Suponhamos que você possui essa função abaixo: `print_num(int)` que recebe como parâmetro o tipo primitivo `int`:

{% highlight cpp %}
void print_num(int num){
  std::cout << num << '\n';
}
{% endhighlight %}

Ao chamar essa função, note que podemos passar os tipos: `char`, `bool` e `float`/`double` que ela receberá normalmente:

{% highlight cpp %}
void print_num(int num){
  std::cout << num << '\n';
}

int main(){
  print_num(9);
  print_num('a');
  print_num(true);
  print_num(3.6);
}
{% endhighlight %}

Ao compilar note que funcionará normalmente:
{% highlight bash %}
g++ main.cpp
./a.out
9
97
1
3
{% endhighlight %}

Para evitar essa *sobrecarga* usamos a declaração `delete` para anular alguns tipos:

{% highlight cpp %}
void print_num(char) = delete;
{% endhighlight %}
Nesse caso o tipo `char` e `float`/`double` já receberão erro ao compilar:

{% highlight cpp %}
void print_num(char) = delete; ■ Call to deleted function 'print_num'
{% endhighlight %}
> Lembrando que o `float`/`double` já receberão um *warning*(se você estiver usando um [LSP](https://terminalroot.com.br/2021/11/lsp-autocomplete-e-machine-learning-neovim-com-lua.html)), mas compilará normalmente!

Ainda podemos usar também para o tipo `bool` também não sobrecarregar:
{% highlight cpp %}
void print_num(bool) = delete;
{% endhighlight %}

Sendo assim, para conseguirmos compilar nosso código precisaremos comentar as linhas referentes ao código acima, deixando assim ao final:

{% highlight cpp %}
#include <iostream>

void print_num(int num){
  std::cout << num << '\n';
}

void print_num(char) = delete;
void print_num(bool) = delete;

int main(){
  print_num(9);
  //print_num('a'); ■ Call to deleted function 'print_num'
  //print_num(true); ■ Call to deleted function 'print_num'
  //print_num(3.6); ■ Call to 'print_num' is ambiguous
  return 0;
}
{% endhighlight %}

### Lembrando que você ainda pode **optimizar** seu código usando `template`, ficando *like a boss!*:
{% highlight cpp %}
#include <iostream>

void print_num(int num){
  std::cout << num << '\n';
}

template<typename T>
void print_num(T) = delete;

int main(){
  print_num(9);
  //print_num('a'); ■ Call to deleted function 'print_num'
  //print_num(true); ■ Call to deleted function 'print_num'
  //print_num(3.6); ■ Call to 'print_num' is ambiguous
  return 0;
}
{% endhighlight %}

---

Em resumo, dentro desse contexto a palavra-chave `delete` em C++ para 'deletar' funções quer dizer:
### `delete` = "*eu proíbo isso*" ou "*isso não existe*"

Para mais informações [acesse aqui](https://en.cppreference.com/w/cpp/keyword/delete).




