---
layout: post
title: "Shell Script - Como renomear um diretório com dados de um arquivo"
date: '2013-06-16T13:46:00.000-07:00'
image: '/assets/img/shell-script/pasta-sem-nomes.jpg'
description: "Baixei um disco da internet, onde as músicas vieram somente com os números, mas sem o nome das mesmas, pois os nomes vieram num arquivo TXT"
tags:
- shellscript
---

> Olá galera, tive um problema hoje, seguinte: baixei um disco da internet, onde as músicas vieram somente com os números, mas sem o nome das mesmas, pois os nomes vieram num arquivo TXT exemplo: 

## Pasta com as músicas:
   
![Shell Script - Como renomear um diretório com dados de um arquivo](/assets/img/shell-script/pasta-sem-nomes.jpg "Shell Script - Como renomear um diretório com dados de um arquivo")
 
 
> Então, criei um Script em Shell que pega a 1° linha do txt e renomea o primeiro arquivo do diretório, depois pega a 2° e renomea a segunda música do diretório...e assim por diante

## Arquivo em TXT:
{% highlight bash %}

cat faixas.txt

01-Alceu Valença-Estação Da luz
02-Alceu Valença-Como Dois Animais
03-Alceu Valença-Tropicana
04-Alceu Valença-Petrolina Juazeiro
05-Alceu Valença-Anunciação
06-Alceu Valença-Coração Bobo
07-Alceu Valença-Solidão
08-Alceu Valença-Pelas Ruas Que Andei
09-Alceu Valença-Essa Menina
10-Alceu Valença-Cabelo No Pente
11-Alceu Valença-Leque Moleque
12-Alceu Valença-Girassol
13-Alceu Valença-O Ovo e a Galinha
14-Alceu Valença-Cantiga Do Sapo
15-Alceu Valença-Romance Da Bela Inês
16-Alceu Valença-Descida da Ladeira
17-Alceu Valença-Meu Forró Meu Canto
18-Alceu Valença-Rima Com Rima
19-Alceu Valença-Vou Pra Campinas
20-Alceu Valença-Eu Quero Ver Você Dizer Que Eu Sou Ruim
 
{% endhighlight %}
 
> Levando em conta que no diretório também existiam outros arquivos que não eram música, ou seja, no formato __JPG__(Capa do disco) e o próprio arquivo com as músicas(__faixas.txt__), então o Script também deve ter a tarefa de __NÃO__ renomeá-los. Com esse algoritmo na cabeça, criei o seguinte

## ✍ Primeiramente, como as músicas são em MP3, precisava que no arquivo final existisse o .mp3, então inclui uma linha que põe o '.mp3' a palavra no final de cada linha:
{% highlight bash %}
sed -i 's/$/.mp3/' faixas.txt
{% endhighlight %}
 
## ✍ Conta a quantidade de arquivos no formato MP3 no diretório, onde 'max' seria a variável que me daria a quantidade dos arquivos:
{% highlight bash %}
max=$(ls *.mp3 | wc -l)
{% endhighlight %}
 
## ✍ Cria um diretório temporário
{% highlight bash %}
mkdir .temp
{% endhighlight %}
 
## ✍ Lista os arquivos em MP3 e a saída joga para um TXT na pasta temporária:
{% highlight bash %}
ls *.mp3 > .temp/lista_antiga_dos_arquivos.txt
{% endhighlight %}
   
## ✍ Um loop onde a sequencia(seq) iria do 1 ao 'max': 
{% highlight bash %}
 for i in $(seq 1 $max)
 do
  #comandos
 done
 
{% endhighlight %}
 
# Dentro do loop criado acima, coloque tais comandos:
 
##  ♛ Lê a linha da lista criada com o 'ls' e joga um linha do loop para um outro arquivo, ainda na pasta temporária
{% highlight bash %}
sed "$i!d" .temp/lista_antiga_dos_arquivos.txt > .temp/uma_das_musicas_lista_VELHA.txt
{% endhighlight %}
 
##  ♛ Armazena a linha(nome antigo, ex.: 01.mp3) numa variável:
{% highlight bash %}
velho=$(cat .temp/uma_das_musicas_lista_VELHA.txt)
{% endhighlight %}
 
##  ♛ Agora lê a lista das faixas(COM OS NOMES QUE DESEJA-SE RENOMEAR) e também joga num outro arquivo temporário:
{% highlight bash %}
sed "$i!d" faixas.txt > .temp/uma_das_musicas_lista_NOVA.txt
{% endhighlight %}
 
##  ♛ Armazena a linha(NOME NOVO DA MÚSICA) numa variável:
{% highlight bash %}
novo=$(cat .temp/uma_das_musicas_lista_NOVA.txt)
{% endhighlight %}
 
##  ♛ Finalmente substitímos o nome dos arquivo(RENOMEAMOS)
{% highlight bash %}
mv "$velho" "$novo"
{% endhighlight %}
 
##  ♛ Imprime o novo nome só para acompanhar a renomeação:
{% highlight bash %}
echo "$novo"
{% endhighlight %}
 
## ✍ E por fim, FORA DO LOOP, removemos a pasta temporária:
{% highlight bash %}
rm -rf .temp
{% endhighlight %}
 
# Verifique o código completo do Script:

{% highlight bash %}
#!/bin/bash
# www.terminalroot.com.br
sed -i 's/$/.mp3/' faixas.txt
max=$(ls *.mp3 | wc -l)
mkdir .temp
ls *.mp3 > .temp/lista_antiga_dos_arquivos.txt
for i in $(seq 1 $max)
 do 
  sed "$i!d" .temp/lista_antiga_dos_arquivos.txt > .temp/uma_das_musicas_lista_VELHA.txt
  velho=$(cat .temp/uma_das_musicas_lista_VELHA.txt)
  sed "$i!d" faixas.txt > .temp/uma_das_musicas_lista_NOVA.txt
  novo=$(cat .temp/uma_das_musicas_lista_NOVA.txt)
  mv "$velho" "$novo"
  echo $novo
  
 done
 
rm -rf .temp
{% endhighlight %}
 
## Por fim a pasta ficou assim
    
![Shell Script - Como renomear um diretório com dados de um arquivo](/assets/img/shell-script/pasta-com-nomes.jpg "Shell Script - Como renomear um diretório com dados de um arquivo")
 
# Valeu!
 
 
 

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

