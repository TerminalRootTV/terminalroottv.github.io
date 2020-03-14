---
layout: post
title: "Gerador e Validador de CPF em Shell Script (Bash)"
date: '2013-10-27T14:16:00.000-07:00'
image: '/assets/img/shell-script/cpf-shell.jpg'
description: "Segue Script com COMENTÁRIOS."
tags:
- shellscript
---

![Gerador e Validador de CPF em Shell Script (Bash)](/assets/img/shell-script/cpf-shell.jpg "Gerador e Validador de CPF em Shell Script (Bash)")

> Segue Script abaixo com COMENTÁRIOS. 

 
{% highlight bash %}
#!/bin/bash
# ----------------------------------------------------------------------------
# Gerador e Validador de CPF em Shell Script (Bash)
# 
# Uso: ./cpf [cpf]
# Ex.: ./cpf 552.056.731-09 # pode utilizar assim
# ./cpf 55205673109 # pode utilizar assim
# ./cpf # gera um CPF válido
#
# Autor: Marcos da B.M. Oliveira , http://www.terminalroot.com.br/
# Desde: Dom 27 Out 2013 18:36:16 BRST
# Versão: 1
# Licença: GPL
# ----------------------------------------------------------------------------
# limpa todos os caracteres que não for número.
cpf=$(echo $1 | tr -d -c 0123456789)
##############################################################################
##############################################################################
########## -- SE FOR PRA GERAR CPF -- ########################################
##############################################################################
##############################################################################
# se não for digitado o parâmetro do cpf
if [ -z $cpf ]; then
# gera 3 sequência de 3 caracters, números randômicos.
 for i in {1..3};
  do
   a+=$(($RANDOM%9));
   b+=$(($RANDOM%9));
   c+=$(($RANDOM%9));
  done
  
  
# estabelece o valor temporário do cpf, só pra poder gerar os digitos verificadores. 
 cpf="$a$b$c"
# array pra multiplicar com o 9(do 10 ao 2)primeiros caracteres do CPF, respectivamente.
mulUm=(10 9 8 7 6 5 4 3 2)
# um loop pra multiplicar caracteres e numeros.Utilizamos nove pois são 9 casas do CPF
 for digito in {1..9}
  do
    # gera a soma dos números posteriormente multiplicados
    let DigUm+=$(($(echo $cpf | cut -c$digito) * $(echo ${mulUm[$(($digito-1))]})))
      
  done
  
# divide por 11
restUm=$(($DigUm%11))
# gera o primeiro digito subtraindo 11 menos o resto da divisão
primeiroDig=$((11-$restUm))
# caso o resto da divisão seja menor que 2
[ $restUm -lt 2 ] &amp;&amp; primeiroDig=0 
# atualizamos o valor do CPF já com um digito descoberto
cpf="$a$b$c$primeiroDig"
# agora um novo array pra multiplicar com o 10(do 11 ao 2) primeiros caracteres do CPF, respectivamente.
mulDois=(11 10 9 8 7 6 5 4 3 2)
 for digitonew in {1..10}
  do
    
    let DigDois+=$(($(echo $cpf | cut -c$digitonew) * $(echo ${mulDois[$(($digitonew-1))]})))    
  done
# também divide por 11
restDois=$(($DigDois%11)) 
# gera o segundo digito subtraindo 11 menos o resto da divisão
segundoDig=$((11-$restDois))
# caso o resto da divisão seja menor que 2
[ $restDois -lt 2 ] &amp;&amp; segundoDig=0 
# exibe o CPF gerado e formatado.
echo -e "\033[1;35mO CPF gerado é:\033[1;32m $a.$b.$c-$primeiroDig$segundoDig\033[0m"
 # FINALIZA O SCRIPT
 exit 0;
fi
##############################################################################
##############################################################################
# -- SE DIGITAR O PARÂMETRO, MAS A QUANTIDADE DE NÚMEROS SEJA MENOR QUE 11 -- 
##############################################################################
##############################################################################
# verificamos a quantidade de caracteres
qtde=$(echo $cpf | wc -c)
# como o wc aumenta mais 1, então precisamos subtrair para chegar a quantidade exata.
total=$(echo $(($qtde-1)))
# se for menos de 11 caracteres
if [ $total != 11 ]; then
 # informa o erro e mostra quantos caracteres têm.
 echo -e "\033[1;31mQuantidade de números diferente de \033[7;31m11\033[0m: Total:\033[1;35m $total\033[0m";
 
 # finaliza o script
 exit 0;
else
# se passar, continua...daqui pra frente os comentários serão o mesmo da geração do CPF, 
# mas nesse caso pra validar, pois só os dois últimos é que definem o CPF
##############################################################################
##############################################################################
########## -- SE FOR PRA VALIDAR CPF -- ########################################
##############################################################################
##############################################################################
mulUm=(10 9 8 7 6 5 4 3 2)
 for digito in {1..9}
  do
    
    let DigUm+=$(($(echo $cpf | cut -c$digito) * $(echo ${mulUm[$(($digito-1))]})))    
  done
  
mulDois=(11 10 9 8 7 6 5 4 3 2)
 for digitonew in {1..10}
  do
    
    let DigDois+=$(($(echo $cpf | cut -c$digitonew) * $(echo ${mulDois[$(($digitonew-1))]})))    
  done
restUm=$(($DigUm%11))
[ $restUm -lt 2 ] &amp;&amp; primeiroDig=0 
primeiroDig=$((11-$restUm))
restDois=$(($DigDois%11))
[ $restDois -lt 2 ] &amp;&amp; segundoDig=0 
segundoDig=$((11-$restDois))
 if [ $(echo $cpf | cut -c10) == $primeiroDig -a $(echo $cpf | cut -c11) == $segundoDig ]; then
  # se o CPF for válido.
  echo -e "\033[1;32mCPF Válido!\033[0m"
 else
  # informa quais seriam os dois últimos se o CPF estiver incorreto.
  echo -e "\033[1;31mCPF Inválido.\nOs dois Últimos números deveriam ser:\033[1;32m $primeiroDig$segundoDig\033[0m"
 fi
 
fi
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

