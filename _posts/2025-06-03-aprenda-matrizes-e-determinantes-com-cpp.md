---
layout: post
title: "Aprenda Matrizes e Determinantes com C++"
date: 2025-06-03 13:01:09
image: '/assets/img/matematica/matriz.jpg'
description: "🔢 Conceito de Matemática do Ensino Médio que se tornou a inda mais relevante na era da Inteligência Artificial."
icon: 'ion:terminal-sharp'
iconname: 'Matemática/C++'
tags:
- matematica
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Nesse artigo recapitularemos conceitos fundamentais sobre Matrizes e Determinantes.


<!-- SQUARE - GAMES ROOT -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

## Matriz
Uma explicação rápida sobre Matriz Matemática é que ela serve para organizar dados numéricos(criando uma tabela) para facilitar a leitura e organização dos dados para solucionar problemas de forma mais fácil.

As Matrizes são utilizadas em diversas áreas:
+ Matemática;
+ Computação(Inteligência Artificial, tratamento de imagens,...);
+ Engenharia;
+ Economia;
+ Biologia;

E entre diversas outras.

O conceito em linhas gerais é: **Uma matriz é uma tabela retangular de números (ou expressões) organizados em linhas e colunas.**, sua representação se parece com isso:

![00](/assets/img/matematica/mathjax/00.jpg) 


Essa matriz tem uma **ordem** de: `2x3` (2 linhas(horizontal) e 3 colunas(vertical)), nas representações de matrizes sempre começamos informando as linhas.  

Outra observação sobre essa matriz é que ela possui a explicação: `A = [aij]<sub>mxn</sub>`, isso quer dizer que, por exemplo:
+ O número `1` está na 1º linha(m) e na 1º coluna(n), logo, a representação `a`<sub>ij</sub> dele é: `a`<sub>11</sub> e assim por diante.

Convertendo todos para `a`<sub>ij</sub>, seria:

![01](/assets/img/matematica/mathjax/01.jpg) 

