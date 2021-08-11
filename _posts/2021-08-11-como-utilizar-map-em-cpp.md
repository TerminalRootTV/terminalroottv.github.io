---
layout: post
title: "Como utilizar std::map em C++"
date: 2021-08-11 11:16:50
image: '/assets/img/cppdaily/cpp-daily-episode42.jpg'
description: 'A STL é rica em disposições de tipo de conteúdo.'
icon: 'ion:terminal-sharp'
iconname: 'cpp::daily'
tags:
- cppdaily
---

![Como utilizar std::map em C++](/assets/img/cppdaily/cpp-daily-episode42.jpg)

# `std::map`
São contêineres associativos que armazenam elementos de forma mapeada. Cada elemento possui um valor-chave e um valor mapeado. 

> Estrutura: `std::map<Key,T,Compare,Allocator>` 

Para usar `std::map`
{% highlight cpp %}
#include <map>
{% endhighlight %}

Declarando o `std::map`, a chave será do tipo `const char*` e o valor `std::string`:
{% highlight cpp %}
std::map<const char*, std::string> mapa;
{% endhighlight %}

Atribuindo valores as chaves
{% highlight cpp %}
mapa["Marcos"] = "Oliveira";
mapa["Terminal"] = "Root";
{% endhighlight %}

Podemos duplicar as chaves, mas o valor agora será 'Root'
{% highlight cpp %}
mapa["Terminal"] = "Root";
mapa["Terminal"] = "User";
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


Imprimindo os valores
{% highlight cpp %}
std::cout << mapa["Marcos"] << '\n';
std::cout << mapa["Terminal"] << '\n';
{% endhighlight %}

Obter o tamanho do *mapa*
{% highlight cpp %}
std::cout << mapa["Terminal"].size() << '\n';
{% endhighlight %}

Se quiser imprimir letras separadas:
{% highlight cpp %}
std::cout << mapa["Marcos"][1] << '\n'; // Saída: l
{% endhighlight %}

Imprimindo valores em um loop, caso precise para alguma aplicação
{% highlight cpp %}
for( auto m : mapa["Terminal"]  ){
  std::cout << m;
}
{% endhighlight %}

Todo o código dos exemplos acima com a saída final:
{% highlight cpp %}
i#include <iostream>
#include <map>

int main(){
  std::map<const char*, std::string> mapa;
  
  mapa["Marcos"] = "Oliveira";
  mapa["Terminal"] = "Root";

  mapa["Terminal"] = "User";
  
  std::cout << mapa["Marcos"] << '\n';
  std::cout << mapa["Terminal"].size() << '\n';
  
  std::cout << mapa["Marcos"][1] << '\n'; // Saída: l

  for( auto m : mapa["Terminal"]  ){
    std::cout << m;
  }

  std::cout << '\n';
  return 0;
}
{% endhighlight %}
> Saída final:
{% highlight bash %}
Oliveira
4
l
User
{% endhighlight %}

Além do `size()` outras funções que podem ser aplicadas: `begin`, `cbegin`, `cend`, `clear`, `contains`, `count`, `crbegin`, `crend`, `emplace`, `emplace_hint`, `empty`, `end`, `erase`, `find`, `insert`, `lower_bound`, `max_size`, `rbegin`, `rend`, `swap` e `upper_bound`.

A diferença entre `begin()` e `cbegin()` é que o `begin()` pode retornar um iterador ou um iterador constante, mas o `cbegin()` só retorna o iterador CONSTANTE . A mesma regra vale para os outros que possui esse **c** na frente .

O `clear()`, limpa o *mapa* retornando ao zero.

O `empty()` serve para verificar se está vazio ou não.

O `emplace()` insere em uma posição específica, assim como o `insert()` a diferença é o tipo de operação. E o `emplace_hint()` para tipos não modificáveis/irreversíveis .

Para mais informações sugiro ver [esse link](https://en.cppreference.com/w/cpp/container/map).

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


<!--
Others references:
- map: <https://github.com/Bhupesh-V/30-seconds-of-cpp#map>
-->
