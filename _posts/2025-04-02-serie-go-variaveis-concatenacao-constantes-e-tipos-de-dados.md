---
layout: post
title: "Série Go: Variáveis, Concatenação, Constantes e Tipos de Dados"
date: 2025-04-02 13:41:29
image: '/assets/img/go/series-go-02.jpg'
description: "🐹 Episódio 02"
icon: 'ion:terminal-sharp'
iconname: 'Go'
tags:
- go
- series-go
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Hoje vamos dar prosseguimento a [Série Go](https://terminalroot.com.br/tags/#series-go). No [episódio anterior](https://terminalroot.com.br/2025/03/serie-go-uma-abordagem-sobre-a-linguagem-de-programacao-golang.html) vimos uma introdução e os primeiros passos.

Nesse episódio veremos:
+ Variáveis;
+ Concatenação;
+ Constantes;
+ e Tipos de Dados.


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

## Variáveis
Em Go existem tipos de dados, mas você pode criar uma *variável* sem informar o tipo usando o operador `:=`, exemplo criando uma *variável* do tipo *string*:
> `variavel := "Olá, Golang!"`

{% highlight go %}
package main
import "fmt"

func main (){
  variavel := "Olá, Golang!"
  fmt.Println(variavel)
}
{% endhighlight %}

Usando a palavra reservada `var`
{% highlight go %}
package main

import "fmt"

func main (){
  var variavel = "Olá, Golang!"
  fmt.Println(variavel)
}
{% endhighlight %}

Regras para criar variáveis:
+ **Não combine formas misturando**: ~~`var variavel := "Olá, Golang!"`~~ ou ~~`variavel = "Olá, Golang!"`~~ .
+ **Não use acentuação para nome de variáveis**: ~~`variável := "Olá, Golang!"`~~
+ **Só nomeie as variáveis com números se o primeiro caractere for uma letra**: ~~`1variavel := "Olá, Golang!"`~~, e sim `variavel1` ou `var1avel`
+ **O único caractere especial que deve ser usado é o underline**, a ordem de aparição dele independe: `_variavel`, `variavel_`, `var_iavel`, `var1_avel`, `_vari_1avel`...

Use a palavra reservada `var` ou o operador `:=` para qualquer tipo de dado, exemplos:
{% highlight go %}
package main

import "fmt"

func main (){
  var num = 10
  var ola = "Olá"
  mundo := "Mundo"
  var preco = 49.54
  fmt.Println(num)
  fmt.Print(ola)
  fmt.Print(" ")
  fmt.Println(mundo)
  fmt.Println(preco)
}
{% endhighlight %}

Variáveis, lógico, podem variar o valor, mas use tanto `var` quanto `:=` somente quando criar pela primeira vez, exemplos:

Correto:
{% highlight go %}
var nome = "Marcos Oliveira"
nome = "Terminal Root"
fmt.Println(nome)
{% endhighlight %}
> Saída: `Terminal Root` .

Errado:
{% highlight go %}
var nome = "Marcos Oliveira"
var nome = "Terminal Root"
fmt.Println(nome)
{% endhighlight %}
> Erro ao compilar/rodar: `./arquivo.go:7:7: nome redeclared in this block`

Outra observação é que se você tentar usar uma variável que você não inicializou(somente declarou, mas não atribuiu nenhum valor inicial) usando a palavra reservada `var`, haverá erro na execução/compilação do programa, exemplo:
{% highlight go %}
package main

import "fmt"

func main(){
  var nome; // ERROR
  nome = "Marcos";
  fmt.Println(nome)
}
{% endhighlight %}
> Note também que o `;` é opcional em Go.

**VARIÁVEIS CRIADAS E NÃO UTILIZADAS, GERAM ERRO NA COMPILAÇÃO!**

---

## Concatenação
O operador para concatenar em Go é o `+`(mais), no entanto, isso só funciona(lógico) para strings. Exemplo de uso:
{% highlight go %}
package main

import "fmt"

func main (){
  var ola = "Olá"
  mundo := "Mundo"
  fmt.Print(ola + ", " + mundo + "!\n")
}
{% endhighlight %}
> Note que também podemos usar caracteres com escape para pular linha: `\n` em `Print` sem *ln*, mas também pulamos a linha. 


<!-- RECTANGLE 2 - OnParagragraph -->
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

## Constantes
Para criar constantes usa-se a palavra reservada `const`.

Diferentemente das variáveis, em nenhuma circunstância, o valor poderá ser alterado:
{% highlight go %}
package main

import "fmt"

func main(){
  const pi = 3.14
  fmt.Println(pi)
}
{% endhighlight %}

Se você tentar redefinir a constante de nome `pi` haverá erro:
{% highlight go %}
package main

import "fmt"

func main(){
  const pi = 3.14
  pi = 6.18
  fmt.Println(pi)
}
{% endhighlight %}
> `/hello.go:7:6: cannot assign to pi (declared const)`

---

# Tipos de Dados
Quando usamos tanto `var` quanto `:=` o tipo de dado é usado dinamicamente(é atribuído o tamanho padrão do tipo) e isso pode influenciar no desempenho dependendo do tipo de aplicação/programa que você estiver criando.

Então, para cada conteúdo é usado um tipo, por exemplo, para uma variável possuir o conteúdo `"Olá, Golang!"` o Go cria dinamicamente o tipo `string`, para um número sem pontuações usa `int`, com pontuações é `float`, e entre outros, veja os tipos básicos na tabela abaixo:
> Para entender algumas informações da tabela precisa ter conhecimentos intermediários de Matemática

| TIPO | DESCRIÇÃO | EXEMPLO |
|---|---|---|
| `byte` | para um único caractere | `a` |
| `string` | para conjunto de caracteres | `"Olá, Golang!"` |
| `int` | para números positivos e negativos | `10` ou `-10` |
| `float` | para números irracionais | `9.36` |
| `complexN` | para números complexos, onde o **N** deve ser o tamanho | `6i` |
| `rune` | para símbolos unicode(emoji, por exemplo) | `U+0030` |
| `bool` | para valores de acordo com a matemática booleana | `true` ou `false` |

Alguns dos tipos básicos citados acima possuem sub categorias que pode variar o tamanho da variável, exemplos:
+ O tipo `int` possui: `int8`, `int16`, `int32` e `int64` o número representa a quantidade de bits, por exemplo, `int64` pode armazenar até 64 bits ou 8 bytes( 64 / 8) e assim por diante, o padrão dependerá do sistema operacional que está rodando o código Go .
+ O tipo `float` se subdivide em: `float32` e `float64` , o padrão é 64 .
+ O tipo `complexN` tem de ser: `complex64` ou `complex128` .
> Os outros tipos não possuem sub divisões, mas para o tipo `bool` o padrão é `false` .

Criando um código definindo o tipo:
> Somente funciona unindo com a palavra reservada `var`
{% highlight go %}
package main

import "fmt"

func main(){
  var olamundo string = "Olá, Golang"
  fmt.Println(olamundo)
}
{% endhighlight %}
> Se você está acostumado com outras linguagens de programação perceba que o tipo é declarado após o nome.

Outros exemplos:
{% highlight go %}
package main

import "fmt"

func main(){

  // String
  var olamundo string = "Olá, Golang"
  olamundo = "Olá, Go!"
  fmt.Println(olamundo) // Olá, Go!

  // int
  var num int = 42
  fmt.Println(num)

  // float32
  var x float32 = 54.892
  fmt.Println(x)

  // complexN → complex64
  var yx complex64 = 2 + 5i
  fmt.Println(yx)

  // byte
  var letra byte = 'a'
  fmt.Println(letra) // 97 de acordo com a tabela ASCII

  // rune
  fmt.Printf("%U\n", []rune("☎")) // veremos mais detalhes à frente

  // bool
  var p bool; // ou var p bool = true
  fmt.Println(p) // false
}
{% endhighlight %}

As prováveis saídas do código acima:
{% highlight sh %}
Olá, Go!
42
54.892
(2+5i)
97
[U+260E]
false
{% endhighlight %}

---

Por esse episódio é só, até o próximo!

