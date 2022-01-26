---
layout: post
title: "Conheça a linguagem de programação Wisp, o Lisp escrito em C++"
date: 2022-01-26 13:00:21
image: '/assets/img/programacao//wisp.jpg'
description: 'E também uma breve história do Lisp e como utilizar mais esse dialeto da família dos parênteses.'
icon: 'ion:terminal-sharp'
iconname: 'Lisp'
tags:
- programacao
- lisp
- clojure
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

O **Lisp**, ou antigamente **LISP**, não é só uma [linguagem de programação](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html) e sim uma **família de linguagens de programação**, isso mesmo!

É um padrão que existem diversos **dialetos**, e é um dos padrões mais antigos do meio do "alto nível das linguagens de programação", é somente 1 ano menos velha que o **Fortran** que é considerada a mais velha de todas.

Mais precisamente em 1958 Lisp foi desenvolvida [John McCarthy](https://en.wikipedia.org/wiki/John_McCarthy_(computer_scientist)).

O nome em português seria **LIS**ta do **P**rocessador, algo do tipo 😃 . O Lisp foi pioneira em muitas ideias que hoje são largamente utilizada, como:
- Tipagem dinâmica
- Recursões
- Gerenciamento automático de memória
- E entre outros.

Apesar de muitos acharem que [Inteligência Artificial](https://terminalroot.com.br/tags/#artificialinteligence) é algo moderno, naquela época Lisp era a predileta para AI , pesquisa e ciência de dados, até hoje ainda é assim por muitos.

Sua sintaxe é considerada uma verdadeira *bizarrice*, ou seja tudo, absolutamente tudo fica dentro de parênteses `( )` .

As linguagens de programação ou dialetos Lisp mais famosos são:
- [Common Lisp](http://common-lisp.net/) (Muita coisa que usamos tem ele no meio)
- Emacs Lisp (O Lisp do [GNU](https://terminalroot.com.br/tags#gnu) criado nada mais, nada menos, pelo *lispeiro*: [Richard Stallman](https://terminalroot.com.br/2018/10/Etica-vigilancia-e-democracia-na-visao-de-richard-stallman.html) )
- [Scheme](http://www.scheme-reports.org/) (Um Lisp bem minimalista)
- [Clojure](https://clojure.org/) (O mais utilizado atualmente)
- Maclisp
- EuLisp
- Visual LISP
- Franz Lisp
- OpenLisp

E diversas outras.


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

Estima-se haver mais de 30 dialetos Lisp, sendo que o mais famoso e atual é o [Clojure](https://clojure.org/) .
> Segundo a pesquisa do [Stackoverflow](https://insights.stackoverflow.com/survey/2021) o Clojure é a linguagem de programação que oferece os melhores salários no mundo!!!

A sintaxe é muito simples e fácil de aprender e lembre-se: sempre haverá parênteses!

Se você escrevesse [JavaScript](https://terminalroot.com.br/tags#javascript) em Lisp, um código exemplo seria assim:

{% highlight clojure %}
(var name = "Terminal Root")
(function do_something()(
  ( print (2 + 2))
))
{% endhighlight %}
Bem sinistro, né não?!

Mas há diversos programadores no mundo de Lisp, e eles são totalmente acostumados e formam uma comunidade grande perante até muitas outras linguagens de programação mais famosas atualmente. E muitas empresas lá fora buscam programadores de Clojure e Lisp em geral.

Não é à toa que Clojure foi considerada a segunda linguagem de programação [mais amada](https://insights.stackoverflow.com/survey/2021) entre os programadores em 2021, segundo o [Stackoverflow](https://insights.stackoverflow.com/survey/2021) .

---

# Sobre o Wisp
Bom, deixando um pouco o papo sobre Lisp de lado, mas ainda falando de Lisp... Há uma versão minimalista escrita em [C++](https://terminalroot.com.br/cpp)(ou seja, muito fácil de instalar, aliás bota facilidade nisso) que é o **Wisp** .

Trata-se de um projeto pessoal que implementa o Lisp de maneira muito simples e talvez seja sua melhor alternativa para você entrar no mundo Lisp, caso você queira entrar nesse mundo.

O legal desse dialeto é para você que curte [C++](https://terminalroot.com.br/cpp) ele tem um código bem escrito e ideal para quem deseja futuramente criar sua própria linguagem de programação e entender conceitos de: tokens, lexicografia, parser e entre outros.

O interpretador inteiro foi escrito em um único arquivo `wisp.cpp` e isso facilita muita coisa na análise de código e tudo dentro dele está bem organizado.


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

# Instalação do Wisp
Como eu havia dito, a instalação é muito simples, primeiro basta usar o [Git](https://terminalroot.com.br/tags#git) para clonar o projeto:
{% highlight sh %}
git clone https://github.com/adam-mcdaniel/wisp
{% endhighlight %}

Agora basta ter um compilador, de preferência o [g++](https://terminalroot.com.br/tags#gcc), entrar no diretório e compilar com o comando abaixo.
> Observação, ele só compila em **C++ 2003**.
{% highlight sh %}
cd wisp
g++ -std=c++03 wisp.cpp -o wisp
{% endhighlight %}

E para instalar no sistema, copie para um diretório que esteja na sua `$PATH`, eu sempre recomendo o `/usr/local/bin`:
{% highlight sh %}
sudo install -v wisp /usr/local/bin/
{% endhighlight %}

O Wisp não tem parâmetro para *versão* e nem `help`, mas veremos que o uso é muito simples!

---

# Olá, Wisp!
Eu ainda não entendo muito de Lisp, mas pretendo aprender até porque eu sou um fanático por aprender linguagens de programação.

Mas o básico seria um *Hello, World!* da vida e há 3 maneiras de fazer isso com Wisp:

### 1º. Rodando via [linha de comando](https://terminalroot.com.br/tags#comandos)
Para isso use o parâmetro `-c` e em seguida o código Lisp entre aspas simples e lógico entre parênteses:
{% highlight sh %}
wisp -c '(print "Olá, Mundo!")'
{% endhighlight %}

### 2º. Rodando via arquivo
Crie um arquivo de extensão `.lisp`, exemplo: `nvim hello.lisp` e insira o conteúdo abaixo:
{% highlight clojure %}
(print "Olá, Mundo!")
{% endhighlight %}

E para rodar use o parâmetro `-f` de *file*:
{% highlight sh %}
wisp -f hello.lisp
{% endhighlight %}

### 3º. Executando em uma subshell via prompt
Se você só rodar o comando `wisp` você entra na subshell que roda comandos [Lisp](https://en.wikipedia.org/wiki/Lisp_(programming_language)), exemplo:
{% highlight sh %}
user@host ~ $ wisp
>>> (print "Olá, Mundo!")
Olá, Mundo!
 => "Olá, Mundo!"
>>> (exit)
{% endhighlight %}
> Note que para sair é `(exit)`(entre parênteses) e evite usar setas direcionais(**→ ↓ ←**), ele irá interpretar de forma literal, ou seja, aparecerá uns: `^[[A^[[D^[[C` .

Para mais informações acesse o [repositório oficial](https://github.com/adam-mcdaniel/wisp) e o diretório de [exemplos](https://github.com/adam-mcdaniel/wisp/tree/main/examples), aprender por exemplos é legal!


