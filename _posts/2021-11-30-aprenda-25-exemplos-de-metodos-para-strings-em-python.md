---
layout: post
title: "Aprenda 25 Exemplos de Métodos para Strings em Python"
date: 2021-11-30 11:33:49
image: '/assets/img/python/python-strings.jpg'
description: 'Útil para filtragem e manipulação de dados.'
icon: 'ion:terminal-sharp'
iconname: 'Python'
tags:
- python
---

![Aprenda 25 Exemplos de Métodos para Strings em Python](/assets/img/python/python-strings.jpg)

[Python](https://terminalroot.com.br/tags#python) é realmente uma [linguagem de programação](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html) versátil e de fácil utilização . Ela já possui diversas funções/métodos que facilitam e muito trabalhar com dados.

Nesse artigo vamos conhecer **25 métodos para trabalhar com strings**, isso é super importante, pois uma das maiores facilidades do [Python](https://terminalroot.com.br/tags#python) é justamente filtrar e manipular dados.

---

# 01. `capitalize()`
Capitalizar uma palavra
{% highlight python %}
name = "tERMINAL"
print( name.capitalize() )
{% endhighlight %}
> Saída: `Terminal`

---

# 02.`casefold()`
Converte para minúsculas

{% highlight python %}
name = "tERMINAL"
print( name.casefold() )
{% endhighlight %}
> Saída: `terminal`


<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# 03. `center()`
Adicionar caractere no início e no final para totalizar uma quantidade

{% highlight python %}
name = "Terminal"
print( name.center(12, "-") )
{% endhighlight %}
> Saída: `--Terminal--`

---

# 04. `count()`
Retorna a quantidade de vezes que um caractere se repete

{% highlight python %}
name = "casa"
print( name.count("a") )
{% endhighlight %}
> Saída: `2`

---

# 05. `endswith()`
Retorna `True`(Verdadeiro) se uma string terminal com uma string indicada

{% highlight python %}
name = "Terminal"
print( name.endswith("nal") )
{% endhighlight %}
> Saída: `True`

---

# 06. `find()`
Retorna a 1º posição da letra/string desejada

{% highlight python %}
name = "Terminal"
print( name.find("i") )
{% endhighlight %}
> Saída: `4`

---

# 07. `format()`

{% highlight python %}
name = "Eu {} {} Python!"
print( name.format("❤️ ", "amar") )
{% endhighlight %}
> Saída: `Eu ❤️  amar Python!`


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

---

# 08. `format_map()`

{% highlight python %}
name = {'a': 'Python', 'b': 'curto'}
print( 'Eu {b} {a}'.format_map(name) )
{% endhighlight %}
> Saída: `Eu curto Python`

---

# 09. `isalnum()`
Retorna verdadeiro se a string possuir **somente** letras e/ou números.

{% highlight python %}
name = "plan9"
print( name.isalnum() )
{% endhighlight %}
> Saída: `True`

---

# 10. `isalpha()`
Retorna verdadeiro se a string possuir **somente letras**.

{% highlight python %}
name = "plan9"
print( name.isalpha() )
{% endhighlight %}
> Saída: `False`

---

# 11. `isdecimal()`
Retorna verdadeiro se a string for um **número decimal**

{% highlight python %}
name = "9.36"
print( name.isdecimal() )
{% endhighlight %}
> Saída: `False`

---

# 12. `isdigit()`
Retorna verdadeiro se a string for composta de dígitos

{% highlight python %}
name = "936"
print( name.isdigit() )
{% endhighlight %}
> Saída: `True`

---

# 13. `islower()`
Verifica se as letras estão em minúsculas

{% highlight python %}
name = "somos minúsculos..."
print( name.islower() )
{% endhighlight %}
> Saída: `True`

---

# 14. `isspace()`
Verifica se todos os caracteres são espaços em branco

{% highlight python %}
name = "         "
print( name.isspace() )
{% endhighlight %}
> Saída: `True`

---

# 15. `isupper()`
Verifica se todas as letras estão em maiúsculas

{% highlight python %}
name = "TERMINAL"
print( name.isupper() )
{% endhighlight %}
> Saída: `True`

---

# 16. `ljust()`
Conta o tamanho da string e adiciona à direita o caractere informado até completar o valor desejado.

{% highlight python %}
name = "Terminal"
print( name.ljust(11, '>') )
{% endhighlight %}
> Saída: `Terminal>>>` . Agora tente o `rjust` e obtenha o inverso.

---

# 17. `lower()`
Converte todas as letras em minúsculas

{% highlight python %}
name = "TeRmInAl RoOt"
print( name.lower() )
{% endhighlight %}
> Saída: `terminal root`

---

# 18. `upper()`
Converte todas as letras em maiúsculas

{% highlight python %}
name = "TeRmInAl RoOt"
print( name.upper() )
{% endhighlight %}
> Saída: `TERMINAL ROOT`


<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# 19. `replace()`
Substitui uma string

{% highlight python %}
name = "Terminal User"
print( name.replace("User", "Root") )
{% endhighlight %}
> Saída: `Terminal Root`

---

# 20. `strip()`
Remove espaços em branco da direita e da esquerda.

{% highlight python %}
name = "    Terminal Root     "
print( name.strip() )
{% endhighlight %}
> Saída: `Terminal Root`

---

# 21. `title()` 
Torna todas as palavras capitalizadas

{% highlight python %}
name = "tErminAl rOOt pYthon"
print( name.title() )
{% endhighlight %}
> Saída: `Terminal Root Python`

---

# 22. `zfill()` 
Adiciona *zeros* à esquerda para completar a quantidade desejada.

{% highlight python %}
name = ".936"
print( name.zfill(6) )
{% endhighlight %}
> Saída: `00.936`

---

# 23. `removesuffix()`
Remove parte de uma string

{% highlight python %}
name = "Terminal"
print( name.removesuffix("inal") )
{% endhighlight %}
> Saída: `Term`

---

# 24. `swapcase()` 
Troca ordem de minúsculas para maiúsculas e vice-versa

{% highlight python %}
name = "TERMINAL root"
print( name.swapcase() )
{% endhighlight %}
> Saída: `terminal ROOT`

---

# 25. `istitle()`
Verifica se todas as iniciais estão capitalizadas(em forma de título)

{% highlight python %}
name = "Terminal Root Python"
print( name.istitle() )
{% endhighlight %}
> Saída: `True`

---

Veja também:
# [As 30 melhores bibliotecas e pacotes Python para Iniciantes](https://terminalroot.com.br/2019/12/as-30-melhores-bibliotecas-e-pacotes-python-para-iniciantes.html)


