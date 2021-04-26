---
layout: post
title: "Qual a diferença dos parâmetros && e & em C++"
date: 2021-04-26 09:15:27
image: '/assets/img/cppdaily/ee-comercial-cpp.png'
description: 'Implementado a partir do C++ 11 .'
icon: 'ion:terminal-sharp'
iconname: 'cpp::daily'
tags:
- cppdaily
- cpp
---

![Qual a diferença dos parâmetros && e & em C++](/assets/img/cppdaily/ee-comercial-cpp.png)


Nós já sabemos que o parâmetro `&` refere-se à referência em [C](https://terminalroot.com.br/tags#linguagemc)/[C++](https://terminalroot.com.br/cpp) , mas a partir do **C++11** podemos encontrar o `&&` e ele se refere ao valor ao outro lado da declaração.

De forma mais objetiva podemos dizer, por exemplo, que:
{% highlight cpp %}
&& = &
{% endhighlight %}

Equivale à:
{% highlight cpp %}
int x = 3;
{% endhighlight %}
> Lógico, os valores e tipos são de exemplo.

Mas em síntese, um é o `lvalue` e o outro o `rvalue` .

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

Em **C++03** (e antes), os temporários (denominados "*rvalues*", já que frequentemente ficam no lado direito de uma atribuição) foram concebidos para nunca serem modificáveis - assim como em [C](https://terminalroot.com.br/tags#linguagemc) - e foram considerados indistinguíveis dos tipos `const T&;`, no entanto, em alguns casos, os temporários podem ter sido modificados, um comportamento que foi até considerado uma brecha útil.

**C++11** adiciona um novo tipo de referência não `const` chamado de referência *rvalue* , identificado por `T&&`. Refere-se a temporários que podem ser modificados após serem inicializados, com o propósito de permitir "mover semântica".

---

# Exemplos de uso
+ Usando `&&` como parâmetro , vejamos as saída:
{% highlight cpp %}
#include <iostream>

void the_int( const int * && i ){
  std::cout << &i << '\n'; // endereço
  std::cout << i << '\n'; // cópia
  std::cout << *i << '\n'; // valor
}

int main(){
  int &&x = 3;
  the_int( &x );
  return 0;
}
{% endhighlight %}
> Ou seja, um ponteiro de um valor do rvalue, mas o ponteiro dele mesmo.

+ Mais um exemplo acima usando `string`

{% highlight bash %}
#include <iostream>

void the_string( const std::string * && ok ){
  std::cout << "Ok: " << *ok << '\n';
}

int main(){
  std::string && ok = "More ok!";
  the_string( &ok );
  return 0;
}
{% endhighlight %}
> Lógico que essa saída será somente o valor

---

Eu particularmente não vejo [nenhuma utilidade](https://stackoverflow.com/questions/8424064/what-does-mean-with-a-parameter-type-in-c) disso nos códigos que eu crio, mas esse artigo serve para sabermos o que significa quando vermos um **duplo 'e' comercial** em algum código e entendermos como eles são utilizados e quais valores retornados . 

E em resumo, de acordo como há na [descrição dessa sintaxe](https://en.wikipedia.org/wiki/C%2B%2B11#Rvalue_references_and_move_constructors) , o **C++ 11** conseguiu resolver o problema de cópias desnecessárias do **C++03** e anteriores, mas deve ser usado com [cuidado](https://stackoverflow.com/questions/5481539/what-does-t-double-ampersand-mean-in-c11) .

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

