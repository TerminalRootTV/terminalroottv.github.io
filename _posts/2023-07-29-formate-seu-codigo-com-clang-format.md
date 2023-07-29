---
layout: post
title: "Formate seu código com clang-format"
date: 2023-07-29 20:55:13
image: '/assets/img/cpp/clang-format.jpg'
description: 'Escolha o estilo: LLVM, GNU, Google, Chromium, Microsoft ou WebKit.'
icon: 'ion:terminal-sharp'
iconname: 'C/C++'
tags:
- clang
- llvm
- cpp
- linguagemc
- programacao
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Nós já publicamos um artigo que descreve detalhes do estilo de código no artigo:
+ [Conheça os detalhes dos Estilos de Indentação](https://terminalroot.com.br/2022/02/conheca-os-detalhes-dos-estilos-de-indentacao.html)

Já nesse artigo vamos conhecer uma ferramenta que formata nosso código de acordo com o estilo que desejamos, trata-se do: **clang-format**.

ClangFormat(`clang-format`) é um conjunto de ferramentas que usa **LibFormat** que formata seu código de várias maneiras, incluindo uma ferramenta autônoma e integrações de editor.


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

# Instalação
Para instalar o `clang-format` basta possuir a coleção de ferramentas do [LLVM](https://terminalroot.com.br/tags#llvm), [aqui nesse artigo](https://terminalroot.com.br/2023/01/como-instalar-o-clang-binario-em-qualquer-distro-gnu-linux.html) há o procedimento baixando o binário e instalando, mas você também pode usar o gerenciador de pacotes do seu sistema para obter, exemplos:

{% highlight bash %}
# Windows
winget install -e --id LLVM.LLVM

# macOS
brew install clang-format

# Debian, Ubuntu, Mint e derivados
sudo apt install clang-format

# Fedora
sudo dnf install clang-tools-extra

# Arch
sudo pacman -S clang-format-git # AUR

# Gentoo, Funtoo e outros
emerge clang
{% endhighlight %}

---

# Utilização
Suponhamos que você possua esse código [C++](https://terminalroot.com.br/tags#cpp): `main.cpp`:
{% highlight cpp %}
#include <iostream>
#include <memory>

typedef struct Model {
  std::string hello = "Hello";
} model;

int main(){
  auto m = std::make_unique<model>();
  m->hello = "World";
  std::cout << m->hello << '\n';
}
{% endhighlight %}

Ele está formatado da maneira que eu gosto, mas se eu quisesse transforma no padrão [GNU](https://terminalroot.com.br/tags#gnu) bastava rodar o seguinte comando:
{% highlight bash %}
clang-format -style=gnu main.cpp
{% endhighlight %}

A saída transforma meu código nesse estilo:
{% highlight cpp %}
#include <iostream>
#include <memory>

typedef struct Model
{
  std::string hello = "Hello";
} model;

int
main ()
{
  auto m = std::make_unique<model> ();
  m->hello = "World";
  std::cout << m->hello << '\n';
}
{% endhighlight %}
> Bem diferente a formatação, né?!

Se quiser salve para outro arquivo:
{% highlight bash %}
clang-format -style=GNU main.cpp > output.cpp
{% endhighlight %}

Há os estilos disponíveis: `llvm`, `google`, `chromium`, `microsoft`, `webkit` e outros.

Exemplos:
{% highlight bash %}
clang-format -style=llvm main.cpp 
clang-format -style=google main.cpp 
clang-format -style=microsoft main.cpp 
{% endhighlight %}

Você também pode salvar seu estilo preferido fazendo um dump em um arquivo de nome: `.clang-format` no caminho/diretório que estiver trabalhando. Para isso rode:
> Supondo que você prefere o estilo `gnu`.
{% highlight bash %}
clang-format -style=gnu -dump-config > .clang-format
{% endhighlight %}

O arquivo será similar ao conteúdo abaixo e note que é possível alterar as cofigurações de acordo como desejar:
{% highlight lua %}
---
Language:        Cpp
AccessModifierOffset: -2
AlignAfterOpenBracket: Align
AlignArrayOfStructures: None
AlignConsecutiveAssignments:
  Enabled:         false
  AcrossEmptyLines: false
  AcrossComments:  false
  AlignCompound:   false
  PadOperators:    true
AlignConsecutiveBitFields:
  Enabled:         false
  AcrossEmptyLines: false
  AcrossComments:  false
  AlignCompound:   false
  PadOperators:    false
AlignConsecutiveDeclarations:
  Enabled:         false
  AcrossEmptyLines: false
  AcrossComments:  false
  AlignCompound:   false
  PadOperators:    false
AlignConsecutiveMacros:
  Enabled:         false
  AcrossEmptyLines: false
  AcrossComments:  false
  AlignCompound:   false
  PadOperators:    false
AlignEscapedNewlines: Right
...
{% endhighlight %}
> O arquivo é bem maior, os `...` remete a isso!

Se você quiser formatar múltiplos arquivos `.cpp` use wildcard:
{% highlight bash %}
clang-format -i *.cpp
{% endhighlight %}
> O parâmetro `-i` modifica o arquivo.

E para modificar diversos arquivos incluindo os arquivos cabeçalho, use esse comando como exemplo:
{% highlight bash %}
find . -regex '.*\.\(cpp\|hpp\|cc\|c\|h\)' -exec clang-format -style=file -i {} \;
{% endhighlight %}

Se quiser incluir ao seu [Editor de Código/IDE](https://terminalroot.com.br/2021/12/os-32-melhores-ides-editores-de-texto-para-cpp.html) procure pelo nome correspondente na documentação do mesmo. No caso do [Vim](https://terminalroot.com.br/tags#vim)/[Neovim](https://terminalroot.com.br/tags#neovim) use o [vim-clang-format](https://github.com/rhysd/vim-clang-format).

Para mais informações acesse o `clang-format --help` e o [endereço oficial do `clang-format`](https://clang.llvm.org/docs/ClangFormat.html).

<!-- 
Link útil: https://leimao.github.io/blog/Clang-Format-Quick-Tutorial/
-->

