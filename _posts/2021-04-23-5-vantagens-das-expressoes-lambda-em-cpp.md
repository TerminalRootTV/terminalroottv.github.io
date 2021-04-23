---
layout: post
title: "5 vantagens das expressões lambda em C++"
date: 2021-04-23 12:51:11
image: '/assets/img/cppdaily/lambda.png'
description: 'Lambda é um dos recursos mais notáveis do C++ Moderno.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![5 vantagens das expressões lambda em C++ e como elas tornam seu código melhor](/assets/img/cppdaily/lambda.png)

Lambda é um dos recursos mais notáveis do [C++ Moderno](https://terminalroot.com.br/cpp/).

Se você ainda não sabe como utilizar lambda, veja antes esse artigo:
## [10 exemplos de uso de Funções Lambda em C++](https://terminalroot.com.br/2021/04/10-exemplos-de-uso-de-funcoes-lambda-em-cpp.html)

Neste artigo, você aprenderá cinco vantagens do Lambdas. E para esse artigo utilizaremos técnicas já informadas em [artigos anteriores do cpp::daily](https://terminalroot.com.br/tags#cppdaily), tais como:
+ [std::placeholders e std::bind](https://terminalroot.com.br/2021/04/stdbind-e-stdplaceholders.html)
+ [std::greateri e std::sort](https://terminalroot.com.br/2021/04/std-swap-std-greater-std-sort.html)
+ [std::count_if](https://terminalroot.com.br/2021/04/cppdaily-std-count-if.html)
+ [std::vector](https://terminalroot.com.br/2021/04/cpp-vector-bidimensional.html)
+ [std::logical_and](https://terminalroot.com.br/2021/04/std-logical-and-or-not.html)
+ [std::less_equal, std::variant e std::visit](https://terminalroot.com.br/2021/04/std-less-equal-variant-visit.html)
+ E sobre outros conceitos que serão tratados, bem como Lambdas, informamos com diversos exemplos nos nossos [Cursos de C++ Moderno](https://terminalroot.com.br/cpp/)

Vamos começar.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


---

# 1. Lambdas tornam o código mais legível
O primeiro ponto pode parecer bastante óbvio, mas é sempre bom apreciar o fato de que, desde o **C++ 11**, podemos escrever um código mais compacto.
Por exemplo, recentemente, encontrei alguns casos de **C++03/C++0x** com expressões de ligação e functores auxiliares predefinidos da **STL**.
Dê uma olhada no código:
{% highlight cpp %}
#include <algorithm>
#include <functional>
#include <vector>

int main() {
    using std::placeholders::_1;

    const std::vector<int> v { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
    const auto val = std::count_if(v.begin(), v.end(),
                               std::bind(std::logical_and<bool>(),
                               std::bind(std::greater<int>(),_1, 2),
                               std::bind(std::less_equal<int>(),_1,6)));

    return val;                                        
}
{% endhighlight %}

Veja execução do código no [@Compiler Explorer](https://godbolt.org/z/_9Ptzg) e note o valor da saída.

Agora vamos escrever esse mesmo código com Lambda:

{% highlight cpp %}
#include <algorithm>
#include <vector>

int main() {
    std::vector<int> v { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
    const auto val = std::count_if(v.begin(), v.end(), 
                        [](int v) { return v > 2 && v <= 6;});

    return val;                                        
}
{% endhighlight %}

Não apenas temos uma sintaxe mais curta para o objeto de função anônima, mas podemos até mesmo reduzir uma instrução de inclusão (já que não há mais necessidade de `<functional>`).

<!-- RETANGULO LARGO 2 -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:block; text-align:center;"
data-ad-layout="in-article"
data-ad-format="fluid"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="8549252987"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


---

# 2. Lambdas melhoram a localização do código
Em C++03, você tinha que criar funções ou functores que poderiam estar longe do lugar onde você os passava como objetos chamáveis.

Isso é difícil de mostrar em exemplos artificiais simples, mas você pode imaginar um grande arquivo de origem, com mais de mil linhas de código. A organização do código pode fazer com que os functores possam ser localizados em um lugar de um arquivo (por exemplo, no topo). Então, o uso de um functor poderia ser centenas de linhas adiante ou antes no código, se você quisesse ver a definição de um functor, você teria que navegar para um local completamente diferente no arquivo. Esse salto pode diminuir sua produtividade.

![Código imenso](/assets/img/cppdaily/jumping_source_code.png)

Lambdas melhoram não somente a localidade e legibilidade, mas também a parte de nomenclatura. Uma vez que lambdas são anônimas, não há necessidade de você selecionar o nome significativo para todas as suas pequenas funções ou functores.

---

# 3. Lambdas permitem armazenar estados facilmente
Vamos dar uma olhada em um caso em que você gostaria de modificar uma operação de comparação padrão para [std::sort](https://terminalroot.com.br/2021/04/std-swap-std-greater-std-sort.html) .

{% highlight cpp %}
#include <algorithm>
#include <iostream>
#include <vector>

int main() {
    std::vector<int> vec { 0, 5, 2, 9, 7, 6, 1, 3, 4, 8 };

    size_t contador = 0;
    std::sort(vec.begin(), vec.end(), [&contador](int a, int b) {
        ++contador;
        return a < b;
    });

    std::cout << "Número de comparações: " << contador << '\n';

    for (auto& v : vec){
      std::cout << v << ", ";
    }
    std::cout << '\n';

    return 0;
}
{% endhighlight %}
> Saída:
{% highlight bash %}
Número de comparações: 36
0, 1, 2, 3, 4, 5, 6, 7, 8, 9
{% endhighlight %}

Como você pode ver, podemos capturar uma variável local e usá-la em todas as invocações do comparador binário. Esse comportamento não é possível com funções regulares (a menos que você use globais, é claro), mas também não é direto com tipos de functores personalizados. Lambdas o tornam muito natural e também muito conveniente de usar.

No exemplo, capturei o `contador` por referência. Essa abordagem funciona, mas se seu lambda for executado de forma assíncrona ou em threads diferentes você precisará prestar atenção em problemas de oscilação e sincronização.

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


---

# 4. Lambdas permitem várias sobrecargas no mesmo lugar
Este é um dos exemplos mais legais não apenas relacionado a lambdas, mas também a vários recursos importantes do C++ Moderno (disponível principalmente em C++17).

{% highlight cpp %}
#include <iostream>
#include <string>
#include <variant>

template<class... Ts> struct overload : Ts... { using Ts::operator()...; };
template<class... Ts> overload(Ts...) -> overload<Ts...>;

int main() {
    std::variant<int, float, std::string> intFloatString { "Fala, Jão!" };
    std::visit(overload  {
        [](const int& i) { std::cout << "int: " << i; },
        [](const float& f) { std::cout << "float: " << f; },
        [](const std::string& s) { std::cout << "string: " << s; }
      },
      intFloatString
    );

    std::cout << '\n';
    return 0;
}
{% endhighlight %}

O exemplo acima é uma abordagem útil para construir um objeto que pode ser chamado com todas as sobrecargas possíveis para tipos de variantes em tempo real. O padrão sobrecarregado é conceitualmente equivalente à seguinte estrutura:

{% highlight cpp %}
struct PrintVisitor {
    void operator()(int& i) const {
        std::cout << "int: " << i; }

    void operator()(float& f) const {
        std::cout << "float: " << f;
    }

    void operator()(const std::string& s) const {
        std::cout << "string: " << s;
    }
};
{% endhighlight %}

É possível escrever um lambda genérico compacto que funcione para todos os tipos mantidos na variante. Isso pode suportar polimorfismo de tempo de execução com [std::variant e std::visit](https://terminalroot.com.br/2021/04/std-less-equal-variant-visit.html#stdvariant-e-stdvisit) .

{% highlight cpp %}
#include <variant>

struct Circle { void Draw() const { } };
struct Square { void Draw() const { } };
struct Triangle { void Draw() const { } };

int main(){
    std::variant<Circle, Square, Triangle> shape;
    shape = Triangle{};
    auto callDraw = [](auto& sh) { sh.Draw(); };
    std::visit(callDraw, shape);
}
{% endhighlight %}

Esta técnica é uma alternativa ao polimorfismo de tempo de execução baseado em funções virtuais. Aqui podemos trabalhar com tipos não relacionados. Não há necessidade de uma classe base comum. 

---

# 5. Lambdas ficam melhores a cada revisão do C++
Você pode pensar que lambdas foram introduzidos no C++11 e isso é tudo, nada mudou. Mas não é verdade.

Aqui está a lista dos principais recursos relacionados aos lambdas que obtivemos com os padrões C++ recentes:

+ C++14
 - Lambdas genéricas - você pode passar o argumento automático e, em seguida, o compilador expande esse código em um modelo de função.
 - Capturar com inicializador - com esse recurso, você pode capturar não apenas variáveis existentes do escopo externo, mas também criar novas variáveis de estado para lambdas. Isso também permitiu capturar apenas tipos móveis.

+ C++17
 - constexpr lambdas - em C++17 seus lambdas podem funcionar em um contexto constexpr!

+ C++20
 - Lambdas de modelo - melhorias nos lambdas genéricos que oferecem mais controle sobre o argumento do modelo de entrada.
 - Lambdas e conceitos - Lambdas também podem trabalhar com auto restrito e conceitos, então eles são tão flexíveis como functores como funções de template
 - Lambdas em contextos não avaliados - agora você pode criar um mapa ou um conjunto e usar um lambda como predicado.

Além de algumas coisas menores e correções.

---

Por hoje é só, são pequenas doses diárias que farão sempre nos manter antenado com o [C++](https://terminalroot.com.br/cpp/) !

## Acompanhe o [cpp::daily](https://terminalroot.com.br/tags#cppdaily)

# Deseja aprender [C++](https://terminalroot.com.br/cpp/) e criar seus programas Gráficos e para Terminal com portabilidade para Linux e Windows?
Então se inscreva nos nossos [Cursos de C++ Moderno](https://terminalroot.com.br/cpp/) . Você aprender criar:
- [Games](https://terminalroot.com.br/tags#games)
- [Ncurses](https://terminalroot.com.br/2021/02/crie-programas-graficos-no-terminal-com-cpp-e-ncurses.html)
- Interface Gráfica: [GTK+](https://terminalroot.com.br/2020/08/anjuta-o-melhor-ide-para-c-com-gtkmm.html) e [Qt](https://terminalroot.com.br/2021/02/gerencie-suas-contas-financeiras-pessoais-com-terminal-finances.html)
- Acesso à Banco de Dados([MySQL](https://terminalroot.com.br/mysql/) e SQLite) via [C++](https://terminalroot.com.br/cpp/)
- Padronização
- E muito mais!

Acesse o endereço:
# <https://terminalroot.com.br/cpp/> e saiba mais!

---

<!-- RETANGULO LARGO -->
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

Esse artigo foi baseado no artigo do [Bartek](https://www.bfilipek.com/2020/05/lambdasadvantages.html) como modificações e tradução feitas por [mim mesmo](http://github.com/terroo).




