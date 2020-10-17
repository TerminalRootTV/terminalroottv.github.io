---
layout: post
title: "Coleção de Shell Script Bash Para Seu Linux"
date: 2018-07-22 17:54:51
image: '/assets/img/bash/bash-snipets.jpg'
description: 'Bash Snippets é uma coleção de Shell Script Bash com 19 ferramentas que servem pra você usar de forma rápida.'
tags:
- bash
- shellscript
---

## Introdução

[Bash Snippets](https://github.com/alexanderepstein/Bash-Snippets) é uma coleção de [Shell Script Bash](http://terminalroot.com.br/shell) com 19 ferramentas que servem pra você usar de forma rápida utilidades do dia a dia sem muita dificuldade e com leveza. Quer saber sintaxes de comandos ? Quer assistir vídeos do Youtube de forma rápida, ou saber as novidades do canal que você segue ? Quer criar uma tarefa pro seu dia a dia ? Todas as respostas para essa pergunta e ainda mais, você pode obter com Bash Snippets!


[Conheça Nosso Curso Extremamente Avaçado de Shell Script Bash e aprenda a criar scripts similares a esse clicando aqui](http://terminalroot.com.br/shell)


## Ferramentas

+ __Cheat__ - Aprenda rapidamente Comandos do Linux.
+ __Cloudup__ - Uma ferramenta para fazer backup de seus repositórios do GitHub para o bitbucket.
+ __Crypt__ - Criptografar e descriptografar arquivos.
+ __Cryptocurrency__ - Converte Cryptocurrency com base nas taxas de câmbio em tempo real.
+ __Currency__ - Conversor de moedas.
+ __Geo__ - Fornece os detalhes de wan, lan, roteador, dns, mac e ip.
+ __Lyrics__ - Grab letras de uma determinada música rapidamente a partir da linha de comando.
+ __Meme__ - Criador de memes de linha de comando.
+ __Movies__ - Pesquise e exiba os detalhes de um filme.
+ __Newton__ - Executa cálculos numéricos até a análise matemática simbólica.
+ __Qrify__ - Transforma a string dada em um código qr.
+ __Short__ - Encurtador de URL
+ __Siteciphers__ - Verifique quais codificações estão ativadas/desativadas para um determinado site https.
+ __Stocks__ - Fornece alguns detalhes da bolsa de valores para uma empresa.
+ __Taste__ - Mecanismo de recomendação que fornece três itens semelhantes, como o item fornecido (os itens podem ser livros, músicas, artistas, filmes e jogos, etc.).
+ __Todo__ - Gerenciador de tarefas de linha de comando.
+ __Transfer__ - Rapidamente transfira arquivos da linha de comando.
+ __Weather__ - Exibe detalhes do tempo do seu lugar.
+ __Youtube-Viewer__ - Assista ao YouTube a partir do Terminal.

## Instalação

+ Clonar o GitHub

{% highlight bash %}
git clone https://github.com/alexanderepstein/Bash-Snippets.git
{% endhighlight %}

+ Entra do Diretório clonado e executar o install com sudo/root

{% highlight bash %}
cd Bash-Snippets/ && sudo ./install.sh all
{% endhighlight %}

## Exemplos

Para todos os exemplos você pode usar o nome do comando mais o parâmetro __-h__ para obter informações de utilização: <kbd>[comando] -h</kbd>.

+ Saber o valor de 1 dólar para o real brasileiro

{% highlight bash %}
currency USD BRL 1
{% endhighlight %}

> Se quiser saber todas as moedas disponíveis para conversão rode <kbd>currency -v</kbd> ou se quiser saber o valor de 17 reais em dólar ou qualquer outras moeda, troque o __1__ por __17__ <kbd>currency USD BRL 17</kbd>

+ Saber o clima de forma gráfica para a cidade que deseja, use <kbd>weather [cidade]</kbd>

{% highlight bash %}
weather Curitiba
{% endhighlight %}

+ Ver qual a fase da Lua bem como detalhes sobre essa informação

{% highlight bash %}
weather moon
{% endhighlight %}

+ Saber as taxas de câmbio em tempo real de criptomoedas.

{% highlight bash %}
cryptocurrency
{% endhighlight %}

+ Criar o QRcode para um texto, palavra, nome,...

{% highlight bash %}
qrify convert Marcos Oliveira
{% endhighlight %}

+ Agendar uma tarefa

{% highlight bash %}
todo -a Fazer o trabalho de calculo I da faculdade
todo -a Levar a Alice pra escola
# para ver todas as tarefas agendadas
todo -g
# remover a lista uma tarefa completada, ex.: tarefa de número 2
todo -r 2
# limpar todas as tarefas
todo -c
{% endhighlight %}

+ Aprender sintaxe de uma linguagem

{% highlight bash %}
cheat bash loop
cheat bash getopt
cheat go hello
cheat rust head
cheat python while
{% endhighlight %}

+ Outros exemplos

{% highlight bash %}
lyrics -a bob marley -s who the cap fit # saber letra de uma música
meme -f neymar # cria uma imagem no seu diretório após você digitar a imagem do meme, e as duas primeiras palavras
newton # para cálculos matemáticos
geo -g # localização do seu ip
{% endhighlight %}

Para mais informações consulte a documentação oficial no endereço do GitHub deles <https://github.com/alexanderepstein/Bash-Snippets> e não deixe de adquirir nosso

# [Conheça Nosso Curso Extremamente Avaçado de Shell Script Bash e aprenda a criar scripts similares a esse clicando aqui](http://terminalroot.com.br/shell) 

Ainda está na promoção por tempo limitado, corre lá e adquira antes que termine a promoção!

# [Clique Aqui Para Assistir o Vídeo Sobre Bash Snippets](https://youtu.be/Nm1OPSCDBpI)

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



