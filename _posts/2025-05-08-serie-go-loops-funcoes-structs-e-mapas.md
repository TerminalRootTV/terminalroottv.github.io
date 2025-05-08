---
layout: post
title: "Série Go: Loops, Funções, Structs e Mapas"
date: 2025-05-08 15:19:34
image: '/assets/img/go/series-go-04.jpg'
description: "🚀 Nesse: Episódio 04, descobriremos porque Go não possui loop while."
icon: 'ion:terminal-sharp'
iconname: 'Go'
tags:
- go
- series-go
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Neste quarto episódio da série sobre a linguagem Go, vamos direto ao ponto em quatro pilares essenciais para qualquer aplicação robusta: estruturas de repetição, funções, structs e mapas. 

Nesse artigo vamos dar prosseguimento a nossa [Série Go](https://terminalroot.com.br/tags/#series-go), os tópicos anteriores são:
+ [Série Go: Uma abordagem sobre a Linguagem de Programação Golang](https://terminalroot.com.br/2025/03/serie-go-uma-abordagem-sobre-a-linguagem-de-programacao-golang.html)
+ [Série Go: Variáveis, Concatenação, Constantes e Tipos de Dados](https://terminalroot.com.br/2025/04/serie-go-variaveis-concatenacao-constantes-e-tipos-de-dados.html)
+ [Série Go: Arrays, Operadores e Condições](https://terminalroot.com.br/2025/05/serie-go-arrays-operadores-e-condicoes.html)


Aqui você entenderá como Go simplifica o controle de fluxo com seu único loop `for`, como modularizar o código com funções, como modelar dados com structs, e como armazenar pares chave-valor com mapas. Essencial para quem quer escrever código limpo, performático e idiomático em Go.


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

## Loops
[Golang](https://terminalroot.com.br/tags#go) (ou [Go](https://terminalroot.com.br/tags#go)) OFERECE APENAS UMA ESTRUTURA DE LOOP: o `for`. Não há `while` ou `do-while`. 

Essa simplicidade faz parte da filosofia da linguagem. A seguir, estão os usos e variações do `for` em Go.

+ Sintaxe Básica
{% highlight go %}
for i := 0; i < 10; i++ {
    fmt.Println(i)
}
{% endhighlight %}
> Equivalente ao `for` tradicional em [C](https://terminalroot.com.br/tags#linguagemc)/[C++](https://terminalroot.com.br/tags#cpp)/[Java](https://terminalroot.com.br/tags#java).

+ Loop Condicional (estilo `while`)
{% highlight go %}
i := 0
for i < 10 {
    fmt.Println(i)
    i++
}
{% endhighlight %}
> Se omitir a inicialização e o incremento, o `for` age como um `while`.

+ Loop Infinito
{% highlight go %}
for {
    // execução contínua
}
{% endhighlight %}
> Precisa de um `break` para terminar.

Loop com `range`. Para iterar sobre arrays, slices, maps, strings ou canais.

+ Slice
{% highlight go %}
nums := []int{1, 2, 3}
for i, v := range nums {
    fmt.Println(i, v)
}
{% endhighlight %}

+ Map
{% highlight go %}
m := map[string]int{"a": 1, "b": 2}
for k, v := range m {
    fmt.Println(k, v)
}
{% endhighlight %}

+ String (em runas)
{% highlight go %}
for i, c := range "gölang" {
    fmt.Printf("%d: %c\n", i, c)
}
{% endhighlight %}

Palavras-chave de controle
* `break`: Sai do loop.
* `continue`: Vai para a próxima iteração.
* `goto`: Evitado, mas existe.

Exemplo com `break` e `continue`
{% highlight go %}
for i := 0; i < 10; i++ {
    if i == 5 {
        continue
    }
    if i == 8 {
        break
    }
    fmt.Println(i)
}
{% endhighlight %}

---


### Funções
Em Go, funções são blocos de código reutilizáveis que executam uma tarefa específica. Elas são definidas com a palavra-chave `func`, e podem retornar múltiplos valores, algo incomum em muitas linguagens.

+ Declaração de Funções
{% highlight go %}
func nomeDaFuncao(param1 tipo1, param2 tipo2) tipoRetorno {
    // corpo da função
}
{% endhighlight %}

+ Exemplo:
{% highlight go %}
func soma(a int, b int) int {
    return a + b
}
{% endhighlight %}

+ Os tipos podem ser agrupados:
{% highlight go %}
func soma(a, b int) int {
    return a + b
}
{% endhighlight %}

+ Retorno Múltiplo
> Go permite múltiplos retornos:

{% highlight go %}
func dividir(dividendo, divisor int) (int, error) {
    if divisor == 0 {
        return 0, fmt.Errorf("divisão por zero")
    }
    return dividendo / divisor, nil
}
{% endhighlight %}

+ Funções Nomeadas
> Os valores de retorno podem ser nomeados:

{% highlight go %}
func operacoes(a, b int) (soma, produto int) {
    soma = a + b
    produto = a * b
    return
}
{% endhighlight %}

+ Funções Variádicas
> Aceitam número variável de argumentos:

{% highlight go %}
func somar(nums ...int) int {
    total := 0
    for _, num := range nums {
        total += num
    }
    return total
}
{% endhighlight %}

+ Funções como Valores
> Funções são cidadãos de primeira classe:

{% highlight go %}
func aplicar(f func(int, int) int, a, b int) int {
    return f(a, b)
}
{% endhighlight %}

+ Closures
> Funções podem capturar variáveis do escopo:

{% highlight go %}
func contador() func() int {
    i := 0
    return func() int {
        i++
        return i
    }
}
{% endhighlight %}

+ Funções Anônimas
> Podem ser usadas diretamente:

{% highlight go %}
resultado := func(a, b int) int {
    return a + b
}(2, 3)
{% endhighlight %}

+ Recursão
> Funções podem chamar a si mesmas:

{% highlight go %}
func fatorial(n int) int {
    if n == 0 {
        return 1
    }
    return n * fatorial(n-1)
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

## Structs
Em Go, *structs* são tipos compostos que agrupam variáveis sob um mesmo nome, permitindo representar entidades com múltiplos atributos. Elas são essenciais para a programação orientada a dados na linguagem, já que Go não tem classes como linguagens `OO` tradicionais.

* Structs são passadas por valor, exceto quando usadas como ponteiros.
* Campos exportados começam com letra maiúscula.
* Structs são a base para JSON, XML e comunicação em rede via `encoding/json`, etc.

+ Definição
{% highlight go %}
type Pessoa struct {
    Nome  string
    Idade int
}
{% endhighlight %}
> Essa struct `Pessoa` agrupa dois campos: `Nome` e `Idade`.

+ Instanciação
{% highlight go %}
p1 := Pessoa{"João", 30}
p2 := Pessoa{Nome: "Maria", Idade: 25}
p3 := Pessoa{}
p3.Nome = "Carlos"
p3.Idade = 40
{% endhighlight %}

+ Acesso a Campos
{% highlight go %}
fmt.Println(p1.Nome)  // João
p2.Idade = 26
{% endhighlight %}

+ Structs como Ponteiros
> Go permite trabalhar com ponteiros para structs, economizando memória e evitando cópias desnecessárias:

{% highlight go %}
p := &Pessoa{Nome: "Ana", Idade: 22}
p.Idade++ // sintaxe simplificada, Go desreferencia automaticamente
{% endhighlight %}

+ Métodos com Structs
{% highlight go %}
func (p Pessoa) Saudacao() string {
    return "Olá, " + p.Nome
}
{% endhighlight %}

+ Métodos com receptor valor não alteram o original. Para modificar o estado:
{% highlight go %}
func (p *Pessoa) Envelhecer() {
    p.Idade++
}
{% endhighlight %}

+ Structs Anônimas
{% highlight go %}
p := struct {
    Nome string
    Idade int
}{"Lucas", 28}
{% endhighlight %}

+ Composição (embedding)
> Go usa *composição* em vez de herança:

{% highlight go %}
type Endereco struct {
    Rua string
    Numero int
}

type Cliente struct {
    Pessoa
    Endereco
    ClienteDesde int
}
{% endhighlight %}
> Campos embutidos podem ser acessados diretamente: `cliente.Rua`


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

## Mapas
Mapas em Go são estruturas de dados baseadas em chave-valor, semelhantes aos dicionários em Python ou objetos em JavaScript. Eles permitem armazenar, acessar e manipular pares de dados de forma eficiente.

+  Declaração e Inicialização
{% highlight go %}
var m map[string]int
m = make(map[string]int)
{% endhighlight %}

Ou de forma mais concisa:
{% highlight go %}
m := make(map[string]int)
{% endhighlight %}

Também é possível inicializar diretamente com valores:
{% highlight go %}
m := map[string]int{
    "apple":  2,
    "banana": 5,
}
{% endhighlight %}

+ Operações Básicas
 - Inserção

{% highlight go %}
m["orange"] = 3
{% endhighlight %}

+ Leitura
{% highlight go %}
val := m["apple"]
{% endhighlight %}

+ Verificação de Existência
{% highlight go %}
val, ok := m["banana"]
if ok {
    // chave existe
}
{% endhighlight %}

+ Exclusão
{% highlight go %}
delete(m, "orange")
{% endhighlight %}

+ Iteração
{% highlight go %}
for key, value := range m {
    fmt.Println(key, value)
}
{% endhighlight %}

+ Referências
> Mapas são estruturas de referência, ou seja, ao passar para funções, você está passando o ponteiro internamente.

{% highlight go %}
func modify(m map[string]int) {
    m["new"] = 42
}
{% endhighlight %}

+ Cuidados
 - Acesso a mapas não é seguro para concorrência. Use `sync.Map` ou mecanismos de sincronização (`sync.Mutex`) se necessário.
 - O valor zero de um mapa é `nil`. Você precisa inicializá-lo com `make()` antes de usar.

+ Exemplo Completo
{% highlight go %}
package main

import "fmt"

func main() {
    fruits := map[string]int{
        "apple":  10,
        "banana": 15,
    }

    fruits["mango"] = 7

    for fruit, qty := range fruits {
        fmt.Printf("%s: %d\n", fruit, qty)
    }

    delete(fruits, "banana")
}
{% endhighlight %}

---

Nsse episódio finalizamos o *CORE* de Go, a partir dos próximos episódio veremos implementações na prática!


