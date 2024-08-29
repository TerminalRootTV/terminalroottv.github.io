---
layout: post
title: "Entenda assert em C++, C e Python"
date: 2024-08-29 08:33:00
image: '/assets/img/cppdaily/assert.jpg'
description: "🚀 Acertando as contas!"
icon: 'ion:terminal-sharp'
iconname: 'C++/C/Python'
tags:
- cpp
- cppdaily
- linguagemc
- python
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

`assert` é uma macro ou função utilizada para verificar condições que *devem* ser verdadeiras em tempo de execução. Se a condição falhar, o programa geralmente é encerrado, e uma mensagem de erro é exibida. É uma ferramenta útil para depuração, garantindo que certas condições sejam atendidas durante o desenvolvimento.

## Uso do `assert` em [C++](https://terminalroot.com.br/tags#cpp) e [C](https://terminalroot.com.br/tags#linguagemc)

Em [C++](https://terminalroot.com.br/cpp) e [C](https://terminalroot.com.br/c), `assert` é uma macro definida no cabeçalho `<cassert>` (C++) ou `<assert.h>` (C). Ela é usada principalmente para validar suposições em tempo de execução e pode ser desativada em código de produção definindo a macro `NDEBUG`.

+ **Desempenho**: `assert` deve ser usado principalmente para depuração. Em código de produção, é comum desativá-lo para melhorar o desempenho.
+ **Mensagens de Erro**: Sempre que possível, forneça uma mensagem descritiva para facilitar a depuração, especialmente em projetos grandes.
+ **Exceções**: Para validações críticas, considere o uso de exceções (em [C++](https://terminalroot.com.br/tags#cpp) ou [Python](https://terminalroot.com.br/tags#python)) ou verificações manuais que nunca são desativadas.


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

## Exemplo em C++
{% highlight cpp %}
#include <iostream>
#include <cassert>

int divide(int a, int b) {
    assert(b != 0 && "Divisor não pode ser zero!");
    return a / b;
}

int main() {
    int x = 10;
    int y = 0;

    std::cout << "Divisão: " << divide(x, y) << std::endl;

    return 0;
}
{% endhighlight %}

Neste exemplo, `assert(b != 0)` garante que o divisor nunca seja zero. Se `y` for zero, a execução será interrompida com uma mensagem de erro.

---

## Exemplo em C
{% highlight c %}
#include <stdio.h>
#include <assert.h>

int divide(int a, int b) {
    assert(b != 0 && "Divisor não pode ser zero!");
    return a / b;
}

int main() {
    int x = 10;
    int y = 0;

    printf("Divisão: %d\n", divide(x, y));

    return 0;
}
{% endhighlight %}

O funcionamento é o mesmo do exemplo em C++, pois `assert` em C é também usado para verificar a validade das condições em tempo de execução.

---

## Uso do `assert` em [Python](https://terminalroot.com.br/tags#python)
Em Python, `assert` é uma declaração nativa da linguagem que funciona de forma semelhante. Se a condição for falsa, uma exceção `AssertionError` é lançada. Assim como em C/C++, os `asserts` podem ser desativados no ambiente de produção utilizando a flag `-O`(optimize, `python -O script.py`) ao executar o script.

{% highlight python %}
def divide(a, b):
    assert b != 0, "Divisor não pode ser zero!"
    return a / b

x = 10
y = 0

print("Divisão:", divide(x, y))
{% endhighlight %}

Nesse exemplo: `assert b != 0` verifica se `b` é diferente de zero. Se `y` for zero, um `AssertionError` será levantado com a mensagem "Divisor não pode ser zero!", se você não usar `assert` ou se usar o parâmetro: `-O` como mencionado, a saída de erro será diferente.

---

Existem muitas implementações de `assert` principalmente em [softwares que fazem testes unitários](https://terminalroot.com.br/2023/10/faca-testes-unitarios-e-benchmark-para-cpp-moderno-com-catch2.html), é uma ferramenta poderosa para evitar falhas!


