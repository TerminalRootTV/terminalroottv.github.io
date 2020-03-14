---
layout: post
title: "Script Introdutório em Shell"
date: '2012-11-20T16:15:00.000-08:00'
image: '/assets/img/shell-script/intro-shell.jpg'
description: "O Script possui todos os ensinamentos básicos de Shell Script"
tags:
- shell script
---
![Script Introdutório em Shell](/assets/img/shell-script/intro-shell.jpg "Script Introdutório em Shell")

> Olá galera, vou mostrar um script que eu montei. O script está abaixo e ainda a execução de resposta do script na imagem acima, copie(leia os comentários) e cole num arquivo em branco, salve como aprender ou aprender.sh ou ainda no nome que você preferir, com ou sem o .sh que o shell interpretará em ambas as formas, só lembrando que antes deve dar permissão de execução.

{% highlight bash %}
chmod +x aprender
{% endhighlight %} 

# Script aprender.sh

{% highlight bash %}
#!/bin/bash
# shell - script que mostra informações básicas sobre Shell Script
# Autor: Marcos da B. M. Oliveira
#Basta iniciar a linha com um "#" e escrever o texto do comentário em seguida. Estas linhas
#são ignoradas pelo shell durante a execução.
#Também é possível colocar comentários no meio da linha # como este
#Dentro do script, algumas variáveis especiais são definidas automaticamente, em especial,
#"$1" contém o primeiro argumento recebido na linha de comando, "$2" o segundo, e assim por diante.
# o $# mostra a quantidade de argumentos e o $* mostra todos os argumentos passados
#O acesso é direto, basta referenciar a variável que o valor já estará definido. Assim é
#possível criar scripts que tenham opções como --help, --version e outras.
#Para usar o echo, basta colocar o texto entre "aspas". Se nenhum texto for colocado, uma linha em branco é mostrada.
echo "ESSE É UM SCRIPT EM SHELL $0 QUE MOSTRA A MAIORIA DOS ITENS BÁSICOS E EXPLICA-OS COM OU NÃO $1 $2 ARGUMENTOS."
echo "ELE TEVE $# ARGUMENTO(S), QUE SÃO: $*"
echo
#• O conteúdo da variável é acessado colocando-se um cifrão "$" na frente
#• O comando test é útil para fazer vários tipos de verificações em textos e arquivos
#• O operador lógico "&&", só executa o segundo comando caso o primeiro tenha sido OK. O operador inverso é o "||"
# O -n mantém o read na mesma linha
echo -n "SERÁ FEITAS ALGUMAS PERGUNTAS, DESEJA CONTINUAR?[s/n]: "
read RESPOSTA
test "$RESPOSTA" = "n" && exit
#O comando "read" leu o que o usuário digitou e guardou na variável RESPOSTA. Logo em seguida, o comando "test" verificou se 
#o conteúdo dessa variável era "n". 
#Se afirmativo, o comando "exit" foi chamado e o script foi finalizado. Nessa linha há vários detalhes importantes:
#            Testes em variáveis                     Testes em arquivos
# -lt Núm. é menor que (LessThan)      -d É um diretório
#-gt Núm. é maior que (GreaterThan)     -f É um arquivo normal
# -le Núm. é menor igual (LessEqual)    -r O arquivo tem permissão de leitura
#-ge Núm. é maior igual (GreaterEqual)  -s O tamanho do arquivo é maior que zero
#-eq Núm. é igual (EQual)              -w O arquivo tem permissão de escrita
#-ne Núm. é diferente (NotEqual)       -nt O arquivo é mais recente (NewerThan)
#  =  String é igual                   -ot O arquivo é mais antigo (OlderThan)
# != String é diferente                -ef O arquivo é o mesmo (EqualFile)
# -n String é não nula                 -a E lógico (AND)
# para variáveis use apenas letras minúsculas e evite acentos, símbolos e espaço em branco
#Para ver quais as variáveis que o shell já define por padrão, use o comando "env"
echo "NESSE DIRETÓRIO PODE HAVER OUTROS DIRETÓRIOS E/OU ARQUIVOS,"
echo -n "DIGITE O NOME PARA DESCOBRIRMOS SE É ARQUIVO OU DIRETÓRIO: "
read ARQUIVO
test -d "$ARQUIVO" && echo "$ARQUIVO é um diretório"
test -f "$ARQUIVO" && echo "$ARQUIVO é um arquivo"
test -f "$ARQUIVO" -o -d "$ARQUIVO" || echo "O arquivo '$ARQUIVO' não foi encontrado"
echo
#Diferente de outras linguagens, o if testa um comando e não uma condição. Porém como já
#conhecemos qual o comando do shell que testa condições(test), é só usá-lo em conjunto com o
#if. Por exemplo, para saber se uma variável é maior ou menor do que 10 e mostrar uma
#Há um atalho para o test , que é o comando [. Ambos são exatamente o mesmo comando,
#porém usar o [ deixa o if mais parecido com o formato tradicional de outras linguagens:
#Se usar o [, também é preciso fechá-lo com o ], e sempre devem ter espaços ao
#redor. É recomendado evitar esta sintaxe para diminuir suas chances de erro.
echo "AQUI HÁ UM COMANDO CRIADO CHAMADO 'marcos' COM A OPÇÃO -s MOSTRA O SOBRENOME"
echo -n "DIGITE O COMANDO COM OU SEM A OPÇÃO: "
read COMANDO
if test "$COMANDO" = "marcos -s" ; then
	echo "Marcos da B. M. Oliveira"
elif [ "$COMANDO" = "marcos" ] ; then
	echo "Marcos"
else
	echo "Comando Inválido"
fi
echo 
#O shell também sabe fazer contas. A construção usada para indicar uma expressão
#aritmética é "$((...))", com dois parênteses.
echo -n "EXPRESSÕES ARITMÉTICAS:" && echo 
echo -n "2 X 3 = " && echo $((2*3))
echo -n "2x3/2+3 = " && echo $((2*3-2/2+3))
echo "ESCREVA UM NÚMERO PARA SABERMOS O VALOR DELE MULTIPLICADO POR 2"
read NUM
echo -n "$NUM x 2 = "&& echo $((NUM*2))
echo
#O while é um laço que é executado enquanto um comando retorna OK. Novamente o
#test é bom de ser usado.
echo "AGORA VAMOS FAZER UM LOOP COM WHILE:"
echo -n "ESCREVA UM NÚMERO MENOR QUE 8: "
read A
c=$A
while [ $c -lt 8 ]
do
	echo "O número $c é menor que 8"
	(( c++ ))
done
echo 
#O for percorre uma lista de palavras, pegando uma por vez:
echo "APRENDENDO O LOOP FOR:"
for nome in Marcos da B. M. Oliveira
do
      echo "Nome: $nome"
done
#Uma ferramenta muito útil para usar com o for é o seq, que gera uma seqüência numérica.
#Para fazer o loop andar 10 passos, pode-se fazer:
for passo in $(seq 4)
  do
  	echo "Passo $passo"
done
echo
echo "FINAL DO SCRIPT $0 , ATÉ A PRÓXIMA!"
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

