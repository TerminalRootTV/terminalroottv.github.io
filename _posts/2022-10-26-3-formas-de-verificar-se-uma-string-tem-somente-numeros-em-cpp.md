---
layout: post
title: "3 Formas de verificar se uma string tem somente números em C++"
date: 2022-10-26 12:27:17
image: '/assets/img/cpp/onlynumber.jpg'
description: 'Na verdade, há diversas formas, no entanto, essas são as mais indicadas e/ou utilizadas.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Há diversas tarefas corriqueiras no [C++](https://terminalroot.com.br/tags#cpp) que "*vira e mexe*" acabamos nos esquecendo. Logo, é interessante sempre retornamos ao básico para treinarmos e fixarmos o conhecimento.

Esse tipo de verificação pode ser utilizado em inúmeras situações e existem mais de 3 formas de verificarmos se uma `string` tem ou não somente números.

Nesse artigo vamos ver as formas mais simples e geralmente as mais utilizadas!

---

# 1. A forma 'Like a BOSS!'
A forma que geralmente eu mais utilizo e recomendo é utilizando a função `std::all_of` do cabeçalho: `<algorithm>` em conjunto com [lambda](https://terminalroot.com.br/2021/04/10-exemplos-de-uso-de-funcoes-lambda-em-cpp.html).

Costumo chamar de forma: *Like a BOSS!* 😃 , por ser mais moderna e mais veloz, principalmente em *tempo de compilação*.

O código se resume em:
{% highlight cpp %}
#include <iostream>
#include <algorithm>

int main(){
  bool number {false};
  std::string s {"a123456"};
  if(!s.empty() && std::all_of(s.begin(), s.end(), [](char c){
    return ::isdigit(c);
  })){
   number = true;
  }
  std::cout << ( number 
      ? "Somente números! =)" 
      : "Não há somente números :(") << '\n'; 
  return 0;
}
{% endhighlight %}
> Note que a `std::string s` possui uma letra, logo, a saída será: *Não há somente números :(* , mas se alterarmos e recompilarmos o resultado será outro.


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

# Utilizando [RegEx](https://terminalroot.com.br/tags#regex)
Algumas acham que [RegEx](https://terminalroot.com.br/regex) já é muito "*apelão*", no entanto, ela é uma forma padronizada que serve para qualquer linguagem de programação e também é funcional.

O lado ruim de usar RegEx em C++, é o *tempo de compilação*, que aumenta significativamente. Em resumo o código seria:

{% highlight cpp %}
#include <iostream>
#include <regex>

int main(){
  const std::string s {"123456+"};
  std::regex re("^[0-9]+$");
  std::smatch match;
  std::cout << ( std::regex_search(s, match, re) ? 
      "Somente números! =)" : 
      "Não há somente números :(") << '\n'; 
  return 0;
}
{% endhighlight %}
> Nesse caso a `string s` tem um caractere que não é número: `+` ao final.

---

# O mais básico possível!
Algumas pessoas preferem o [C++ Ortodoxo](https://gist.github.com/bkaradzic/2e39896bc7d8c34e042b), ou seja, aquele mais antigo e o mais parecido possível com o [C](https://terminalroot.com.br/tags#linguagemc).

Então, esse código *basicão*, seria:

{% highlight cpp %}
#include <iostream>
#include <string.h>

int main(){
  const std::string s {"123456"};
  bool number {true};
  for (std::size_t i {}; i < s.length(); ++i) {
   if( !::isdigit(s[i])){
     number = false;
   } 
  }
  std::cout << ( number 
      ? "Somente números! =)" 
      : "Não há somente números :(") << '\n'; 
  return 0;
}
{% endhighlight %}

---

*Melzinho na chupeta*, né não?! 😛 

# Veja também:
## [12 Cursos na Udemy Gratuitos e com Cupons com até 80% de Desconto](https://terminalroot.com.br/2022/10/12-cursos-na-udemy-gratuitos-e-com-cupons-com-ate-80-de-desconto.html)
> Há 5 Cursos de C++ na promoção!!! 😎 

Compartilhe esse artigo e até a próxima! \o/

