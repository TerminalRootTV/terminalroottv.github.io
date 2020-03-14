---
layout: post
title: "Dicas úteis para Shell Script"
date: '2014-12-19T11:19:00.002-08:00'
image: '/assets/img/shell-script/shell-script-logo.jpg'
description: "Separei algumas dicas para Shell Script, deem uma analisada"
tags:
- shell script
---

![Dicas úteis para Shell Script](/assets/img/shell-script/shell-script-logo.jpg "Dicas úteis para Shell Script")

> Separei algumas __dicas__ para Shell Script, deem uma analisada

#### →  Contar os caracteres de uma variável

{% highlight bash %}
echo ${#variavel}
{% endhighlight %}

#### →  Usando o comando cut
+ Mostrar somente a __3° coluna__(de cada linha) do arquivo

{% highlight bash %}
cat arquivo.txt | cut -c3
{% endhighlight %}

+ Mostrar somente a __3° coluna EM DIANTE__(de cada linha) do arquivo

{% highlight bash %}
cat arquivo.txt | cut -c3-
{% endhighlight %}

+ O comando abaixo extrai o __campo 1 (field)__ do arquivo __/etc/passwd__ cujo delimitador de campo é "__:__" (delimiter)(para caracteres especiais como '__(__' [parênteses] use uma __barra__ antes __'\(' )__.

{% highlight bash %}
cat /etc/passwd | cut -d: -f1
{% endhighlight %}

+ Mostrar somente da __3° até a 6°__ coluna(de cada linha) do arquivo

{% highlight bash %}
cat arquivo.txt | cut -c3-6
{% endhighlight %}

+ Joga a __saída(stdout)__ do comando __cat__ para a __entrada(stdin)__ do __cut__ e a saída do __cut__ para a entrada do __sort__ (deixando em ordem alfabética)

{% highlight bash %}
cat arquivo.txt | cut -c3 | sort
{% endhighlight %}
#### →  Variáveis ​​locais e o comando define:

Uma variável declarada como local é aquele que só é visível dentro do bloco de código em que ela aparece. Em uma função, uma variável local só tem sentido dentro desse bloco de função forma de declarar uma variável(aspas simples e colar igual(__=__))

{% highlight bash %}
  hello(){
  local variavel = 'teste'
  }
 
{% endhighlight %}

#### →  Comando Shift:

Para trabalhar com parêmtros você pode utilizar o comando __shift__, que desloca parâmetros

Exemplo de como usar o __shift__ (arquivo __./teste.sh__):

{% highlight bash %}
 #!/bin/bash
 echo $@
 shift
 echo $@
 
{% endhighlight %}

> exemplo com saida

{% highlight bash %}
./teste.sh param1 param2 param3
 param1 param2 param3
 param2 param3
 
{% endhighlight %}

#### →  A Variável RANDOM:

gerar um número __randômico__ (aleatório) que seja até no máximo __60__

{% highlight bash %}
echo $(($RANDOM % 61))
{% endhighlight %}

#### →  O comando declare e o comando readonly

+ Use o comando '__declare__' para definir atributos de variáveis ​​e funções.

__-r__ (readonly)
__-i__ (integer/numeros)

__-f__ (para criar funções somente leitura)

{% highlight bash %}
declare -r variavel
{% endhighlight %}

+ Use o comando __readonly__ para fazer as variáveis ​​e funções __readonly__ ou seja, você não pode alterar o valor de variáveis ​​.Ou, em vez de __-r__ , usar: __readonly variavel__

{% highlight bash %}
readonly variavel='Isso é um teste!'
{% endhighlight %}

#### →  O comando case:
 O uso do 'case' tem de usar dessa forma: o case, o in, o ;;, o ) e o esac

{% highlight bash %}
opcao="$1"

case "$opcao" in
eric)
echo "Menino"
;;
camila)
echo "Mulher"
;;
marcos)
echo "Homem"
;;
esac 
{% endhighlight %}

## →  Utilizando o bc

#### Introdução

