---
layout: post
title: "Pesquisando CEP via Shell Script"
date: '2013-08-25T09:27:00.004-07:00'
image: '/assets/img/shell-script/correios-shell.jpg'
description: "Script simples para saber o Estado, Cidade, Bairro e Logradouro de um determinado CEP, explicações segue nos comentários do código."
main-class: 'bash'
tags:
- Shell Script
- SED
---

![Pesquisando CEP via Shell Script](/assets/img/shell-script/correios-shell.jpg "Pesquisando CEP via Shell Script")

> Script simples para saber o Estado, Cidade, Bairro e Logradouro de um determinado CEP, explicações segue nos comentários do código.


{% highlight bash %} 
#!/bin/bash
# --------------------------------------
# ./cep.sh
#
# Pesquisando CEP via Shell Script
#
# Uso: ./cep.sh [CEP]
#
# Ex.: ./cep.sh 41630635
#
# Autor: Marcos da B. M. Oliveira , www.terminalroot.com.br
# Desde: Dom 25 Ago 2013 13:11:36 BRT
# Licença: GPL
# --------------------------------------
# se não informa o CEP o script pára aqui
[ -z $1 ] &amp;&amp; echo -e '\e[40;31;1mÉ necessário informar o CEP\033[m' &amp;&amp; exit 1

#url da pesquisa
url='http://cep.republicavirtual.com.br/web_cep.php?cep'

# baixa o código fonte do xml e grava no arquivo cep.txt
lynx -source $url=$1 > cep.txt

# converte o arquivo para utf-8
iconv -f=iso_8859-1 -t=utf-8 cep.txt > cep2.txt

# limpa todas as tags XML
sed 's/]*>//g' cep2.txt > cep.txt

# remove o arquivo da transformação do encode
rm -rf cep2.txt

# apaga da linha 1 à 4 , pois são desnecessárias
sed -i '1,4d' cep.txt

# apaga todas as linhas em branco
sed -i '/^$/d' cep.txt

# imprime(com cores) os dados do arquivo gerado pelo dump, personalizado.
echo -e "\e[40;37;1m CIDADE-UF:\033[m \e[40;33;1m"$(sed -n '2p' cep.txt) $(sed -n '1p' cep.txt) "\033[m"
echo -e "\e[40;37;1m BAIRRO:\033[m \e[40;33;1m"$(sed -n '3p' cep.txt) "\033[m"
echo -e "\e[40;37;1m LOGRADOURO:\033[m \e[40;33;1m"$(sed -n '4p' cep.txt) $(sed -n '5p' cep.txt) "\033[m"

# remove o arquivo
rm -rf cep.txt
{% endhighlight %}
