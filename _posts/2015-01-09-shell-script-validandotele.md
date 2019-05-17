---
layout: post
title: "Shell Script validando com Expressões Regulares"
date: '2015-01-09T12:36:00.003-08:00'
image: '/assets/img/shell-script/regex-bash.jpg'
description: "grep é um utilitário de linha de comando para procurar conjuntos de dados de texto simples para as linhas que correspondem a uma expressão regular."
main-class: 'bash'
tags:
- Shell Script
---

![Shell Script validando com Expressões Regulares](/assets/img/shell-script/regex-bash.jpg "Shell Script validando com Expressões Regulares")


__grep__ é um utilitário de linha de comando para procurar conjuntos de dados de texto simples para as linhas que correspondem a uma __expressão regular__.

> __grep [OPÇÕES] expressão_regular arquivo__



<table border="1">

<tbody>
<tr><td><b><span style="color: blue;">Caracter</span></b><span style="background-color: #274e13;"></span></td><td><b><span style="color: blue;">Descrição</span></b></td></tr>
<tr><td>.</td><td>Qualquer letra</td></tr>
<tr><td>^</td><td>início da linha</td></tr>
<tr><td>$</td><td>final da linha</td></tr>
<tr><td>[xyz]</td><td>Qualquer das letras dentro dos colchetes</td></tr>
<tr><td>[^xyz]</td><td>Qualquer letra fora as dentro dos colchetes</td></tr>
<tr><td>[t-z]</td><td>Qualquer das letras entre t e z</td></tr>
<tr><td>z* </td><td>Letra z zero ou mais vezes</td></tr>
<tr><td>z+ </td><td>Letra z uma ou mais vezes</td></tr>
<tr><td>?{0,1}</td><td>Pode aparecer ou não (opcional)</td></tr>
<tr><td>*{0,}</td><td>Pode aparecer em qualquer quantidade</td></tr>
<tr><td>+{1,}</td><td>Deve aparecer no mínimo uma vez</td></tr>
<tr><td>a{2}</td><td>Casa a letra 'a' duas vezes</td></tr>
<tr><td>a{2,4}</td><td>Casa a letra 'a' de duas a quatro vezes</td></tr>
<tr><td>a{2,}</td><td>Casa a letra 'a' no mínimo duas vezes</td></tr>
<tr><td>.*</td><td>Casa qualquer coisa, é o tudo e o nada</td></tr>
<tr><td>^</td><td>início da linha</td></tr>
<tr><td>$</td><td>final da linha</td></tr>
<tr><td>[abc]</td><td>casa com os caracteres a, b e c</td></tr>
<tr><td>[a-c]</td><td>casa com os caracteres a, b e c</td></tr>
<tr><td>[^abd]</td><td>não casa com os caracteres a, b e d</td></tr>
<tr><td>(um|dois)</td><td>casa com as palavras um e dois</td></tr>
<tr><td>Repetições</td></tr>
<tr><td>a{2}</td><td>casa com a letra “a” duas vezes</td></tr>
<tr><td>a{2,5}</td><td>casa com a letra “a” duas a cinco vezes</td></tr>
<tr><td>a{2,}</td><td>casa com a letra “a” duas vezes ou mais</td></tr>
<tr><td>a?</td><td>casa com “a” letra a zero vezes ou uma</td></tr>
<tr><td>a*</td><td>casa com a letra “a” zeros vezes ou mais</td></tr>
<tr><td>a+</td><td>casa com a letra “a” uma vez ou mais</td></tr>
<tr><td>Curingas</td></tr>
<tr><td>.</td><td>casa com qualquer caracter uma vez</td></tr>
<tr><td>.*</td><td>casa com qualquer caracter várias vezes</td></tr>
<tr><td>(esse|aquele)</td><td>Casa as palavras 'esse' ou 'aquele'</td></tr>
</tbody></table>

## Exemplos

1-Procura a palavra marcos no arquivo /etc/passwd:
{% highlight bash %}
grep marcos /et/passwd
{% endhighlight %}


2-Procura todas as linhas começadas pela letra u no arquivo /etc/passwd:
{% highlight bash %}
grep '^u' /et/passwd
{% endhighlight %}


3-Procura todas as linhas terminadas pela palavra false no arquivo /etc/passwd:
{% highlight bash %}
grep 'false$' /et/passwd
{% endhighlight %}


4-Procura todas as linhas começadas pelas vogais no arquivo /etc/passwd:
{% highlight bash %}
grep '^[aeiou]' /et/passwd
{% endhighlight %}


5-Procura todas as linhas começadas por qualquer caracter e segundo caracter seja qualquer vogal no arquivo /etc/passwd:
{% highlight bash %}
grep '^.[aeiou]' /et/passwd
{% endhighlight %}


