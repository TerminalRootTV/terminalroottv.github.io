---
layout: post
title: "Como utilizar o clang-tidy para C++"
date: 2023-08-08 19:59:12
image: '/assets/img/cpp/clang-tidy.jpg'
description: 'Um linter prático e eficiente!'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
- clang
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Em um dos artigos aqui do blog nós publicamos sobre o [clang-format](https://terminalroot.com.br/2023/07/formate-seu-codigo-com-clang-format.html), hoje vamos conhecer outra ferramenta da coleção de aplicativos do [Clang](https://terminalroot.com.br/tags#clang)/[LLVM](https://terminalroot.com.br/tags#llvm): `clang-tidy`.

**Clang-Tidy** é um [linter](https://en.wikipedia.org/wiki/Lint_(software)) para [C++](https://terminalroot.com.br/tags#cpp). Sua finalidade é fornecer uma estrutura extensível para diagnosticar e corrigir erros típicos de programação, como violações de estilo, uso indevido de interface ou bugs que podem ser deduzidos por meio de análise estática.

Para instalar o `clang-tidy` basta usar os mesmos procedimentos descritos [no artigo do clang-format](https://terminalroot.com.br/2023/07/formate-seu-codigo-com-clang-format.html).

---

# Usabilidade
A maneira mais simples de verificar seu código com `clang-tidy` é: suponhamos que você possui o código abaixo que imprime um ponteiro em vez da referência ou o dado propriamente dito:
> `main.cpp`

{% highlight cpp %}
#include <iostream>

int main(){
  const char* str {};
  std::cout << *str << '\n';
}
{% endhighlight %}
> Mesmo que você compile com os devidos parâmetros do seu compilador para detectar falhas não conseguirá detectar o `warning`.

Usando o comando abaixo com `clang-tidy` você poderá detectar:
{% highlight bash %}
clang-tidy main.cpp -- -Imy_project/include -DMY_DEFINES ...
{% endhighlight %}

Vai aparecer a saída:
{% highlight bash %}
1 warning generated.
main.cpp:5:16: warning: Dereference of null pointer (loaded from variable 'str') [clang-analyzer-core.NullDereference]
  std::cout << *str << '\n';
               ^~~~
main.cpp:4:3: note: 'str' initialized to a null pointer value
  const char* str {};
  ^~~~~~~~~~~~~~~
main.cpp:5:16: note: Dereference of null pointer (loaded from variable 'str')
  std::cout << *str << '\n';
               ^~~~
{% endhighlight %}

**clang-tidy** tem suas próprias verificações e também pode executar verificações do *Clang Static Analyzer*. Cada verificação tem um nome e as verificações a serem executadas podem ser escolhidas usando a opção `-checks=`, que especifica uma lista separada por vírgulas e `-`, por exemplo:

{% highlight bash %}
clang-tidy main.cpp -checks=-*,clang-analyzer-*,-clang-analyzer-cplusplus*
{% endhighlight %}
> Esse comando desabilitará todas as verificações padrão (`-*`) e habilitará todas `clang-analyzer-*` exceto `clang-analyzer-cplusplus*`.

---

Em resumo, é uma ferramenta útil e utilizada como padrão na maioria das configurações para [LSP](https://terminalroot.com.br/2021/11/lsp-autocomplete-e-machine-learning-neovim-com-lua.html).

Para mais informações use `clang-tidy --help` e leia a [documentação oficial](https://clang.llvm.org/extra/clang-tidy/).

## Algumas alternativas ao `clang-tidy`:
+ [CppCheck](https://terminalroot.com.br/2023/04/como-fazer-analise-estatica-de-c-cpp-com-cppcheck.html)
+ [flint++](https://github.com/JossWhittle/FlintPlusPlus)
+ [cpplint](https://github.com/google/styleguide/tree/gh-pages/cpplint)
+ [Frama-C](https://www.frama-c.com/)
+ E entre [outros](https://analysis-tools.dev/tool/clang-tidy).



