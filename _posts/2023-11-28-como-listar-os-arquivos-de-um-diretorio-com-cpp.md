---
layout: post
title: "Como listar os arquivos de um diretório com C++"
date: 2023-11-28 22:22:59
image: '/assets/img/cpp/list-dir-cpp.jpg'
description: 'Utilizando C++ Moderno de forma simples.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Comumente quando estamos desenvolvendo nossas aplicações precisamos de tarefas corriqueiras para realizar o objetivo final do nosso projeto.

Uma das coisas mais frequentes, dentre outras, é listar arquivos de um diretório e geralmente recorremos a internet, no entanto, é muito simples de entender a lógica e fixarmos esse conceito para diminuirmos a perda de tempo realizando pesquisa.

Nessa dica rápida veremos como fazer isso de forma moderna com [C++](https://terminalroot.com.br/tags#cpp).


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

# Utilizando o `filesystem`
A biblioteca `filesystem` fornece recursos para executar operações em sistemas de arquivos e seus componentes, como caminhos, arquivos regulares e diretórios.

Ela foi originalmente desenvolvida pela [Boost](https://www.boost.org/) e na versão `C++` ela foi finalmente adotada pelo comitê para fazer parte da biblioteca padrão(STL).

Para usá-la incluiremos:
{% highlight cpp %}
#include <filesystem>
{% endhighlight %}

O `namespace` dela é muito grande, logo, é sempre interessante *reduzir* o caminho simplificando para `fs` somente, e isso é bom ser feito logo após a inclusão do cabeçalho:
{% highlight cpp %}
namespace fs = std::filesystem;
{% endhighlight %}
> Se estiver usando um [linter](https://terminalroot.com.br/2023/08/como-utilizar-o-clang-tidy-para-cpp.html), pode ser que ele acuse o *warning*: `■ Namespace alias decl 'fs' is unused (fix available)`, isso é porque declaramos, mas ainda não usamos no nosso código, porém já já usaremos!

Agora vamos criar uma *string* que armazenará a pasta/diretório que queremos listar os arquivos(ex.: `/path/to/directory`), para esse exemplos listaremos o diretório atual mesmo:
{% highlight cpp %}
std::string path = "./";
{% endhighlight %}

E para listar os arquivos usaremos um [Range-based for loop](https://en.cppreference.com/w/cpp/language/range-for) que também é carinhosamente confundido com [for-each](https://en.cppreference.com/w/cpp/algorithm/for_each) e percorremos nossa pasta utilizando um iterador nativo da `filesystem` que é o `directory_iterator()` e dentro do loop printaremos o elemento que nada mais é que o(s) arquivos do diretório, usando a função-mebro `path()`:
> Lembrando que se houver um subdiretório ele também listará.

{% highlight cpp %}
for (const auto &entry : fs::directory_iterator(path)){
  std::cout << entry.path() << '\n';
}
{% endhighlight %}

Após compilar normalmente e rodar, você notará os arquivos(e/ou diretórios, se houver) sendo listados.

Se quiser ter certeza que os arquivos estão sendo listado um de cada vez, você pode *pausar a exibição* com um [sleep](https://terminalroot.com.br/2021/08/quatro-formas-diferentes-de-usar-sleep-em-cpp.html):
{% highlight cpp %}
std::this_thread::sleep_for(std::chrono::seconds(1)); 
{% endhighlight %}
> Nesse caso haverá um atraso de 1 segundo na exibição.

O código completo é:
{% highlight cpp %}
#include <iostream>
#include <filesystem>
//#include <chrono>
//#include <thread>

namespace fs = std::filesystem;

int main(){
  std::string path = "./";

  for (const auto &entry : fs::directory_iterator(path)){
    std::cout << entry.path() << '\n';
    //std::this_thread::sleep_for(std::chrono::seconds(1)); 
  }

  return 0;
}
{% endhighlight %}
> A *pausa* está comentada!

---

# Exibindo na ordem
Suponhamos que você tenham diversos arquivos assim: `file1.jpg, file2.jpg,...file.10.jpg, ... file31.jpg`, ao listar eles não aparecerão em ordem alfabética.

Para resolver isso, além de respeitar a ordem das dezenas, adicione os cabeçalhos:
{% highlight cpp %}
#include <vector>
#include <algorithm>
#include <cctype> // isdigit
#include <sstream> // std::stringstream
{% endhighlight %}

Crie uma função com um [lambda](https://terminalroot.com.br/2021/04/10-exemplos-de-uso-de-funcoes-lambda-em-cpp.html) interna:
{% highlight cpp %}
bool num_str_cmp(const fs::path& x, const fs::path& y) {
  auto get_number = [](const fs::path& path) {
    auto str_num = path.stem().string();

    std::string num_part {};
    for (char c : str_num) {
      if (std::isdigit(c)) {
        num_part += c;
      }
    }

    return !num_part.empty() ? std::stoi(num_part) : 0;
  };

  return get_number(x) < get_number(y);
}
{% endhighlight %}

E agora ordene o [vector](https://terminalroot.com.br/2022/04/como-criar-sua-propria-classe-de-vectores-em-cpp.html) com [sort](https://terminalroot.com.br/2021/04/std-swap-std-greater-std-sort.html):
{% highlight cpp %}
std::vector<fs::path> files_in_dir;
std::copy(fs::directory_iterator(path), fs::directory_iterator(), std::back_inserter(files_in_dir));

std::sort(files_in_dir.begin(), files_in_dir.end(), num_str_cmp);

for (const auto &entry : files_in_dir){
  std::cout << entry << '\n';
}
{% endhighlight %}

Dessa forma resolveremos ambos os problemas: ordem alfabética e respeito das dezenas!

Código completo:
{% highlight cpp %}
#include <iostream>
#include <filesystem>
#include <vector>
#include <algorithm>
#include <cctype> // isdigit
#include <sstream> // std::stringstream

namespace fs = std::filesystem;

bool num_str_cmp(const fs::path& x, const fs::path& y) {
  auto get_number = [](const fs::path& path) {
    auto str_num = path.stem().string();

    std::string num_part {};
    for (char c : str_num) {
      if (std::isdigit(c)) {
        num_part += c;
      }
    }

    return !num_part.empty() ? std::stoi(num_part) : 0;
  };

  return get_number(x) < get_number(y);
}

int main(){
  std::string path = "./imgs";

  std::vector<fs::path> files_in_dir;
  std::copy(fs::directory_iterator(path), fs::directory_iterator(), std::back_inserter(files_in_dir));

  std::sort(files_in_dir.begin(), files_in_dir.end(), num_str_cmp);

  for (const auto &entry : files_in_dir){
    std::cout << entry << '\n';
  }

  return 0;
}
{% endhighlight %}

---

Para mais informações acesse: <https://en.cppreference.com/w/cpp/filesystem>.
<!-- https://stackoverflow.com/questions/612097/how-can-i-get-the-list-of-files-in-a-directory-using-c-or-c -->