6-Procura todas as linhas que contenham uma sequência de 4 números consecutivos:
{% highlight bash %}
grep '[0-9][0-9][0-9][0-9]' /et/passwd
{% endhighlight %}


7-Comando para encontrar linhas em branco:
{% highlight bash %}
grep '^$' /et/passwd
{% endhighlight %}


8-Encontrar e contar linhas em branco:
{% highlight bash %}
grep '^$' /et/passwd | wc -l
{% endhighlight %}


9-Encontrar mesmo nome, porém com letra inicial minúscula e maiúscula:
{% highlight bash %}
grep '[Mm]arcos' /et/passwd
{% endhighlight %}


10-Encontrar 27 sequência^de 27 caracteres:
{% highlight bash %}
egrep '^.{27}$' passwd
{% endhighlight %}


> Note que foi usado o __egrep__ e não o __grep__. É porque as chaves fazem parte de um conjunto avançado de __Expressões Regulares__ ("__extended__"), então o __egrep__ lida melhor com elas. Se fosse para usar o grep normal, teria que "__escapar__" as chaves

{% highlight bash %}
grep '^.\{27\}$' /etc/passwd
{% endhighlight %}


11-Para procurar por linhas que tenham de 20 a 40 caracteres:
{% highlight bash %}
egrep '^.{20,40}$' /etc/passwd
{% endhighlight %}


12-Para obter as linhas que possuem 40 caracteres ou mais:
{% highlight bash %}
egrep '^.{40,}$' /etc/passwd
{% endhighlight %}


13-Econtrar números com 3 dígitos (de 0 a 9) ou mais:
{% highlight bash %}
egrep '[0123456789]{3,}' /etc/passwd
{% endhighlight %}


14-Econtrar linhas que começam com '__vogal minúscula__' e terminam com a palavra 'bash', usa−se o curinga "__.*__" para significar "qualquer coisa"(não confunda com "__qualquer caracterer__" somente "__.__"):
{% highlight bash %}
egrep '^[aeiou].*bash$' /etc/passwd
{% endhighlight %}


15-Procura linhas que comecem com a palavra 'eric' ou 'marcos' ou 'camila':
{% highlight bash %}
egrep '^(eric|marcos|camila)' /etc/passwd
{% endhighlight %}


16-Procura todas as linhas que NÃO comecem com a letra minúscula 'm'
{% highlight bash %}
egrep '^[^marcos]' /etc/passwd
{% endhighlight %}




## Script com validações de Tel,E-mail,CEP,IP,Data...

{% highlight bash %}
#!/bin/bash
# Script com validações de Tel,E-mail,CEP,IP,Data...
####################### VALIDAR TELEFONE no formato: (99)9999-9999 ################################################
echo 'Informe o número de Telefone.Formato: (99)9999-9999';
read TELEFONE
echo $TELEFONE | egrep '^[(][0-9]{2}[)][0-9]{4}+-[0-9]{4}$' &amp;&amp; echo -e '\033[01;32m Número válido! \033[0m' || echo -e '\033[01;31m NÃO é válido esse número.\033[0m'
######################### VALIDAR IP ##############################################
echo 'Informe o número de IP';
read IP
echo $IP | egrep '^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}$' &amp;&amp; echo -e '\033[01;32m IP válido! \033[0m' || echo -e '\033[01;31m NÃO é válido esse IP.\033[0m'
######################### VALIDAR CEP ##############################################
echo 'Informe o CEP';
read CEP
echo $CEP | egrep '^[0-9]{5}[-][0-9]{3}$' &amp;&amp; echo -e '\033[01;32m Número válido! \033[0m' || echo -e '\033[01;31m NÃO é válido esse número.\033[0m'
######################### VALIDAR DATA formato dd/mm/aaaa ##############################################
echo 'Informe a Data.Formato dd/mm/aaaa';
read DATA
echo $DATA | egrep '^[0-3]{1}[0-9]{1}[/][0-1]{1}[0-9]{1}[/][0-9]{4}$' &amp;&amp; echo -e '\033[01;32m Data válida! \033[0m' || echo -e '\033[01;31m NÃO é válida essa Data.\033[0m'
######################### VALIDAR E-MAIL ##############################################
echo 'Informe o E-mail';
read EMAIL
echo $EMAIL | egrep '^([a-zA-Z0-9_-.])+@[0-9a-zA-Z.-]+\.[a-z]{2,3}$' &amp;&amp; echo -e '\033[01;32m E-mail válido! \033[0m' || echo -e '\033[01;31m NÃO é válido esse E-mail.\033[0m'
{% endhighlight %}
