---
layout: post
title: "Dicas úteis para Shell Script 2"
date: '2014-12-19T12:57:00.000-08:00'
image: '/assets/img/shell-script/shell-script-logo.jpg'
description: "Continuação de dicas úteis."
tags:
- shellscript
- dicas
---
![Dicas úteis para Shell Script 2](/assets/img/shell-script/shell-script-logo.jpg "Dicas úteis para Shell Script 2")

Digitar Script no terminal utilizando __EOF (End Of File)__, serve para agilizar digitalização de qualquer coisa e já salvar via terminal, para finalizar, basta escrever em maiúsculo: __EOF__ e pressionar __[ENTER]__, pode-se usar __EOS (End Of System)__ ou __EOL (End Of Line)__ também e finalizar com __EOS [ENTER]__ ou __EOL [ENTER]__, da mesma forma ou diferente como apresentada abaixo

{% highlight bash %}
$ cat > condicao_ternaria.sh
#!/bin/bash
ping -c1 www.linux.org && echo 'Rede OK' || echo 'Rede Sujou.'
EOF
{% endhighlight %}

utilizando o __EOS__ e uma condição ternária com somente mensagens

{% highlight bash %}
$ cat > condicao_ternaria_2_so_msg.sh << EOS
#!/bin/bash
ping -c1 www.linux.org 2>/dev/null 1>/dev/null && echo 'Rede OK' ||\ echo 'Rede Sujou.'
EOS
{% endhighlight %}

Criando um arquivo sh instantâneo, utilizando o __EOL__ e o comando __trap__

{% highlight bash %}
$ sh << EOL
# funções tambem podem ser chamadas usando: function funcao(){}
# trap é o mesmo CTRL+C
function trataErro()
{
echo "Voce pressionou ctrl-c"
echo "Mas nao posso terminar agora"
}

trap trataErro SIGINT SIGTERM

for i in {1..10}
do
sleep 1
echo "Dormindo"
done
EOL
{% endhighlight %}

>

#### Truques para tratamento de variáveis em shell script

As variáveis do sistema servem para armazenar algum valor (como toda variável), mas existem alguns recursos interessantes e úteis no modo de usar tais variáveis. O que aprendemos em alguns tutoriais, é que para declarar uma variável do sistema, fazemos: 

NOME="VALOR" | Aqui podemos usar valores de outras variáveis
NOME='VALOR' | NOME terá o valor igual a VALOR
NOME=`COMANDO` | NOME terá o valor da saída de comando
 
Isto é o básico, agora teremos algumas coisas mais interessantes:
+ Retirar parte final de uma string

{% highlight bash %}
VAR="minha_foto.jpeg"
echo ${VAR%.jpeg}
{% endhighlight %}
 
> Saída: __minha_foto__

Como podemos ver, "__.jpeg__" será excluído. Indicamos o que será excluído depois do caracter '__%__'.

+ Retirar da variável a parte inicial do valor dado
{% highlight bash %}
VAR="http://www.terminalroot.com.br"
echo ${VAR#http://}
{% endhighlight %}
 
> Saída: www.terminalroot.com.br

Indicamos o que será excluído depois do caracter '__#__'

+ Mostrar tudo depois de uma certa posição
{% highlight bash %}
VAR="http://www.g00gle.com"
echo ${VAR:7}
{% endhighlight %}
 
> Saída: www.g00gle.com

Depois do '__:__' indicamos o índice. Como é em __C__, o primeiro índice é 0, o segundo é 2 ..., o oitavo é 7 ... etc.

+ Mostrar entre alguns caracteres
{% highlight bash %}
VAR="123456789"
echo ${VAR:2:5}
{% endhighlight %}
 
> Saída: 34567

Primeiro, faz-se o índice 2, que começa no caracter '3'. No índice 5, a contagem já começa no índice 2 (5 caracteres a partir do índice 2), aí morre no caracter '7'.

+ Elimina o caracter mostrado e tudo a ESQUERDA

{% highlight bash %}
VAR="daemonio@terminalroot"
echo ${VAR#*@}
{% endhighlight %}
 
> Saída: terminalroot

Bom, aqui indicamos o caracter a ser deletado e tudo a sua esquerda, depois da string "#*".

+ Elimina o caracter mostrado e tudo a DIREITA

Como o mundo não é feito somente de canhotos,

{% highlight bash %}
VAR="daemonio@terminalroot"
echo ${VAR%@*}
{% endhighlight %}
 
> Saída: daemonio

Já aqui, indicamos o caracter a ser deletado e tudo a sua direita, entre a string "__%*__".

+ Excluir até um certo valor

Esta daqui é igual ao de cima, só que podemos indicar strings ao invés de somente um caracter.

{% highlight bash %}
EXC=":senha"
VAR="root:senha:/bin/bash"
echo ${VAR%%$EXC*}
{% endhighlight %}
 
> Saída: __root__

O que será excluído tem que ficar entre "__%%__" e '__*__'.

+ Excluir de um certo valor até o final

Agora é ao contrário, exclui até o final.
{% highlight bash %}
EXC="senha:"
VAR="root:senha:/bin/bash"
echo ${VAR##*$EXC}
{% endhighlight %}
 
> Saída: __/bin/bash__

O que será excluído deve ficar depois do "__##*__".

+ Troca-troca (de strings :-)

Isto na verdade funfa que nem o comando __sed__.

{% highlight bash %}
VAR="c1:c2:c3"
echo ${VAR/:/x}
{% endhighlight %}
 
> Saída: c1xc2:c3

Troca a primeira ocorrência de '__:__' por '__x__', para trocar tudo
{% highlight bash %}
echo ${VAR//:/x}
{% endhighlight %}
 
Usa-se duas barras.

Nada impede de trocar por strings:
{% highlight bash %}
echo ${VAR//:/-CC-}
{% endhighlight %}
 
 Saída: c1-CC-c2-CC-c3

+ Mostrar o comprimento da variável:
 
 VAR="tenho 19 caracteres"
 echo ${#VAR}
 
> Saída: 19

+ Listar nomes de variáveis

Para listar todas as variáveis de seu sistema que contenha tal nome, faça:
{% highlight bash %}
echo ${!va*}
{% endhighlight %}

Mostrará todas as variáveis que começam com "va". Aí pode sair: vaca, vacuo, vassoura, etc.

+ Um ou outro
{% highlight bash %}
echo ${VAR:-"eu não existo"}
{% endhighlight %}
 
> Saída: eu não existo

Se VAR for nula, mostra "eu não existo", se não for nula, mostra o conteúdo dela.
{% highlight bash %}
VAR="eu existo"
echo ${VAR:-"eu não existo"}
{% endhighlight %}
 
> Saída: eu existo

Agora, __VAR__ não é nula, por isto mostra o conteúdo dela.

## Veja a parte 1 dos Exmplos Úteis
### [Dicas úteis para Shell Script 1](http://terminalroot.com.br/2014/12/dicas-uteis-para-shell-script.html)
 
Fonte: <http://www.vivaolinux.com.br/dica/Truques-para-tratamento-de-variaveis-em-shell-script>

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

