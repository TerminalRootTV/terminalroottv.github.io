---
layout: post
title: "Entendendo std::hash em C++"
date: 2025-02-25 09:44:45
image: '/assets/img/cppdaily/std-hash.jpg'
description: "🚀 Ela fornece uma função hash padronizada para tipos primitivos e alguns tipos da biblioteca padrão."
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- stl
- programacao
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

A `std::hash` faz parte do cabeçalho `<functional>` da STL (Standard Template Library) e fornece uma função hash padronizada para tipos primitivos e alguns tipos da biblioteca padrão. Ela é usada principalmente para implementar tabelas hash, como `std::unordered_map` e `std::unordered_set`.

---

## Como funciona `std::hash`
A `std::hash<T>` é um functor (função-objeto) que retorna um valor hash para um objeto do tipo `T`. Para tipos que não possuem uma especialização padrão, pode-se definir uma especialização personalizada.


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

## Exemplo básico

{% highlight cpp %}
#include <iostream>
#include <functional>

int main() {
    std::hash<int> hashInt;
    std::hash<std::string> hashString;

    int num = 42;
    std::string str = "hello";

    std::cout << "Hash de " << num << ": " << hashInt(num) << '\n';
    std::cout << "Hash de " << str << ": " << hashString(str) << '\n';

    return 0;
}
{% endhighlight %}

Saída esperada (os valores podem variar):
{% highlight txt %}
Hash de 42: 42
Hash de hello: 1762889876
{% endhighlight %}

---

## Uso com `std::unordered_map`
O `std::hash` é frequentemente usado em conjunto com `std::unordered_map` para criar tabelas hash eficientes:

{% highlight cpp %}
#include <iostream>
#include <unordered_map>

int main() {
    std::unordered_map<std::string, int> tabelaHash;

    tabelaHash["Alice"] = 25;
    tabelaHash["Bob"] = 30;
    tabelaHash["Charlie"] = 35;

    for (const auto& [chave, valor] : tabelaHash) {
        std::cout << "Chave: " << chave << ", Valor: " << valor << '\n';
    }
    return 0;
}
{% endhighlight %}

Saída esperada:
{% highlight txt %}
Chave: Alice, Valor: 25
Chave: Bob, Valor: 30
Chave: Charlie, Valor: 35
{% endhighlight %}

## Criando um `std::hash` personalizado
Se quisermos usar um tipo de dado personalizado como chave em um `std::unordered_map`, precisamos fornecer uma função de hash personalizada:

{% highlight cpp %}
#include <iostream>
#include <unordered_map>
#include <functional>

struct Pessoa {
    std::string nome;
    int idade;

    bool operator==(const Pessoa& outra) const {
        return nome == outra.nome && idade == outra.idade;
    }
};

struct HashPessoa {
    std::size_t operator()(const Pessoa& p) const {
        return std::hash<std::string>()(p.nome) ^ (std::hash<int>()(p.idade) << 1);
    }
};

int main() {
    std::unordered_map<Pessoa, std::string, HashPessoa> pessoas;

    pessoas[{"Alice", 25}] = "Engenheira";
    pessoas[{"Bob", 30}] = "Médico";

    for (const auto& [pessoa, profissao] : pessoas) {
        std::cout << "Pessoa: " << pessoa.nome << ", Idade: " << pessoa.idade << " -> Profissão: " << profissao << '\n';
    }

    return 0;
}
{% endhighlight %}

1. A estrutura `Pessoa` é usada como chave.
2. O operador `==` é implementado para comparação entre objetos.
3. Criamos um functor `HashPessoa` que combina os hashes do nome e da idade.

Isso garante que o tipo `Pessoa` possa ser usado dentro de `std::unordered_map`.

---

A `std::hash` é uma ferramenta poderosa para criar tabelas hash eficientes. Podemos utilizá-la para tipos básicos e também criar funções de hash personalizadas para tipos definidos pelo usuário.



