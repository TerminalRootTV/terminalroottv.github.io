---
layout: post
title: "Curso Certificação Linux LPI-102: Backup, compactação e descompactação"
date: '2012-12-26T13:09:00.000-08:00'
image: '/assets/img/lpi/compactacao.jpg'
description: "A compressão de dados é o ato de reduzir o espaço ocupado por dados num determinado dispositivo."
main-class: 'linux'
tags:
- Linux
- Dicas
- LPI
---

![Curso Certificação Linux LPI-102: Backup, compactação e descompactação](/assets/img/lpi/compactacao.jpg "Curso Certificação Linux LPI-102: Backup, compactação e descompactação")

> A compressão de dados é o ato de reduzir o espaço ocupado por dados num determinado dispositivo. Essa operação é realizada através de diversos algoritmos de compressão, reduzindo a quantidade de Bytes para representar um dado, sendo esse dado uma imagem, um texto, ou um arquivo (ficheiro) qualquer.

__Comprimir__ dados destina-se também a retirar a redundância, baseando-se que muitos dados contêm informações redundantes que podem ou precisam ser eliminadas de alguma forma. Essa forma é através de uma regra, chamada de código ou protocolo, que, quando seguida, __elimina os bits redundantes de informações__, de modo a __diminuir seu tamanho__ nos arquivos. Por exemplo, a __sequência "AAAAAA"__ que ocupa __6 bytes__, poderia ser representada pela __sequência "6A"__, que __ocupa 2 bytes__, __economizando 67% de espaço__.
Alguns compactadores de arquivos:
 
![Blog Linux](/assets/img/lpi/compactadores-linux.jpg "Blog Linux")
 
## TAR
> MIME:  __application/x-tar__

