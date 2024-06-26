---
layout: post
title: "Como usar o std::optional em C++ Moderno"
date: 2024-06-26 09:16:49
image: '/assets/img/cppdaily/optional.jpg'
description: "🗞️ É útil para situações em que você quer indicar a ausência de um valor de uma forma mais clara e segura do que usar ponteiros nulos."
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

`std::optional` é uma funcionalidade introduzida na biblioteca padrão do [C++17](https://terminalroot.com.br/tags#cppdaily) que encapsula um valor opcional, ou seja, um valor que pode ou não estar presente. 

É útil para situações em que você quer indicar a ausência de um valor de uma forma mais clara e segura do que usar [ponteiros](https://terminalroot.com.br/2022/01/entenda-ponteiros-em-c-cpp-e-como-a-memoria-ram-funciona.html) [nulos](https://terminalroot.com.br/2024/06/utilize-stdany-do-cpp-moderno-nos-seus-projetos.html) ou valores especiais.

Vamos ver alguns exemplos de uso!

---

## 01. Criação e uso básico
{% highlight cpp %}
#include <iostream>
#include <optional>

std::optional<int> find_even_number(int num) {
    if (num % 2 == 0) {
        return num;
    } else {
        return std::nullopt; // Indica ausência de valor
    }
}

int main() {
    int num = 4;
    auto result = find_even_number(num);
    
    if (result) {
        std::cout << "Número par encontrado: " << result.value() << '\n';
    } else {
        std::cout << "Número não é par.\n";
    }
    
    return 0;
}
{% endhighlight %}


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

## 02. Usando `std::optional` com `std::string`
{% highlight cpp %}
#include <iostream>
#include <optional>

std::optional<std::string> get_middle_name(const std::string& full_name) {
    size_t space1 = full_name.find(' ');
    if (space1 == std::string::npos) {
        return std::nullopt;
    }
    size_t space2 = full_name.find(' ', space1 + 1);
    if (space2 == std::string::npos) {
        return std::nullopt;
    }
    return full_name.substr(space1 + 1, space2 - space1 - 1);
}

int main() {
    std::string name = "Marcos Simões Oliveira";
    auto middle_name = get_middle_name(name);
    
    if (middle_name) {
        std::cout << "Nome do meio: " << *middle_name << '\n';
    } else {
        std::cout << "O nome do meio não foi encontrado.\n";
    }
    
    return 0;
}
{% endhighlight %}

---

## 03. Manipulando `std::optional`
{% highlight cpp %}
#include <iostream>
#include <optional>

int main() {
    std::optional<int> opt;

    // Atribuindo um valor
    opt = 42;
    std::cout << "Valor: " << *opt << '\n';

    // Removendo o valor
    opt.reset();
    if (!opt) {
        std::cout << "Sem valor.\n";
    }

    // Usando valor padrão
    std::cout << "Valor ou padrão: " << opt.value_or(-1) << '\n';

    return 0;
}
{% endhighlight %}

---

## 04. Trabalhando com funções que retornam `std::optional`
{% highlight cpp %}
#include <iostream>
#include <optional>

std::optional<std::string> get_first_word(const std::string& sentence) {
    size_t pos = sentence.find(' ');
    if (pos == std::string::npos) {
        return std::nullopt;
    }
    return sentence.substr(0, pos);
}

int main() {
    std::string sentence = "Olá, Mundo!";
    auto first_word = get_first_word(sentence);
    
    if (first_word) {
        std::cout << "Primeira palavra: " << *first_word << '\n';
    } else {
        std::cout << "A primeira palavra não foi encontrada.\n"; 
    }
    
    return 0;
}
{% endhighlight %}

---

Em resumo, `std::optional` é uma maneira elegante e segura de lidar com valores opcionais em [C++](https://terminalroot.com.br/tags#cpp), fornecendo uma alternativa mais clara e menos propensa a erros em comparação com o uso de ponteiros nulos ou valores especiais.

---

## Links úteis
+ <https://en.cppreference.com/w/cpp/utility/optional>
+ <https://cengizhanvarli.medium.com/std-optional-in-c-06127604815e>
+ <https://www.learncpp.com/cpp-tutorial/stdoptional/>
+ <https://stackoverflow.com/questions/78581072/stdoptional-factory-function-with-guaranteed-copy-elision-and-private-cons>



