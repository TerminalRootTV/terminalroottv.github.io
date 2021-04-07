---
layout: post
title: "cpp::daily Loop for ranged-based"
date: 2021-04-07 11:15:46
image: '/assets/img/cppdaily/cpp-daily-episode3.jpg'
description: 'Episódio 003 .'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cppdaily
---

![cpp::daily Loop for ranged-based](/assets/img/cppdaily/cpp-daily-episode3.jpg)

O loop `for` *ranged-based* foi introduzido a partir do **C++11** e tem um desempenho um pouco melhor . Nem sempre é um caso há ser utilizado, mas sempre que puder use! Para programadores de outras linguagens p loop `for` *ranged-based* pode ser comparado ao *foreach* .

Nesse [cpp::daily](https://terminalroot.com.br/tags#cppdaily) de hoje vamos mostrar **5 exemplos** que facilitarão sua compreensão para poder utilizá-los sempre que necessário!

# 01. Foreach style
{% highlight cpp %}
for( int i : { 11, 2, 9, 17, 89, 12, 13, 52, 8, 4 } ){
  std::cout << i << '\n';
}
{% endhighlight %}

---

# 02. Com vectores e tipos automáticos
{% highlight cpp %}
std::vector<int> vec = { 11, 2, 9, 17, 89, 12, 13, 52, 8, 4 };
for( auto &elem : vec ){
  std::cout << elem << '\n';
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

---

# 03. Quando passado para templates de função
{% highlight cpp %}
#include <iostream>
#include <vector>

template <typename T>
void print( const T& coll ){
  for( auto &elem : coll ){
    std::cout << elem << ' ';
  }
  std::cout << '\n';
}

int main(){
  std::vector<int> vec = { 11, 2, 9, 17, 89, 12, 13, 52, 8, 4 };
  print( vec );
  return 0;
}
{% endhighlight %}

---

# 04. Range baseada em declarações de vectores
{% highlight cpp %}
std::vector<int> vec = { 11, 2, 9, 17, 89, 12, 13, 52, 8, 4 };
for ( auto pos = vec.begin(); pos != vec.end(); ++pos) {
 std::cout << *pos << '\n'; 
}
{% endhighlight %}

---

# 05. Somando elementos em estilo *foreach*
{% highlight cpp %}
int array[] = { 1, 2, 3 };
long sum = 0;
for ( int x : array ) {
 sum += x;
}

for ( auto elem : { sum, sum * 2, sum * 4 } ) {
  std::cout << elem << '\n';
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

