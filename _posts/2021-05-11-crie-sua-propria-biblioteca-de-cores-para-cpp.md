---
layout: post
title: "Crie sua própria biblioteca de cores para C++"
date: 2021-05-11 11:02:12
image: '/assets/img/cppdaily/colors-lib-cpp.jpg'
description: 'Básico e útil!'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cppdaily
- cpp
---

![Crie sua própria biblioteca de cores para C++](/assets/img/cppdaily/colors-lib-cpp.jpg)

Muitas vezes queremos tornar nossas aplicações do terminal mais recheada de detalhes e cores são importantes.

É meio estranho ficar digitando toda hora vários caracteres somente para gerar cores, então é legal já ter uma `lib` pra isso.

Nesse [cpp::daily](https://terminalroot.com.br/tags#cppdaily) de hoje vou mostrar uma dica simples, mas que pode ser usada de serventia para diversas outras situações.

No terminal [UNIX-Like](https://terminalroot.com.br/tags#unix) as cores são separadas pelos números:

| COR      | NÚMERO |
|----------|--------|
| cinza    | 30     |
| vermelho | 31     |
| verde    | 32     |
| amarelo  | 33     |
| azul     | 34     |
| roxo     | 35     |
| ciano    | 36     |
| branco   | 37     |

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Bem como também o estilo pode ser customizado, por exemplo:
+ `0` normal
+ `1` **negrito**
+ `2` <span style="color:gray;">tom fraco</span>
+ `3` *itálico*
+ `4` <u>sublinhado</u>
+ `5` <blink>piscando<blink>
+ `6` NULL
+ `7` <span style="background:white;color:#000;">cor de fundo</span>
+ `8` NULL
+ `9` ~~strike~~

Podemos declarar os tipos como constante até por questões de desempenho e usar palavrar em inglês que são mais curtas, exemplo:
{% highlight cpp %}
const char * red = "31";
{% endhighlight %}

É legal também informar o estilo com uma única letra ao final do nome da cor para ficar simples a implementação, exemplo: `redn`(red **n**egrito), `reds`(**s**ublinhado) e assim por diantes, em resumo seria:
{% highlight cpp %}
red  = "\e[31;10m", // normal
redn = "\e[31;1m", // negrito
redf = "\e[31;2m", // fraco
redi = "\e[31;3m", // itálico
reds = "\e[31;4m", // sublinhado
redp = "\e[31;5m", // piscando
redb = "\e[31;7m", // background
redc = "\e[31;9m", // cancelado
{% endhighlight %}

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


Usar um `namespace` em um arquivo `colors.hpp`, curto para ocupar menos espaço, exemplo: `hey` e criar um `off` para desligar as cores:
{% highlight cpp %}
std::cout << hey::red << "Olá, mundo!" << hey::off << '\n';
{% endhighlight %}

E sempre que quisermos usar basta incluir nossa `lib`, exemplo:
{% highlight cpp %}
#include <iostream>
#include "colors.hpp"

int main( int argc , char **argv ){
  std::cout << hey::blue << "Terminal Root" << hey::off << '\n';
  return 0;
}
{% endhighlight %}
> Saída:
![Cores C++](/assets/img/cppdaily/colors-lib-cpp-1.jpg)

Para exemplo para todas as cores e estilos seria:
{% highlight cpp %}
#include <iostream>
#include "colors.hpp"

int main( int argc , char **argv ){
  std::cout << hey::gray << "Terminal Root" << hey::off << '\n';
  std::cout << hey::redn << "Terminal Root" << hey::off << '\n';
  std::cout << hey::greenf << "Terminal Root" << hey::off << '\n';
  std::cout << hey::yellowi << "Terminal Root" << hey::off << '\n';
  std::cout << hey::blues << "Terminal Root" << hey::off << '\n';
  std::cout << hey::purplep << "Terminal Root" << hey::off << '\n';
  std::cout << hey::cyanb << "Terminal Root" << hey::off << '\n';
  std::cout << hey::whitec << "Terminal Root" << hey::off << '\n';
  return 0;
}
{% endhighlight %}
> Saída:
![Cores C++](/assets/img/cppdaily/colors-lib-cpp-2.jpg)

Lembrando que se você alterou o tema de cores do seu terminal, pode ser que haja algumas alterações na exibição das cores, no meu exemplo:

![Cores C++](/assets/img/cppdaily)

Resumindo o código final seria assim:
> Usei `std::string` pode condiz mais com nosso caso.

Arquivo `vim colors.hpp`
{% highlight cpp %}
#ifndef COLORS_H
#define COLORS_H
#include <iostream>

namespace hey {
                    
  const std::string gray  = "\e[30;10m", // normal
                    grayn = "\e[30;1m", // negrito
                    grayf = "\e[30;2m", // fraco
                    grayi = "\e[30;3m", // itálico
                    grays = "\e[30;4m", // sublinhado
                    grayp = "\e[30;5m", // piscando
                    grayb = "\e[30;7m", // background
                    grayc = "\e[30;9m", // cancelado

                    red  = "\e[31;10m", // normal
                    redn = "\e[31;1m", // negrito
                    redf = "\e[31;2m", // fraco
                    redi = "\e[31;3m", // itálico
                    reds = "\e[31;4m", // sublinhado
                    redp = "\e[31;5m", // piscando
                    redb = "\e[31;7m", // background
                    redc = "\e[31;9m", // cancelado

                    green  = "\e[32;10m", // normal
                    greenn = "\e[32;1m", // negrito
                    greenf = "\e[32;2m", // fraco
                    greeni = "\e[32;3m", // itálico
                    greens = "\e[32;4m", // sublinhado
                    greenp = "\e[32;5m", // piscando
                    greenb = "\e[32;7m", // background
                    greenc = "\e[32;9m", // cancelado

                    yellow  = "\e[33;10m", // normal
                    yellown = "\e[33;1m", // negrito
                    yellowf = "\e[33;2m", // fraco
                    yellowi = "\e[33;3m", // itálico
                    yellows = "\e[33;4m", // sublinhado
                    yellowp = "\e[33;5m", // piscando
                    yellowb = "\e[33;7m", // background
                    yellowc = "\e[33;9m", // cancelado

                    blue  = "\e[34;10m", // normal
                    bluen = "\e[34;1m", // negrito
                    bluef = "\e[34;2m", // fraco
                    bluei = "\e[34;3m", // itálico
                    blues = "\e[34;4m", // sublinhado
                    bluep = "\e[34;5m", // piscando
                    blueb = "\e[34;7m", // background
                    bluec = "\e[34;9m", // cancelado

                    purple  = "\e[35;10m", // normal
                    purplen = "\e[35;1m", // negrito
                    purplef = "\e[35;2m", // fraco
                    purplei = "\e[35;3m", // itálico
                    purples = "\e[35;4m", // sublinhado
                    purplep = "\e[35;5m", // piscando
                    purpleb = "\e[35;7m", // background
                    purplec = "\e[35;9m", // cancelado

                    cyan  = "\e[36;10m", // normal
                    cyann = "\e[36;1m", // negrito
                    cyanf = "\e[36;2m", // fraco
                    cyani = "\e[36;3m", // itálico
                    cyans = "\e[36;4m", // sublinhado
                    cyanp = "\e[36;5m", // piscando
                    cyanb = "\e[36;7m", // background
                    cyanc = "\e[36;9m", // cancelado

                    white  = "\e[38;10m", // normal
                    whiten = "\e[38;1m", // negrito
                    whitef = "\e[38;2m", // fraco
                    whitei = "\e[38;3m", // itálico
                    whites = "\e[38;4m", // sublinhado
                    whitep = "\e[38;5m", // piscando
                    whiteb = "\e[38;7m", // background
                    whitec = "\e[38;9m", // cancelado

                    off = "\e[m"; // desliga
}

#endif

{% endhighlight %}

Lembrando que já existem bibliotecas que fazem isso, exemplos:
+ [rang](https://github.com/agauniyal/rang)
+ [color](https://github.com/dmilos/color)
+ [cpp-colors](https://github.com/gchudnov/cpp-colors)
+ E entre outros.

O código pode ser que esteja um pouco mais complicado, talvez para não parecer simples pra você, mas o resultado final é o mesmo!

Legal, né?!

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




