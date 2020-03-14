---
layout: post
title: "Crie Marcação Matemática em HTML com MathML"
date: 2017-02-08 12:18:38
image: '/assets/img/dicas/mathml.jpg'
description: "Mathematical Markup Language - MathML é uma aplicação do XML para representar símbolos e fórmulas matemáticas, apontada na integração dela em documentos World Wide Web."
color: '#eb7728'
tags:
- html
- xml
categories:
---

![MathML](/assets/img/dicas/mathml.jpg "MathML Blog Linux")

Mathematical Markup Language (Linguagem de Marcação Matemática) (MathML) é uma aplicação do XML para representar símbolos e fórmulas matemáticas, apontada na integração dela em documentos World Wide Web. Ela é uma recomendação do grupo de trabalho matemático do W3C.
Ela está dividida em duas partes:

+ Presentation
+ Content Markup

Exemplo raíz quadrada de 2

<p>
<math>
      <msqrt>
            <mn>2</mn>
      </msqrt>
</math>
</p>

{% highlight html %}
<math>
      <msqrt>
            <mn>2</mn>
      </msqrt>
</math>

{% endhighlight %}

Perceba que o elemento raiz do MathML é o "math", e que a raiz quadrada é representada pelo elemento "msqrt" (para outras raízes existe o elemento "mroot", veja os exemplos na próxima página) e o elemento "mn" representa um número.

Os elementos mais usados em MathML são "mn", "mi" e "mo". Eles servem para representar respectivamente números (ex.: 1, 0.235), variáveis/constantes (ex.: x, π) e operadores (ex. +, =).

Veja um exemplo usando esses 3 elementos:

<p>
<math>
      <mi> y </mi>
      <mo> = </mo>
      <mi> x </mi>
      <mo> - </mo>
      <mn> 3 </mn>
</math>
</p>
{% highlight html %}
<math>
      <mi> y </mi>
      <mo> = </mo>
      <mi> x </mi>
      <mo> - </mo>
      <mn> 3 </mn>
</math>
{% endhighlight %}

Outro elemento usado com frequência é o "mrow". Esse elemento tem a função de agrupar outros elementos em linha. A princípio, pode parecer um elemento sem muita utilidade, mas em MathML existem elementos com um número específico de filhos. Dessa forma "mrow" se torna muito útil.

Por exemplo, o elemento "mfenced" serve para colocar parênteses ao redor de outro elemento, mas se for colocado mais de um elemento filho dentro dele, esses elementos são separados por vírgula, veja:
<p>
<math>
      <mfenced>
            <mi> x </mi>
            <mo> - </mo>
            <mn> 3 </mn>
      </mfenced>
</math>
</p>
{% highlight html %}
<math>
      <mfenced>
            <mi> x </mi>
            <mo> - </mo>
            <mn> 3 </mn>
      </mfenced>
</math>
{% endhighlight %}

Outro elemento que tem o número de filhos predefinido é "mfrac", que serve para criar frações, o primeiro filho é o numerador e o segundo é o denominador. Segue um exemplo:
<p>
<math>
      <mfrac>
            <mrow>
                  <mn> 2 </mn>
                  <mo> + </mo>
                  <mn> 5 </mn>
            </mrow>
            <mn>2</mn>
      </mfrac>
</math>
</p>
{% highlight html %}
<math>
      <mfrac>
            <mrow>
                  <mn> 2 </mn>
                  <mo> + </mo>
                  <mn> 5 </mn>
            </mrow>
            <mn>2</mn>
      </mfrac>
</math>
{% endhighlight %}

Os elementos "msub" e "msup" também têm o número de filhos predefinidos:

<p>
<math>
      <msub>
            <mn> 2 </mn>
            <mn> 5 </mn>
      </msub>

      <mo>+</mo>

      <msup>
            <mn> 1 </mn>
            <mn> 4 </mn>
      </msup>
</math>
</p>
{% highlight html %}
<math>
      <msub>
            <mn> 2 </mn>
            <mn> 5 </mn>
      </msub>

      <mo>+</mo>

      <msup>
            <mn> 1 </mn>
            <mn> 4 </mn>
      </msup>
</math>
{% endhighlight %}

Com MathML, é possível criar matrizes com uma sintaxe semelhante às tabelas HTML. O elemento pai é o "mtable". Dentro dele temos elementos de linha "mtr", e dentro desses, elementos de coluna "mtd". Veja:

<p>
<math>
      <mfenced><mtable>
            <mtr>
                  <mtd> <mn> 1 </mn> </mtd>
                  <mtd> <mn> 0 </mn> </mtd>
            </mtr>
            <mtr>
                  <mtd> <mn> 0 </mn> </mtd>
                  <mtd> <mn> 1 </mn> </mtd>
            </mtr>
       </mtable></mfenced>
</math>
</p>
{% highlight html %}
<math>
      <mfenced><mtable>
            <mtr>
                  <mtd> <mn> 1 </mn> </mtd>
                  <mtd> <mn> 0 </mn> </mtd>
            </mtr>
            <mtr>
                  <mtd> <mn> 0 </mn> </mtd>
                  <mtd> <mn> 1 </mn> </mtd>
            </mtr>
       </mtable></mfenced>
</math>
{% endhighlight %}

Fórmula de Bhaskara:

<p>
<math>
      <mrow>
            <mn>x</mn>
            <mo>=</mo>
            <mrow>
                  <mfrac>
                        <mrow>
                              <mo>-</mo>
                              <mi>b</mi>
                              <mo>±</mo>
                              <msqrt>
                                    <mrow>
                                         <msup>
                                              <mi>b</mi><mn>2</mn>
                                         </msup>
                                         <mo>-</mo>
                                         <mn>4</mn>
                                         <mo>.</mo>
                                         <mi>a</mi>
                                         <mo>.</mo>
                                         <mi>c</mi>
                                    </mrow>
                              </msqrt>
                        </mrow>
                        <mrow>
                              <mn>2</mn>
                              <mo>.</mo>
                              <mi>a</mi>
                        </mrow>
                  </mfrac>
            </mrow>
      </mrow>
</math>
</p>

{% highlight html %}
<math>
      <mrow>
            <mn>x</mn>
            <mo>=</mo>
            <mrow>
                  <mfrac>
                        <mrow>
                              <mo>-</mo>
                              <mi>b</mi>
                              <mo>±</mo>
                              <msqrt>
                                    <mrow>
                                         <msup>
                                              <mi>b</mi><mn>2</mn>
                                         </msup>
                                         <mo>-</mo>
                                         <mn>4</mn>
                                         <mo>.</mo>
                                         <mi>a</mi>
                                         <mo>.</mo>
                                         <mi>c</mi>
                                    </mrow>
                              </msqrt>
                        </mrow>
                        <mrow>
                              <mn>2</mn>
                              <mo>.</mo>
                              <mi>a</mi>
                        </mrow>
                  </mfrac>
            </mrow>
      </mrow>
</math>
{% endhighlight %}

Documentação Oficial: [MathML Mathematical](https://www.w3.org/Math/)

Via: [PRMINFO](http://www.prminformatica.com.br/2012/12/mathml.html)


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

