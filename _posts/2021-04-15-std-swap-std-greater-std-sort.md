---
layout: post
title: "cpp::daily - Troca de valores e Ordenar valores de um array"
date: 2021-04-15 13:23:24
image: '/assets/img/cppdaily/cpp-daily-episode9.jpg'
description: 'Episódio 009: std::swap, std::sort e std::greater'
icon: 'ion:terminal-sharp'
iconname: 'cpp::daily'
tags:
- cppdaily
---

![Episódio 009: std::swap, std::sort e std::greater](/assets/img/cppdaily/cpp-daily-episode9.jpg)

# Troca de valores
Nós sabemos que se quisermos trocar o valor de duas variáveis, basta ter uma variável temporária para armazenar o valor de uma das duas e depois atribuir o valor da primeira para a temporária, da primeira para a segunda e da segunda para temporária, assim:

{% highlight cpp %}
#include <iostream>

int main( int argc , char **argv ){
  int a = 3, b = 6, tmp;
  tmp = a;
  a = b;
  b = tmp;
  std::cout << "Após troca agora o valor de 'a' = " << a <<
               " e o valor de 'b' = " << b << '\n';
  return 0;
}
{% endhighlight %}
> Saída:
{% highlight bash %}
Após troca agora o valor de 'a' = 6 e o valor de 'b' = 3
{% endhighlight %}

Se quisermos usar uma função precisamos passar como ponteiro ou (des)referência, pois precisamos alterar o valor armazenado no endereço da memória, se não usarmos um desses métodos, serão criadas cópias das variáveis e os valores não serão alterados, eu particularmente prefiro usar (des)referência pelo fato da implementação ser mais simples e o desempenho ser o mesmo de usar ponteiros, logo, nosso código usando função seria assim:
{% highlight cpp %}
#include <iostream>

void swap( int &a, int &b ){
  int temp = a;
  a = b;
  b = temp;
}


int main( int argc , char **argv ){
  int a = 3, b = 6, tmp;
  tmp = a; a = b; b = tmp;

  std::cout << "Antes de trocar: " << '\n';
  std::cout << "a = " << a << " e b = " << b << '\n';

  swap( a, b );

  std::cout << "Depois de trocar: " << '\n';
  std::cout << "a = " << a << " e b = " << b << '\n';

  return 0;
}
{% endhighlight %}
> Saída:
{% highlight bash %}
Antes de trocar: 
a = 6 e b = 3
Depois de trocar: 
a = 3 e b = 6
{% endhighlight %}

Mas isso aí há uma limitação, pois só altera integer. Então teríamos que sobrecarregar a função `swap()` várias vezes para vários tipos, e isso é bem estranho.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


Logo, poderíamos usar `template`:
{% highlight cpp %}
#include <iostream>

template<typename T>
void swap( T &a, T &b ){
  auto temp = a;
  a = b;
  b = temp;
}


int main( int argc , char **argv ){
  int a = 3, b = 6, tmp;
  tmp = a; a = b; b = tmp;
  std::string s1 = {"Olá!"}, s2 = {"Tchau!"};

  std::cout << "Antes de trocar: " << '\n';
  std::cout << "a = " << a << " e b = " << b << '\n';

  std::cout << "Antes de trocar: " << '\n';
  std::cout << "s1 = " << s1 << " e s2 = " << s2 << '\n';

  swap( a, b );
  swap( s1, s2 );

  std::cout << "Depois de trocar: " << '\n';
  std::cout << "a = " << a << " e b = " << b << '\n';

  std::cout << "Depois de trocar: " << '\n';
  std::cout << "s1 = " << s1 << " e s2 = " << s2 << '\n';

  return 0;
}
{% endhighlight %}
> Saída:
{% highlight bash %}
Antes de trocar: 
a = 6 e b = 3
Antes de trocar: 
s1 = Olá! e s2 = Tchau!
Depois de trocar: 
a = 3 e b = 6
Depois de trocar: 
s1 = Tchau! e s2 = Olá!
{% endhighlight %}

