---
layout: post
title: "O que significa a letra f em números do C++?"
date: 2021-04-19 11:19:37
image: '/assets/img/cppdaily/float-literal.png'
description: 'Tipos literais para precisão de dados.'
icon: 'ion:terminal-sharp'
iconname: 'cpp::daily'
tags:
- cppdaily
- cpp
---

![O que significa a letra f em números do C++?](/assets/img/cppdaily/float-literal.png)

Eu tenho recebido bastante dúvidas dos incritos dos cursos e do canal. E alguns dos conceitos baseados nessas dúvidas iremos tratar aqui no [cpp::daily](https://terminalroot.com.br/tags#cppdaily), logo teremos postagens de dicas rápidas para documentarmos essas dúvidas .

Uma das dúvidas que recebi recentemente é o fato de encontrar a letra *f* acompanhado de números em [C++](https://terminalroot.com.br/cpp/): ex.: `3.69f`.

Em linhas gerais podemos dizer que esse número é um tipo literal do *float*: `8.04f` . Mas por que existe esse *f* se o tipo já é *float*? A resposta é porque por padrão todo número com `.`(ponto) o [C](https://terminalroot.com.br/tags#linguagemc) e [C++](https://terminalroot.com.br/tags#cpp) tratam como *double*, logo, precisamos tornar o tipo *float* explícito.

Vamos à um exemplo. Suponhamos que você deseja testar o número *pi*:
{% highlight cpp %}
#include <iostream>

int main(){
  const float pi = 3.14;
  std::cout << ( pi == 3.14 ? "É igual" : "Não é igual" ) << '\n';
  return 0;
}
{% endhighlight %}

A princípio você diria que a saída desse código seria que ~~É igual~~ , mas teste e verás que a saída será: **Não é igual** .

Agora se adicionarmos o **f**: `const float pi = 3.14f;` ainda não seria igual, se mantermos a condição sem o **f**. 

Mas se adicionarmos o **f** na condição, seria igual:

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

{% highlight cpp %}
#include <iostream>

int main(){
  const float pi = 3.14;
  std::cout << ( pi == 3.14f ? "É igual" : "Não é igual" ) << '\n';
  return 0;
}
{% endhighlight %}

Ou em ambos, que evita ainda mais "erro humano":
{% highlight cpp %}
#include <iostream>

int main(){
  const float pi = 3.14f;
  std::cout << ( pi == 3.14f ? "É igual" : "Não é igual" ) << '\n';
  return 0;
}
{% endhighlight %}
> **Alternativamente você também pode usar o F maiúsculo que funciona da mesma forma**.

É altamente recomendável você usar assim em todos os casos em que a precisão é importante, como [games](https://terminalroot.com.br/tags#games), por exemplo.

Existem também dados literais para outros tipos: long(L ou l), unsigned(U ou u), long unsigned(Ul ou ul), long long(LL ou ll) .

Por hoje é só, são pequenas doses diárias que farão sempre nos manter antenado com o [C++](https://terminalroot.com.br).

Acompanhe o [cpp::daily](https://terminalroot.com.br/tags#cppdaily).




