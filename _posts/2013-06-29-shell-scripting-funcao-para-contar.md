---
layout: post
title: "Como Contar Palavras de um arquivo com Shell Script"
date: '2013-06-29T19:07:00.002-07:00'
image: '/assets/img/shell-script/terminal52.jpg'
description: 'Contar quantas vezes uma determinada palavra aparece num texto (arquivo)'
tags:
- gnulinux
- shellscript
- sed
---

![Como Contar Palavras de um arquivo com Shell Script](/assets/img/shell-script/terminal52.jpg "Como Contar Palavras de um arquivo com Shell Script")

> Olá galera, acabei de criar essa função , serve pra contar quantas vezes uma determinada palavra aparece num texto(arquivo) modo de utilizar entre outros dados, no próprio cabeçalho do Script, cada linha explicada nos comentários.


{% highlight bash %}
#!/bin/bash
# ---------------------------------------------------------------
# ./contapalavra
#
# Shell Scripting: Função para contar palavra num arquivo
#
# Uso: contapalavras [palavra] [arquivo]
#
# Ex.: ./contapalavras MinhaPalavra arquivo.txt
#
# Autor: Marcos da Boa Morte, www.terminalroot.com.br
# Desde: Sáb 29 Jun 2013 22:53:28 BRT 
# Versão: 1
# Licença: GPL
# ----------------------------------------------------------------
contapalavra(){
 # Deixa todas as palavras numa única linha
 sed 's/ /\n/g' $2 | 
 
 # apaga todas as linhas em branco
 sed '/^$/d' | 
 
 # Remove caracteres que não são parte de palavras
 sed 's/[^A-Za-z0-9ÀàÁáÂâÃãÉéÊêÍíÓóÔôÕõÚúÇç_-]/ /g' | 
 
 # Ordena as palavras em ordem alfabética
 sort -n | 
 
 # exibe quantidade de vezes que aparece em cada linha a palavra X
 uniq -c | 
 
 # ordena por numeros a quantidade de uniq
 sort -n | 
 
 # exibe as linhas que contém a palavra procurada
 # n (mostra o número de cada linha; 
 # i ignora a diferença entre letras maiúsculas e letras minúsculas
 egrep -ni "$1" | 
 
 # o egrep(pós uniq) exibe [numero: palavra], então o cut retira o : e o que vem antes dele
 cut -d: -f2 | 
 
 # troca os espaços vazios por quebra de linha
 sed 's/ /\n/g' | 
 
 # remove novamente as linhas em branco
 sed '/^$/d' | 
 
 #exibe o número(que está na primeira linha)
 sed -n 1p
 
 # exibição intuitiva, caso queira.
 #echo "A palavra ($1) aparece: "$(sed -n 1p) " vezes no arquivo: "$2
}

# chama a função e passa os parâmetros para ela.
contapalavra $1 $2

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



