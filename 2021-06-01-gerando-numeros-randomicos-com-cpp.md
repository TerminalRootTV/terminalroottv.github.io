---
layout: post
title: "Gerando números randômicos com C++"
date: 2021-06-01 18:23:11
image: '/assets/img/'
description: 'Existem formas mais complexas e mais simples.'
icon: 'ion:terminal-sharp'
iconname: 'cpp::daily'
tags:
- cppdaily
---

![Gerando números randômicos com C++](/assets/img/)

No [Curso de C++](https://terminalroot.com.br/cpp) nós utilizamos outras técnicas mais complexas, mas que funciona desde o **C++11**, no entanto, hoje nesse [cpp::daily](https://terminalroot.com.br/tags#cppdaily) vamos mostrar casos mais simples, mais específicos e mais atuais.

# Sobre `std::rand`, `std::time`, `std::srand` e `std::experimental::randint`
`std::srand` tem o `std::time`(precisa incluir `<ctime>` e usa a hora atual como semente para o gerador aleatório) como parâmetro e semeia o gerador de número pseudo-aleatório usado por `std::rand()` que por sua vez retorna um valor integral pseudo-aleatório entre 0 e `RAND_MAX`, para saber o valor dele basta imprí-lo, exemplo:

{% highlight cpp %}
#include <iostream>
#include <ctime>

int main(){
  std::srand(std::time(nullptr));

  int numero_aleatorio = std::rand();
  int numero_ate_60 = std::rand() % 60;
  
  std::cout << "O número máximo é: " << RAND_MAX << '\n';
  std::cout << "Número aleatório até RAND_MAX: " << numero_aleatorio << '\n';
  std::cout << "Número aleatório até 60: " << numero_ate_60 << '\n';

  return 0;
}
{% endhighlight %}
> Os números randômicos são gerados em tempo de execução, ou seja, cada vez que for executado ou a cada vez que você chamar uma função com valor gerado a partir de `std::rand()` os números serão diferentes, a menos que você remova a linha: `std::srand(std::time(nullptr));` ou, no caso da função, se estiver usando `static`.

Se também quiser números também sem sinais, basta fazer um `casting`, exemplo: `std::srand(static_cast<unsigned>(time(nullptr)))`, meio inútil, mas só para informar.

Legal saber que podemos limitar o tamnho do número aleatório como no exemplo que usamos: `std::rand() % 60`, ou seja, imprime no máximo até 60, mas se quiséssemos uma range entre: 40 e 60, por exemplo ?

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


Lógico que poderíamos criar uma condição e somar ou subtrair de acordo com o valor do resultado dinamicamente.

Mas isso é um tanto quanto trabalhoso, então entra a tarefa do `std::experimental::randint`. Para usá-lo precisamos incluir o cabeçalho `<experimental/random>`, exemplo:

{% highlight cpp %}
#include <iostream>
#include <ctime>
#include <experimental/random>

int main(){
  std::srand(std::time(nullptr));

  int valor = std::experimental::randint(40,60);
  std::cout << "Número randômico entre 40 e 60: " << valor  << '\n';

  return 0;
}
{% endhighlight %}
> Se achar que o nome fica muito grande, tente resumir, ex.: `namespace rd = std::experimental;` e implementar: `rd::randint(5,10);`.

Alternativamente você pode usar o `std::srand` com `time` ZERO: `std::srand(time(0));` ou até mesmo sem a resolução de escopo: `srand(time(0));` e `rand() % num;`, exemplo:

{% highlight cpp %}
#include <iostream>
#include <ctime>

int main(){
  srand(time(0));
  int valor = rand() % 10;
  std::cout << "Número randômico até 10: " << valor  << '\n';
  return 0;
}
{% endhighlight %}

Simples, né?!

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

