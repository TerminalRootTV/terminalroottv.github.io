---
layout: post
title: "Conceito, Instalação e Exemplos de uso da biblioteca Boost"
date: 2024-07-08 08:35:31
image: '/assets/img/cpp/boost-cpp.jpg'
description: "⏱️  A Boost é Multiplataforma: Windows, macOS, GNU/Linux, BSD e qualquer outros sistema operacional e arquitetura."
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

[Boost](https://www.boost.org/) é um conjunto de bibliotecas para a linguagem de programação [C++](https://terminalroot.com.br/tags#cpp) que fornece suporte para tarefas e estruturas como álgebra linear, geração de números pseudoaleatórios, multithreading, processamento de imagens, expressões regulares e testes unitários. 

Ele contém **164 bibliotecas individuais** (a partir da versão `1.76`).

Todas as bibliotecas **Boost** são licenciadas sob a `Boost Software License` , projetada para permitir que o Boost seja usado com projetos de software livre e proprietário. 

Muitos dos fundadores do Boost estão no comitê de padrões C++(por isso, muitas vezes o site da Boost é visto como site do C++), e várias bibliotecas criadas pela Boost foram aceitas para incorporação no C++(Technical Report 1), tais como: 
+ [smart pointers](https://terminalroot.com.br/2022/08/entenda-ponteiros-inteligentes-em-cpp-smart-pointers.html); 
+ [thread](https://terminalroot.com.br/2021/08/entendendo-como-utilizar-async-em-cpp.html); 
+ [RegEx](https://terminalroot.com.br/2022/03/como-remover-tags-html-em-c-e-cpp-com-regex.html); 
+ [random](https://terminalroot.com.br/2021/06/gerando-numeros-para-mega-sena-com-cpp.html);
+ `ratio` e [std::tuple](https://terminalroot.com.br/2021/08/cpp-pair-e-tuple.html);
+ [std::filesystem](https://terminalroot.com.br/2024/06/usando-cpp-como-shell-script.html); 
+ [std::any](https://terminalroot.com.br/2024/06/utilize-stdany-do-cpp-moderno-nos-seus-projetos.html); 
+ [std::optional](https://terminalroot.com.br/2024/06/como-usar-o-stdoptional-em-cpp-moderno.html); 
+ [std::variant](https://terminalroot.com.br/2021/04/std-less-equal-variant-visit.html); 
+ [std::string_view](https://terminalroot.com.br/2021/12/10-exemplos-de-uso-de-stringview-em-cpp.html) 
E quase tudo, na verdade! 😃 

A comunidade Boost surgiu por volta de 1998, quando a primeira versão do padrão foi lançada. 

Os fundadores originais do Boost ainda estão ativos na comunidade, dentre eles há o [Nicolai Josuttis](https://www.instagram.com/p/CMVXF7Qg32w/), um escritor de [livros](https://terminalroot.com.br/tags#livros) de [C++](https://terminalroot.com.br/2022/03/10-livros-de-cpp-que-vale-a-pena-voce-ler.html) que eu tenho o prazer de possuir um dos livros dele: 📘 

![Livro do Nicolai Josuttis](/assets/img/cpp/livro-cpp.jpg) 


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

## Instalação

### No Windows
É interessante usar os gerenciadores de pacotes como: [Winget](https://github.com/microsoft/winget-cli), no entanto, a melhor opção é usar o [vcpkg](https://github.com/microsoft/vcpkg)

#### Usando vcpkg
vcpkg é um gerenciador de pacotes popular para [C++](https://terminalroot.com.br/tags#cpp) que facilita a instalação de bibliotecas, incluindo Boost.

+ Baixe e instale vcpkg:
Abra o PowerShell e execute os seguintes comandos para baixar e configurar o vcpkg:
> Instale o [Git](https://terminalroot.com.br/tags#git) de acordo com [esse artigo](https://terminalroot.com.br/2023/03/como-instalar-git-e-git-bash-no-windows.html).

{% highlight cmd %}
git clone https://github.com/microsoft/vcpkg.git
cd vcpkg
.\bootstrap-vcpkg.bat
{% endhighlight %}
Instale Boost usando `vcpkg`, ainda no PowerShell, execute o comando para instalar Boost:

{% highlight bash %}
.\vcpkg install boost
{% endhighlight %}

Integre vcpkg com seu ambiente de desenvolvimento. Para usar as bibliotecas instaladas pelo [vcpkg](https://terminalroot.com.br/2021/09/instale-o-vcpkg-um-gerenciador-de-pacotes-para-c-cpp.html), você precisa integrar vcpkg com seu ambiente de desenvolvimento. Para [Visual Studio](https://terminalroot.com.br/2021/12/os-32-melhores-ides-editores-de-texto-para-cpp.html), execute:

{% highlight bash %}
.\vcpkg integrate install
{% endhighlight %}
> Isso permite que o Visual Studio detecte automaticamente as bibliotecas instaladas pelo vcpkg.

### Outra forma de instalar Boost no Windows é usar o instalador oficial disponível no site do Boost:
+ <https://www.boost.org/doc/libs/1_85_0/more/getting_started/windows.html>
> Baixe a versão mais recente.

Extraia o conteúdo do arquivo `.zip` ou `.7z` para um diretório de sua escolha.

Compilar Boost (opcional):
Alguns módulos do Boost podem precisar ser compilados. Para compilar, abra o Command Prompt e navegue até o diretório do Boost. Em seguida, execute:

{% highlight bash %}
bootstrap.bat
.\b2
{% endhighlight %}
> Isso irá compilar os módulos necessários e criar os arquivos de biblioteca.

Configure o caminho do Boost no seu ambiente de desenvolvimento (como Visual Studio) para que ele possa localizar os arquivos de cabeçalho e as bibliotecas compiladas.

---

### No Ubuntu:
Para instalar a biblioteca **Boost** no [Ubuntu](https://terminalroot.com.br/tags#ubuntu) via *APT*, rode esses comando no seu [terminal](https://terminalroot.com.br/tags#terminal):

{% highlight bash %}
sudo apt update
sudo apt install libboost-all-dev
{% endhighlight %}
> Se você deseja instalar apenas módulos específicos do Boost, você pode instalar os pacotes individuais. Por exemplo, para instalar apenas o Boost.Filesystem e o Boost.System, você pode usar: `sudo apt install libboost-filesystem-dev libboost-system-dev`.

Depois de instalar a biblioteca Boost, você pode verificar a instalação conferindo a versão instalada:
{% highlight bash %}
dpkg -s libboost-all-dev | grep 'Version'
{% endhighlight %}

Agora vamos ver como usar a **Boost** com alguns exemplos!

---

### 01. Limpar espaços em branco no início e final de uma string
Sabe aquela função pronta do [PHP](https://terminalroot.com.br/tags#php) que você queiria que existisse na STL? Sim, aquela que remove espaços em branco, muito utilizada para tratar `input` do [HTML](https://terminalroot.com.br/tags#html)?

Na Boost, basta você incluir o *header*: `string.hpp` e usá-la, exemplo:

{% highlight cpp %}
#include <iostream>
#include <boost/algorithm/string.hpp>

int main() {
    std::string str = "     Hello, World!    ";
    boost::algorithm::trim(str);
    std::cout << "'" << str << "'" << std::endl;
    return 0;
}
{% endhighlight %}
> Lógico que você pode fazer essa façanha do zero com `algorithm` ou com `regex`, mas nada como ter ela prontinha só pra usar.

---

## 02. Converte uma string para um tipo específico ou vice-versa, de forma segura e conveniente.
E aquelas conversões que às vezes *enchem o saco*, na Boost basta incluir a `#include <boost/lexical_cast.hpp>` e usar:

{% highlight cpp %}
int i = boost::lexical_cast<int>("123");
std::string s = boost::lexical_cast<std::string>(456);
{% endhighlight %}
> Como nem todos os tipos são cambiáveis, o ideal é usá-la dentro de um `try catch`!


<!-- RECTANGLE LARGE -->
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Informat -->
<ins class="adsbygoogle"
style="display:block"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="2327980059"
data-ad-format="auto"
data-full-width-responsive="true"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

## 03. Substitui todas as ocorrências de um substring por outro.
Mais uma vez, o pessoal do [desenvolvimento web](https://terminalroot.com.br/tags#desenvolvimentoweb), amam usar essa funcionalidade. E isso na Boost basta incluir também a `#include <boost/algorithm/string.hpp>`:

{% highlight cpp %}
std::string s = "Hello World";
boost::algorithm::replace_all(s, "World", "Boost");
// s agora é "Hello Boost"
{% endhighlight %}

---

## 04. Cria funções e functors através de vinculação de argumentos.
Se você não entende ainda o porque de **vincular argumentos**, sugiro ler [esse artigo](https://terminalroot.com.br/2021/04/stdbind-e-stdplaceholders.html).

{% highlight cpp %}
auto f = boost::bind(std::plus<int>(), 1, 2);
int result = f(); // result é 3
{% endhighlight %}

Essas funções e classes são apenas uma pequena amostra da vasta funcionalidade que a biblioteca Boost oferece, tornando-a uma ferramenta poderosa e essencial para desenvolvedores C++.

Diversos softwares utilizam a Boost, dentre eles: [Asio](https://en.wikipedia.org/wiki/Asio_(C%2B%2B_library)), [Dlang](https://en.wikipedia.org/wiki/D_(programming_language)), [POCO](https://en.wikipedia.org/wiki/POCO_C%2B%2B_Libraries), [Red Programming Language](https://en.wikipedia.org/wiki/Red_(programming_language)) e muitos outros!

---

O endereço oficial do site da Boost é: <https://www.boost.org> e o repositório oficial da Boost no [GitHub](https://terminalroot.com.br/tags#github) pode ser encontrado no seguinte endereço: <https://github.com/boostorg/boost>. E mais links úteis: <https://boost-spirit.com/home/> e <https://en.wikipedia.org/wiki/Boost_(C%2B%2B_libraries)>.

