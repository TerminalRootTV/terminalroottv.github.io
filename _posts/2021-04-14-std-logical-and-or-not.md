---
layout: post
title: "cpp::daily - Lógicas Boooleanas com STL"
date: 2021-04-14 09:34:47
image: '/assets/img/cppdaily/cpp-daily-episode8.jpg'
description: 'Portas ou circuitos lógicos são dispositivos que operam e trabalham com um ou mais sinais lógicos de entrada para produzir uma e somente uma saída.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cppdaily
- cpp
---

![cpp::daily - Lógicas Boooleanas com STL](/assets/img/cppdaily/cpp-daily-episode8.jpg)

Portas ou circuitos lógicos são dispositivos que operam e trabalham com um ou mais sinais lógicos de entrada para produzir uma e somente uma saída, dependente da função implementada no circuito. 

As situações "Verdade" e "Falso" são estudadas na Lógica Matemática ou Lógica de Boole. Existem as seguintes portas lógicas: **AND**, **OR** e **NOT** são as principais, pois com elas podemos formar as demais que são: **NAND**, **NOR** , **XOR** e **XNOR** .

Lembrando que ao analisar saída de execução: **0 é verdadeiro**(sem erro) e **1 é falso**( >= 1 é erro), então isso pode confundir sua mente ao analisar os exemplos, pois é o contrário, mas eu não vou inverter porque é assim que é na realidade, então vamos usar o conceito de computação e não de saída de execução: **0 como falso** e **1 é verdadeiro** . 😃 

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


# AND `logical_and`
![AND](/assets/img/eletronica/and.jpg)

Essa porta resulta em um valor lógico verdadeiro somente se todos os operados tem um valor verdadeiro( nesse caso é 1 ). Uma idéia de entendimento seria dois interruptores ligados em série ) e uma lâmpada no final, ou seja, a lâmpada só será ligada se esses dois interruptores estiverem ligados.

![AND Example](/assets/img/eletronica/and_example.jpg)

Para esses exemplos usaremos a função [std::transform](https://terminalroot.com.br/2021/04/cppdaily-std-plus-std-transform.html) . Vamos analizar a saída da combinação de dois arrays usando a `std::logical_and`:

{% highlight cpp %}
#include <iostream>
#include <algorithm>

int main(){
    const int num = 3;
    bool array1[] = { false, false, true },
         array2[] = { false, true, true },
         result[ num ];

    std::transform( array1, array1 + num, array2, result, std::logical_and<bool>());

    std::cout << "Lógica AND:\n";
    for (int i = 0; i < num; ++i){
      std::cout << array1[i] << " AND " << array2[i] << " = " << result[i] << "\n";
    }
    return 0;
}
{% endhighlight %}
> A saída será:
{% highlight bash %}
0 AND 0 = 0
0 AND 1 = 0
1 AND 1 = 1
{% endhighlight %}

Caso queira ver a saída literal, use assim:
{% highlight cpp %}
#include <iostream>
#include <algorithm>

int main(){
    const int num = 3;
    bool array1[] = { false, false, true },
         array2[] = { false, true, true },
         result[ num ];
    const char * vf;

    std::transform( array1, array1 + num, array2, result, std::logical_and<bool>());

    std::cout << "Lógica AND:\n";
    for (int i = 0; i < num; ++i){
       vf = ( result[i] == 0 ? "false" : "true" );
      std::cout << array1[i] << " AND " << array2[i] << " = " << vf << "\n";
    }
    return 0;
}
{% endhighlight %}
> A saída será:
{% highlight bash %}
Lógica AND:
0 AND 0 = false
0 AND 1 = false
1 AND 1 = true
{% endhighlight %}

Ou seja, igual ao exemplo das lâmpadas, somente se ambos for verdadeiro que a saída é verdadeira!


<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


---

# NOT `logical_not`
![NOT](/assets/img/eletronica/not.jpg)

A Porta NOT ou inversora é uma porta lógica digital que implementa a negação lógica, de acordo com a tabela verdade abaixo. Ou seja, se for ~~**falso**~~ ele retorna **true** e se for ~~**true**~~ ele retorna **false**.
> Nesse exemplo usaremos somente um array(somente com 2 elementos) e lógico só passaremos 4 parametros para o `std::transform`.

{% highlight cpp %}
#include <iostream>
#include <algorithm>

int main(){
    const int num = 2;
    bool array1[] = { false, true },
         result[ num ];
    const char * vf;

    std::transform( array1, array1 + num, result, std::logical_not<bool>());

    std::cout << "Lógica NOT:\n";
    for (int i = 0; i < num; ++i){
       vf = ( result[i] == 0 ? "false" : "true" );
      std::cout << array1[i] << " NOT" << " = " << vf << "\n";
    }
    return 0;
}
{% endhighlight %}
> A saída será:
{% highlight bash %}
Lógica NOT:
0 NOT = true
1 NOT = false
{% endhighlight %}

---

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


# OR `logical_or`
![OR](/assets/img/eletronica/or.jpg)

A porta lógica OR também é chamada de disjunção lógica, é uma operação lógica entre dois ou mais operandos que resulta em um valor lógico falso se, e somente se, todos os operandos tiverem um valor falso.

Ou seja, se todos os valores forem falsos será falso, caso contrário será verdadeiro.

![OR example](/assets/img/eletronica/or_example.jpg)

> Retornando o exemplo de analisar 2 arrays.

{% highlight cpp %}
#include <iostream>
#include <algorithm>

int main(){
    const int num = 3;
    bool array1[] = { false, false, true },
         array2[] = { false, true, true },
         result[ num ];
    const char * vf;

    std::transform( array1, array1 + num, array2, result, std::logical_or<bool>());

    std::cout << "Lógica OR:\n";
    for (int i = 0; i < num; ++i){
       vf = ( result[i] == 0 ? "false" : "true" );
      std::cout << array1[i] << " OR " << array2[i] << " = " << vf << "\n";
    }
    return 0;
}
{% endhighlight %}
> A saída será:
{% highlight bash %}
Lógica OR:
0 OR 0 = false
0 OR 1 = true
1 OR 1 = true
{% endhighlight %}

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

<!-- RETANGULO LARGO -->
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Informat -->
<ins class="adsbygoogle"
style="display:block"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="2327980059"
data-ad-format="auto"
data-full-width-responsive="true"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# Links Úteis
+ <https://en.wikipedia.org/wiki/Logic_gate>
+ <https://en.wikipedia.org/wiki/AND_gate>
+ <https://en.cppreference.com/w/cpp/utility/functional/logical_and>
+ <https://en.wikipedia.org/wiki/NOT_gate>
+ <http://www.cplusplus.com/reference/functional/logical_or/>
+ <https://en.wikipedia.org/wiki/OR_gate>
