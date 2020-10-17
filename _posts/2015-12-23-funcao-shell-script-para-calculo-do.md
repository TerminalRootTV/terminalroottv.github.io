---
layout: post
title: "Função Shell Script para cálculo do Imposto de Renda e INSS"
date: '2015-12-23T14:13:00.000-08:00'
image: '/assets/img/shell-script/irrf.jpg'
description: "Simule o valor do seu Imposto de Renda"
tags:
- bash
- shellscript
- contabeis
- freesoftware
- opensource
- gnu
- terminal
- terminalroot
---

![Função Shell Script para cálculo do Imposto de Renda e INSS](/assets/img/shell-script/irrf.jpg "Função Shell Script para cálculo do Imposto de Renda e INSS")

> Hoje vamos mostrar como é feito o cálculo do __INSS__ e do [Imposto de Renda](https://is.gd/LblNpV) e usaremos como ferramenta uma função em [Shell Script](https://goo.gl/dBqXzZ).



Quando você precisa saber quando é recolhido seu quando você trabalha mensalmente para o INSS e o IRRF ou IR ou a até mesmo, mais conhecido como __Imposto de Renda__.

Para o __INSS__ há umas faixas de contribuição e o [TETO máximo](http://www.previdencia.gov.br/servicos-ao-cidadao/todos-os-servicos/gps/tabela-contribuicao-mensal/), bem como também para o __IRRF__!

Verifique, baixe e execute o script/função abaixo e leia os comentários ( linhas iniciadas com __#__ ) para entendimento.

Como nosso intuito aqui é mais o __Shell Script__ do que, não menos importante , a Contabilização , segue a __função/script__ , e não esqueça de consultar os links úteis para melhor entendimento e informação!

## Informe o salário e o número de dependentes para efetuar o cálculo, utilizando o
 
+ __-s__ para p salário;
+ __-d__ para dependentes;
+ __-h__  para dúvidas.

{% highlight bash %}
./imposto.sh -s 2.500,84 -d 1
{% endhighlight %}

A saída será mais ou menos isso, com detalhamento do INSS, IR e outros

## Para dúvidas

{% highlight bash %}
./imposto.sh -h
{% endhighlight %} 

## Ou

{% highlight bash %}
./imposto.sh --helper
{% endhighlight %}
 
# irrf.sh
{% highlight bash %}
#!/bin/bash
# 
# NOME          : 	imposto.sh - Faz o cálculo do IRRF (Imposto de Renda Retido na Fonte)
#
# SINOPSE       : 	./imposto.sh -s [SALARIO] -d [DEPENDENTES]
#					ou
#					./imposto.sh --salario [SALARIO] --dependentes [DEPENDENTES]
#
# DESCRICAO     : 	É necessário passar o -s e o -d com seus respectivos valores
#
# EXEMPLO       :	$ ./imposto.sh -s 2.500,84 -d 4 
#
# AUTHOR        : 	Marcos da B. M. Oliveira <binbash@linuxmail.org>
#
# VERSAO        : 	v1.0 2015-12-13
#
# REPORTING BUGS:	<http://www.terminalroot.com.br/>
#
# COPYRIGHT     :	Copyright © 2014 Free Software Foundation, Inc.  License GPLv3+: GNU GPL version 3 or later 
#					<http://gnu.org/licenses/gpl.html>.
#       			This is free software: you are free to change and redistribute it.  There is NO WARRANTY, 
#       			to the extent permitted by law.
#
# DEPENDENCIAS  : 	sed, bc
# 

#Valida fomatação
valida(){
	if [ -z $1 ]; then
		echo "$0: falta operando";
		echo "Tente '$0 -h ou --help' para mais informações.";
		exit 1
	fi

	if [ $1 = "-h" ] || [ $1 = "--help" ]; then
		sed -n '2,$s/^# //p' $0
		exit 1
	fi

	case $1 in
		    -s|--salario) 
				SAL=$2
		     	DEP=$4
		     	;;
		    -d|--dependentes) 
		    	DEP=$2
		    	SAL=$4
		     	;;
		             
			*) 	echo "Erro."
				exit 1;
		        ;;
	esac
}

#faz o cálculo dos dependentes
dependentes(){
	CAL="18959";
	DEP=$(echo "$DEP*$CAL" | bc);
	NDEP=$(echo "$DEP/$CAL" | bc);
}

#formata números para moeda real brasileiro
formata_num(){

	NUM=$2;

	E2=$(echo $NUM | rev | cut -c1-2 | rev);
	E1=$(echo $NUM | rev | cut -c3- | rev);
	
	if [ "${#E1}" -gt 3 ]; then
		ONE=$(echo $E1 | rev | cut -c1-3 | rev);
		TWO=$(echo $E1 | rev | cut -c4- | rev);
		NUM="$TWO.$ONE,$E2";
	else
	
		if [ -z $E1 ]; then
			NUM="0";
		else
			NUM="$E1,$E2";
		fi
	fi
	
	echo -e "$1 $NUM""\033[0m";
}