O __bc__ não é exatamente uma __calculadora__, mas sim uma linguagem para cálculos, que lembra vagamente a __linguagem C__. O que significa que podemos ter construções como __'if', 'for', 'while'__ , que um programa pode pedir informações para um usuário, e que podemos usar "programas" escritos para o '__bc__' como se usássemos um shell script.
+ Conhecendo o __bc (modo interativo)__
 
Para chamar o __bc__, basta digitar numa janela de terminal, '__bc__'. Para fazer um cálculo, basta digitar a expressão e dar __ENTER__ .

#### Operações definidas

> Adição, subtração, multiplicação, divisão.
 % | (resto da divisão)
 ^ | (potenciação)
 sqrt(x) | (raiz quadrada de x)
 last | (último resultado)
> Para sair, basta dar 'quit'.

{% highlight bash %}
bc
  bc 1.06
  Copyright 1991-1994, 1997, 1998, 2000 Free Software Foundation, Inc.
  This is free software with ABSOLUTELY NO WARRANTY.
  For details type `warranty'.
  300*500
  150000
  last + 500
  150500
  last - 1600
  148900
  last / 20
  7445
  last^4
  3072265955400625
  sqrt(last)
  55428025
  2/3
  0
  quit
  
{% endhighlight %}

Você pode estar pensando, depois desse último resultado (2/3 = 0?), "Epa! Alguma coisa está errada!".
  
Calma, não se desespere. Você precisa carregar o bc com o parâmetro '-l', que ativa uma biblioteca de operações matemáticas.

{% highlight bash %}
bc -l
  bc 1.06
  Copyright 1991-1994, 1997, 1998, 2000 Free Software Foundation, Inc.
  This is free software with ABSOLUTELY NO WARRANTY.
  For details type `warranty'.
  2/3
  .66666666666666666666
  3/5
  .60000000000000000000
  33/4589259837593
  .00000000000719070202
  3125886/2592375832
  .00120579969980216973
  
{% endhighlight %}

Pequena curiosidade: o comando 'quit' é executado assim que ele é encontrado. Portanto, algo como

>  __if (0==1) quit__
>  mesmo __0==1__ sendo impossível, vai fazer o ' __bc__ ' __sair__.
>  Tome cuidado com isso.
  
+ Conhecendo os comandos matemáticos do __bc__
  
Quando carregamos o bc com a opção '__-l__', temos alguns comandos matemáticos:

 __s(x)__| o seno de x (x em radianos)
 __c(x)__| o cosseno de x (x em radianos)
 __a(x)__| o inverso da tangente de x (retorna radianos).
 
> Se y = tangente de x (tg x), a(y) = x

l(x) | o logaritmo natural de x. (ln x)
e(x) | a função exponencial ( e^x ) (exp x)
  
+ Construindo funções
  
Podemos definir algumas funções extras a partir da definição matemática

> __define sin(x) {return s(x)}__

> __define cos(x) {return c(x)}__

> __tg x = sen x / cos x__

> __define tan(x) {return s(x)/c(x)}__

> __log10 x (logaritmo na base 10 de x) = ln x / ln 10__

> __define l10(x) {return l(x)/l(10)}__


## Conversão entre radianos e graus:

> d2r: graus para radianos

> r2d: radianos para graus

> pi = 3.14159265

> define d2r(n) { return n * (pi/180); }

> define r2d(n) { return n / (pi/180); }

Mas é chato ficar digitando essas definições toda vez que queremos usar o 'bc'.

Portanto, iremos criar um script que defina essas funções automaticamente.

Crie, usando seu editor de texto preferido (__vi, emacs, Gedit...__) um arquivo com o seguinte

{% highlight bash %}
#!/usr/bin/bc -l
#
# Nosso arquivo de definições
# Nós vamos entender o 'define' depois.
pi = 3.14159265
define ln(n) { return l(n); }
define log(n) { return ln(n)/ln(10); }
define log2(n) { return l(n)/l(2); }
define d2r(n) { return n * (pi/180); }
define r2d(n) { return n / (pi/180); }
define sin(x) { return s(d2r(x)); }
define cos(x) { return c(d2r(x)); }
define tan(x) { return sin(x)/cos(x); } 
{% endhighlight %}
> Salve ele como 'define.bc' no seu diretório HOME.
> Mude os atributos dele, tal que ele seja executável:

