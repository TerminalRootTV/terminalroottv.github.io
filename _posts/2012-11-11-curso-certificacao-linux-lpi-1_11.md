---
layout: post
title: "Curso Certificação Linux LPI-1: Hierarquia do Sistema"
date: '2012-11-11T03:40:00.000-08:00'
image: '/assets/img/lpi/linux.jpg'
description: "Sistema de arquivos é a forma de organização de dados em algum meio de armazenamento de dados em massa frequentemente feito em discos magnéticos."
tags:
- linux
- lpi
---

![Blog Linux](/assets/img/lpi/linux.jpg "Blog Linux")

> Sistema de arquivos é a forma de organização de dados em algum meio de armazenamento de dados em massa frequentemente feito em discos magnéticos. Sabendo interpretar o sistema de arquivos de um determinado disco, o sistema operacional pode decodificar os dados armazenados e lê-los ou gravá-los.

Fazendo analogias, tal organização assemelha-se a uma biblioteca escolar. O bibliotecário organiza os livros conforme um padrão, cuja busca, convenientemente, procura deixar mais fácil, sem ocupar muitas prateleiras e assegurando a integridade deste.

### Inode
Cada diretório e arquivo do [Linux](http://www.terminalroot.com.br/tags#linux) é identificado para o kernel como um número de __nó i (inode)__. Um inode é, na realidade, uma estrutura de dados que possui informações sobre um determinado arquivo ou diretório como, por exemplo, dono, grupo, tipo e permissões de acesso.

O inode é exclusivo somente para o dispositivo (partição) dentro do qual ele está contido. Portanto, para identificar unicamente um arquivo, o __kernel__ deve ter o número de dispositivo e o inode do arquivo.

Um arquivo possui um único inode, não importa por quantos nomes este arquivo é identificado no sistema. Logo, é o conjunto de inodes que indica o número de arquivos/diretórios que o sistema possui.

### Diretório

Diretório é o local utilizado para armazenar conjuntos de arquivos para melhor organização e localização. O diretório, como o arquivo, também é "Case Sensitive" (diretório /teste é completamente diferente do diretório /Teste).

Não podem existir dois arquivos com o mesmo nome em um diretório, ou um sub-diretório com um mesmo nome de um arquivo em um mesmo diretório.
Um diretório, nos sistemas Linux/[UNIX](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=unix), é especificado por uma "/" e não uma "\" como é feito no DOS.

### Diretório Raiz

Este é o diretório principal do sistema. Dentro dele estão todos os diretórios do sistema. O diretório __Raiz__ é representado por uma "__/__", assim se você digitar o comando __cd /__ você estará acessando este diretório.

Nele estão localizados outros diretórios como o __/bin, /sbin, /usr, /usr/local, /mnt, /tmp, /var, /home, etc__. 

Estes são chamados de sub-diretórios pois estão dentro do diretório "/". A estrutura de diretórios e sub-diretórios pode ser identificada da seguinte maneira

A estrutura de diretórios também é chamada de __Árvore de Diretórios__ porque é parecida com uma árvore de cabeça para baixo. Cada diretório do sistema tem seus respectivos arquivos que são armazenados conforme regras definidas pela __FHS (FileSystem Hierarchy Standard__ - Hierarquia Padrão do Sistema de Arquivos) versão 2.0, definindo que tipo de arquivo deve ser armazenado em cada diretório.

O sistema GNU/Linux possui a seguinte estrutura básica de diretórios, organizados segundo o __FHS (Filesystem Hierarchy Standard)__

+ __/__ - raíz do sistema
+ __/bin__ - Contém arquivos programas do sistema que são usados com frequência pelos usuários.
+ __/boot__ - Contém arquivos necessários para a inicialização do sistema.
+ __/cdrom__ - Ponto de montagem da unidade de CD-ROM.
+ __/media__ - Ponto de montagem de dispositivos diversos do sistema (rede, pen-drives, CD-ROM em distribuições mais novas).
+ __/dev__ - Contém arquivos usados para acessar dispositivos (periféricos) existentes no computador.
+ __/etc__ - Arquivos de configuração de seu computador local.
+ __/floppy__ - Ponto de montagem de unidade de disquetes
+ __/home__ - Diretórios contendo os arquivos dos usuários.
+ __/lib__ - Bibliotecas compartilhadas pelos programas do sistema e módulos do kernel.
+ __/lost+found__ - Local para a gravação de arquivos/diretórios recuperados pelo utilitário fsck.ext2. Cada partição possui seu próprio diretório lost+found.
+ __/mnt__ - Ponto de montagem temporário.
+ __/proc__ - Sistema de arquivos do kernel. Este diretório não existe em seu disco rígido, ele é colocado lá pelo kernel e usado por diversos programas que fazem sua leitura, verificam configurações do sistema ou modificam o funcionamento de dispositivos do sistema através da alteração em seus arquivos.
+ __/root__ - Diretório do usuário root.
+ __/sbin__ - Diretório de programas usados pelo superusuário (root) para administração e controle do funcionamento do sistema.
+ __/tmp__ - Diretório para armazenamento de arquivos temporários criados por programas.
+ __/usr__ - Contém maior parte de seus programas. Normalmente acessível somente como leitura.
+ __/var__ - Contém maior parte dos arquivos que são gravados com frequência pelos programas do sistema, e-mails, spool de impressora, cache, etc.

## Fontes
[http://www.uniriotec.br/](http://www.uniriotec.br/)

[http://pt.wikibooks.org/wiki/Guia_do_Linux/](http://pt.wikibooks.org/wiki/Guia_do_Linux/)


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



