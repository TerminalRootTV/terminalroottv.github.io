---
layout: post
title: "A Base das linguagens de programação está na Correspondência Curry–Howard"
date: 2024-12-27 21:10:15
image: '/assets/img/compiladores/curry-howard.jpg'
description: "💭 Uma observação de Haskell Curry e William Howard."
icon: 'ion:terminal-sharp'
iconname: 'Linguagens de Programação'
tags:
- compiladores
- interpretadores
- terlang
- programacao
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

[A](https://en.wikipedia.org/wiki/Curry%E2%80%93Howard_correspondence) correspondência Curry–Howard é uma observação profunda na ciência da computação e na lógica matemática que estabelece uma relação direta entre sistemas formais de prova e sistemas de programação. Em resumo, a correspondência afirma que:

- **Provas lógicas correspondem a programas computacionais.**
- **Fórmulas lógicas correspondem a tipos.**

Dessa forma, a construção de uma prova para uma fórmula lógica pode ser vista como a construção de um programa com um tipo correspondente. 


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

## Origem e Contexto

![Haskell Curry](/assets/img/compiladores/curry.png) 
![William Howard](/assets/img/compiladores/howard.jpg) 

A correspondência recebeu esse nome em homenagem a Haskell Curry e William Howard, que trabalharam separadamente para estabelecer as relações entre a lógica proposicional e os sistemas de programação.

- **Haskell Curry**: Explorou a relação entre sistemas formais e funções.
- **William Howard**: Formalizou a relação entre provas lógicas e tipos em sistemas de programação em seu artigo de 1969.

A ideia ganhou notoriedade quando foi aplicada à lógica intuicionista, especialmente com o sistema de tipos no âmbito da programação funcional.

---

## Intuição por Trás da Correspondência

![Correspondência](https://i.gifer.com/origin/b1/b106c2c02471a031d2e9c5fc3c739ca1_w200.gif) 

- **Fórmulas lógicas**: Representam especificações ou restrições.
- **Provas**: Representam construções que demonstram a validade das especificações.
- **Programas**: São implementações dessas construções.
- **Tipos**: Garantem que os programas seguem as especificações.

Por exemplo, no contexto de programação funcional, um programa que tem o tipo `A -> B` pode ser visto como uma prova de que, dada uma entrada do tipo `A`, é possível produzir um valor do tipo `B`.


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

## Exemplos na Prática

![Exemplos na Prática](https://media.tenor.com/trIRGeV6UUcAAAAM/allen-iverson-meme-iverson-meme.gif) 

#### 1. Lógica Simples: Implicação
Na lógica, a implicação `A → B` significa que, se `A` é verdadeiro, então `B` também é verdadeiro.

No sistema de tipos, isso corresponde a um programa que recebe um valor do tipo `A` e retorna um valor do tipo `B`. Esse programa pode ser representado em uma linguagem funcional como Haskell:

```haskell
implicacao :: (A -> B) -> A -> B
implicacao f x = f x
```

Aqui, a função `implicacao` demonstra como transformar um valor de `A` em um valor de `B` usando uma função fornecida.

#### 2. Lógica Conjuntiva: "E" Lógico
Na lógica, a conjunção `A ∧ B` significa que tanto `A` quanto `B` são verdadeiros.

No sistema de tipos, isso corresponde a um par de valores, um do tipo `A` e outro do tipo `B`.

Em Haskell, podemos representar isso com tuplas:

```haskell
conjuncao :: (A, B)
conjuncao = (valorA, valorB)
```

#### 3. Lógica Disjuntiva: "Ou" Lógico
Na lógica, a disjunção `A ∨ B` significa que pelo menos um dos valores, `A` ou `B`, é verdadeiro.

No sistema de tipos, isso corresponde a um tipo soma, ou seja, um valor que pode ser de um tipo ou de outro.

Em Haskell, usamos `Either` para representar isso:

```haskell
disjuncao :: Either A B
disjuncao = Left valorA -- Ou Right valorB
```

---

## Benefícios da Correspondência Curry–Howard
![Benefícios da Correspondência curry-howard](https://upload.wikimedia.org/wikipedia/commons/thumb/8/8b/Coq_plus_comm_screenshot.jpg/300px-Coq_plus_comm_screenshot.jpg) 

1. **Segurança de tipos**: Garantir que um programa está correto equivale a provar uma fórmula lógica.
2. **Raciocínio formal**: Programadores podem raciocinar sobre código como se fossem matemáticos raciocinando sobre provas.
3. **Ferramentas de verificação**: Sistemas como Coq e Agda permitem criar provas e extrair código diretamente delas.

---

### Conclusão

A correspondência Curry–Howard é um conceito poderoso que unifica a lógica e a programação, permitindo uma compreensão mais profunda de como projetamos e verificamos software. Usando exemplos concretos e ferramentas modernas, é possível aplicar esses princípios para escrever códigos mais seguros e confiáveis.

Com essa visão, podemos apreciar como as [linguagens de programação modernas](https://terminalroot.com.br/mylang) são profundamente influenciadas pela teoria dos tipos e pela lógica matemática.

## Aprenda a Criar sua própria linguagem de programação:
### <https://terminalroot.com.br/mylang>

---

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

<!--
Via: <https://en.wikipedia.org/wiki/Curry%E2%80%93Howard_correspondence>
-->
Fontes:
+ <http://wadler.blogspot.com/2014/08/howard-on-curry-howard.html>
+ <https://web.archive.org/web/20080819185521/http://www.thenewsh.com/~newsham/formal/curryhoward/>
+ <http://www.haskell.org/wikiupload/1/14/TMR-Issue6.pdf>
+ <https://books.google.com/books?id=TLHfQPHNs0QC>



