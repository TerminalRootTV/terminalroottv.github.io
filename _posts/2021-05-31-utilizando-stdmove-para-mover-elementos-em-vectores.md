---
layout: post
title: "Utilizando std::move para mover elementos em vectores"
date: 2021-05-31 14:38:27
image: '/assets/img/cppdaily/cpp-daily-episode30.jpg'
description: 'Conceito muito utilizado no desenvolvimento de games.'
icon: 'ion:terminal-sharp'
iconname: 'cpp::daily'
tags:
- cppdaily
---

![Utilizando std::move para mover elementos em vectores](/assets/img/cppdaily/cpp-daily-episode30.jpg)

No [cpp::daily](https://terminalroot.com.br/tags#cppdaily) de hoje vamos conhecer um recurso muito utilizado no desenvolvimento de [games](https://terminalroot.com.br/tags#games).

# `std::move`
`std::move` é usado para indicar que um objeto `t` pode ser "movido de..para", ou seja, permitindo a transferência eficiente de recursos de `t` para outro objeto.

Em particular, `std::move` produz uma expressão *xvalue* que identifica seu argumento `t`. É exatamente equivalente a um `static_cast` para um tipo de referência *rvalue*.

Sua sintaxe é: `std::move(first,last,result)`.

# Exemplos de uso
Vamos supor que estamos criando um [jogo da velha](https://pt.wikipedia.org/wiki/Jogo_da_velha) e possuímos um `namespace` com a seguinte `struct` que armazena as coordenadas do nosso [game](https://terminalroot.com.br/tags#games):
{% highlight cpp %}
namespace terroo {
  struct Coordenadas {
    int x, y;
  };
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


E possuímos os vectores(`v1`, `v2` e `v3`) com as seguintes coordenadas:

{% highlight cpp %}
std::vector<terroo::Coordenadas> v1 = { {0,0}, {0,1}, {0,2} }, v2, v3;

for (size_t i = 0; i < v1.size(); ++i) {
  v2.push_back({1, v1[i].y}); 
  v3.push_back({2, v1[i].y}); 
}

for (size_t i = 0; i < v1.size(); ++i) {
  std::cout << v1[i].x << ',' << v1[i].y << ' '; 
}
{% endhighlight %}

A saída será:
{% highlight bash %}
0,0 0,1 0,2 
1,0 1,1 1,2 
2,0 2,1 2,2
{% endhighlight %}

Agora vamos supor que um jogador venceu marcando a diagonal da esquerda para a direita.

Utilizando `std::move` para a gente mover o `0,0` para o `1,1` e para o `2,3` usaríamos esse código:
{% highlight cpp %}
std::move(v1.begin(), v1.begin() + 1, v2.begin() + 1); // move 0,0 para 1,1
std::move(v1.begin(), v1.begin() + 1, v3.begin() + 2); // move 0,0 para 2,2
{% endhighlight %}

Rodando nosso código e exibindo as saída após o jogador ganhar seria:
{% highlight bash %}
0,0 0,1 0,2 
1,0 1,1 1,2 
2,0 2,1 2,2 
-----------
0,0 0,1 0,2 
1,0 0,0 1,2 
2,0 2,1 0,0 
{% endhighlight %}

Código completo criado para esse exemplo:

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
#include <iostream>
#include <vector>

namespace terroo {
  struct Coordenadas {
    int x, y;
  };
}

int main(){
  
  std::vector<terroo::Coordenadas> v1 = { {0,0}, {0,1}, {0,2} }, v2, v3;

  for (size_t i = 0; i < v1.size(); ++i) {
   v2.push_back({1, v1[i].y}); 
   v3.push_back({2, v1[i].y}); 
  }

  for (size_t i = 0; i < v1.size(); ++i) {
   std::cout << v1[i].x << ',' << v1[i].y << ' '; 
  }
  std::cout << '\n';

  for (size_t i = 0; i < v2.size(); ++i) {
   std::cout << v2[i].x << ',' << v2[i].y << ' '; 
  }
  std::cout << '\n';

  for (size_t i = 0; i < v3.size(); ++i) {
   std::cout << v3[i].x << ',' << v3[i].y << ' '; 
  }
  std::cout << '\n';

  std::cout << "------" << '\n';

  std::move(v1.begin(), v1.begin() + 1, v2.begin() + 1);
  std::move(v1.begin(), v1.begin() + 1, v3.begin() + 2);

  for (size_t i = 0; i < v1.size(); ++i) {
   std::cout << v1[i].x << ',' << v1[i].y << ' '; 
  }
  std::cout << '\n';

  for (size_t i = 0; i < v2.size(); ++i) {
   std::cout << v2[i].x << ',' << v2[i].y << ' '; 
  }
  std::cout << '\n';

  for (size_t i = 0; i < v3.size(); ++i) {
   std::cout << v3[i].x << ',' << v3[i].y << ' '; 
  }
  std::cout << '\n';

  return 0;
}
{% endhighlight %}

Muito simple, né?!

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








