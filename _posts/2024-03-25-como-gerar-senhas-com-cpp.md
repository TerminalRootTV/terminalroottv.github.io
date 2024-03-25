---
layout: post
title: "Como Gerar Senhas com C++"
date: 2024-03-25 17:03:31
image: '/assets/img/cpp/genpass.jpg'
description: 'Gerar senhas aleatórias é um dos exercícios iniciais para quem deseja avançar em segurança de sistemas.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Gerar senhas aleatórias é um dos exercícios iniciais para quem deseja avançar em segurança de sistemas. Nós já fizemos um artigo explicando como você pode gerar senhas, para mais detalhes leia a postagem completa: [23 Formas de Gerar e Guardar SENHAS FORTES; veja as explicações de comandos](https://terminalroot.com.br/2019/12/gerar-senha-linux.html).

Nesse artigo conheceremos a lógica de gerar senhas com [C++](https://terminalroot.com.br/tags#cpp). Será um código simples usando somente senhas alfanuméricas, mas você pode melhorar adicionando caracteres especiais para tornar o código ainda mais completo.

Vamos ao passo a passo!

---

# 01. Criar um arquivo *header* único
Nesse exemplo vamos organizar nosso código para caso quisermos adicionarmos futuramente para algum projeto, logo, criaremos um "*header* único"(só um arquivo: `.hpp`), ou seja, a classe e a execução no mesmo arquivo:
> `vim genpass.hpp`

{% highlight cpp %}
#pragma once
#include <iostream>
#include <memory> // Opcional

class GenPass {};
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

# 02. Adicionando o conteúdo
Vamos agora adicionar 2 membros *privados* para usarmos na nossa função-membro, são eles:
+ `std::string pass` - Que armazerará a string que será retornada para o objeto;
+ e `const std::string charset` - A constante que possuirá os caracteres alfanuméricos, tanto com minúsculas como MAIÚSCULAS, além dos números;

{% highlight cpp %}
#pragma once
#include <iostream>
#include <memory>

class GenPass {
  std::string pass;
  const std::string charset = "abcdefghijklmnopqrstuvwxyz"
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    "0123456789";
};
{% endhighlight %}

---

# 03. Adicionar a função-membro que retornará nossa senha
Essa função-membro receberá como argumento o tamanho da senha, você poderia escolher um valor mínimo padrão, mas vou deixar possível qualquer tamanho, mas é bom lembrar que senhas fortes possuem no mínimo 8 caracteres!

+ Ela reserva a quantidade de caracteres informada no argumento;
+ Inicializa o cronômetro para gerar a captura dos caracteres de `charset` de forma aleatória;
+ Incrementa ao membro `pass` o caractere até atingir o máximo informado no argumento;
+ Por final retorna o membro.

{% highlight cpp %}
std::string gen_pass(int length){
  this->pass.reserve(length);
  srand(static_cast<unsigned int>(time(nullptr)));
  for (int i = 0; i < length; ++i) {
    this->pass += this->charset[
      rand() % this->charset.length()
    ];
  }
  return pass;
}
{% endhighlight %}

---

# 04. Arquivo `genpass.hpp` final
Ao final nosso arquivo completo ficará assim:

{% highlight cpp %}
#pragma once
#include <iostream>
#include <memory>

class GenPass {
  std::string pass;
  const std::string charset = "abcdefghijklmnopqrstuvwxyz"
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    "0123456789";
  public:
  std::string gen_pass(int length){
    this->pass.reserve(length);
    srand(static_cast<unsigned int>(time(nullptr)));
    for (int i = 0; i < length; ++i) {
      this->pass += this->charset[
        rand() % this->charset.length()
      ];
    }
    return pass;
  }
};
{% endhighlight %}

---

# Implementando nosso *Gerador de Senhas* com [C++](https://terminalroot.com.br/cpp)
Vamos criar um novo arquivo `main.cpp` e incluiremos nosso `genpass.hpp`, e chamaremos a função-membro `gen_pass()` com a quantidade de caracteres que queremos que nossa senha possua, nesse exemplo: Gerando uma senha alfanumérica com 8 caracteres!

{% highlight cpp %}
#include "genpass.hpp"

int main(){
  auto g = std::make_unique<GenPass>();
  std::cout << g->gen_pass(8) << '\n';
  return 0;
}
{% endhighlight %}
> Compile e rode: `g++ main.cpp && ./a.out`. Provável e similar saída:
{% highlight bash %}
skkb8Bms
{% endhighlight %}

Se quiser gerar com: 16, 32, 64 e 128 caracteres, respectivamente:
{% highlight cpp %}
std::cout << g->gen_pass(16) << '\n';
std::cout << g->gen_pass(32) << '\n';
std::cout << g->gen_pass(64) << '\n';
std::cout << g->gen_pass(128) << '\n';
{% endhighlight %}

---

Simples e fácil, né?! Agora você já pode usar esse *header único* e adicionar aos seus projetos!

