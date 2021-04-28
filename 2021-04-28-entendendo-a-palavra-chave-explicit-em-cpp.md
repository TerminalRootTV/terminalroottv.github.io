---
layout: post
title: "Entendendo a palavra-chave explicit em C++"
date: 2021-04-28 09:07:04
image: '/assets/img/cppdaily/explicit-cpp.png'
description: 'Carrega o tipo correto do construtor .'
icon: 'ion:terminal-sharp'
iconname: 'cpp::daily'
tags:
- cppdaily
---

![Entendendo a palavra-chave explict em C++](/assets/img/cppdaily/explicit-cpp.png)

Especifica que um **construtor** ou função de conversão (desde **C++ 11**) é explícito, ou seja, não pode ser usado para conversões implícitas e inicialização de cópia . 

Vamos à um exemplo, você possui o seguinte código:
> A função `do_something` recebe um parâmetro do tipo `TerminalRoot`, mas o compilador converte automaticamente para `int`:

{% highlight cpp %}
#include <iostream>

class TerminalRoot {
  public:
    TerminalRoot( int num ) : m_var( num ){}

    int get_var(){
      return m_var;
    }

  private:
    int m_var;
};

void do_something( TerminalRoot terroo ){
  int x = terroo.get_var();
  std::cout << "O tipo é: " << typeid( x ).name() << '\n';
}

int main(){
  do_something( 963 );
  return 0;
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


E você não quer isso, você quer o que o tipo correto seja passado, pois você quer saber se há *bug* nesse tipo. Então você usa a palavra-chave `explicit`, mas ao compilar há um erro ao compilar:
{% highlight cpp %}
#include <iostream>

class TerminalRoot {
  public:
    explicit TerminalRoot( int num ) : m_var( num ){}

    int get_var(){
      return m_var;
    }

  private:
    int m_var;
};

void do_something( TerminalRoot terroo ){
  int x = terroo.get_var();
  std::cout << "O tipo é: " << typeid( x ).name() << '\n';
}

int main(){
  do_something( 963 );
  return 0;
}
{% endhighlight %}
> E então obtém o erro:
{% highlight bash %}
error: could not convert ‘963’ from ‘int’ to ‘TerminalRoot’
{% endhighlight %}
> Não pode converter `int` para `TerminalRoot`

Logo, você precisa passar o tipo correto agora:
> `do_something( TerminalRoot( 963 ) );`

{% highlight cpp %}
#include <iostream>

class TerminalRoot {
  public:
    explicit TerminalRoot( int num ) : m_var( num ){}

    int get_var(){
      return m_var;
    }

  private:
    int m_var;
};

void do_something( TerminalRoot terroo ){
  int x = terroo.get_var();
  std::cout << "O tipo é: " << typeid( x ).name() << '\n';
}

int main(){
  do_something( TerminalRoot( 963 ) );
  return 0;
}
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


A saída é **i**( de int ), mas você passou o tipo correto e verificou que ele está funcionando . Para mais informações consulte o link: <https://en.cppreference.com/w/cpp/language/explicit> .

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

