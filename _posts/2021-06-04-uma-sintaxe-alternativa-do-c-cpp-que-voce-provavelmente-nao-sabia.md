---
layout: post
title: "Uma sintaxe alternativa do C/C++ que você provavelmente não sabia"
date: 2021-06-04 09:20:20
image: '/assets/img/cppdaily/alternative-cpp.jpg'
description: 'E de quebra ainda saiba sobre a sintaxe Troll!'
icon: 'ion:terminal-sharp'
iconname: 'cpp::daily'
tags:
- cppdaily
- cpp
---

![Uma sintaxe alternativa do C/C++ que você provavelmente não sabia](/assets/img/cppdaily/alternative-cpp.jpg)

O código-fonte [C++](https://terminalroot.com.br/cpp) (e [C](https://terminalroot.com.br/tags#linguagemc)) pode ser escrito em qualquer conjunto de caracteres não [ASCII](https://en.wikipedia.org/wiki/ASCII) de 7 bits que inclua o conjunto de caracteres invariante [ISO 646:1983](https://en.wikipedia.org/wiki/ISO_646) .

No entanto, vários operadores e pontuações [C++](https://terminalroot.com.br/cpp) requerem caracteres que estão fora do conjunto de códigos ISO 646: `{, }, [, ], #, \, ^, |, ~`.

Para poder usar codificações de caracteres onde alguns ou todos esses símbolos não existem (como o [DIN 66003](http://de.wikipedia.org/wiki/DIN_66003) do alemão ), [C++](https://terminalroot.com.br/cpp) define as seguintes alternativas compostas de caracteres compatíveis com ISO 646.

| Padrão | Alternativo |
|--------|-------------|
| && | and |
| &= | and_eq |
| & | bitand |
| \| | bitor |
| ~ | compl |
| ! | not |
| != | not_eq |
| \|\| | or |
| \|= | or_eq |
| ^ | xor |
| ^= | xor_eq |
| { | <% |
| } | %> |
| [ | <: |
| ] | :> |
| # | %: |
| ## | %:%: |


<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


Sabendo disso você criar um código nesse estilo: `vim main.cpp`

{% highlight cpp %}
%:include <iostream>
 
struct X
<%
    compl X() <%%> // destructor
    X() <%%>
    X(const X bitand) = delete; // copy constructor
 
    bool operator not_eq(const X bitand other)
    <%
       return this not_eq bitand other;
    %>
%>;
 
int main(int argc, char* argv<::>) 
<%
    auto greet = <:bitand:>(const char* name)
    <%
        std::cout << "Olá " << name
                  << "! Você está executando o arquivo: " << argv<:0:> << '\n';
    %>;
 
    if (argc > 1 and argv<:1:> not_eq nullptr) <%
        greet(argv<:1:>);
    %> else <%
        greet("Anônimo");
    %>
%>
{% endhighlight %}

Se você compilar e rodar, a saída será:
{% highlight bash %}
g++ main.cpp -o alternativo
./alternativo Marcos
Olá Marcos! Você está executando o arquivo: ./alternativo
{% endhighlight %}

# Compatibilidade com C
As mesmas palavras são definidas na [linguagem de programação C](https://terminalroot.com.br/tags#linguagemc) no arquivo de inclusão `<iso646.h>` como macros. Porque em [C++](https://terminalroot.com.br/cpp) eles são integrados à linguagem.

Exemplo na linguagem C: `vim main.c`

{% highlight c %}
%:include <stdio.h>

int main(int argc, char* argv<::>)
<%
  
  char * name = "Anônimo";
  
  if( argc > 1 ){
   name = argv<:1:>;
  }

  printf("Olá, %s! Você está rodando do arquivo: %s\n", name, argv<:0:>);
  return 0;
%>
{% endhighlight %}

Compilando e rodando:
{% highlight bash %}
gcc main.c -o alternativo
./alternativo
Olá Anônimo! Você está executando o arquivo: ./alternativo
{% endhighlight %}

Ainda há os Trígrafos também, mas foram retirado do **C++17**, são eles:

| Primário | Tígrafo |
|----------|---------|
| { | ??< |
| } | ??> |
| [ | ??( |
| ] | ??) |
| # | ??= |
| \ | ??/ |
| ^ | ??' |
| \| | ??! |
| ~ | ??- |

# Curiosidade trolll-style
Macros são algo realmente assustadores, se você criar um header estilo isso: `vim troll.hpp`

{% highlight cpp %}
#include <iostream>
#define troll int
#define peido main
#define haha argc
#define bufa char
#define hehe argv
#define tchau std
#define nada cout
#define vo_fazer ::
#define lixo "Essa é a linguagem Troll!"
#define besteira endl
#define dane_se return
#define maluco 0
{% endhighlight %}

E incluir ele no seu source: `vim main.cpp`

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

{% highlight cpp %}
#include "troll.hpp"

troll peido (troll haha, bufa ** hehe) {
  tchau vo_fazer nada << lixo << tchau vo_fazer besteira;
  dane_se maluco;
}
{% endhighlight %}

E compilar, vai rodar seu código:

![Troll Language](/assets/img/cppdaily/troll.png)

Que loko, né?! Dá pra fazer também usando um única letra, exemplo: `#define e int`, `define ee main`, ... e assim por diante!

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

### Links Úteis
+ <https://en.cppreference.com/w/cpp/language/operator_alternative>