{% highlight bash %}
chmod a+x define.bc
{% endhighlight %}
> Agora, chame o arquivo:

{% highlight bash %}
~/define.bc
{% endhighlight %}
> Experimente usar os comandos:

{% highlight bash %}
cos(15)
.96592582636649385821
log2(2097152)
21.000000000000000021
quit

{% endhighlight %}
> Note que ocorre um pequeno desvio nas casas decimais.

+ Conceitos para a criação de pequenos programas com o bc
  
## O comando "define". Mas afinal, o que o comando faz?

> Ele simplesmente define uma função.

Dentro dele podemos usar os elementos acima citados, além destes:

+ __auto__ : define uma variável local.
+ __print__ : mostra mensagens na tela. (equivalente ao printf em C)
+ __return__ : retorna um valor. Deve ser usada no final do programa, para retornar o resultado final dele.
+ __{ } (colchetes)__ têm o mesmo significado que na linguagem C. Eles servem para agrupar várias operações, de modo que estas sejam executadas de uma vez só.

> Como podemos notar, a linguagem é bem semelhante ao C. Porém, não há nenhum elemento parecido com o 'goto' ou o 'switch', o que a torna bem limitada.

quit | Só deve ser usado em modo interativo.
> Assim que '__quit__' for encontrado, o __bc__ sai. (ver curiosidade no item 2) Em programas devemos usar '__halt__'.

+ Alguns exemplos
  
> Definição recursiva do fatorial:

{% highlight bash %}
#!/usr/bin/bc -l
define f (x) {
if (x <= 1) return (1);
 return (f(x-1) * x);
}
{% endhighlight %}

### Solução da equação do 2o grau

Como o bc força o retorno de apenas um valor por função, criamos 2 funções para retornar as 2 raízes da equação

{% highlight bash %}
  #!/usr/bin/bc -l
  define delta(a,b,c) { return b^2 - 4*a*c }
  define eq2grau(a,b,c) {
   auto d;
   d = delta(a,b,c);
   if (d<0) halt;
   if (d>=0) {
    return (-b + sqrt(d))/(2*a);
   }
  }
  define eq2grau2(a,b,c) {
   d = delta(a,b,c);
   if (d<0) halt;
   if (d==0) return eq2grau(a,b,c);
   if (d>0) {
    return (-b - sqrt(d))/(2*a);
   }
  }
{% endhighlight %}
+ bc e shell scripts

Às vezes, precisamos fazer um cálculo num shell script. O bc torna isso moleza

> __x=$(echo "358358*5824825" | bc)__

> __echo $x__

> __2087372637350__

Simples, não?

A estrutura é

> __variavel=$(echo "expressão" | bc)__

## Conclusão e considerações finais

> Nesse artigo, vimos como usar os comandos básicos do programa bc, que, embora aparentemente limitado, pode quebrar um bom galho como uma calculadora programável e em shell scripts.
> Porém, ele não deve ser considerado como uma linguagem de programação completa, mas sim como uma linguagem específica para sua aplicação.
 
#### →  Usando o 'sleep' e o 'clear' para programas interativos

{% highlight bash %}
 sleep 1 # tempo de 1 segundo de espera na execução
 clear #(limpa a tela)
{% endhighlight %}

#### →  o comando 'reset' 
É o mesmo que o clear, porém limpa a tela totalmente(a barra de rolagem fica integral)
 
#### →  Mostrar hora

{% highlight bash %}
DATA=`date +%T`
echo $DATA
{% endhighlight %}

#### →  O comando tput
Envia a seqüência para mover o cursor para a linha 2, coluna 4 (no canto superior esquerdo da tela, geralmente conhecida como a "casa" posição do cursor).

