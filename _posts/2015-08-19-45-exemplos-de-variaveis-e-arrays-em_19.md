---
layout: post
title: "45 Exemplos de Variáveis e Arrays em Shell Script"
date: '2015-08-19T18:07:00.001-07:00'
image: '/assets/img/bash/arrays.jpg'
description: "Completíssimo"
tags:
- shellscript
- terminal
- comandos
---

![Blog Linux](/assets/img/bash/arrays.jpg "Arrays Bash")

1 - Criar uma variável, ${var} é o mesmo que $var, porém não ambíguo.
{% highlight bash %}
var="http://www.terminalroot.com.br/"
echo $var
http://www.terminalroot.com.br/
{% endhighlight %}

2 - Retornar o tamanho da string
{% highlight bash %}
echo ${#var}
31
{% endhighlight %}

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

3 - Executa o conteúdo de $var (igual 'eval \$$var')
{% highlight bash %}
echo ${!var}
{% endhighlight %}

4 - Retorna os nomes de variáveis começadas por 'U'
{% highlight bash %}
echo ${!U*}
UID USER USERNAME
{% endhighlight %}

5 - Retorna o texto a partir da posição 7
{% highlight bash %}
echo ${var:7}
www.terminalroot.com.br/
{% endhighlight %}

6 - Retorna 8 caracteres a partir da posição 11
{% highlight bash %}
echo ${var:11:8}
terminal
{% endhighlight %}

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

7 - Corta 'http://' do início da string
{% highlight bash %}
echo ${var#http://}
www.terminalroot.com.br/
{% endhighlight %}

8 - Corta '.com.br/' do final da string
{% highlight bash %}
echo ${var%.com.br/}
http://www.terminalroot
{% endhighlight %}


9 - Substitui 'terminalroot' por 'aurelio', uma vez
{% highlight bash %}
echo ${var/terminalroot/aurelio} 
http://www.aurelio.com.br/
{% endhighlight %}

10 - Substitui 'o' por 'O', sempre
{% highlight bash %}
echo ${var//o/O}
http://www.terminalrOOt.cOm.br/
{% endhighlight %}

11 - Se a string começar com 'http', substitui 'http' por 'Site'
{% highlight bash %}
echo ${var/#http/Site}
Site://www.terminalroot.com.br/
{% endhighlight %}

12 - Se a string terminar com 'te', substitui 'te' por 'TADO'
{% highlight bash %}
var2="teste"
echo ${var2/%te/TADO}
tesTADO
{% endhighlight %}

<!-- RETANGULO LARGO 2 -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:block; text-align:center;"
data-ad-layout="in-article"
data-ad-format="fluid"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="8549252987"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

13 - "" (aspas duplas) protege uma string, mas reconhece $, \ e ` como especiais
{% highlight bash %}
echo "$var"
http://www.terminalroot.com.br/
{% endhighlight %}

14 - '' (aspas simples) protege uma string, mas reconhece $, \ e ` como especiais
{% highlight bash %}
echo '$var'
$var
{% endhighlight %}

15 - $'...' (cifrão antes de aspas simples) protege uma string completamente, mas interpreta \n, \t, \a, etc
{% highlight bash %}
echo $'$var\n'
$var
{% endhighlight %}


<!-- RETANGULO LARGO -->
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

16 - `...` (entre crases) Executa comandos numa subshell, retornando o resultado
{% highlight bash %}
echo `ls`
Área de trabalho Documentos Downloads Imagens Modelos Música Público Vídeos
{% endhighlight %}

17 - Executa comandos numa subshell
{% highlight bash %}
(ls)
Área de trabalho Documentos Downloads Imagens Modelos Música Público Vídeos
{% endhighlight %}

18 - Executa comandos numa subshell, retornando o resultado
{% highlight bash %}
echo $(ls)
Área de trabalho Documentos Downloads Imagens Modelos Música Público Vídeos
{% endhighlight %}

19 - Testa uma operação aritmética, retornando 0 ou 1
{% highlight bash %}
((11>9))
{% endhighlight %}

20 - Retorna o resultado de uma operação aritmética
{% highlight bash %}
echo $((11-9))
2
{% endhighlight %}


<!-- RETANGULO LARGO 2 -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:block; text-align:center;"
data-ad-layout="in-article"
data-ad-format="fluid"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="8549252987"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


21 - Testa uma expressão, retornando 0 ou 1 (alias do comando 'test')
{% highlight bash %}
[ 5 -gt 3 ] && echo 'É maior!'
É maior!
{% endhighlight %}


22 - Testa uma expressão, retornando 0 ou 1 (podendo usar && e \|\|)
{% highlight bash %}
[[ $var ]] && echo 'Existe essa variável'
Existe essa variável
{% endhighlight %}


23 - Variáveis especiais
<table align="center" border="1"><tbody>
<tr><th>Variável</th>
<th>Parâmetros Posicionais</th>
</tr>
<tr>
<td align="center"><code>$0</code></td>
<td>Parâmetro número 0 (nome do comando ou função)</td>
</tr>
<tr>
<td align="center"><code>$1</code></td>
<td>Parâmetro número 1 (da linha de comando ou função)</td>
</tr>
<tr>
<td align="center"><code>...</code></td>
<td>Parâmetro número N ...</td>
</tr>
<tr>
<td align="center"><code>$9</code></td>
<td>Parâmetro número 9 (da linha de comando ou função)</td>
</tr>
<tr>
<td align="center"><code>${10}</code></td>
<td>Parâmetro número 10 (da linha de comando ou função)</td>
</tr>
<tr>
<td align="center"><code>...</code></td>
<td>Parâmetro número NN ...</td>
</tr>
<tr>
<td align="center"><code>$#</code></td>
<td>Número total de parâmetros da linha de comando ou função</td>
</tr>
<tr>
<td align="center"><code>$*</code></td>
<td>Todos os parâmetros, como uma string única</td>
</tr>
<tr>
<td align="center"><code>$@</code></td>
<td>Todos os parâmetros, como várias strings protegidas</td>
</tr>
<tr>
<th>Variável</th>
<th>Miscelânia</th>
</tr>
<tr>
<td align="center"><code>$$</code></td>
<td>Número PID do processo atual (do próprio script)</td>
</tr>
<tr>
<td align="center"><code>$!</code></td>
<td>Número PID do último job em segundo plano</td>
</tr>
<tr>
<td align="center"><code>$_</code></td>
<td>Último argumento do último comando executado</td>
</tr>
<tr>
<td align="center"><code>$?</code></td>
<td>Código de retorno do último comando executado</td></tr>
</tbody></table>


25 - Escapes especiais para usar no prompt (PS1)
<table align="center" border="1"><tbody><tr><th>Escape</th><th>Lembrete</th><th>Expande para...</th></tr><tr><td align="center">\a</td><td><i>Alerta</i></td><td>Alerta (bipe)</td></tr><tr><td align="center">\d</td><td><i>Data</i></td><td>Data no formato "Dia-da-semana Mês Dia" (Sat Jan 15)</td></tr><tr><td align="center">\e</td><td><i>Escape</i></td><td>Caractere Esc</td></tr><tr><td align="center">\h</td><td><i>Hostname</i></td><td>Nome da máquina sem o domínio (dhcp11)</td></tr><tr><td align="center">\H</td><td><i>Hostname</i></td><td>Nome completo da máquina (dhcp11.empresa)</td></tr><tr><td align="center">\j</td><td><i>Jobs</i></td><td>Número de jobs ativos</td></tr><tr><td align="center">\l</td><td><i>Tty</i></td><td>Nome do terminal corrente (ttyp1)</td></tr><tr><td align="center">\n</td><td><i>Newline</i></td><td>Linha nova</td></tr><tr><td align="center">\r</td><td><i>Return</i></td><td>Retorno de carro</td></tr><tr><td align="center">\s</td><td><i>Shell</i></td><td>Nome do shell (basename $0)</td></tr><tr><td align="center">\t</td><td><i>Time</i></td><td>Horário no formato 24 horas HH:MM:SS</td></tr><tr><td align="center">\T</td><td><i>Time</i></td><td>Horário no formato 12 horas HH:MM:SS</td></tr><tr><td align="center">\@</td><td><i>At</i></td><td>Horário no formato 12 horas HH:MM am/pm</td></tr><tr><td align="center">\A</td><td><i>At</i></td><td>Horário no formato 24 horas HH:MM</td></tr><tr><td align="center">\u</td><td><i>Usuário</i></td><td>Login do usuário corrente</td></tr><tr><td align="center">\v</td><td><i>Versão</i></td><td>Versão do Bash (2.00)</td></tr><tr><td align="center">\V</td><td><i>Versão</i></td><td>Versão+subversão do Bash (2.00.0)</td></tr><tr><td align="center">\w</td><td><i>Working Dir</i></td><td>Diretório corrente, caminho completo ($PWD)</td></tr><tr><td align="center">\W</td><td><i>Working Dir</i></td><td>Diretório corrente, somente o último (basename $PWD)</td></tr><tr><td align="center">\!</td><td><i>Histórico</i></td><td>Número do comando corrente no histórico</td></tr><tr><td align="center">\#</td><td><i>Número</i></td><td>Número do comando corrente</td></tr><tr><td align="center">\$</td><td><i>ID</i></td><td>Mostra "#" se for root, "$" se for usuário normal</td></tr><tr><td align="center">\nnn</td><td><i>Octal</i></td><td>Caractere cujo octal é nnn</td></tr><tr><td align="center">\\</td><td><i>Backslash</i></td><td>Barra invertida \ literal</td></tr><tr><td align="center">\[</td><td><i>Escapes</i></td><td>Inicia uma seqüência de escapes (tipo códigos de cores)</td></tr><tr><td align="center">\]</td><td><i>Escapes</i></td><td>Termina uma seqüência de escapes</td></tr></tbody></table>

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

26 - Escapes reconhecidos pelo comando echo
<table align="center" border="1"><tbody><tr><th>Escape</th><th>Lembrete</th><th>Descrição</th></tr><tr><td align="center">\a</td><td><i>Alerta</i></td><td>Alerta (bipe)</td></tr><tr><td align="center">\b</td><td><i>Backspace</i></td><td>Caractere Backspace</td></tr><tr><td align="center">\c</td><td><i>EOS</i></td><td>Termina a string</td></tr><tr><td align="center">\e</td><td><i>Escape</i></td><td>Caractere Esc</td></tr><tr><td align="center">\f</td><td><i>Form feed</i></td><td>Alimentação</td></tr><tr><td align="center">\n</td><td><i>Newline</i></td><td>Linha nova</td></tr><tr><td align="center">\r</td><td><i>Return</i></td><td>Retorno de carro</td></tr><tr><td align="center">\t</td><td><i>Tab</i></td><td>Tabulação horizontal</td></tr><tr><td align="center">\v</td><td><i>Vtab</i></td><td>Tabulação vertical</td></tr><tr><td align="center">\\</td><td><i>Backslash</i></td><td>Barra invertida \ literal</td></tr><tr><td align="center">\nnn</td><td><i>Octal</i></td><td>Caractere cujo octal é nnn</td></tr><tr><td align="center">\xnn</td><td><i>Hexa</i></td><td>Caractere cujo hexadecimal é nn</td></tr></tbody></table>

27 - Formatadores do comando date
<table align="center" border="1"><tbody>
<tr><th>Formato</th>
<th>Descrição</th>
</tr>
<tr>
<td align="center"><code>%a</code></td>
<td>Nome do dia da semana abreviado (Dom..Sáb)</td>
</tr>
<tr>
<td align="center"><code>%A</code></td>
<td>Nome do dia da semana (Domingo..Sábado)</td>
</tr>
<tr>
<td align="center"><code>%b</code></td>
<td>Nome do mês abreviado (Jan..Dez)</td>
</tr>
<tr>
<td align="center"><code>%B</code></td>
<td>Nome do mês (Janeiro..Dezembro)</td>
</tr>
<tr>
<td align="center"><code>%c</code></td>
<td>Data completa (Sat Nov 04 12:02:33 EST 1989)</td>
</tr>
<tr>
<td align="center"><code>%y</code></td>
<td>Ano (dois dígitos)</td>
</tr>
<tr>
<td align="center"><code>%Y</code></td>
<td>Ano (quatro dígitos)</td>
</tr>
<tr>
<td align="center"><code>%m</code></td>
<td>Mês (01..12)</td>
</tr>
<tr>
<td align="center"><code>%d</code></td>
<td>Dia (01..31)</td>
</tr>
<tr>
<td align="center"><code>%j</code></td>
<td>Dia do ano (001..366)</td>
</tr>
<tr>
<td align="center"><code>%H</code></td>
<td>Horas (00..23)</td>
</tr>
<tr>
<td align="center"><code>%M</code></td>
<td>Minutos (00..59)</td>
</tr>
<tr>
<td align="center"><code>%S</code></td>
<td>Segundos (00..60)</td>
</tr>
<tr>
<td align="center"><code>%s</code></td>
<td>Segundos desde 1º de Janeiro de 1970</td>
</tr>
<tr>
<td align="center"><code>%%</code></td>
<td>Um % literal</td>
</tr>
<tr>
<td align="center"><code>%t</code></td>
<td>Um TAB</td>
</tr>
<tr>
<td align="center"><code>%n</code></td>
<td>Uma quebra de linha</td></tr>
</tbody></table>

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


28 - Formatadores do comando printf
<table align="center" border="1"><tbody>
<tr><th>Formato</th>
<th>Descrição</th>
</tr>
<tr>
<td align="center"><code>%d</code></td>
<td>Número decimal</td>
</tr>
<tr>
<td align="center"><code>%o</code></td>
<td>Número octal</td>
</tr>
<tr>
<td align="center"><code>%x</code></td>
<td>Número hexadecimal (a-f)</td>
</tr>
<tr>
<td align="center"><code>%X</code></td>
<td>Número hexadecimal (A-F)</td>
</tr>
<tr>
<td align="center"><code>%f</code></td>
<td>Número com ponto flutuante</td>
</tr>
<tr>
<td align="center"><code>%e</code></td>
<td>Número em notação científica (e+1)</td>
</tr>
<tr>
<td align="center"><code>%E</code></td>
<td>Número em notação científica (E+1)</td>
</tr>
<tr>
<td align="center"><code>%s</code></td>
<td>String</td></tr>
</tbody></table>


29 - Para saber todas as variáveis locais, execute
{% highlight bash %}
set
{% endhighlight %}
ou, e abra o txt para ver depois
{% highlight bash %}
set > VariaveisLocais.txt
{% endhighlight %}

30 - Variáveis globais, para saber todas as variáveis globais, execute
{% highlight bash %}
env
{% endhighlight %}
ou
{% highlight bash %}
printenv
{% endhighlight %}

31 - Para atribuir um valor a uma variável local
{% highlight bash %}
LINUX=free
echo $LINUX
free 
{% endhighlight %}

32 - verificar se a variável criada no item anterior aparece na relação de variáveis locais
{% highlight bash %}
set | grep LINUX
LINUX=free 
{% endhighlight %}

33 - Agora vamos tornar esta variável local em uma variável global
{% highlight bash %}
export LINUX
env | grep LINUX
LINUX=free
{% endhighlight %}

34 - Deletar uma 'variável de ambiente local' da memória usamos o comando unset 
{% highlight bash %}
unset LINUX
echo $LINUX
{% endhighlight %}
{% highlight bash %}


{% endhighlight %}
35 - Criar um aliases ( apelido para um comando ou programa ), você ainda pode incluí-lo no seu ~/.bashrc
{% highlight bash %}
alias listar='ls -la color=auto'
{% endhighlight %}

36 - Destruir um aliase
{% highlight bash %}
unalias listar
{% endhighlight %}

37 - Verificar todos os comando digitados
{% highlight bash %}
history
{% endhighlight %}

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

executar o comando pelo número dele no history
{% highlight bash %}
!468
{% endhighlight %}
executar o último comando digitado
{% highlight bash %}
!!
{% endhighlight %}
eles ficam no bash_history
{% highlight bash %}
cat bash_history
{% endhighlight %}
limpar o history
{% highlight bash %}
history -c
{% endhighlight %}

38 - Interpretadores de linha de comando
> $ - Shell de um usuário comum;
> # - Shell do superusuário root (administrador)

Verificar dos os Shells disponíveis
{% highlight bash %}
cat /etc/shells
{% endhighlight %}

Variável que mostra o SHELL que você utiliza
{% highlight bash %}
echo $SHELL
{% endhighlight %}

39 - Criando um Array (Arranjo) "conjunto de variáveis"
{% highlight bash %}
DISTROS=( "Debian" "Trisquel" "Ubuntu" "RedHat")
{% endhighlight %}
Se você imprimir o Array DISTROS como variável, ele printará a variável 0 , o array exibe as variáveis nele contidas começando do 0 (zero), logo seria o mesmo de imprimir a ${DISTROS[0]}
{% highlight bash %}
echo $DISTROS
{% endhighlight %}

40 - Imprimir o elemento 1 da array DISTROS
{% highlight bash %}
echo ${DISTROS[1]}
Trisquel
{% endhighlight %}

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

41 - Pode-se também criar um array inserindo elemento um de cada vez 
{% highlight bash %}
DISTROS[0]="Debian"
DISTROS[1]="Trisquel"
DISTROS[2]="Ubuntu"
DISTROS[3]="RedHat"
{% endhighlight %}

42 - Alterar o elemento 2 do array DISTROS
{% highlight bash %}
DISTROS[2]="Linux Mint"
echo ${DISTROS[2]}
Linux Mint
{% endhighlight %}

43 - Exibir Distro do elemento 2 até o final
{% highlight bash %}
echo ${DISTROS[@]:2} 
Ubuntu RedHat
{% endhighlight %}

44 - Esta exibe os elementos com início na posição 1 seguidos de mais dois elementos consecutivos à posição 1
{% highlight bash %}
echo ${DISTROS[@]:1:2} 
Trisquel Ubuntu
{% endhighlight %}

45 - Saber quantos elementos possui o array DISTROS
{% highlight bash %}
echo ${#DISTROS[@]} 
4
{% endhighlight %}


# Valeu!


## Referências

[http://aurelio.net/shell/canivete/](http://aurelio.net/shell/canivete/)

[http://www.vivaolinux.com.br/artigo/Trabalhando-com-shell-e-variaveis-de-ambiente](http://www.vivaolinux.com.br/dica/Utilizando-arrays-em-shell-script)

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



