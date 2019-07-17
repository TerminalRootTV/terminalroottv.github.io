---
layout: post
title: "Pesquisando CEP via Shell Script"
date: '2013-08-25T09:27:00.004-07:00'
image: '/assets/img/shell-script/cep.jpg'
description: "Script simples para saber o Estado, Cidade, Bairro e Logradouro de um determinado CEP, explicações segue nos comentários do código."
main-class: 'bash'
tags:
- Shell Script
- SED
---

![Pesquisando CEP via Shell Script](/assets/img/shell-script/cep.jpg "Pesquisando CEP via Shell Script")

### Se quiser baixar como arquivo [Clique Aqui](https://gitlab.com/snippets/1876455)

> Script simples para saber o Estado, Cidade, Bairro e Logradouro de um determinado CEP, explicações segue nos comentários do código.

{% highlight bash %} 
#!/bin/bash
# --------------------------------------
# ./cep.sh
# Pesquisa CEP via Shell Script
# Uso: ./cep.sh [CEP]
# Exemplo.: ./cep.sh 41630635
# Autor: Marcos da Oliveira , www.terminalroot.com.br
# Desde: Dom 25 Ago 2013 13:11:36 BRT
# Licença: GPL
# Nova versão: 2019 19:30:11 BRT
# --------------------------------------

cep(){
	[[ -z $1 ]] && echo "É necessário informar o CEP" && exit 1
	#[[ ! $(which lynx 2>&-) ]] && echo -e '\e[40;31;1mÉ necessário ter o lynx instalado.\033[m' && exit 1
	if [[ $1 = @(-h|--help) ]]; then
  		sed -n '/^#.*Uso.*/p' ${0##*/} | tr -d '#\|'
		sed -n '/^#.*Ex.*/p' ${0##*/} | tr -d '#\|'
  		exit $(( $# ? 0 : 1 ))
	fi

	_FILE=$(mktemp)
	_FILE2=$(mktemp)

	#url da pesquisa
	url='http://cep.republicavirtual.com.br/web_cep.php?cep'

	# baixa o código fonte do xml e grava no arquivo cep.txt
	#lynx -source $url=$1 > cep.txt
	wget -q "$url=$1" -O "$_FILE"

	# converte o arquivo para utf-8
	iconv -f=iso_8859-1 -t=utf-8 "$_FILE" > "$_FILE2"

	# limpa todas as tags XML
	sed -i 's/<[^>]*>//g' "$_FILE2"

	# apaga da linha 1 à 4 , pois são desnecessárias
	sed -i '1,4d' $_FILE2

	# apaga todas as linhas em branco
	sed -i '/^$/d' $_FILE2

	# imprime(com cores) os dados do arquivo gerado pelo dump, personalizado.
	echo "┌─────────────┬─────────────────────────────"
	echo "│ CIDADE-UF:  │ "$(sed -n '2p' $_FILE2) $(sed -n '1p' $_FILE2)
	echo "├─────────────┼─────────────────────────────"
	echo "│ BAIRRO:     │ "$(sed -n '3p' $_FILE2)
	echo "├─────────────┼─────────────────────────────"
	echo "│ LOGRADOURO: │ "$(sed -n '4p' $_FILE2) $(sed -n '5p' $_FILE2)
	echo "└─────────────┴─────────────────────────────"
}

cep "$1"
# ┐ ┤ ┘
{% endhighlight %}



