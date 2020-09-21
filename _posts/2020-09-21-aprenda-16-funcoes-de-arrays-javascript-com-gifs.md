---
layout: post
title: "Aprenda 16 Funções de Arrays Javascript com GIFs"
date: 2020-09-21 14:34:12
image: '/assets/img/js/js.jpg'
description: 'Muitas vezes, um conceito fica difícil para nós assimilarmos, no entanto, se o conteúdo é multimídia fica mais fácil para a maioria das pessoas.'
icon: 'bx:bxl-javascript'
iconname: 'javascript'
tags:
- javascript
---

![Aprenda 16 Funções de Arrays Javascript com GIFs](/assets/img/js/js.jpg)

Muitas vezes, um conceito fica difícil para nós assimilarmos, no entanto, se o conteúdo é multimídia fica mais fácil para a maioria das pessoas.

E esses GIFs tornam mais fácil de entender e como funciona algumas funções [JavaScript](https://terminalroot.com.br/tags#javascript) que são importantes!

---

# [concat()](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/Array/concat)
O método `concat()` retorna um novo array contendo todos os arrays ou valores passados como parâmetro. Cria um novo array unindo todos os elementos que foram passados como parâmetro, na ordem dada, para cada argumento e seus elementos (se o elemento passado for um array).
### Sintaxe
> arr.concat(valor1, valor2, ..., valorN)

### Exemplo:
![concat](/assets/img/js/array/concat.gif)

---

# [fill()](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/Array/fill)
O método `fill()` preenche todos os valores do array a partir do índice inicial a um índice final com um valor estático. O intervalo de preenchimento dos elementos é  `[início, fim`).
### Sintaxe
> arr.fill(valor[, ínicio = 0[, fim = this.length]])

### Exemplo:
![fill](/assets/img/js/array/fill.gif)

---

# [filter()](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/Array/filtro)
O método `filter()` cria um novo array com todos os elementos que passaram no teste implementado pela função fornecida.` filter()` chama a função `callback` fornecida, uma vez para cada elemento do array, e constrói um novo array com todos os valores para os quais o callback retornou o valor `true` ou  um valor que seja convertido para `true`.
### Sintaxe
> var newArray = arr.filter(callback[, thisArg])

### Exemplo
![filter](/assets/img/js/array/filter.gif)

---

# [find()](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/Array/find)
O método `find()` retorna o valor do primeiro elemento do array que satisfizer a função de teste provida. Caso contrario, `undefined` é retornado.
### Sintaxe
> arr.find(callback(element[, index[, array]])[, thisArg])

### Exemplo
![find](/assets/img/js/array/find.gif)

---

# [forEach](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach)
O método `forEach()` executa uma dada função em cada elemento de um array.
### Sintaxe
> arr.forEach(callback(currentValue [, index [, array]])[, thisArg]);

### Exemplo
![forEach](/assets/img/js/array/foreach.gif)

---

# [includes()](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/Array/includes)
O método `includes()` determina se um array contém um determinado elemento, retornando true ou false apropriadamente.
### Sintaxe
> array.includes(searchElement[, fromIndex])

### Exemplo
![includes](/assets/img/js/array/includes.gif)

---

# [indexOf()](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/Array/indexof)
O método `indexOf()` retorna o primeiro índice em que o elemento pode ser encontrado no array, retorna `-1` caso o mesmo não esteja presente.
### Sintaxe
> array.indexOf(elementoDePesquisa, [pontoInicial = 0])

### Exemplo
![indexOf](/assets/img/js/array/indexof.gif)

---

# [join()](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/Array/join)
O método `join()` junta todos os elementos de uma array (ou um array-like object) em uma string e retorna esta string.
### Sintaxe
> arr.join([separador = ','])

### Exemplo
![join](/assets/img/js/array/join.gif)

---

# [map()](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/Array/map)
O método `map()` invoca a função `callback` passada por argumento para cada elemento do Array e devolve um novo Array como resultado.
### Sintaxe
> arr.map(callback[, thisArg])

### Exemplo
![map](/assets/img/js/array/map.gif)

---

# [pop()](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/Array/pop)
O método `pop()` remove o último elemento de um array e retorna aquele elemento.
### Sintaxe
> arr.pop()

### Exemplo
![pop](/assets/img/js/array/pop.gif)

---

# [push()](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/Array/push)
O método `push()` adiciona um ou mais elementos ao final de um array e retorna o novo comprimento desse array.
### Sintaxe
> arr.push(elemento1, ..., elementoN)

### Exemplo
![push](/assets/img/js/array/push.gif)

---

# [reverse()](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/Array/reverse)
O método `reverse()` inverte os itens de um array. O primeiro elemento do array se torna o último e o último torna-se o primeiro.
### Sintaxe
> arr.reverse()

### Exemplo
![reverse](/assets/img/js/array/reverse.gif)

---

# [shift()](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/Array/shift)
O método `shift()` remove o primeiro elemento de um array e retorna esse elemento. Este método muda o tamanho do array. 
### Sintaxe
> arr.shift()

### Exemplo
![shift](/assets/img/js/array/shift.gif)

---

# [sort()](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/Array/sort)
O método `sort()` ordena os elementos do próprio array e retorna o array. A ordenação não é necessariamente estável. A ordenação padrão é de acordo com a  pontuação de código unicode.
### Sintaxe
> arr.sort([funcaoDeComparacao])

### Exemplos
![sort](/assets/img/js/array/sort01.gif)

![sort](/assets/img/js/array/sort02.gif)

---

# [unshift()](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/Array/unshift)
O método `unshift()` adiciona um ou mais elementos no início de um array e retorna o número de elementos (propriedade `length`) atualizado.
### Sintaxe
> arr.unshift([element1[, ...[, elementN]]])

![unshift](/assets/img/js/array/unshift.gif)

---

Existe um repositório com todos os gifs [aqui](https://cutt.ly/LfYhgCw) para mais informações veja [aqui](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/Array).





