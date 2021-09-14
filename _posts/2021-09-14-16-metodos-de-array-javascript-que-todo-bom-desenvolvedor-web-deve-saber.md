---
layout: post
title: "16 Métodos de array JavaScript que todo bom Desenvolvedor Web deve saber"
date: 2021-09-14 11:44:57
image: '/assets/img/js/arrays-javascript.jpg'
description:
icon: 'ion:terminal-sharp'
iconname: 'JavaScript'
tags:
- javascript
- desenvolvimentoweb
---

![16 Métodos de array JavaScript que todo bom Desenvolvedor Web deve saber](/assets/img/js/arrays-javascript.jpg)

[JavaScript](https://terminalroot.com.br/2020/01/javascript.html) fornece vários métodos integrados para lidar com matrizes/arrays. Vamos ver uma lista de **16** desses métodos que o ajudarão a melhorar suas habilidades de desenvolvimento de JavaScript.

---

# 1. `includes`
O método `includes` verifica na matriz e retorna `true` se o elemento fornecido está presente e `false` se não está.

{% highlight js %}
const numbers = [1, 2, 3, 4, 5];
console.log(numbers.includes(3)); // true
console.log(numbers.includes(3, 3)); // false
{% endhighlight %}
O método `includes` também usa um segundo parâmetro que é a posição inicial para iniciar a verificação.

---

# 2. `map`
O método `map` pega um elemento individual da matriz fornecida e altera seu valor de acordo com a função passada, então retorna uma nova matriz com esses valores modificados.

{% highlight js %}
const numbers = [1, 2, 3, 4, 5];
const squared = numbers.map((e) => e ** 2);
console.log(squared); // [ 1, 4, 9, 16, 25 ]
{% endhighlight %}

---

# 3. `filter`
O método `filter` verifica cada elemento na matriz em relação à condição na função passada e retorna apenas os elementos que atendem a essa condição.


<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

{% highlight js %}
const numbers = [1, 2, 3, 4, 5];
const result = numbers.filter((element) => element % 2 === 0);
console.log(result); // [ 2, 4 ]
{% endhighlight %}

---

# 4. `forEach`
O método `forEach` executa uma função uma vez para cada elemento da matriz.

{% highlight js %}
const numbers = [1, 2, 3, 4, 5];
numbers.forEach((element) => {
  const message =
    element % 2 === 0
      ? `${element} é um número par`
      : `${element} é um número ímpar`;
console.log(message);
});
// Saída: 
// 1 é um número ímpar
// 2 é um número par
// 3 é um número ímpar
// 4 é um número par
// 5 é um número ímpar
{% endhighlight %}

---

# 5. `reduce`
O método `reduce` usa uma função com dois parâmetros, o primeiro parâmetro é para acumular o resultado e o segundo parâmetro para manter o valor do elemento atual durante a iteração. Esse valor acumulado é retornado após a execução das operações na função fornecida.

{% highlight js %}
const numbers = [1, 2, 3, 4, 5];
const result = numbers.reduce(
    (totalSum, currentValue) => totalSum + currentValue
);
console.log(result); // 15
{% endhighlight %}

---

# 6. `sort`
O método `sort` classifica os elementos do array em ordem crescente por padrão.

{% highlight js %}
const numbers = [2, 3, 1, 5, 4];
console.log(numbers.sort()); // [ 1, 2, 3, 4, 5 ]
{% endhighlight %}

Você também pode fornecer uma função de comparador para ele, que pega dois elementos da matriz por vez. Se a operação fornecida retornar `0`, ou um valor negativo, a matriz fornecida permanecerá inalterada. Se o resultado for um valor positivo, os elementos serão invertidos, classificando a matriz em ordem decrescente.


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

{% highlight js %}
const numbers = [2, 3, 1, 5, 4];
console.log(numbers.sort((first, second) => second - first)); 
// [ 5, 4, 3, 2, 1 ]
{% endhighlight %}

---

# 7. `join`
O método `join` cria e retorna uma nova string juntando cada elemento do array fornecido separado por uma vírgula por padrão ou por um caractere separador especificado se o usuário fornecer algum.

{% highlight js %}
const numbers = [1, 2, 3, 4, 5];
console.log(numbers.join()); // "1,2,3,4,5"
console.log(numbers.join(" - ")); // "1 - 2 - 3 - 4 - 5"
{% endhighlight %}

---

# 8. `concat`
O método `concat` mescla duas ou mais matrizes fornecidas em uma única.

{% highlight js %}
const first = [1, 2];
const second = [3, 4];
const third = [5, 6];
console.log(first.concat(second, third)); // [ 1, 2, 3, 4, 5, 6 ]
{% endhighlight %}

---

# 9. `find`
O método `find` itera sobre cada elemento da matriz e retorna o primeiro elemento que satisfaça a condição fornecida.

{% highlight js %}
const numbers = [1, 2, 3, 4, 5];
const result = numbers.find((element) => element > 2);
console.log(result); // 3
{% endhighlight %}

---

# 10. `indexOf`
O método `indexOf` retorna o índice do elemento fornecido na matriz se for encontrado e retorna `-1` se não for encontrado.


{% highlight js %}
const numbers = [1, 2, 3, 4, 5];
const result = numbers.indexOf(3);
console.log(result); // 2
{% endhighlight %}

---

# 11. `push`
O método `push` adiciona novos elementos no final da matriz fornecida.

{% highlight js %}
const numbers = [1, 2, 3, 4, 5];
numbers.push(6);
console.log(numbers); // [ 1, 2, 3, 4, 5, 6 ]
{% endhighlight %}

---

# 12. `pop`
O método `pop` remove o último elemento do final da matriz fornecida.

{% highlight js %}
const numbers = [1, 2, 3, 4, 5];
numbers.pop();
console.log(numbers); // [ 1, 2, 3, 4 ]
{% endhighlight %}

---

# 13. `shift`
O método `shift` remove um elemento do início da matriz fornecida.

{% highlight js %}
const numbers = [1, 2, 3, 4, 5];
numbers.shift();
console.log(numbers); // [ 2, 3, 4, 5 ]
{% endhighlight %}

---

# 14. `unshift`
O método `unshift` adiciona a lista de elementos fornecida ao array existente.

{% highlight js %}
const numbers = [2, 3, 4, 5];
numbers.unshift(0, 1);
console.log(numbers); // [ 0, 1, 2, 3, 4, 5 ]
{% endhighlight %}

---

# 15. `splice`
O método `splice` remove o número fornecido de elementos de um determinado índice e adiciona uma lista de elementos a partir do índice fornecido.
Aqui, no exemplo, o método de splicing remove três elementos a partir do índice de `0` e adiciona o `"0"`, `"1"`, `"2"`, `"3"` elementos a partir do índice de `0`.

{% highlight js %}
const numbers = [1, 2, 3, 4, 5];
numbers.splice(0, 3, "0", "1", "2", "3");
console.log(numbers); // [ '0', '1', '2', '3', 4, 5 ]
{% endhighlight %}

---

# 16. `slice`
O método `slice` cria e retorna uma nova matriz a partir da matriz fornecida contendo os elementos do índice inicial (incluído) ao índice final. Se nenhum índice final for fornecido, todos os elementos do índice inicial fornecido até o final da matriz serão retornados.

{% highlight js %}
const numbers = [1, 2, 3, 4, 5];
console.log(numbers.slice(0, 2)); // [ 1, 2 ]
{% endhighlight %}

---


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

Esse artigo foi publicado originalmente por [plainenglish.io](https://javascript.plainenglish.io/16-javascript-array-methods-that-every-good-web-developer-should-know-1601da8f3026) em inglês .