{% highlight bash %}
cat arquivo.txt | tput cup 2 4
{% endhighlight %}

#### →  O comando diff(utilizado para para mostrar diferenças em arquivos)
{% highlight bash %}
diff hashing_site.txt hashing_sum.txt
{% endhighlight %}

#### →  Usando o Comando beep

+ Instalando:

{% highlight bash %}
apt-get install beep
{% endhighlight %}

+ Opções de uso

{% highlight bash %}
beep -l 5000
{% endhighlight %}

__-f__ | frequênciaDefine a frequencia, muda o tom do som, permitindo realizar combinações muito interessantes

{% highlight bash %}
beep -l 2000 -f 100
{% endhighlight %}

__-r__ | repetiçõesDefine o numero de repetições

{% highlight bash %}
beep -l 800 -f 100 -r 5
{% endhighlight %}

__-d__ | tempo - Determina o tempo (__delay__) de espera de repetição entre um som e outro, usado junto com a opção __-r__

{% highlight bash %}
beep -l 500 -r 5 -d 1000
{% endhighlight %}

__-n__ | Usa uma linha de comando do beep para realizar vários sons diferentes
{% highlight bash %}
beep -l 700 -f 1 -n -l 700 -f 10 -n -l 700 -f 100
{% endhighlight %}

__-s__ | Essa opção trata do processamento de entrada e saída de dados. A opção -s conta as linhas que foram redirecionadas para o beep por meio do pipe (|)
{% highlight bash %}
cat zonebin.txt | beep -s -f 500
{% endhighlight %}

__-c__ | Essa opção trata do processamento de entrada e saída de dados, contando os caracteres que forem redirecionados pelo pipe
{% highlight bash %}
echo zonebin | beep -c -f 100 -l 900
{% endhighlight %}

#### →  Passando argumentos para funções

{% highlight bash %}
#!/bin/bash
ola(){
echo "Olá $1, vamos ser terminalroot." ; 
}
ola Marcos
echo '$* ou $@(argumentos da função) =' $* 'ou' $@ ', $#(número de parâmetros para função) = '$# ', $0 = '$0
{% endhighlight %}

> Nota adicional para funções, ao invés de criar vários aliases no .bashrc melhor criar funções em um diretório, exemplo:
- __a)__ edite seu .bashrc somente uma vez incluindo uma linha

{% highlight bash %}
echo 'alias minhasfuncoes="/home/$USER/minhasfuncoes.sh"' >> /home/$USER/.bashrc
{% endhighlight %}

- __b)__ Crie o arquivo minhasfuncoes.sh no seu /home com o seguinte código:

{% highlight bash %}
echo '#!/bin/bash' > funcoesbosta.sh && echo '/home/$USER/funcoes/./$1' >> minhasfuncoes.sh
{% endhighlight %}

- __c)__ Crie uma pasta 'funcoes' na sua home para salvar sua funções lá:

{% highlight bash %}
mkdir /home/$USER/funcoes
{% endhighlight %}

- __d)__ Crie sua funções sem o .sh e jogue na pasta '/home/$USER/funcoes'
 + Exemplos:
  
#### ♠ Função bobmarley()

{% highlight bash %}
echo '#!/bin/bash' > /home/$USER/funcoes/bobmarley && echo 'bobmarley(){ echo "Músico jamaicano!";}' >> /home/$USER/funcoes/bobmarley && echo 'bobmarley' >> /home/$USER/funcoes/bobmarley
{% endhighlight %}

#### ♠ Função malcomx()

{% highlight bash %}
echo '#!/bin/bash' > /home/$USER/funcoes/malcomx && echo 'malcomx(){ echo "Líder Revolucionário!";}' >> /home/$USER/funcoes/malcomx && echo 'malcomx' >> /home/$USER/funcoes/malcomx
{% endhighlight %}

- __e)__ Depois torne tudo executável, dando as devidas permissões:

