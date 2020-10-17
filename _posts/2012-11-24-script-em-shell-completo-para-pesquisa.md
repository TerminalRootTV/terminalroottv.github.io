---
layout: post
title: "Script em Shell (completo) para pesquisa"
date: '2012-11-24T13:37:00.000-08:00'
image: '/assets/img/shell-script/procura-basica-shell.jpg'
description: "Exercício Shell"
tags:
- shellscript
---

![Script em Shell (completo) para pesquisa](/assets/img/shell-script/procura-basica-shell.jpg "Script em Shell (completo) para pesquisa")

> Olá galera, fiz um script, pra passar o tempo, de Pesquisa(completo).Segue o código no blog para análise e também estudo, a única coisa diferente das que vêm sendo abordadas aqui no blog é o surgimento do __case__. Não utilizei comentários pra não ficar muito grande, mas é tão simples e o código tão limpo que dá pra ter uma noção como o case funciona.


## Código(procura)

{% highlight bash %}
#!/bin/bash
# procura - script que faz pesquisas completas de arquivos e/ou diretórios
# Autor: Marcos da B. M. Oliveira
# Endereço Web - http://marcospinguim.blogspot.com
# Facebook - fb.com/terminalroot
echo "1 PESQUISAR POR NOME"
echo "2 PESQUISAR POR TAMANHO"
echo "3 PESQUISAR POR ALTERADOS NOS ÚLTIMOS DIAS"
echo "4 PESQUISAR POR ACESSADOS NOS ÚLTIMOS DIAS"
echo "5 CONSULTAR O MANUAL DE find"
echo "6 SAIR"
 echo -n "Por favor faça sua escolha: "
 read INPUT
 
 if [ $INPUT != 5 ] &amp;&amp; [ $INPUT != 6 ] ; then
  echo -n "Informe a PASTA que deseja pesquisar(ex.:/home/usuario/Downloads/): "
  read PASTA
 fi 
 
 case $INPUT in
 1)
  echo "A) Pesquisar por nome 'EXATO COM A EXTENSÃO'"
  echo "B) Pesquisar por arquivo ou diretório que 'CONTÉM A PALAVRA': "
  echo "C) Voltar pro MENU anterior: "
  read FIND
  
  if [ $FIND = "" ] ; then
   $FIND=/home/$USER
 fi
  
  case $FIND in
   1|a|A) 
   
    echo -n "Informe o NOME EXATO do arquivo ou diretório: "
    read nome
    find $PASTA -name $nome
   ;;
   2|b|B)
   
    echo -n "Informe A PALAVRA que está arquivo ou diretório: "
    read nome
    find $PASTA -name *$nome* 
    
  
  ;;
  3|c|C)
  clear
  sleep 0
  $0
   
  ;;
  *)
  exit 0
   ;;
   esac    
 ;;
 2)
  echo -n "Informe o TAMANHO MÍNIMO do arquivo, escreva o k(kilobytes) no final, ex.:(300k): "
  read tamanho
  find /home/marcos/Downloads -size $tamanho
 ;;
 3)
  echo -n "Informe a quantidade de dias que se passaram: "
  read data
  find /home/marcos/Downloads -ctime $data
 ;; 
 4)
  echo -n "Informe a quantidade dos últimos dias: "
  read qtde
  find /home/marcos/Downloads -used $qtde
 
 ;; 
 5)
  man find
 ;;
 
 6|q|Q)
 exit 0
 
 ;;
 *)
 clear
 echo "Por favor utilize uma das opções 1, 2, 3, 4 ou 5"
 sleep 2
 $0
 
 ;;
 esac 
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



