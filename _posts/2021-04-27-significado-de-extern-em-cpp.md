---
layout: post
title: "Significado de extern em C++"
date: 2021-04-27 09:42:14
image: '/assets/img/cppdaily/extern-cpp.jpg'
description: 'Ligações externas.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cppdaily
- cpp
---

![Significado de extern em C++](/assets/img/cppdaily/extern-cpp.jpg)

O especificador `extern` é usado nas declarações de variáveis e funções (exceto membros de classe ou parâmetros de função). Ele especifica a ligação externa e não afeta tecnicamente a duração do armazenamento, mas não pode ser usado em uma definição de um objeto de duração de armazenamento automático, portanto, todos os objetos `extern` têm durações estáticas ou de encadeamento.

Isso é útil quando você tem variáveis globais e declara a existência delas em um cabeçalho, de forma que cada arquivo de origem que inclui o cabeçalho saiba sobre ele, mas você só precisa "defini-lo" uma vez em um de seus arquivos de origem.

Exemplo, Suponhamos que você tenha 3 arquivos e fará link de dois arquivos:

`vim global.hpp`
{% highlight cpp %}
#ifndef GLOBAL_H
#define GLOBAL_H

// qualquer arquivo que incluir esse cabeçalho será capaz de usar "var_global"
extern float var_global;

void the_func();

#endif
{% endhighlight %}

`vim global.cpp`
{% highlight cpp %}
#include <iostream>
#include "global.hpp"

void the_func(){
    // imprime a variável global:
    std::cout << var_global << '\n';
}
{% endhighlight %}

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


`vim main.cpp`
{% highlight cpp %}
#include "global.hpp"

// ela será definida aqui
float var_global;

int main(){
    var_global = 9.36f;
    the_func();
}
{% endhighlight %}

Após compilar a saída será: **9.36**, mas disponível para todos os arquivos.

Outra forma de uso da palavra-chave `extern` é para compilar projetos [C++](https://terminalroot.com.br/cpp) em [C](https://terminalroot.com.br/tags#linguagemc), por exemplo.

Suponhamos que você está escrevendo um plugin/extensão para um programa escrito C, mas está usando C++, então você pode alterar o contexto do seu código para [C](https://terminalroot.com.br/tags#linguagemc) .

Exemplo:

{% highlight cpp %}
#include <iostream>

extern "C" {
  namespace terroo {
    class DarthVader{
      public:
        DarthVader(){
          std::cout << "Eu sou o seu pai." << '\n';
        }
        ~DarthVader(){
          std::cout << "Nãããããããããooooooooo ..." << '\n';
        }
    };
  }
}

int main( int argc , char **argv ){
  terroo::DarthVader t;
  return 0;
}
{% endhighlight %}

Se um programa for escrito em [C](https://terminalroot.com.br/tags#linguagemc) ele funcionará com esse código, mesmo usando classes, construtores, destrutores, namespace,...

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

