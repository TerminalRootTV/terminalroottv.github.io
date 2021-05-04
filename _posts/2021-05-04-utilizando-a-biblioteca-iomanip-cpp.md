---
layout: post
title: "Utilizando a biblioteca iomanip C++"
date: 2021-05-04 09:26:58
image: '/assets/img/cppdaily/iomanip.png'
description: 'Fornece recursos para manipular a formatação de saída'
icon: 'ion:terminal-sharp'
iconname: 'cpp::daily'
tags:
- cppdaily
---

![Utilizando a biblioteca iomanip C++](/assets/img/cppdaily/iomanip.png)

A biblioteca `<iomanip>` fornece recursos para manipular a formatação de saída, como a base usada ao formatar inteiros e a precisão dos valores de ponto flutuante . 

Ela dispõe das seguintes funções:
+ `setiosflags` - Define formato dos sinalizadores 
+ `resetiosflags` - Reseta formato dos sinalizadores
+ `setbase` - Define a base dos sinalizadores 
+ `setfill` - Define o preenchimento dos caracteres
+ `setprecision` - Define a precisão dos decimais
+ `setw` - Define a largura de um campo
+ `get_money` - Obtém o valor monetário
+ `put_money` - Insere o valor monetário
+ `get_time` - Obtém a hora e data
+ `put_time` - Obtém a hora e data


# Alguns exemplos
### `setfill` e `setw`
Preenche com determinado caractere ao lado esquerdo do número(int, float, double,...)

{% highlight cpp %}
#include <iostream>
#include <iomanip>

int main(){
  std::cout << std::setfill (' ') << std::setw( 10 );
  std::cout << 3.69f << '\n';
  return 0;
}
{% endhighlight %}
> Preencheu com 6 espaços em branco(10 menos a quantidade de caracteres do número), logo a saída será: `      3.69`. Se alterarmos o `std::setfill (' ')` por `std::setfill ('-')` a saída será: `------3.69` .

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

### `setprecision`
Define quantos algarismo você deseja que apareça se não houver mais após a vírgula( nesse caso, ponto `.` ), preencherá com zeros `0` se usarmos `std::fixed` .
{% highlight cpp %}
#include <iostream>
#include <iomanip>

int main(){
  double pi = 3.14159;
  std::cout << std::setprecision( 3 ) << pi << '\n';
  return 0;
}
{% endhighlight %}
> Saída: `3.14`

{% highlight cpp %}
#include <iostream>
#include <iomanip>

int main(){
  double pi = 3.14159;
  std::cout << std::setprecision( 4 ) << pi << '\n';
  return 0;
}
{% endhighlight %}
> Saída: `3.142` porquê o próximo número significativo é igual ou maior à 5, logo ele apromixa o anterior .

E se alterar para `std::setprecision( 9 )`, a saída será: `3.14159` não completará com zeros, mas usando `std::fixed`
{% highlight cpp %}
#include <iostream>
#include <iomanip>

int main(){
  double pi = 3.14159;
  std::cout << std::fixed << std::setprecision( 9 ) << pi << '\n';
  return 0;
}
{% endhighlight %}
> A saída será: `3.141590000`.

---

### `get_money` e `put_money`
Informa o valor em inteiro, em outras palavras transforma: `float`, `double`,... em inteiro. São úteis para uso com inserção de dados. Exemplo:
{% highlight cpp %}
#include <iomanip>
#include <iostream>

int main() {
  long double preco;
  std::cout << "Informe o preço: ";
  std::cin >> std::get_money( preco );

  if( std::cin.fail() ){
    std::cerr << "Falha ao ler o preço" << '\n';
    return 1;
  }else{
    std::cout << "O preço é: " << std::put_money( preco ) << '\n';
  }

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

### `get_time`
Trata a inserção de horas, exemplo:
{% highlight cpp %}
#include <iostream> 
#include <iomanip> 
#include <ctime> // struct std::tm

int main(){
  struct std::tm dthr;
  std::cout << "Informe a hora: ";
  std::cin >> std::get_time(&dthr,"%R");   // extrai as horas em formato 24H

  std::cout << "São " << 
               dthr.tm_hour << " horas e " 
               << dthr.tm_min << " minutos\n";

  return 0;
}
{% endhighlight %}
> Exemplo:
{% highlight bash %}
Informe a hora: 12:23
São 12 horas e 23 minutos
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

---

Para mais informações consulte:
+ <https://en.cppreference.com/w/cpp/header/iomanip>
+ <https://www.cplusplus.com/reference/iomanip/put_time/>