#Encontra a porcentagem do INSS
inss(){
	# caso o usuario digite só 1 numero depois da vírgula
	if [ "$(echo $SAL | grep '\,')" ]; then
		A=$(echo $SAL | cut -d, -f2);
	
		if [ ${#A} -lt 2 ]; then
			echo "Formato do número inválido";
			exit 1;
		fi
	
	fi

	# caso o usuario digite só 1 numero depois do ponto
	if [ "$(echo $SAL | grep '\.')" ]; then
		B=$(echo $SAL | cut -d. -f2);
	
		if [ ${#B} -lt 2 ]; then
			echo "Formato do número inválido";
			exit 1;
		fi
	fi

	# elimina ponto e virgula do salario para poder efetuar validação e calculo posteriormente
	SAL=$(echo $SAL | tr -d '. ,');	

	# se o usuario nao digitar o ',00' ou ',' põe o ',00'  para quantidade de algarismos menores que 5
	if [ ! "$(echo $SAL | grep '\, ')" ] && [ "${#SAL}" -lt 6 ] && [ ! "$(echo $SAL | grep '\. ')" ]; then
		SAL=$SAL"00";
	fi
	
	# Valores da tabela para cálculo do INSS
	MIN="139912";
	MED="233188";
	MAX="466375";


	if [ "$SAL" -le "$MIN" ]; then

		INSS=$(echo "($SAL* 8)/100" | bc);
	
	elif [ "$SAL" -gt "$MIN" ] && [ "$SAL" -le "$MED" ]; then

		INSS=$(echo "($SAL* 9)/100" | bc);
	
	elif [ "$SAL" -gt "$MED" ] && [ "$SAL" -le "$MAX" ]; then

		INSS=$(echo "($SAL* 11)/100" | bc);		
	
	else
	
		INSS=$(echo "(466375* 11)/100" | bc);
				
	fi	
}

#Encontra o valor da base para multiplicar à alíquota
base(){

#base para aliquota e parcela a deduzir
	BASE=$(echo "$SAL-$DEP-$INSS" | bc);

#cria variaveis para validação , eliminado os . e , baseado no valor inteiro
	MIN="190398";
	MED="282665";
	SUB="375105";
	MAX="466468";
	
	
	if [ "$BASE" -le "$MIN" ]; then
		
		QUOTA="0";
		PARC="0";
		
	elif [ "$BASE" -gt "$MIN" ] && [ "$BASE" -le "$MED" ]; then
	
		QUOTA="7.5";
		PARC="14280";		
		
	elif [ "$BASE" -gt "$MED" ] && [ "$BASE" -le "$SUB" ]; then
	
		QUOTA="15";
		PARC="35480";		
		
	elif [ "$BASE" -gt "$SUB" ] && [ "$BASE" -le "$MAX" ]; then
	
		QUOTA="22.5";
		PARC="63613";		
		
	elif [ "$BASE" -gt "$MAX" ]; then
	
		QUOTA="27.5";
		PARC="86936";	
		
	else	
		echo "Erro. Salário incorreto.";
		exit 1	
	fi
}

#chama demais funções para encontrar desejados valores e fazer o cálculo do IRRF
#encontra o valor do Imposto de Renda para depois subtrair pela parcela a deduzir
irrf(){

	valida $*
	dependentes
	inss
	base
	
	VALOR=$(echo "($BASE*$QUOTA) / 100" | bc);
	IRRF=$(echo "$VALOR-$PARC" | bc);
	echo
	echo "|--------------------------------------------------------|";
	formata_num "|Salário: R$" $SAL ;
	echo "|--------------------------------------------------------|";
	echo "|N° Dependente(s): $NDEP";
	echo "|--------------------------------------------------------|";
	formata_num "|INSS: R$" $INSS;
	echo "|--------------------------------------------------------|";
	echo		"|Alíquota: $QUOTA%";
	echo "|--------------------------------------------------------|";
	formata_num "|Parcela a deduzir: R$" $PARC;
	echo "|--------------------------------------------------------|";
	
	if [ "$IRRF" -eq "0" ]; then
		echo -e "|\033[0;1mImposto de renda à recolher: ISENTO\033[0m";
		echo "|--------------------------------------------------------|";
	else
		formata_num "|\033[0;1mImposto de renda à recolher: R$" $IRRF;
		echo -e "|--------------------------------------------------------|";
	fi
	echo
	exit 0
}

#Chama a função que irá pegar os dados e gerar o valor do IRRF
irrf $*
{% endhighlight %}
 


## Links Úteis

> https://is.gd/LblNpV

> http://www.previdencia.gov.br/servicos-ao-cidadao/todos-os-servicos/gps/tabela-contribuicao-mensal/

> http://idg.receita.fazenda.gov.br/acesso-rapido/tributos/irpf-imposto-de-renda-pessoa-fisica

> http://economia.uol.com.br/empregos-e-carreiras/noticias/redacao/2013/01/01/imposto-de-renda-e-inss-entenda-os-descontos-no-seu-salario.htm

> http://www.calculador.com.br

> https://pt.wikipedia.org/wiki/Imposto_de_Renda_de_Pessoa_F%C3%ADsica

> http://www.receita.fazenda.gov.br/PessoaFisica/IRPF/

> http://www.receita.fazenda.gov.br/Aplicacoes/ATRJO/Simulador/simulador.asp?tipoSimulador=M

> http://www.dpc.com.br/pt-br/show/tabela-progressiva-do-imposto-de-renda 

## Valeu até a próxima!

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



