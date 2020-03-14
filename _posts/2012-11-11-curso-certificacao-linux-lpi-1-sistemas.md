---
layout: post
title: "Curso Certificação Linux LPI-1: Sistemas de Arquivos e Dispositivos"
date: '2012-11-11T12:36:00.000-08:00'
image: '/assets/img/lpi/file-systems-devides-linux.jpg'
description: "No Linux cada partição é representada por um número inteiro."
tags:
- linux
- lpi
---

![Blog Linux](/assets/img/lpi/file-systems-devides-linux.jpg "Blog Linux")

## Por padrão, os discos são nomeados da seguinte forma no linux

* __/dev/hda__ - Disco IDE conectado na interface primária mestre.
* __/dev/hdb__ - Disco IDE conectado na interface primária escravo.
* __/dev/hdc__ - Disco IDE conectado na interface secundária mestre.
* __/dev/hdd__ - Disco IDE conectado na interface secundário escravo.
* __/dev/sda__ - Disco SCSI conectado no primeiro canal.
* __/dev/sdb__ - Disco SCSI conectado no segundo canal.
* __/dev/sdc__ - Disco SCSI conectado no terceiro canal.
* __/dev/fd__ - Drive de disquete.

> Cada disco pode ter de uma a 16 partições.As partições funcionam com um contêiner para os sistemas de arquivos. No [Linux](http://www.terminalroot.com.br/tags#linux) cada partição é representada por um número inteiro.

## Partições Primárias

Cada disco pode conter no máximo 4 partições primárias.Estas partições contêm necessariamente um sistema de arquivos e pelo menos uma deve ser criada.As partições primárias podem ser nomeadas como: __/dev/hda1__, __/dev/hda2__, __/dev/hda3 /dev/hda4__.Uma destas partições primárias deve ser marcada como ativa para que a carga do sistema operacional(__boot__) seja possível.

## Partições Estendidas

> Elas são uma variação das partições primárias, mas não podem conter um sistema de arquivos.Funcionam como um contêiner para as partições lógicas.

## Partições Lógicas

Essas existem em conjunto com uma partição estendida e podemos ter de uma a 12 partições desse tipo.São nomeadas do n° 5 até 16.
Exemplo:

* __/dev/hda1__ (partição primária)
* __/dev/hda2__ (partição estendida)
* __/dev/hda5__ (partição lógica)
* __/dev/hda6__ (partição lógica)
(...)
* __/dev/hda16__ (partição lógica)

## Partição de Swap (arquivo de troca)

Existem ainda um outro tipo especial de partição no Linux chamado de partição de swap.Esta possibilita que o Linux tenha uma memória virtual em disco.Este tipo de memória é usado como arquivo de troca de dados entre a memória física e o disco.Seu objetivo é aumentar a performance do sistema.

__fdisk__ (e __cfdisk__) são responsáveis por __criar, listar, alterar e apagar as partições de disco__.__mkfs__ formata a partição criada pelo fdisk.mkswap prepara o dispositivo para ser usado como área de memória virtual(__swap__), antes de formatar uma partição para swap, é necessária que ela seja do tipo 82 (__Linux Swap__).__swapon__ ativa a partição após formatada (necessário)__.df__ mostra a capacidade utilizada em termos de espaço e __inodes__.__du (Disk Usage)__ fornece uma lista detalhada sobre a utilização do disco em termos de diretórios.__fsck__ checa e corrige a existência de erros no sistema de arquivos.Por padrão ele assume __o sistema de arquivos ext2__.__/etc/fstab__ mantém informações de quais sistemas de arquivos serão montados no processo de carga do sistema operacional.__which__ procura um comando no disco.

## Find

O comando __find__ localiza a partir de um caminho ou diretório recursivamente uma expressão diretamente no sistema de arquivos. Uso: __find [caminho] [expressão]__

{% highlight bash %}
find /home/$USER/ -name arquivo.txt
{% endhighlight %}

Para os diretórios que você não tem permissão de visualização, pode jogar a segunda etapa para o vazio, assim

{% highlight bash %}
find /home/$USER/ -name marcospinguim.php 2>/dev/null
{% endhighlight %}

Para localizar arquivos ou diretórios que foram alterados nos últimos 30 dias, utilizamos a expressão -ctime 30

{% highlight bash %}
find /home/$USER/ -ctime 30
{% endhighlight %}

Para localizar arquivos que foram acessados nos últimos 10 dias, utilizamos a expressão -used 10
{% highlight bash %}
find /home/$USER/-used 10
{% endhighlight %}

Para localizar arquivos com pelo menos 30k, utilizamos a expressão -size nk
{% highlight bash %}
find /home/$USER/-size 30k
{% endhighlight %}


Veja o artigo completo sobre o __Comando find__
[20 EXEMPLOS DO COMANDO FIND](http://terminalroot.com.br/2015/07/20-exemplos-do-comando-find.html)

__locate__ realiza buscas em um banco de dados criado com updatedb.whatis pesquisa por palavra exata no banco de dados.apropos consulta um banco de dados consistindo de descrições curtas dos comandos do sistema e utilitários. Por enquanto é só, até o próximo tópico ou a próxima postagem sobre outro assunto.

![Blog Linux](/assets/img/lpi/sad.jpg "Blog Linux")

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

