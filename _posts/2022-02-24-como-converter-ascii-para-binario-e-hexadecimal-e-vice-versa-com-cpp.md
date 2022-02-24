---
layout: post
title: "Como Converter ASCII para Binário e Hexadecimal e vice-versa com C++"
date: 2022-02-24 11:09:52
image: '/assets/img/cppdaily/conv.jpg'
description: 'De forma fácil e rápida.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Diversas vezes precisamos converter nossos dados para manipulá-los da maneira desejada e até mesmo para dificultar exibição quando necessário.

Nós fizemos algumas dessas conversões do zero no [Curso de C++ para Iniciantes](https://terminalroot.com.br/cpp) sem usar bibliotecas e isso é interessante por fins didáticos para entendermos o que na verdade essas bibliotecas fazem.

Mas, para fins de desenvolvimento é bom já termos algo pronto para agilizarmos, então criei um único arquivo `convert.hpp` com uma [Union](https://terminalroot.com.br/2022/02/como-usar-unions-em-cpp.html) que possui as funções-membro para isso.

Eu realmente não gosto de encher o código de comentários, até porque programadores sabem ler o código da [linguagem de programação](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html) que ele está familiarizado.

No entanto, vou informar algumas coisas no código para ficar mais fácil a leitura e caso você queira incrementar alguma coisa, ficará mais fácil, são elas:

+ Utilizer `union` em vez de `class` ou `struct` por motivos de desempenho como vimos [nesse artigo](https://terminalroot.com.br/2022/02/como-usar-unions-em-cpp.html);
+ Atribuí `static` para não precisarmos de instância e utilizar mais facilmente somente com o operador `::`;
+ Não informei `namespace`, pois a própria `static` já permitirá um *escopo*;
+ Apesar do padrão para **classes**, **unions** e **structs** é ter nomes capitalizados, não usei porque acho que, *tipograficamente* falando, nesse caso fica mais agradável;
+ Utilizei a classe [std::bitset](https://en.cppreference.com/w/cpp/utility/bitset), pois como havia dito, escrever do zero é bom para fins didáticos, para desenvolvimento é bom utilizarmos soluções já prontas;
+ Na função-membro `ascii_to_bin()` adicionei essa verificação abaixo só para separarmos a saída em 8 bits, exemplo: `01010101 01010101`, ou seja, por um espaço no meio:
{% highlight cpp %}
if( ss.str().length() % 8 == 0){
  ss << " ";
}
{% endhighlight %}
+ Na função-membro `bin_to_hex()` adicionei o *iterador* `bin.erase( std::remove( bin.begin() , bin.end(), ' ') , bin.end() );` para removermos o espaço em branco dos bits, se houver, pois em `bin_to_ascii()` as converões são diferentes;
+ Ao ler o código note também que para hexadecimal é necessário usar o template de **16** em vez de ~~8~~ em: `std::bitset<16>`;
+ E por fim a função-membro `ascii_to_hex`, reutiliza as outras funções-membro, não precisar reescrever tudo.

O código completo é esse:
> `convert.hpp`


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

{% highlight cpp %}
#pragma once
#include <sstream>
#include <bitset>
#include <vector>
#include <algorithm>

union conv {
    static const std::string bin_to_ascii(const std::string & bin){
      std::stringstream ss(bin);
      std::string r;
      while(ss.good()){
        std::bitset<8> bits;
        ss >> bits;
        char c = char(bits.to_ulong());
        r += c;
      }
      return r;
    }

    static const std::string ascii_to_bin(const std::string& ascii){
      std::stringstream ss(ascii);
      for (size_t i = 0; i < ascii.length(); ++i) {
        std::bitset<8> bits(ascii[i]);
        ss << bits;
        if( ss.str().length() % 8 == 0){
          ss << " ";
        }
      }
      return ss.str();
    }

    static const std::string bin_to_hex(std::string bin){
      bin.erase( std::remove( bin.begin() , bin.end(), ' ') , bin.end() );
      std::bitset<16> bits(bin);
      std::stringstream res;
      res << std::hex << std::uppercase << bits.to_ulong();
      return res.str();
    }

    static const std::string ascii_to_hex(std::string ascii){
       return bin_to_hex( ascii_to_bin(ascii) );
    }
};
{% endhighlight %}

Para utilizar, basta incluir esse arquivo e *chamar* as funções-membro estáticas da union, exemplo: `conv::funcao_membro(param);`:

> `main.cpp`

{% highlight cpp %}
#include <iostream>
#include "convert.hpp"

int main(){
  std::cout << conv::bin_to_ascii("01001111 01101011") << '\n';
  std::cout << conv::ascii_to_bin("Ok") << '\n';
  std::cout << conv::bin_to_hex("01001111 01101011") << '\n';
  std::cout << conv::ascii_to_hex("Ok") << '\n';
}
{% endhighlight %}

Possível e provável saída:
{% highlight sh %}
Ok
01001111 01101011
4F6B
4F6B
{% endhighlight %}

Se quiser adicionar mais conversões, por exemplo, para: **decimal** e **octal**, será um bom exercício. Não pus no [GitHub](https://github.com/terroo) porque é só um arquivo básico! 😃 

### Aprenda [C++](https://terminalroot.com.br/cpp): <https://terminalroot.com.br/>



