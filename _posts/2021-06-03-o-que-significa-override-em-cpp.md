---
layout: post
title: "O que significa override em C++ ?"
date: 2021-06-03 12:51:32
image: '/assets/img/cppdaily/cpp-daily-episode32.jpg'
description: 'C++ é mais complexo do que imaginamos.'
icon: 'ion:terminal-sharp'
iconname: 'cpp::daily'
tags:
- cppdaily
---

![O que significa override em C++ ?](/assets/img/cppdaily/cpp-daily-episode32.jpg)

Nós já sabemos que podemos sobrecarregar(overload) as funções e funções-membro em [C++](https://terminalroot.com.br/cpp) assim como vimos no [Curso de C++ Moderno Avançado](https://terminalroot.com.br/cpp).

Mas nesse [cpp::daily](https://terminalroot.com.br/tags#cppdaily) de hoje vamos ver para que serve a palavra chave `override` e também `final` .

# Conceito
`override` é utilizado para especificar que uma função virtual substitui outra função virtual.

Em uma declaração ou definição de função-membro, o especificador de substituição garante que a função é virtual e está substituindo uma função virtual de uma classe base. O programa está mal formado (um erro de tempo de compilação é gerado) se isso não for verdade.

`override` é um identificador com um significado especial quando usado após declaradores de função de membro: caso contrário, não é uma palavra-chave reservada.

Supondo que você a seguinte struct ou classe com o seguinte conteúdo:

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

{% highlight cpp %}
#include <iostream>

struct Base {
  virtual void foo(){
    std::cout << "Eu sou a foo!" << '\n';
  }

  void bar(){
    std::cout << "Eu sou a bar" << '\n';
  }
};

struct Derivada : Base {
  virtual void foo(){
    std::cout << "Eu sou a foo 2!" << '\n';
  }

  void bar(){
    std::cout << "Eu sou a bar 2!" << '\n';
  }
};

int main(){
  Derivada d;
  d.foo();
  d.bar();
  return 0;
}
{% endhighlight %}
Isso compila normalmente mesmo se tornarmos a `foo()` da `Derivada` como `override`, exemplo:

{% highlight cpp %}
virtual void foo() override{
  std::cout << "Eu sou a foo 2!" << '\n';
}
{% endhighlight %}

Mesmo se você ainda altere para `const`:

{% highlight cpp %}
virtual void foo() const {
  std::cout << "Eu sou a foo 2!" << '\n';
}
{% endhighlight %}


Mas se você torná-la como `const override` ou a `bar()` como `override` o compilador não deixará passar.

{% highlight cpp %}
struct Derivada : Base {
  virtual void foo() const{
    std::cout << "Eu sou a foo 2!" << '\n';
  }

  void bar() override{
    std::cout << "Eu sou a bar 2!" << '\n';
  }
};
{% endhighlight %}

Mas se você tiver uma nova herdeira(neta) e a filha declarada como `final` e tentar reutilizá-la, essa substituição não será possível:

{% highlight cpp %}
#include <iostream>

struct Base {
  virtual void foo(){
    std::cout << "Eu sou a foo!" << '\n';
  }

  void bar(){
    std::cout << "Eu sou a bar" << '\n';
  }
};

struct Derivada : Base {
  virtual void foo() final{
    std::cout << "Eu sou a foo 2!" << '\n';
  }

  void bar() {
    std::cout << "Eu sou a bar 2!" << '\n';
  }
};

struct Outra : Derivada {
  virtual void foo() {
    std::cout << "Eu sou a foo 2!" << '\n';
  }

  void bar() {
    std::cout << "Eu sou a bar 2!" << '\n';
  }
};

int main(){
  Derivada d;
  d.foo();
  d.bar();
  return 0;
}
{% endhighlight %}
> Saída: `overriding final function`
{% highlight bash %}
error: virtual function ‘virtual void Outra::foo()’ overriding final function
virtual void foo() {
             ^~~
note: overridden function is ‘virtual void Derivada::foo()’
virtual void foo() final{
{% endhighlight %}

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

Tá, legal! Mas pra que serve isso ??? Só pra exibir erro ? Não, isso foi implementado no **C++11** com intuito de tornar seu código limpo, porque você queria criar uma função que duplicasse conteúdo existente? Iria "sobrecarregar", não é?! Então você pode descobrir se está ou não "reinventando a roda" simplesmente utilizando `override`.

Não tão simples de entender, mas fácil de perceber, né?!

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
+ <https://en.cppreference.com/w/cpp/language/override>
+ <https://en.cppreference.com/w/cpp/language/final>


