---
layout: post
title: "Significado de decltype em C++"
date: 2021-04-29 10:22:01
image: '/assets/img/cppdaily/decltype-cpp.png'
description: 'Tipo automático de acordo com o retorno da função usada.'
icon: 'ion:terminal-sharp'
iconname: 'cpp::daily'
tags:
- cppdaily
---

![Significado de decltype em C++](/assets/img/cppdaily/decltype-cpp.png)

`decltype` é uma palavra-chave usada para consultar o tipo de uma expressão . Introduzido no **C++ 11** , seu principal uso é na programação genérica , onde muitas vezes é difícil, ou mesmo impossível, expressar tipos que dependem de parâmetros de modelo .

À medida que as técnicas de programação genérica se tornaram cada vez mais populares ao longo da década de 1990, a necessidade de um mecanismo de dedução de tipo foi reconhecida. Muitos fornecedores de compiladores implementaram suas próprias versões do operador, normalmente chamadas `typeof`, e algumas implementações portáteis com funcionalidade limitada, com base nos recursos de linguagem existentes, foram desenvolvidas.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


Em 2002, Bjarne Stroustrup propôs que uma versão padronizada do operador fosse adicionada à linguagem [C++](https://terminalroot.com.br/cpp) e sugeriu o nome "`decltype`", para refletir que o operador produziria o "tipo declarado" de uma expressão.

A semântica foi projetada para atender tanto a desenvolvedores de bibliotecas genéricas quanto programadores novatos. Em geral, o tipo deduzido corresponde ao tipo do objeto ou função exatamente como declarado no código-fonte. 

Exemplo:

{% highlight cpp %}
#include <iostream>

int the_int(){
  return 3;
}

int main(){
  // pega automaticamente o tipo de retorno de the_int
  decltype( the_int() ) x = the_int();
  std::cout << "O valor de x é: " << x << '\n';
  return 0;
}
{% endhighlight %}

---

Por hoje é só, são pequenas doses diárias que farão sempre nos manter antenado com o [C++](https://terminalroot.com.br/cpp/) !

## Acompanhe o [cpp::daily](https://terminalroot.com.br/tags#cppdaily)