{% highlight bash %}
chmod +x /home/$USER/minhasfuncoes.sh && chmod -R +x /home/$USER/funcoes/
{% endhighlight %}

- __f)__ Agora basta abrir o novo terminal e chamar a função desejada para executar o desejado:

{% highlight bash %}
minhasfuncoes bobmarley
Músico jamaicano! 
{% endhighlight %}
{% highlight bash %}
minhasfuncoes malcomx
Líder Revolucionário! 
{% endhighlight %}

### Ainda há como torná-las de leitura automática sem precisar chamar a minhasfuncoes, assim como as FunçõesZZ do Aurélio.

#### → O comando exit:

 + A declaração de saída é usado para sair do script shell com um status de __N__.
 + Use a declaração de saída para indicar o término shell script bem ou mal sucedidas.
 + O valor de __N__ pode ser utilizado por outros comandos ou scripts shell para levar a sua própria ação.
 + Se __N__ for omitido, o estado de saída é o valor do último comando foi executado.
 + Use a declaração de saída para terminar script shell em um erro.
 + Se __N__ é definido para 0 significa saída shell normal. Criar um script shell chamado exitcmd.sh:
 + Cada comando Linux executado pelo script shell ou usuário, tem um status de saída.
 + O status de saída é um número inteiro.
 + 0 estado de saída significa que o comando foi bem sucedido sem erros.
 + A não-zero (1-255 valores) saída de comando, o estatuto foi falha.
 
Você pode usar variáveis ​​shell especial chamado? para obter o status de saída do comando anteriormente executado.Para imprimir? variável usar o comando echo
  
{% highlight bash %}
#!/bin/bash
echo "Isto é um teste."
# Terminar nosso script shell com mensagem de sucesso
exit 0 
{% endhighlight %}

+ Para visualizar existe data de status do comando, digite:

{% highlight bash %}
echo $?
{% endhighlight %}

+ De acordo com a página man ls - estado de saída é 0 se OK, 1 se problemas menores, se dois sérios problemas. 
{% highlight bash %}
echo $?
date # executar o comando data
echo $? # imprime status de saída
foobar123 # não é um comando válido
echo $? # imprime status de saída
{% endhighlight %}

#### → O comando seq

Ele é praticamente o loop for, mostra uma sequência de tal número até outro número.No exemplo abaixo, contará do número 2 até o número 8
{% highlight bash %}
seq 2 8
{% endhighlight %}

#### mesmo que:

{% highlight bash %}
 for i in {2..8}
 do
  echo $i
 done 
{% endhighlight %}

####  ou até mesmo(os dois aninhados):

{% highlight bash %}
 for i in $(seq 2 8)
 do
 echo $i
 done
{% endhighlight %}
 
#### → O comando let
Ele praticamente é um '__incrementador__', se vc digitar isso num terminal, verá que ele incrementar __+1__ na variável __j__

{% highlight bash %}
echo $j
let j++
echo $j
1
let j++
echo $j
2
{% endhighlight %}

#### → Operações básicas com vetores/arrays

Se há um recurso muito útil na programação, certamente é a possibilidade de agruparmos várias variáveis de um mesmo tipo em uma só. São o que chamamos de vetor, ou __matriz__ - em inglês se diz __array__.

{% highlight bash %}
vetor=(eric camila marcos débora)
echo ${vetor[3]}
débora
echo ${vetor[0]}
eric
  
{% endhighlight %}

#### → O comando unset(serve para apagar: variáveis, vetores/arrays e funções)

## Veja a parte 2 dos Exmplos Úteis
### [Dicas úteis para Shell Script 2](http://terminalroot.com.br/2014/12/dicas-uteis-para-shell-script-2.html)

#### Mais infos e fontes:
 
https://help.gnome.org/users/zenity/stable/

http://funcoeszz.net/http://bash.cyberciti.biz/guide/Main_Page

http://www.vivaolinux.com.br/

http://www.dicas-l.com.br/

http://pt.wikipedia.org/wiki/Cut_%28Unix%29

http://renanbirck.blogspot.com/


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