[TAR ou tar](https://www.gnu.org/software/tar/) (abreviatura de __T__ ape __AR__ chive), é um formato de arquivamento de arquivos (ficheiros). Apesar do nome "__tar__" ser derivado de "__tape archive__", o seu uso não se restringe a fitas magnéticas. Ele se tornou largamente usado para armazenar vários arquivos em um único, preservando informações como datas e permissões. Normalmente é produzido pelo comando "__tar__". 
Algumas das opções mais frequentes:


* __-c__ - cria um novo arquivo tar;
* __-M__ - cria, lista ou extrai um arquivo multivolume;
* __-p__ - mantém as permissões originais do(s) arquivo(s);
* __-r__ - acrescenta arquivos a um arquivo tar;
* __-t__ - exibe o conteúdo de um arquivo tar;
* __-v__ - exibe detalhes da operação;
* __-w__ - pede confirmação antes de cada ação;
* __-x__ - extrai arquivos de um arquivo tar;
* __-z__ - comprime ou extrai arquivos tar resultante com o gzip;
* __-j__ - comprime ou extrai arquivos tar resultante com o bz2;
* __-f__ - especifica o arquivo tar a ser usado;
* __-C__ - especifica o diretório dos arquivos a serem armazenados.


## GZIP

[Gzip](https://www.gnu.org/software/gzip/) é a abreviação de __GNU z__ ip, um Software Livre de compressão sem perda de dados, criado por Jean-loup Gailly e Mark Adler. O programa é baseado no algoritmo __DEFLATE__. A extensão gerada pelo __gzip__ é o __.gz__, e seu formato contém apenas um arquivo comprimido. Em sistemas [UNIX](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=UNIX) é comum gerar um arquivo contendo diversos outros arquivos com o programa tar, e depois comprimi-lo com o gzip, gerando um arquivo __.tar.gz__.
__Não confundir com o formato ZIP__.

## TAR.BZ2

> Formato de compactação de arquivos, muito utilizado em sistemas __Unix-Like__.

## COMPACTAÇÃO

### Compactando arquivos .tar

{% highlight bash %}
tar -cf arquivo.tar [arquivo ou pasta]
{% endhighlight %}

Criando arquivos gzip(depois de ter criado o tar primeiro):
{% highlight bash %}
gzip arquivo.tar
{% endhighlight %}

Compactando arquivos tar.gz (TAR com gzip de uma só vez):
{% highlight bash %}
tar -zcvf arquivos.tar.gz [arquivo ou pasta]
{% endhighlight %}

Compactando arquivos no formato tar.bz2:
{% highlight bash %}
tar -jcvf arquivos.tar.bz2 [arquivo ou pasta]
{% endhighlight %}

Compactando arquivos tar de uma outra forma:
{% highlight bash %}
tar -c [arquivo ou pasta] > arquivo.tar
{% endhighlight %}

## Compactando outros formatos (rar, zip e afins)

Instale o suporte
{% highlight bash %}
apt-get install rar unrar p7zip
{% endhighlight %}

{% highlight bash %}
rar a arquivo.rar [arquivo ou pasta]
{% endhighlight %}

{% highlight bash %}
zip -r arquivo.zip [arquivo ou pasta]
{% endhighlight %}

## DESCOMPACTAÇÃO

Descompactando arquivos __.tar__
{% highlight bash %}
tar -xf arquivo.tar [arquivo ou pasta]
{% endhighlight %}

Descompactando arquivos gzip(depois de ter criado o tar primeiro):
{% highlight bash %}
gzip -d arquivo.tar.gz
{% endhighlight %}

Descompactando arquivos tar.gz (TAR com gzip de uma só vez):
{% highlight bash %}
tar -zxvf arquivos.tar.gz
{% endhighlight %}

Descompactando arquivos no formato tar.bz2:
{% highlight bash %}
tar -jxvf arquivos.tar.bz2 [arquivo ou pasta]
{% endhighlight %}

## Descompactando outros formatos(rar, zip e afins)
Instale o suporte
{% highlight bash %}
apt-get install rar unrar p7zip
{% endhighlight %}

{% highlight bash %}
rar -e arquivo.rar
{% endhighlight %}
 ou
{% highlight bash %}
unrar x arquivo.rar
{% endhighlight %}

{% highlight bash %}
unzip arquivo.zip
{% endhighlight %}

## O comando dd (para Backup)

> O comando __dd__ é um clássico dos ambientes [Unix-Like](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=unix), com ele você pode fazer uma __cópia exata__ de um arquivo, ou seja uma __cópia bit a bit__. 

### Sintaxe básica

> dd if=origem of=destino

#### Exemplos

Cópia do HD para um arquivo
{% highlight bash %}
dd if=/dev/sda of=~/backup_hd.img
{% endhighlight %}

Será feita uma cópia exata do HD dentro do diretório do root com o nome "backup_hd.img". Se quiser restaurar o "backp_hd.img" no /dev/sda2 (lembre que o sda2 deve ter pelo menos o mesmo tamanho do arquivo "backup.hd" se não os resultados poderão ser desastrosos)
{% highlight bash %}
dd if=backup_hd.img of=/dev/sda2
{% endhighlight %}

Cópia de partição para o partição
{% highlight bash %}
dd if=/dev/sda9 of=/dev/sda11
{% endhighlight %}

Será feita cópia da partição /dev/sda9 para a /dev/sda11.
Fazendo uma cópia do HD para um arquivo compactado:
{% highlight bash %}
dd if=/dev/sda1 | gzip > backup_hd.img.gz
{% endhighlight %}

e para descompactar
{% highlight bash %}
gzip -d -c backup_hd.img.gz | dd of=/dev/sda2
{% endhighlight %}

O comando acima está descompactando o arquivo beckup_hd.img.gz no HD em /dev/sda2.

### Criar uma imagem ISO
{% highlight bash %}
dd if=diretorio of=iso_do_diretorio.iso
{% endhighlight %}

Para visualizar progresso de cópia de arquivos, vá em outro terminal e execute
{% highlight bash %}
watch df -h
{% endhighlight %}

Para converter todos as letras maiúsculas de um documento para letras minúsculas
{% highlight bash %}
dd if=ficheiro1 of=ficheiro2 conv=lcase
{% endhighlight %}

Se quisermos converter todas as letras do ficheiro2 para maiúsculas
{% highlight bash %}
dd if=ficheiro2 of=ficheiro3 conv=ucase
{% endhighlight %}

Para zerar (formatar) o seu HD (use com cuidado!)
{% highlight bash %}
dd if=/dev/zero of=/dev/hda
{% endhighlight %}

Gerar senhas de forma (pseudo) aleatória
{% highlight bash %}
dd if=/dev/random bs=2 count=6 | base64 -
r2KWFW83e9nTniVR
6+0 registros de entrada
6+0 registros de saída
12 bytes (12 B) copiados, 0,000100641 s, 119 kB/s
{% endhighlight %}

Para automatizar tarefas, você pode utilizar o Cron e Crontab.
