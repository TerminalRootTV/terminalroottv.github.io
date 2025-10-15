---
layout: post
title: "std::runtime_error vs std::exit , qual o melhor?"
date: 2025-10-15 18:49:46
image: '/assets/img/cppdaily/std-runtime_error-vs-std-exit.jpg'
description: "🏁 Tratamento e encerramento em C++."
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')


---

Em [C++](https://terminalroot.com.br/tags#cpp), lidar corretamente com erros é essencial para garantir a estabilidade e previsibilidade de um programa. 

Dois mecanismos comuns usados para esse fim são **`std::runtime_error`**, que faz parte do sistema de exceções da linguagem, e **`std::exit`**, que encerra o processo imediatamente.

Embora ambos possam ser usados para sinalizar falhas, eles possuem **propósitos completamente diferentes**: um foca no **tratamento e recuperação**, o outro na **finalização imediata**.

Nesse artigo vamos ver o funcionamento de cada um, mostrar quando aplicá-los e discutir qual abordagem é mais adequada em diferentes contextos de desenvolvimento.


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

## `std::runtime_error`

`std::runtime_error` é uma exceção da biblioteca padrão [C++](https://terminalroot.com.br/cpp) derivada de `std::exception`.
Serve para sinalizar erros **em tempo de execução** que impedem a continuação normal do programa.

#### **Uso:**

{% highlight cpp %}
#include <stdexcept>
#include <iostream>

void carregarArquivo(const std::string& caminho) {
    if (caminho.empty()) {
        throw std::runtime_error("Caminho do arquivo inválido");
    }
    // ...
}

int main() {
    try {
        carregarArquivo("");
    } catch (const std::runtime_error& e) {
        std::cerr << "Erro: " << e.what() << '\n';
    }
}
{% endhighlight %}

#### **Características:**

* É **lançada com `throw`** e **tratada com `try/catch`**.
* Permite **propagação controlada do erro**, preservando o estado do programa.
* Garante **liberação automática de recursos** via *stack unwinding* (destrutores de objetos locais são chamados).
* Ideal para erros **recuperáveis ou previsíveis**, como falha de leitura, valor inválido, etc.

---

## `std::exit`

`std::exit` (definido em `<cstdlib>`) termina o programa **imediatamente**, retornando um código de status ao sistema operacional.

#### **Uso:**

{% highlight cpp %}
#include <cstdlib>
#include <iostream>

int main() {
    std::cerr << "Erro fatal, encerrando.\n";
    std::exit(EXIT_FAILURE);
}
{% endhighlight %}

#### **Características:**

* **Não lança exceção**, nem faz *stack unwinding*.
* Objetos **automáticos (locais)** não têm seus destrutores chamados.
* Objetos **estáticos e globais** ainda são destruídos.
* Ideal para **erros fatais** ou situações onde o estado do programa está completamente corrompido.

---

## Qual usar e quando?

| Situação                                                                    | Recomendado          | Motivo                                                  |
| --------------------------------------------------------------------------- | -------------------- | ------------------------------------------------------- |
| Erro previsível ou recuperável                                              | `std::runtime_error` | Permite tratamento via `try/catch` e limpeza automática |
| Erro irrecuperável (ex: corrupção de memória, falha grave de inicialização) | `std::exit`          | Finaliza de forma imediata e controlada                 |
| Código de biblioteca ou engine                                              | `std::runtime_error` | Dá ao chamador a chance de reagir                       |
| Programa pequeno ou utilitário simples                                      | `std::exit`          | Simplicidade, sem necessidade de exceções               |

* Use **`std::runtime_error`** quando quiser **propagar e tratar erros** dentro da lógica do programa.
* Use **`std::exit`** apenas quando não há como continuar — o erro é fatal.
* Em geral, **`std::runtime_error` é mais seguro e flexível**, pois mantém o controle de fluxo e garante destruição adequada de recursos.

**Dependendo do contexto.**

### `throw std::runtime_error(...)`

**Melhor na maioria dos casos.**

* Permite **tratamento com `try/catch`**, stack unwinding, e destrutores são chamados corretamente (RAII).
* Usado quando há um **erro lógico ou de fluxo**, e você quer **propagar o erro**.

{% highlight cpp %}
throw std::runtime_error("Arquivo inválido");
{% endhighlight %}

### `std::exit(1)`

**Use só se quiser encerrar IMEDIATAMENTE e não precisa liberar recursos.**

* **Não faz stack unwinding** → destrutores não são chamados.
* Bom para **nível `main()`**, ferramentas, ou se realmente precisa abortar **sem exceções**.

{% highlight cpp %}
std::cerr << "Erro fatal\n";
std::exit(1);
{% endhighlight %}

| Situação                          | Melhor opção               |
| --------------------------------- | -------------------------- |
| Código com RAII/recursos alocados | `throw std::runtime_error` |
| Em `main()` ou ferramenta simples | `std::exit(1)`             |
| Precisa de tratamento de erro     | `throw`                    |
| Quer encerrar seco e rápido       | `std::exit(1)`             |

**Recomendação padrão moderna: use `throw`, não `exit`, a menos que tenha motivo real.**

---

## Aprenda C++:
### <https://terminalroot.com.br/cpp>



