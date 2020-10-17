---
layout: post
title: "Curso Certificação Linux LPI-1: grep e sed"
date: '2012-12-16T05:47:00.000-08:00'
image: '/assets/img/lpi/sed-e-grep.gif'
description: "Básico de Grep e Sed, mas o essencial pra passar no LPI"
tags:
- linux
- lpi
- sed
---

![Curso Certificação Linux LPI-1: grep e sed](/assets/img/lpi/sed-e-grep.gif "Curso Certificação Linux LPI-1: grep e sed")

## O comando grep

__grep__ é um utilitário de linha de comando para procurar conjuntos de dados de texto simples para as linhas que correspondem a uma expressão regular.


> grep [OPÇÕES] expressão_regular arquivo

### Exemplos

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

## O comando sed

__sed__ é um editor de textos simples utilizado para fazer pequenas transformações no conteúdo dos arquivos.

> sed [opções] {script} [arquivo]

### Exemplos

1-Troca todas ocorrências da palavra marcos pela palavra pinguim:
{% highlight bash %}
sed 's/marcos/pinguim/' arquivo.txt
{% endhighlight %}

2-Troca todas ocorrências da palavra marcos pela palavra pinguim e envia as mudanças para um novo arquivo:
{% highlight bash %}
sed 's/marcos/pinguim/' arquivo.txt > novoarquivo.txt
{% endhighlight %}

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