Mas não precisamos criar essa função sempre que quisermos fazer essa operação, a [STL](https://en.wikipedia.org/wiki/Standard_Template_Library) já possui esse recurso, basta usá-la: `std::swap`:

{% highlight cpp %}
#include <iostream>

int main( int argc , char **argv ){
  int a = 3, b = 6, tmp;
  tmp = a; a = b; b = tmp;
  std::string s1 = {"Olá!"}, s2 = {"Tchau!"};

  std::cout << "Antes de trocar: " << '\n';
  std::cout << "a = " << a << " e b = " << b << '\n';

  std::cout << "Antes de trocar: " << '\n';
  std::cout << "s1 = " << s1 << " e s2 = " << s2 << '\n';

  std::swap( a, b );
  std::swap( s1, s2 );

  std::cout << "Depois de trocar: " << '\n';
  std::cout << "a = " << a << " e b = " << b << '\n';

  std::cout << "Depois de trocar: " << '\n';
  std::cout << "s1 = " << s1 << " e s2 = " << s2 << '\n';

  return 0;
}
{% endhighlight %}

Sempre verifique se já há uma função que você deseja na STL, é mais profissional usá-la!

---

# Ordenar valores de um array
Suponhamos que você tem um array e deseja imprimir os elementos em ordem decrescente de valor, para isso basta você armazenar o valor inicial em uma variável, comparar e fazer uma trocar `std::swap`, então você faria assim em um loop for aninhado:

{% highlight cpp %}
#include <iostream>
 
int main(){
  int array[]{11, 2, 9, 17, 12, 89, 13, 52, 8, 4, 79},
      length = sizeof( array ) / sizeof( array[0] ),
      greater; // variável que armazenará o valor para comparação
 
 // o tamanho do array precisa ser -1 para não termos a famosa 'falha de segmentação'
  for ( int start = 0; start < length - 1; ++start ){
    greater = start; // atribuímos inicialmente o valor 0
 
    for (int current = start + 1; current < length; ++current){
      if ( array[ current ] > array[ greater ] ){ // aqui está a mágica inicial comparar 
        greater = current;
      }
    }
 
    std::swap(array[start], array[greater]); / trocando a posição do array pelo maior
  }
 
 // Imprimimos o array em forma decrescente
  for (int index = 0; index < length; ++index){
    std::cout << array[ index ] << ' ';
  }
 
  std::cout << '\n';
 
  return 0;
}
{% endhighlight %}
> Saída: `89 79 52 17 13 12 11 9 8 4 2`

Caso queira o contrário, basta alterar o sinal de maior(`>`) pelo sinal de menor(`<`) na condição de comparação em:

Trocar isso:
{% highlight cpp %}
if ( array[ current ] > array[ greater ] ){
{% endhighlight %}

Por isso:
{% highlight cpp %}
if ( array[ current ] < array[ greater ] ){
{% endhighlight %}
E os valores serão impressos em ordem crescente:
> Saída:
{% highlight bash %}
2 4 8 9 11 12 13 17 52 79 89
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

Bom, apesar desse código ser bom, a verdade é que podemos melhorar usando o `std::greater` e `std::sort` da STL.
+ `std::sort` é uma função que ordena os valor de um array.
+ `std::greater` é um objeto de função que retornar o maior valor em uma comparação. 

Por padrão a função `sort()` ordena os valores em ordem crescente. Então se quisermos transformar o código acima usando `std::sort` ficaria:
> Precisa incluir o `#include <algorithm>`

{% highlight cpp %}
#include <iostream>
#include <algorithm>

int main(){
    int array[] = {11, 2, 9, 17, 12, 89, 13, 52, 8, 4, 79},
          length = sizeof( array ) / sizeof( array[0] );
    
    std::sort( array, array + length);

    for ( auto nums : array ) {
      std::cout << nums << ' ';
    }
    std::cout << '\n';

    return 0;
}
{% endhighlight %}
> Saída: `2 4 8 9 11 12 13 17 52 79 89`

A `std::sort` é sobrecarregada, logo, se quisermos imprimir em ordem decrescente precisamos usar o terceiro parametro com `std::greater` ficaria:
{% highlight cpp %}
#include <iostream>
#include <algorithm>

int main(){
    int array[] = {11, 2, 9, 17, 12, 89, 13, 52, 8, 4, 79},
          length = sizeof( array ) / sizeof( array[0] );

    std::sort( array, array + length, std::greater<int>() );

    for ( auto nums : array ) {
      std::cout << nums << ' ';
    }
    std::cout << '\n';

    return 0;
}
{% endhighlight %}
> Saída: `89 79 52 17 13 12 11 9 8 4 2`


### Simples e Like a Boss!

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


# Links Úteis
+ <https://en.cppreference.com/w/cpp/algorithm/swap>
+ <https://en.cppreference.com/w/cpp/algorithm/sort>
+ <https://en.cppreference.com/w/cpp/utility/functional/greater>
