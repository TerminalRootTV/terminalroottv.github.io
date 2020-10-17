---
layout: post
title: "Gerando Números para Mega-Sena com Shell Script"
date: '2015-01-09T12:29:00.000-08:00'
description: "Script em Bash para gerar números para Mega-Sena, o Script foi melhorado e enviado por Diego Rocha."
tags:
- shellscript
---
![Gerando Números para Mega-Sena com Shell Script](/assets/img/sh-rep-mega/blog-linux-mega-sena-bash-repub.jpg "Gerando Números para Mega-Sena com Shell Script")

> Olá galera, aqui vou mostrar um Script em Bash para gerar números para __Mega-Sena__, o Script foi __melhorado__ e enviado por __Diego Rocha__.

{% highlight bash %}
#!/bin/bash
# Autor: Diego Brum 
# email: diego.brum@gmail.com
# Numeros sugeridos da mega sena
n1=0
n2=0
n3=0
n4=0
n5=0
n6=0
# Numeros obtidos do ultimo sorteio disponivel no site da caixa
mega1=0
mega2=0
mega3=0
mega4=0
mega5=0
mega6=0
function ordenador {
	echo " " > var1.txt
	printf "%s\n" $@ | sort -n >> var1.txt
	todos=""
	for y in $(cat var1.txt); do
		todos="$todos $y"
		
	done
	echo -en " \033[42;1;34m $todos \033[0m \n"
}
function acertos {
	qtd_acertos=0
	for r in $(cat var1.txt); do
		if [[ $r -eq $mega1 ]] || [[ $r -eq $mega2 ]] || [[ $r -eq $mega3 ]] || [[ $r -eq $mega4 ]] || [[ $r -eq $mega5 ]] || [[ $r -eq $mega6 ]]; then
					
			((qtd_acertos+=1))
		fi
	done
	echo "Você teve $qtd_acertos acerto(s)"
}
function sugestao {
echo "Sugestão de jogo:"
for x in {1..6}; do
	num=$(echo "$((RANDOM % 61))")
	while [[ $num -eq 0 ]] || [[ $num -eq $n1 ]] || [[ $num -eq $n2 ]] || [[ $num -eq $n3 ]] || [[ $num -eq $n4 ]] || [[ $num -eq $n5 ]] || [[ $num -eq $n6 ]] 
	do
		num=$(echo "$((RANDOM % 61))")
	done
	case "$x" in
		
		1) n1=$num
			;;
		2) n2=$num
			;;
		3) n3=$num
			;;
		4) n4=$num
			;;	
		5) n5=$num
			;;
		6) n6=$num
			;;
	esac
done
ordenador "$n1 $n2 $n3 $n4 $n5 $n6"
}
function ultimoResultadoMegaSena {
	wget http://loterias.caixa.gov.br/wps/portal/loterias/landing/megasena/ --output-document=resultado_mega.txt -q
	echo "Resultado do último concurso:"
	mega1=$(cat resultado_mega.txt |grep "numbers mega-sena" |awk -F "|" '/.*[1-9][1-9]/ {print $2}')
	mega2=$(cat resultado_mega.txt |grep "numbers mega-sena" |awk -F "|" '/.*[1-9][1-9]/ {print $4}')
	mega3=$(cat resultado_mega.txt |grep "numbers mega-sena" |awk -F "|" '/.*[1-9][1-9]/ {print $6}')
	mega4=$(cat resultado_mega.txt |grep "numbers mega-sena" |awk -F "|" '/.*[1-9][1-9]/ {print $8}')
	mega5=$(cat resultado_mega.txt |grep "numbers mega-sena" |awk -F "|" '/.*[1-9][1-9]/ {print $10}')
	mega6=$(cat resultado_mega.txt |grep "numbers mega-sena" |awk -F "|" '/.*[1-9][1-9]/ {print $12}')
	echo -en " \033[42;1;34m $mega1 $mega2 $mega3 $mega4 $mega5 $mega6  \033[0m \n"
}
echo
ultimoResultadoMegaSena
echo
sugestao
echo
acertos
echo
exit 0
{% endhighlight %}

Dica enviada por: Diego Rocha | diego.brum@gmail.com

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