Essa mesma matriz em [C++](https://terminalroot.com.br/tags#cpp) podemos usar o [std::vector](https://terminalroot.com.br/2021/08/diferencas-entre-list-e-vector-na-stl-do-cpp.html) ou [std::array](https://terminalroot.com.br/2023/05/como-usar-o-stdarray-em-cpp.html):
+ Use `std::vector<std::vector<int>>` se quiser algo **dinâmico e flexível**.
+ Use `std::array<std::array<int, 3>, 2>` se as dimensões forem **fixas e conhecidas em tempo de compilação**.
**Nunca use `std::list` para matrizes.** Ela não tem acesso aleatório eficiente.

### Exemplos:
**Com `std::vector`:**

{% highlight cpp %}
std::vector<std::vector<int>> A = {
    {1, 2, 3},
    {4, 5, 6}
};
{% endhighlight %}

**Com `std::array`:**

{% highlight cpp %}
std::array<std::array<int, 3>, 2> A = { {
    {1, 2, 3},
    {4, 5, 6}
} };
{% endhighlight %}


### Qual usar?
* Use `std::vector` se for alterar tamanho em tempo de execução.
* Use `std::array` para desempenho máximo com tamanho fixo.

### Construção de matrizes
Suponhamos que você está prestando um concurso e possui esse enunciado:
+ Construa a matriz B = [`a`<sub>ij</sub>]<sub>2x3</sub> tal que `a`<sub>ij</sub> = (i + j)<sup>2</sup>.

Solução:
+ `a`<sub>ij</sub> = (i + j)<sup>2</sup> &Rightarrow; `a`<sub>11</sub> = (1 + 1)<sup>2</sup> &Rightarrow; **`a`<sub>11</sub> = 4**.
> Faça para os demais

A solução para todos em [C++](https://terminalroot.com.br/tags#cpp) utilizando `std::array`, já que a matriz é de tamanho fixo `2x3`:

{% highlight cpp %} 
#include <array>
#include <iostream>

int main() {
  std::array<std::array<int, 3>, 2> B;

  for (int i = 0; i < 2; ++i) {
    for (int j = 0; j < 3; ++j) {
      B[i][j] = (i + j) * (i + j);
    }
  }

  // Exibe a matriz
  for (const auto& row : B) {
    for (int val : row) {
      std::cout << val << " ";
    }
    std::cout << "\n";
  }

  return 0;
}
{% endhighlight %}

Se quiser com `std::vector`, troca por:

{% highlight cpp %} 
std::vector<std::vector<int>> B(2, std::vector<int>(3));
{% endhighlight %}
> O resto do código é igual.

O resultado será:

![02](/assets/img/matematica/mathjax/02.jpg) 


### Tipos de Matrizes

#### 1. **Matriz Quadrada**

* **Descrição:** Número de linhas igual ao de colunas (n×n).
* **Exemplo:**

![03](/assets/img/matematica/mathjax/03.jpg) 

#### 2. **Matriz Linha**

* **Descrição:** Apenas uma linha.
* **Exemplo:**

![04](/assets/img/matematica/mathjax/04.jpg) 

#### 3. **Matriz Coluna**

* **Descrição:** Apenas uma coluna.
* **Exemplo:**

![05](/assets/img/matematica/mathjax/05.jpg)

#### 4. **Matriz Nula**

* **Descrição:** Todos os elementos são zero.
* **Exemplo:**

![06](/assets/img/matematica/mathjax/06.jpg)


#### 5. **Matriz Identidade**

* **Descrição:** Diagonal principal com 1 e o resto 0. Denotada por $I_n$.
* **Exemplo:**

![07](/assets/img/matematica/mathjax/07.jpg)



#### 6. **Matriz Diagonal**

* **Descrição:** Apenas a diagonal principal pode ter valores diferentes de zero.
* **Exemplo:**

![08](/assets/img/matematica/mathjax/08.jpg)



#### 7. **Matriz Escalar**

* **Descrição:** Matriz diagonal com todos os valores da diagonal iguais.
* **Exemplo:**

![09](/assets/img/matematica/mathjax/09.jpg)



#### 8. **Matriz Simétrica**

* **Descrição:** <b>A = A<sup>T</sup></b>, ou seja, é igual à sua transposta.
* **Exemplo:**

![10](/assets/img/matematica/mathjax/10.jpg)



#### 9. **Matriz Antissimétrica (ou Skew-Simétrica)**

* **Descrição:** <b>A<sup>T</sup> = -A</b>. Diagonal principal é sempre zero.
* **Exemplo:**

![11](/assets/img/matematica/mathjax/11.jpg)



#### 10. **Matriz Triangular Superior**

* **Descrição:** Todos os elementos abaixo da diagonal principal são zero.
* **Exemplo:**

![12](/assets/img/matematica/mathjax/12.jpg)



#### 11. **Matriz Triangular Inferior**

* **Descrição:** Todos os elementos acima da diagonal principal são zero.
* **Exemplo:**

![13](/assets/img/matematica/mathjax/13.jpg)



#### 12. **Matriz Transposta**

* **Descrição:** Linhas viram colunas. Denotada <b>A<sup>T</sup></b>.
* **Exemplo:**

![14](/assets/img/matematica/mathjax/14.jpg)



#### 13. **Matriz Oposta**

* **Descrição:** Todos os elementos multiplicados por -1.
* **Exemplo:**

![15](/assets/img/matematica/mathjax/15.jpg)



#### 14. **Matriz Retangular**

* **Descrição:** Número de linhas diferente do número de colunas.
* **Exemplo:**

![16](/assets/img/matematica/mathjax/16.jpg)


### Cálculos de Matrizes
Operações aritméticas(algébricas ou matriciais) com Matrizes.

#### **a) Adição e Subtração**  
Só é possível se as matrizes tiverem a mesma ordem.  

![17](/assets/img/matematica/mathjax/17.jpg)


> Ou seja, `1 + 5` = `6`, `2 + 6` = `8` e assim por diante.

Em C++:
{% highlight cpp %} 
#include <array>
#include <iostream>

int main() {
  std::array<std::array<int, 2>, 2> A = {{{1, 2}, {3, 4}}};
  std::array<std::array<int, 2>, 2> B = {{{5, 6}, {7, 8}}};
  std::array<std::array<int, 2>, 2> C;

  for (int i = 0; i < 2; ++i){
    for (int j = 0; j < 2; ++j){
      C[i][j] = A[i][j] + B[i][j];
    }
  }

  for (auto& row : C){
    for (int v : row){
      std::cout << v << (v == row.back() ? '\n' : ' ');
    }
  }
}
{% endhighlight %}

#### **b) Multiplicação por Escalar**  
Multiplica-se cada elemento por um número real (escalar).  

![18](/assets/img/matematica/mathjax/18.jpg)

> Ou seja, `3 x 1` = `3`, `3 x 2` = `6` e assim por diante.

Em C++:
{% highlight cpp %} 
#include <array>
#include <iostream>

int main() {
  std::array<std::array<int, 2>, 2> A = {{{1, 2}, {3, 4}}};
  std::array<std::array<int, 2>, 2> B;
  int escalar = 3;

  for (int i = 0; i < 2; ++i){
    for (int j = 0; j < 2; ++j){
      B[i][j] = escalar * A[i][j];
    }
  }

  for (auto& row : B){
    for (int v : row){
      std::cout << v << (v == row.back() ? '\n' : ' ');
    }
  }
}
{% endhighlight %}

#### **c) Multiplicação de Matrizes**  
O número de colunas da primeira matriz deve ser igual ao número de linhas da segunda.  

![19](/assets/img/matematica/mathjax/19.jpg)


Em C++:
{% highlight cpp %} 
#include <array>
#include <iostream>

int main() {
  std::array<std::array<int, 2>, 2> A = {{{1, 2}, {3, 4}}};
  std::array<std::array<int, 2>, 2> B = {{{5, 6}, {7, 8}}};
  std::array<std::array<int, 2>, 2> C = {};

  for (int i = 0; i < 2; ++i){
    for (int j = 0; j < 2; ++j){
      for (int k = 0; k < 2; ++k){
        C[i][j] += A[i][k] * B[k][j];
      }
    }
  }

  for (auto& row : C){
    for (int v : row){
      std::cout << v << (v == row.back() ? '\n' : ' ');
    }
  }
}
{% endhighlight %}


<!-- RECTANGLE LARGE -->
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

---

## Determinantes
O **determinante** é um número associado apenas a **matrizes quadradas**, útil para resolver sistemas lineares e verificar se uma matriz é invertível.  

> **IMPORTANTE**: Na representação de matrizes usamos colchetes: `[ ]`, mas em determinantes usamos barras verticais, exemplo: `| |`.

### 3.2 Cálculo do Determinante
#### a) Matriz \( 2 \times 2 \)

![20](/assets/img/matematica/mathjax/20.jpg)


**Exemplo:**  

![21](/assets/img/matematica/mathjax/21.jpg)


Em C++:
{% highlight cpp %} 
#include <iostream>

int main(){
  int a = 1, b = 2;
  int c = 3, d = 4;

  int det = a * d - b * c;

  std::cout << det << '\n';
}
{% endhighlight %}

#### b) Matriz \( 3 \times 3 \) (Regra de Sarrus)
A Regra de Sarrus consiste em adicionar a 1º e a 2º coluna para o lado direito da matriz determinante e *traçar* diagonais(a partir dos números da primeira LINHA), exemplo:
> Isso para uma matriz `3x3`.

![Regra de Sarrus](./sarrus.png) 


![22](/assets/img/matematica/mathjax/22.jpg)


**Exemplo:**  

![23](/assets/img/matematica/mathjax/23.jpg)


> `= 45 + 84 + 96 - 105 - 48 - 72 = 0`

Em C++:
{% highlight cpp %} 
#include <iostream>

int main(){
  int a11 = 1, a12 = 2, a13 = 3;
  int a21 = 4, a22 = 5, a23 = 6;
  int a31 = 7, a32 = 8, a33 = 9;

  int det = 
    a11 * a22 * a33 +
    a12 * a23 * a31 +
    a13 * a21 * a32
    - a13 * a22 * a31
    - a11 * a23 * a32
    - a12 * a21 * a33;

  std::cout << det << '\n';
}
{% endhighlight %}

#### 3.3 Propriedades dos Determinantes
- Se uma linha ou coluna for toda zero, \(\text{det} = 0\).  
- Se duas linhas ou colunas forem iguais, \(\text{det} = 0\).  
- \(\text{det}(A \cdot B) = \text{det}(A) \cdot \text{det}(B)\).  

#### 4. Aplicações
- **Sistemas Lineares:** Resolver equações usando a **Regra de Cramer**.  
- **Matriz Inversa:** Uma matriz \( A \) é invertível se \(\text{det}(A) \neq 0\).  

#### 5. Exercício
+ Calcule o determinante:  


![24](/assets/img/matematica/mathjax/24.jpg)


Em C++:
{% highlight cpp %} 
#include <iostream>

int main(){
  int a = 7, b = 3;
  int c = -2, d = 4;

  int det = a * d - b * c;

  std::cout << det << '\n';
}
{% endhighlight %}

![25](/assets/img/matematica/mathjax/25.jpg)

<img src="/assets/img/matematica/mathjax/25.jpg" alt="" style="border:none;text-align:left">

Resposta: **14**.

---

## Links úteis
+ [Nerckie](https://www.youtube.com/watch?v=SUbr6zypkLA)
+ [Giz com Gis](https://www.youtube.com/watch?v=Fa_vs3jPa0Q&list=PLGyv8aUrOlzA_xsEveyON086udN6WIga_)

