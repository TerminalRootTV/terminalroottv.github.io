---
layout: post
title: "14 códigos úteis de JavaScript #3"
date: 2024-06-06 08:31:51
image: '/assets/img/js/js-tips-3.jpg'
description: "🗞️ A parte #1 foi há 13 anos atrás! =)"
icon: 'ion:terminal-sharp'
iconname: 'JavaScript'
tags:
- javascript
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Em 2011 eu fiz essa postagem:
## [Alguns códigos simples de JavaScript](http://terminalroot.com.br/2011/11/alguns-codigos-simples-de-javascript.html)
> Baseada nas coisas que eu mais estava utilizando naquela época!

5 anos depois eu fiz essa:
## [10 códigos úteis de JavaScript #2](https://terminalroot.com.br/2016/12/alguns-codigos-simples-de-javascript-2.html)
> Pra facilitar pra mim e pra quem quisesse o famoso: copiar e colar! =)

Hoje, 13 anos depois da primeira, vamos fazer a **Parte #3** \o/


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

## 01. Converter RGB para Hexadecimal:
{% highlight js %}
const rgbToHex = (r, g, b) =>  "#" + ((1 << 24) + (r << 16) + (g << 8) + b).toString(16).slice(1)
console.log( rgbToHex(55, 44, 77) ) // #372c4d
{% endhighlight %}
> Teste a veracidade [aqui](https://www.rgbtohex.net/).

---

## 02. Copiar para área de tranferência
{% highlight html %}
<button onclick="copyToClipboard('Texto do Botão')">Texto do Botão</button>

<script>
    const copyToClipboard = (text) => navigator.clipboard.writeText(text);
</script>
{% endhighlight %}
> Após clicar no botão, quando pressionar `Ctrl + v` em qualquer outro lugar possível, aparecerá: '`Texto do Botão`'. Se enviar direto(sem botão para clicar) pro navegador, ele pedirá uma confirmação:

![Transferência](/assets/img/js/transferencia.png) 

---

## 03. Verificar se uma data é válida
{% highlight js %}
const isDateValid = (...val) => !Number.isNaN(new Date(...val).valueOf());
//                        Mês / Dia / Ano
console.log( isDateValid("06/06/2024") ) // true
console.log( isDateValid("13/31/2024") ) // false
{% endhighlight %}
> A segunda é `false` pois, lógico, não existe mês **13** 😃 

---

## 04. Dia do Ano
{% highlight js %}
const dayOfYear = (date) =>
  Math.floor((date - new Date(date.getFullYear(), 0, 0)) / 1000 / 60 / 60 / 24);
const dayQtd = dayOfYear(new Date());
console.info(dayQtd) // 158
{% endhighlight %}
> De acordo com a data de publicação desse artigo! Se você pesquisar esse tipo de frase no Google, por exemplo, irá confirmar:
![Confirmar no Google](/assets/img/js/dia-do-ano.png) 


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

## 05. Capitalizar somente a primeira letra de uma frase
Javascript não possui uma função para esse resultado específico. Apesar de ser fácil, às vezes pode tomar um tempinho até acertar =)
{% highlight js %}
const capitalize = str => str.charAt(0).toUpperCase() + str.slice(1)
let frase = "amanhã será um lindo dia"
console.log( capitalize(frase) )
// Amanhã será um lindo dia
{% endhighlight %}

---

## 06. Descobrir quantos de dias há em um intervalo de datas
{% highlight js %}
const dayDif = (date1, date2) => Math.ceil(Math.abs(date1.getTime() - date2.getTime()) / 86400000)
let qtdDays = dayDif(new Date("2024-05-31"), new Date("2024-06-06"))
console.log(qtdDays) // 6
{% endhighlight %}

---

## 07. Gerar número Hexadecimal aleatório
Pode ser útil para backgrounds(`body` nesse caso) com cores diversificadas!
{% highlight js %}
const randomHex = () => `#${Math.floor(Math.random() * 0xffffff).toString(16).padEnd(6, "0")}`;
let color = randomHex()
document.body.style.background = color;
// console.log(randomHex());
{% endhighlight %}

---

## 08. Remover elementos duplicados de um array
{% highlight js %}
const removeDuplicates = (arr) => [...new Set(arr)];
console.log(removeDuplicates([1, 2, 3, 3, 4, 4, 5, 5, 6]));
// 1, 2, 3, 4, 5, 6
{% endhighlight %}

---

## 09. Criar botão de *Ir pro Topo da Página* facilmente
{% highlight html %}
<body>
  <p>=)</p>
  <div id="main" style="height:2000px;"></div>
  <a onclick="goToTop()">Ir pro topo!</a>
  <script>
    const goToTop = () => window.scrollTo(0, 0);
  </script>
</body>
{% endhighlight %}

---

## 10. Descobrir a média de alguns números
{% highlight js %}
const average = (...args) => args.reduce((a, b) => a + b) / args.length;
let media  = average(1, 2, 3, 4);
console.log(media) // 2.5
{% endhighlight %}

---

## 11. Inverter uma string
{% highlight js %}
const reverse = str => str.split('').reverse().join('')
console.log( reverse('Terminal Root') )
// tooR lanimreT
{% endhighlight %}

---

## 12. Capturar trechos selecionados pelo mouse
{% highlight bash %}
<div id="main">
  <p>Isso também pode ser selecionado</p>
  <p>Ou partes de qualquer desses trechos</p>
  <button onclick="showSelected()">Mostrar o que você selecionou</button>
</div>
<script>
  const getSelectedText = () => window.getSelection().toString()
  const showSelected = () => console.log(getSelectedText())
</script>
{% endhighlight %}

---

## 13. Embaralhar um array
{% highlight js %}
const shuffleArray = (arr) => arr.sort(() => 0.5 - Math.random());
console.log(shuffleArray([1, 2, 3, 4]));
{% endhighlight %}


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

## 14. Verificar se o usuário está usando o modo Dark no Dispositivo
> Ás vezes o navegador pode não está em Dark Mode, mas se o dispositivo estiver, ele detecta

{% highlight js %}
const isDarkMode = window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches
console.log(isDarkMode)
{% endhighlight %}
> No meu caso que uso: `true`

---

Espero daqui a alguns anos fazer a parte 4!`[brincadeira]` [😃](https://dev.to/saviomartin/20-killer-javascript-one-liners-94f).

