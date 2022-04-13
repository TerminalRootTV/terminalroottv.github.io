---
layout: post
title: "Crie facilmente Tabelas no Terminal com C++"
date: 2022-04-13 07:55:46
image: '/assets/img/cppdaily/tabulate-cpp.jpg'
description: 'Uma biblioteca C++ que facilita o desenvolvimento dos seus aplicativos TUI.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
- tui
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Aplicativos TUI(Terminal User Interface) estão crescendo dia após dia. E para você exibir dados em tabela no terminal com cores e outros recursos, para desenvolvedores [C++]() há mais uma biblioteca muito simples de usar: **Tabulate** .

# Instalação
Para usar Tabulate em seus aplicativos, basta instalá-la no seu sistema e para isso você precisará das seguintes dependências:
> Geralmente programadores C++ já possuem todas elas instaladas, mas por via das dúvidas... 😃 

+ Compilador [C++](https://terminalroot.com.br/cpp): [g++](https://terminalroot.com.br/tags#gcc) ou [clang++](https://terminalroot.com.br/tags#clang)
+ [CMake](https://terminalroot.com.br/tags#cmake)
+ [GNU Make](https://terminalroot.com.br/tags#make)
+ [Git](https://terminalroot.com.br/tags#git)

Após isso é só clonar e instalar com os seguintes comandos:

{% highlight sh %}
git clone https://github.com/p-ranav/tabulate
cd tabulate
cmake .
sudo make install
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

# Utilização
Existem diversas formas de aplicar o Tabulate no seu código, no entanto, a forma mais básica seria:
+ Incluir a biblioteca: `#include <tabulate/table.hpp>`
+ Utilizar o *namespace* diretamente ou com *using*: `using namespace tabulate;`
+ Instanciar a clase: `Table table;`
+ E usar o código conforme necessidade.

Nesse exemplo básico imprimimos duas células com larguras predefinidas de acordo como desejar:

> `vim main.cpp`
{% highlight cpp %}
#include <tabulate/table.hpp>
using namespace tabulate;

int main() {
  Table table;

  table.add_row({"This paragraph contains a veryveryveryveryveryverylong word. The long word will "
                 "break and word wrap to the next line.",
                 "This paragraph \nhas embedded '\\n' \ncharacters and\n will break\n exactly "
                 "where\n you want it\n to\n break."});

  table[0][0].format().width(20);
  table[0][1].format().width(50);

  std::cout << table << std::endl;
}
{% endhighlight %}

Para compilar não precisa de nenhuma *flag* adicional, exemplo: 
{% highlight sh %}
g++ main.cpp
./a.out
{% endhighlight %}

Possível saída:
{% highlight txt %}
+--------------------+--------------------------------------------------+
| This paragraph     | This paragraph                                   |
| contains a         | has embedded '\n'                                |
| veryveryveryveryv- | characters and                                   |
| eryverylong word.  | will break                                       |
| The long word will | exactly where                                    |
| break and word     | you want it                                      |
| wrap to the next   | to                                               |
| line.              | break.                                           |
+--------------------+--------------------------------------------------+
{% endhighlight %}

Note que para imprir a tabela você deve usar o `std::cout << nome_da_tabela << '\n';` . E para adicionar recursos, formatação, cores e outros você pode fazer união na instância da sua classe, por exemplo, adicionar cor seria : `table[0][0].format().font_color(Color::yellow);`, nesse caso de acordo com o exemplo acima o `[0][0]` indica que a saída da célula à esquerda terá agora a cor amarela .

---

# Mais exemplos
Para um exemplo mais detalhado você pode usar o diretório **samples/** , exemplo:
{% highlight sh %}
g++ tabulate/samples/summary.cpp
./a.out
{% endhighlight %}

A possível saída será:

![Summary Tabulate C++](/assets/img/cppdaily/tabulate.jpg) 

Se quiser desinstalar o Tabulate, rode:
{% highlight cpp %}
sudo rm -rf /usr/local/lib64/cmake/tabulate /usr/local/include/tabulate
{% endhighlight %}

Para mais exemplos e informações acesse o [repositório oficial](https://github.com/p-ranav/tabulate) .

# Aprenda C++, acesse: <https://terminalroot.com.br/cpp> .
# Aprenda Desenvolvimento de Games com C++ e SFML: <https://terminalroot.com.br/games>


