---
layout: post
title: "Série Go: Arrays, Operadores e Condições"
date: 2025-05-05 21:01:32
image: '/assets/img/go/series-go-03.jpg'
description: "🚀 Episódio 03"
icon: 'ion:terminal-sharp'
iconname: 'Série Go'
tags:
- go
- series-go
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Nesse artigo vamos dar prosseguimento a nossa [Série Go](https://terminalroot.com.br/tags#series-go), os tópicos anteriores são:
+ [Série Go: Uma abordagem sobre a Linguagem de Programação Golang](https://terminalroot.com.br/2025/03/serie-go-uma-abordagem-sobre-a-linguagem-de-programacao-golang.html)
+ [Série Go: Variáveis, Concatenação, Constantes e Tipos de Dados](https://terminalroot.com.br/2025/04/serie-go-variaveis-concatenacao-constantes-e-tipos-de-dados.html)

Nesse artigo vamos ver: **Arrays, Operadores e Condições**.


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

## Arrays
Arrays em [Go](https://terminalroot.com.br/tags#go) são estruturas de dados que armazenam uma sequência fixa de elementos do mesmo tipo. São úteis quando se conhece de antemão a quantidade exata de elementos que serão manipulados.

#### Declaração
{% highlight go %}
var a [5]int
{% endhighlight %}

Cria um array de 5 inteiros, inicializados com zero.

Também é possível inicializar diretamente:

{% highlight go %}
b := [3]string{"Go", "é", "rápido"}
{% endhighlight %}

Ou deixar o compilador inferir o tamanho:

{% highlight go %}
c := [...]float64{3.14, 2.71, 1.41}
{% endhighlight %}

#### Acesso e Modificação
{% highlight go %}
a[0] = 10
fmt.Println(a[0])
{% endhighlight %}

#### Iteração
{% highlight go %}
for i, v := range b {
    fmt.Println(i, v)
}
{% endhighlight %}

#### Propriedades
* **Tamanho fixo**: o tamanho faz parte do tipo. `[3]int` e `[4]int` são tipos diferentes.
* **Valor por cópia**: ao atribuir um array a outro, ele é copiado:

{% highlight go %}
x := [2]int{1, 2}
y := x
y[0] = 9
fmt.Println(x) // [1 2]
{% endhighlight %}

#### Arrays Multidimensionais
{% highlight go %}
var matriz [2][3]int
matriz[0][1] = 42
{% endhighlight %}

#### Limitações
* Tamanho fixo torna arrays pouco flexíveis.
* Usualmente substituídos por slices, que são mais dinâmicos.


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

## Operadores
Go oferece um conjunto direto de operadores para manipulação de valores. Eles são divididos em categorias: aritméticos, relacionais, lógicos, bit a bit, de atribuição e especiais. São usados para realizar operações matemáticas comuns:

|Operador|Nome|Descrição|Exemplo|
|--- |--- |--- |--- |
|`+`|Adição|Soma dois valores|x + y|
|`-`|Subtração|Subtrai um valor de outro|`x - y`|
|`*`|Multiplicação|Multiplica dois valores|`x * y`|
|`/`|Divisão|Divide um valor por outro|`x / y`|
|`%`|Módulo|Retorna o resto da divisão|`x % y`|
|`++`|Incremento|Aumenta o valor de uma variável em 1|`++x`|
|`--`|Decremento|Diminui o valor de uma variável em 1|`--x`|

Há também os:
+ Operadores de **Comparação**: `==`, `!=`, `>`, `<`, `>=`, `<=`; 
+ Operadores de **Atribuição**: `=`, `+=`, `-=`, `*=`, `/=`, `%=`, `&=`, `|=`, `^=`, `>>=` e `<<=`;
+ Operadores **Lógicos**: `&&`, `||` e `!`; 
+ Operadores **Bit a Bit**(Bitwise): `&`, `|`, `^`, `<<` e `>>` .

Exemplo de uma expressão matemática com Golang:
{% highlight go %}
package main

import "fmt"

func main(){
  fmt.Println( 2 + 6 / 4 + 3 * 3 - (4 -1) ) // 9
}
{% endhighlight %}
> `go run operadores.go`

---

## Condições
Go usa estruturas de controle simples para decisões condicionais. As principais são `if`, `if-else`, `else if` e `switch`.

#### 1. **`if`**
{% highlight go %}
if condição {
    // bloco executado se condição for verdadeira
}
{% endhighlight %}

Exemplo:
{% highlight go %}
x := 10
if x > 5 {
    fmt.Println("Maior que 5")
}
{% endhighlight %}

#### 2. **`if` com declaração curta**
Permite inicializar variáveis dentro do `if`.
{% highlight go %}
if y := calcula(); y > 10 {
    fmt.Println("Resultado > 10")
}
{% endhighlight %}

`y` só existe dentro do bloco.

#### 3. **`if-else`**
{% highlight go %}
if condição {
    // verdadeiro
} else {
    // falso
}
{% endhighlight %}

#### 4. **`else if`**
Permite múltiplas verificações sequenciais:
{% highlight go %}
if x < 0 {
    fmt.Println("Negativo")
} else if x == 0 {
    fmt.Println("Zero")
} else {
    fmt.Println("Positivo")
}
{% endhighlight %}

#### 5. **`switch`**
Usado para múltiplas comparações, mais limpo que vários `if-else`.

{% highlight go %}
switch valor {
case 1:
    fmt.Println("Um")
case 2:
    fmt.Println("Dois")
default:
    fmt.Println("Outro")
}
{% endhighlight %}

* Não precisa de `break`.
* Pode usar `switch true` para expressões booleanas:

{% highlight go %}
switch {
case x < 0:
    fmt.Println("Negativo")
case x == 0:
    fmt.Println("Zero")
default:
    fmt.Println("Positivo")
}
{% endhighlight %}

#### 6. **`fallthrough`**
Força a execução do próximo `case`, mesmo que a condição não seja satisfeita:

{% highlight go %}
switch x := 1; x {
case 1:
    fmt.Println("Um")
    fallthrough
case 2:
    fmt.Println("Dois também")
}
{% endhighlight %}

---

Por hoje é só até o próximo tópico!


