---
layout: post
title: "4 Formas diferentes de usar sleep() em C++"
date: 2021-08-24 10:09:37
image: '/assets/img/cpp/time-cpp.png'
description: 'Com exemplos de portabilidade para Linux e Windows.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
 - cpp
 - cppdaily
---

![5 Formas diferentes de usar sleep() em C++](/assets/img/cpp/time-cpp.png)

Fazer um código aguardar por certo tempo é uma prática utilizada por diversos programadores.

O [C++](https://terminalroot.com.br/cpp) dispões de múltiplas formas. Nesse artigo vamos ver algumas formas para [Linux](https://terminalroot.com.br/tags#linux) e também para [Windows](https://terminalroot.com.br/tags#windows) .

Vamos mostrar 5 exemplos em cada um deles para o código aguardar **2 segundos** em alguns casos utilizando também em **microssegundos** e **milisegundos** .

---

# 1º Utilizando `unistd.h`
Essa talvez seja a forma mais simples de todas, usando o cabeçalho `#include <unistd.h>`

{% highlight cpp %}
#include <unistd.h>
int main(){
  // 2 em segundos de sleep
  sleep(2);
  return 0;
}
{% endhighlight %}

Para mais informações rode o comando:
{% highlight bash %}
man 3 sleep
{% endhighlight %}

---


<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


# 2º Utilizando `std::chrono`
O `std::chrono` é uma coleção flexível de tipos que controlam o tempo com vários graus de precisão . Para esse exemplo vamos utilizar a função: `std::this_thread::sleep_for`, exemplo:

Informando o tempo em segundos:

{% highlight cpp %}
#include <chrono>
#include <thread>

int main(){
  // 2 em segundos de sleep
  std::this_thread::sleep_for( std::chrono::seconds(2) );
  return 0;
}
{% endhighlight %}

Informando o tempo de microssegundos

{% highlight cpp %}
#include <chrono>
#include <thread>

int main(){
  // 2 000 000 em MICROSEGUNDOS de sleep
  // equivale a 2 segundos
  std::this_thread::sleep_for( std::chrono::microseconds( 2000000 ) );
  return 0;
}
{% endhighlight %}

Ainda é possível usar: `minutes`, `milliseconds` e entre outros.

---

# 3º Utilizando `Windows.h`
Somente para [Windows](https://terminalroot.com.br/tags#windows) caso você queira criar soluções portáveis, seria assim mais ou menos:

{% highlight cpp %}
#ifdef _WIN32
#define WINDOWS_SYSTEM
#include <Windows.h>
#else
#include <unistd.h>
#endif

int main(){

#ifdef WINDOWS_SYSTEM
  Sleep( 2000000 );
#else
  usleep( 2000000 );
#endif

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

---

# 4º Utilizando a Biblioteca `boost`
A [boost.org](https://www.boost.org/) é uma coleção de bibliotecas úteis para [C++](https://terminalroot.com.br/cpp) que torna seus códigos com mais portabilidade.
> Verifique antes se possui ela instalada no seu sistema, apesar de eu achar difícil não possuir, pois muita coisa utiliza ela.

Para esse exemplo usamos `boost::posix_time`:

{% highlight cpp %}
#include <boost/thread.hpp>

int main(){
    // Somados aguarda 2 segundos

    // aguarda 1 segundo
    boost::this_thread::sleep( boost::posix_time::seconds(1) );
    // aguarda 1000 milisegundo = 1 segundo
    boost::this_thread::sleep( boost::posix_time::milliseconds(1000) );

    return 0;
}
{% endhighlight %}

Para compilar use as flags `-lboost_thread` e `-pthread` em conjunto, exemplo:
{% highlight bash %}
g++ -lboost_thread -pthread sleep.cpp
{% endhighlight %}

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

