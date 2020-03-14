---
layout: post
title: "Curso Certificação Linux LPI-1: Executando, Gerenciando e Terminando Processos"
date: '2012-11-17T17:04:00.000-08:00'
image: '/assets/img/lpi/processos.jpg'
description: "O escalonamento (scheduling) de processos ou agendador de tarefas é uma atividade organizacional feita pelo escalonador (scheduler) da CPU ou de um sistema distribuído"
tags:
- linux
- lpi
---

![Curso Certificação Linux LPI-1: Executando, Gerenciando e Terminando Processos](/assets/img/lpi/processos.jpg "Curso Certificação Linux LPI-1: Executando, Gerenciando e Terminando Processos")

## Escalonador

O escalonamento (__scheduling__) de processos ou agendador de tarefas é uma atividade organizacional feita pelo escalonador (__scheduler__) da __CPU__ ou de um sistema distribuído, possibilitando executar os processos mais viáveis e concorrentes, priorizando determinados tipos de processos, como os de __I/O__ Bound e os computacionalmente intensivos.

O escalonador de processos de 2 níveis escolhe o processo que tem mais prioridade e menos tempo e coloca-o na memória principal, ficando os outros alocados em disco; com essa execução o processador evita ficar ocioso.

## O Processo init

O __init__ é o primeiro processo iniciado no [Linux](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=linux), logo após a carga do kernel do sistema. Quando é disparado, o __init__ continua a carga do sistema, geralmente executando vários scripts que irão verificar e montar sistemas de arquivos, configurar teclado e iniciar servidores, entre outras tarefas.

O __init__ utilizado no [Linux](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=linux) permite que existam diversos níveis de execução no sistema. Um nível de execução é uma configuração de software do sistema que define quais processos devem ser inicializados e quais não devem, e também de que modo são inicializados. 

## Atributo de Processos(Sinais)

Um processo tem vários atributos que controlam sua execução.

O __PID__ identifica únicamente este processo (nenhum __PID__ pode ser repetido até novo boot do sistema). O __PPID__ indica qual "processo-pai" o criou. O nice number controla a prioridade desse processo. Processos de maior prioridade têm a preferência na utilização da __CPU__. O __UID e GID__ indicam o usuário e grupo que criou esse processo. Somente o __root__ (superusuário) pode destruir processos criados por outros usuários. O __EUID e o EGID__ são formas de se rodar um processo, criado por um usuário não-privilegiado de forma que ele se comporte como privilegiado, com acesso a outros recursos que normalmente o usuário não o teria. O comando __chmod +s__  pode ser usado para fazer um programa modificar esse valor na execução. Um programa setuid (com o __flag s__ ligado) no instante de execução troca seu __UID/GID__ pelos seus próprios (user/group do arquivo) e efetivamente rodam como se fosse este outro usuário, pois o kernel testa o __EUID e EGID__ para testar privilégios de acesso. Daí, devmos ter o máximo cuidado quando ligarmos este flag em algum executável.

## Prioridades de Processos

Muita gente não sabe, mas nos sistemas Linux mais modernos, podemos ter um controle de prioridade de processos utilizando a CPU. Estas prioridades funcionam para favorecer melhor um comando à outro. Por exemplo:

> Programa 1 tem prioridade “alta”

> Programa 2 tem prioridade “normal”
 
Se o Programa 2 resolve gastar quase todo o processamento no sistema (como por exemplo: compactação de arquivos em bzip2), os programas que estão em prioridade alta não serão completamente afetados.

Se o Programa 1 estivesse em prioridade “normal”, ele teria que dividir o processamento com o Programa 2, mesmo que ele usasse pouquinho. Mas como ele está em “alta” prioridade, ele sempre vai ter a preferência no sistema, ao invés do Programa 2.

A faixa de prioridades é:

* -20 (Prioridade Máxima)
* -19 … -1
* 0 (Prioridade Padrão)
* 1 … 18
* 19 (Prioridade Mínima)
 
Sendo assim, por padrão, todo comando executado “normalmente” recebe a prioridade __0__ (Zero). E quanto menor for esse número, maior a prioridade do processo na __CPU__ (Sim, é o contrário! Quanto menor, maior; quanto maior, menor! :).

Por padrão, os comandos ligados ao kernel e o sistema operacional em si têm prioridade inferior a 0 (aqui no meu sistema, vejo vários processos com prioridade -5). Isso nos faz lembrar que você precisa ser root para configurar um processo com prioridade menor que 0. Isso faz sentido, já que em um sistema multi-usuário, os usuários normais compartilham o padrão 0, e podem escolher apenas se o processo pode ter uma prioridade mais baixa, assim não interferindo com os processos do sistema, que teoricamente são mais importantes.

## Executando aplicações em segundo plano

Quando estamos num terminal, queremos utilizar algum comando/aplicação e necessitamos ainda do terminal livre, podemos executar o que queremos em segundo plano.
{% highlight bash %}
comando &
{% endhighlight %}

Simplesmente adicione o caracter __&__ ao final do comando/aplicativo que você quer executar. Acho interessante quando estamos no X e queremos abrir uma aplicação diretamente do terminal.

## Comandos para gerenciamento

__ps__ - exibe informações sobre uma seleção dos processos ativos.Se você quer uma atualização repetitiva da seleção e as informações apresentadas, usar top (1) em seu lugar.
{% highlight bash %}
$ ps [options] 
{% endhighlight %}

__pstree__  - mostra a árvore de processos
{% highlight bash %}
$ pstree
{% endhighlight %}

__top__  - exibe as tarefas do linux.
{% highlight bash %}
$ top
{% endhighlight %}

__kill__ - O sinal padrão para matar é __TERM__. Utilização de __L__ ou __L -a__ lista de sinais disponíveis. Sinais particularmente úteis incluem __HUP, INT, MATAR, STOP, CONT, e 0__.Sinais de suplentes poderão ser especificada de três formas: __-9 SIGKILL matar__. PID valores negativos podem ser usados ​​para escolher grupos de processos inteiros; ver a coluna __PGID__ na saída do comando __ps__. A __PID__ de __-1__ é especial, que indica todos os processos exceto o processo de se matar e __init__.
{% highlight bash %}
$ kill
{% endhighlight %}

__killall__  - mata um proceso pelo nome. 
{% highlight bash %}
$ killall
{% endhighlight %}

![Blog Linux](/assets/img/lpi/processos/2.jpg "Blog Linux")
![Blog Linux](/assets/img/lpi/processos/3.jpg "Blog Linux")
![Blog Linux](/assets/img/lpi/processos/4.jpg "Blog Linux")
![Blog Linux](/assets/img/lpi/processos/5.jpg "Blog Linux")
![Blog Linux](/assets/img/lpi/processos/6.jpg "Blog Linux")

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

