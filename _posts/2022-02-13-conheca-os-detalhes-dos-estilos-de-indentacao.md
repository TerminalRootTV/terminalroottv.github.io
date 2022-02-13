---
layout: post
title: "Conheça os detalhes dos Estilos de Indentação"
date: 2022-02-13 11:29:47
image: '/assets/img/programacao/indentation.jpg'
description: 'O estilo de recuo não é obrigatório na maioria das linguagens de programação, mas ele diz muito sobre a origem do programador .'
icon: 'ion:terminal-sharp'
iconname: 'Programação'
tags:
- programacao
- desenvolvimento
- lisp
- linguagemc
- haskell
- bsd
- gnu
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Na programação de computadores , uma Indentação(estilo de recuo) é uma convenção que governa o recuo de blocos de código para transmitir a estrutura do programa. 

A indentação não é uma obrigação da maioria das linguagens de programação, onde é usada como notação secundária . Em vez disso, o recuo ajuda a transmitir melhor a estrutura de um programa para leitores humanos.

Ele é usado para visualizar melhor o vínculo entre construções de fluxo de controle , como condições ou loops, e o código contido dentro e fora deles.

No entanto, algumas linguagens (como [Python](https://terminalroot.com.br/tags#python) e [occam](https://en.wikipedia.org/wiki/Occam_(programming_language)) ) usam recuo para determinar a estrutura em vez de usar chaves ou palavras-chave; isso é chamado de regra do off-side , nessas linguagens, a indentação é significativa(e obrigatória) para o compilador ou intérprete; é mais do que apenas uma questão de estilo.

---

# Padrões existentes
Abaixo vamos ver padrões estabelecidos por algumas organização que desenvolvem software:


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

### Estilo [BSD](https://terminalroot.com.br/tags#bsd)
Esse estilo também é conhecido como **Allman**(Eric Allman, criador do sendmail)
> Notação utiliza o início das chaves após a instrução principal e alinhadas ao início da mesma.
{% highlight c %}
while (x == y)
{
    something();
    somethingelse();
}
{% endhighlight %}

---

### Estilo [K&R](https://terminalroot.com.br/tags#linguagemc)
K&R são as iniciais dos sobrenomes de **K**erningan e **R**itchie, os criadores das linguagens [AWK](https://terminalroot.com.br/tags#awk) e [C](https://terminalroot.com.br/tags#linguagemc), respectivamente. Ambos escreveram o livro de programação mais vendido da história: [The C Programming Language](https://en.wikipedia.org/wiki/The_C_Programming_Language) .
> Notação utiliza o início das chaves na mesma linha após a instrução principal.
{% highlight c %}
while (x == y) {
    something();
    somethingelse();
}
{% endhighlight %}

Esse padrão pode ser encontrado, por exemplo, no Kernel [Linux](https://terminalroot.com.br/tags#linux).

---

### Estilo [GNU](https://terminalroot.com.br/tags#gnu)
**GNU** é uma organização que desenvolve softwares de [código aberto](https://terminalroot.com.br/tags#opensource) e com licenças que permitem alterar o código e redistribuir([Software Livre](https://terminalroot.com.br/tags#freesoftware)) . Foi iniciado pelo programador [Richard Stallman](https://terminalroot.com.br/2018/10/Etica-vigilancia-e-democracia-na-visao-de-richard-stallman.html).
> Notação utiliza o início das chaves após a instrução principal e desalinhadas ao início da mesma, com diferença de um *espaço*.
{% highlight c %}
while (x == y)
  {
    something ();
    somethingelse ();
  }
{% endhighlight %}

---

### Estilo [Whitesmiths](https://en.wikipedia.org/wiki/Whitesmiths)
Whitesmiths foi o primeiro compilador comercial da linguagem C . Essa notação foi encontrada na primeira versão do [Windows](https://terminalroot.com.br/tags#windows) .
> Similar ao GNU, mas com 2 *espaços* em vez de um .
{% highlight c %}
while (x == y)
    {
    something();
    somethingelse();
    }
{% endhighlight %}

---

### Estilo [Haskell](https://terminalroot.com.br/tags#haskell)
**Haskell** é uma linguagem de programação funcional e tipada estaticamente .
> A notação é uma mistura do estilo GNU com o ponto e vírgula também alinhados às chaves.
{% highlight c %}
while (x == y)
  { something()
  ; somethingelse()
  ;
  }
{% endhighlight %}

---

### Estilo [Pico](http://pico.vub.ac.be/)
Pico é uma linguagem de programação criada com intuito de apresentar os fundamentos da programação para estudantes que não são de ciência da computação.
> A chave de abertura não é na mesma linha, mas a de fechamento é após a última instrução do bloco e na mesma linha .
{% highlight c %}
while (x == y)
{   something();
    somethingelse(); }
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

### Estilo Ratliff
**Ratliff** foi o programador(**C. Wayne Ratliff**) original por trás das populares linguagens de programação de quarta geração [dBase](https://en.wikipedia.org/wiki/DBase) -II e -III . Essa notação foi encontrada nos materiais da [Digital Research](https://en.wikipedia.org/wiki/Digital_Research) Inc.
> Lembra o estilo K&R, mas com espaços duplos no ínicio da cada linha do bloco.
{% highlight c %}
while (x == y) {
    something();
    somethingelse();
    }
{% endhighlight %}

---

### Estilo [Lisp](https://terminalroot.com.br/tags#lisp)
**Lisp** é uma linguagem de programação e também uma família de linguagens de programação que obedecem o padrão criado pelo primeiro Lisp.
> Similar à Pico, no entanto, com espaços iniciais antes da abertura do par de chaves .
{% highlight c %}
while (x == y)
  { something();
    somethingelse(); }
{% endhighlight %}
> Lembrando que esse é exemplo é ilustrativo, os Lisps possuem um uso maior de parênteses em todo o código.

---

# Qual seu estilo ?
Meu estilo é mais para K&R, só que ainda mais **moderno**! 😃 Eu gosto de unir a abertura das chaves também quando crio funções . Prefiro esse estilo porque diminui a probabilidade de erros de digitação similar à esse abaixo, quando o uso é similar ao estilo BSD:
{% highlight c %}
void myfunction()
  int x = 42; // erro de sintaxe
{
  while (x == y)
  int y = 42; // outro erro
  {
      something();
      somethingelse();
  }
}
{% endhighlight %}

Prefiro sempre usar assim:
{% highlight cpp %}
void myfunction(){
  int x = 42;
  int y = 42;
  while (x == y) {
      something();
      somethingelse();
  }
}
{% endhighlight %}

Eu chamo esse estilo de **Like a Boss!** 😃 

Abraços!

---

Fonte: [Wikipedia](https://en.wikipedia.org/wiki/Indentation_style) .

