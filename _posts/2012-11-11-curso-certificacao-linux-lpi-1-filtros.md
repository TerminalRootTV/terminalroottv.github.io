---
layout: post
title: "Curso Certificação Linux LPI-1: Filtros de Texto"
date: '2012-11-11T02:47:00.000-08:00'
description: "A filtragem de textos é o processo de executar algumas conversões no texto de um fluxo de entrada de texto antes de enviá-lo para um fluxo de saída."
main-class: 'linux'
tags:
- Linux
- LPI
- SED
---

![Blog Linux](/assets/img/lpi/filtros.jpg "Blog Linux")

## Filtragem de textos
 
A filtragem de textos é o processo de executar algumas conversões no texto de um fluxo de entrada de texto antes de enviá-lo para um fluxo de saída. Embora tanto a entrada como a saída possam vir de um arquivo, nos ambientes [UNIX](http://www.terminalroot.com.br/tags#unix)® e [Linux](http://www.terminalroot.com.br/tags#linux), a filtragem é, na maioria das vezes, feita através da criação de uma pipeline de comandos, na qual a saída de um comando é canalizada ou redirecionada para ser usada como a entrada para o próximo.

> Canais e redirecionadores são abordados mais detalhadamente no artigo sobre fluxos, canais e redirecionadores. Porém, por enquanto, vamos dar uma olhada nos canais e redirecionamentos de saída básicos usando os operadores __&#124;__ e __>__ .

## Fluxos 
Um fluxo é nada mais que uma sequência de bytes que pode ser lida ou escrita através do uso de funções da biblioteca, as quais escondem os detalhes de um dispositivo subjacente do aplicativo. O mesmo programa pode ler ou escrever em um terminal, arquivo ou soquete de rede em uma direção independente de dispositivo através do uso de fluxos. Ambientes modernos de programação e shells usam três fluxos padrão de E/S: 

+ __stdin__ é o fluxo de entrada padrão, que fornece a entrada para os comandos.
+ __stdout__ é o fluxo de saída padrão, que exibe a saída dos comandos.
+ __stderr__ é o fluxo de erro padrão, que exibe a saída de erros dos comandos.

## Canalizando com | 

A entrada pode vir de parâmetros que você fornece aos comandos e a saída pode ser exibida em seu terminal. Muitos comandos de processamento de texto (filtros) podem receber entradas tanto de um fluxo de entrada padrão quanto de um arquivo. Para usar a saída de um comando, command1, como entrada para um filtro, command2, você deve conectar os comandos usando o operador de canal (I). O código abaixo mostra como canalizar a saída de __echo__ para classificar uma pequena lista de palavras.

### Canalizando saídas de echo para entradas de classificação
{% highlight bash %}
$ echo -e "apple\npear\nbanana" | sort 
{% endhighlight %}

Qualquer comando pode ter opções e argumentos. Também é possível usar __&#124;__ para redirecionar a saída do segundo comando na pipeline para um terceiro comando, e assim por diante. Construir longas pipelines de comandos, em que cada uma tenha uma capacidade limitada, é um modo comum de executar tarefas no [Linux](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=linux) e no [UNIX](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=unix). 

Às vezes, você verá um hífen (__-__) no lugar do nome do arquivo como um argumento para um comando, indicando que a entrada deve vir do __stdin__ e não de um arquivo.

## Redirecionamento de saída com > 

Embora você possa criar uma pipeline com muitos comandos e visualizar a saída no seu terminal, às vezes, você desejará salvar a saída em um arquivo. Isso é feito com o operador de redirecionamento de saída (__>__). 

Durante o resto desta seção, usaremos pequenos arquivos, assim, vamos então criar um diretório chamado lpi103-2 e fazer cd nesse diretório. Usaremos então o > para redirecionar a saída do comando __echo__ para um arquivo chamado text1. Tudo isso é exibido na  2. Observe que a saída não é exibida no terminal, pois foi redirecionada para um arquivo. 

## Redirecionando a saída de um comando para um arquivo
{% highlight bash %}
mkdir lpi103-2
cd lpi103-2
echo -e "1 apple\n2 pear\n3 banana" > text1
{% endhighlight %}

Agora que já temos algumas ferramentas básicas para canalizar e redirecionar, vamos dar uma olhada em alguns comandos e filtros de processamento de texto comuns do Linux e do UNIX. Consulte a man page apropriada para mais informações sobre estes comandos.
 
> cat, od e split

Agora que você já criou o arquivo text1, você pode querer verificar o que há nele. Use o comando __cat__ (*abreviação de ConcATenate*) para exibir o conteúdo de um arquivo no __stdout__.

## Exibindo conteúdos de arquivos com o comando cat

{% highlight bash %}
$ cat text
{% endhighlight %}

O comando __cat__ recebe a entrada a partir do __stdin__, caso você não especifique um nome de arquivo (ou se você especifica - como o nome do arquivo). Vamos usar isso junto com o redirecionamento de saída para criar outro arquivo de texto. O comando __tac__ faz o inverso.

![Linux Filtros de textos](/assets/img/lpi/filtros.jpg ""Curso Certificação Linux LPI-1: Filtros de Texto"")

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

