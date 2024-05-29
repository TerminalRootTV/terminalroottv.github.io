---
layout: post
title: "O que são as: Sequências Especificadoras de Atributos em C++?"
date: 2024-05-29 11:50:54
image: '/assets/img/cpp/nodiscard.jpg'
description: "🎆 Importantes para: Detectar erros, Otimizar o código e Fornecer informações adicionais ao desenvolvedor."
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

As Sequências Especificadoras de Atributos (Attribute Specifiers) em [C++](https://terminalroot.com.br/tags#cpp) são metadados que fornecem informações adicionais ao compilador sobre como ele deve tratar certas partes do código. 

Esses atributos podem ajudar a:
+ Detectar erros;
+ Otimizar o código;
+ ou Fornecer informações adicionais ao desenvolvedor. 

Vamos ver alguns exemplos de atributos em [C++](https://terminalroot.com.br/tags#cpp).


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

## Exemplos de Atributos em C++
### 01. `[[nodiscard]]`:
Esse atributo indica que o valor de retorno de uma função não deve ser ignorado. Se o valor de retorno for ignorado, o compilador gerará um aviso.

{% highlight cpp %}
[[nodiscard]] int computeValue() {
    return 42;
}

int main() {
    computeValue(); // Aviso do compilador: o valor de retorno foi ignorado
    int result = computeValue(); // Correto, o valor de retorno é usado
    return 0;
}
{% endhighlight %}

O compilador emitirá um aviso se a função computeValue for chamada e seu valor de retorno não for usado. Isso é útil para evitar a perda acidental de valores importantes.
> Se você remover o `[[nodiscard]]` do código note que não haverá avisos, mas com o `[[nodiscard]]` a saída será similar a isso:
{% highlight bash %}
nodiscard.cpp: In function ‘int main()’:
nodiscard.cpp:8:17: warning: ignoring return value of ‘int computeValue()’, declared with attribute ‘nodiscard’ [-Wunused-result]
    8 |     computeValue(); // Aviso do compilador: o valor de retorno foi ignorado
      |     ~~~~~~~~~~~~^~
nodiscard.cpp:3:19: note: declared here
    3 | [[nodiscard]] int computeValue() {
{% endhighlight %}

---

### 02. `[[fallthrough]]`:
Esse atributo é usado em uma declaração case dentro de um switch para indicar que a queda (`fallthrough`) para o próximo case é intencional. Isso ajuda a evitar avisos do compilador sobre quedas acidentais.

{% highlight cpp %}
void process(int value) {
    switch (value) {
        case 1:
            // Código para o case 1
            [[fallthrough]];
        case 2:
            // Código para o case 2
            break;
        default:
            // Código para outros casos
            break;
    }
}
{% endhighlight %}

No exemplo do switch, `[[fallthrough]]` indica que a queda de case 1 para case 2 é intencional. Sem esse atributo, o compilador poderia emitir um aviso sobre a falta de break em case 1.

---

### 03. `[[unlikely]]`:
Esse atributo sugere ao compilador que a probabilidade de execução de um ramo de código é baixa. Isso pode ajudar na otimização do código gerado.

{% highlight cpp %}
#include <iostream>

void checkValue(int value) {
    if (value == 42) [[unlikely]] {
        std::cout << "O valor é 42, o que é improvável!\n";
    } else {
        std::cout << "O valor não é 42.\n";
    }
}

int main() {
    checkValue(10);
    checkValue(42);
    return 0;
}
{% endhighlight %}

O compilador pode otimizar o código gerado com base na dica de que a condição `value == 42` é improvável de ser verdadeira, possivelmente reordenando o código para melhorar o desempenho no caso mais comum.

---

Esses atributos são parte da modernização contínua da [linguagem C++](https://terminalroot.com.br/tags#cpp) para tornar o código mais expressivo e ajudar na detecção precoce de erros, bem como na otimização de desempenho.

Para mais informações acesse o [cpp reference](https://en.cppreference.com/w/cpp/language/attributes).

