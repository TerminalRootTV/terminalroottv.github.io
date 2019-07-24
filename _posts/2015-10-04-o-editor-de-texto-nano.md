---
layout: post
title: "O editor de texto Nano"
date: '2015-10-04T17:27:00.002-07:00'
image: '/assets/img/editores/nano-editor.jpg'
description: "Nano é um editor que deve ser executado a partir de um terminal, e se concentra em simplicidade."
main-class: 'linux'
tags:
- Linux
- Dicas
- GNU
twitter_text: "O editor de texto Nano"
introduction: "Nano é um editor que deve ser executado a partir de um terminal, e se concentra em simplicidade."
---

![Nano Editor Blog Linux](/assets/img/editores/nano-editor.jpg "Nano Editor Blog Linux")

[Nano](http://www.nano-editor.org/) é um editor que deve ser executado a partir de um terminal, e se concentra em simplicidade. Nano é um clone do antigo  editor de texto Pico, o editor para o cliente de e-mail Pine, que foi muito popular lá pelos anos 90, em [UNIX](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=unix) e sistemas do tipo UNIX. O Pine foi substituído pelo Alpine e o Pico pelo Nano, mas algumas coisas não mudaram - assim como a simplicidade de edição com o Nano.

Caso você não possua o Nano, utilize o seu gerenciador de pacotes para instalar, ele está na maioria dos repositórios da [Distros](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=distros)

{% highlight bash %}
apt-get install nano
{% endhighlight %} 

Nano foi criado em 1999 com o nome de "TIP" (uma sigla, um acrônimo  recursivo que significa "TIP Isn't Pine", ou "TIP não é o Pine") por  Chris Allagretta. Allagretta decidiu criar este clone do Pico porque o  programa não foi liberado sob a GPL. O nome foi mudado oficialmente em  10 de janeiro de 2000 para diminuir a confusão entre o novo editor e o  comando "tip" (o comando "tip" é comum em Sun Solaris). 

Nano usa combinações muito simples de teclas para trabalhar com arquivos. Um arquivo é aberto ou iniciado com o comando

{% highlight bash %}
nano 
{% endhighlight %}

Veja uma imagem de terminal rodando o Nano:
![Blog Linux](/assets/img/editores/editor-gnu-nano.jpg "Blog Linux")

Quando o arquivo estiver aberto no Nano, você verá uma pequena lista de  exemplos de comando na parte inferior da janela do terminal. 
Veja na  figura
![Blog Linux](/assets/img/editores/editor-gnu-nano3.jpg "Blog Linux")
Todas as combinações de teclas para Nano começam com a tecla __CTRL__. 
Para  executar um comando você deve manter a tecla __CTRL__ pressionada e clicar  na segunda tecla para executar a ação.

As combinações mais comuns para  Nano são
> __CTRL+X__ => Sai do editor.

> __CTRL+O__ => Salva o arquivo. 

> __CTRL+R__ => Ler um arquivo em seu arquivo de trabalho atual. 

>__CTRL+C__ => Mostra a posição atual do cursor.

> __CTRL+K__ => 'recorta' o texto.

> __CTRL+U__ => 'cola' o texto.

> __CTRL+S__ => Salva o arquivo e continua trabalhando.

> __CTRL+T__ => verifica a ortografia do seu texto.

> __CTRL+W__ => faz uma busca no texto.

> __CTRL+A__ => leva o cursor para o início da linha.

> __CTRL+E__ => leva o cursor para o fim da linha.

> __CTRL+G__ => mostra a ajuda do Nano.

> __CTRL+/__ => e depois insira o n° da linha que deseja ir.

Abrir o *arquivo.txt* já na *linha 20*
{% highlight bash %}
nano +20 arquivo.txt
{% endhighlight %}

Abrir 3 arquivos de texto de uma só vez
{% highlight bash %}
nano arq1 arq2 arq3
{% endhighlight %}

Abrir um arquivo em modo somente-leitura
{% highlight bash %}
nano -v arq1
{% endhighlight %}

Ir para uma linha e coluna específicas com o arquivo já aberto(*O número da coluna é opcional.*)

{% highlight bash %}
Alt + g <número da linha, [número da coluna]>
{% endhighlight %}

Levar o *cursor* para o início e para o final do documento

> Para o início: __Alt + \\__

***

> Para o final: __Alt + /__

+ Selecionar texto (região) para copiar ou recortar trechos de texto

Primeiramente, posicione o cursor no local a partir de onde o texto desejado será selecionado (a seleção pode ser feita tanto para frente quanto para trás)

Pressionar a combinação de teclas __Alt + A__ para ativar a marcação de textos (modo de seleção)

Efetuar a seleção usando as setas de direção do teclado.

+ Copiar região (texto) para buffer de transferência

Após selecionar o texto desejado como mostrado no item anterior, pressione agora a combinação de teclas __Alt + 6__ para copiar o conteúdo selecionado para o buffer de transferência.

Para colar o texto em outro local dentro do arquivo, posicione o cursor no destino e use a combinação __Ctrl + U__


## Mais algumas opções do comando

* __-B (--backup)__ : quando salva um arquivo, faz um backup da versão anterior dele com o nome do arquivo atual acrescido do sufixo ~.
* __-V (--version)__ : exibe dados da versão atual e encerra.
* __-c (--const)__ : exibe a posição do cursor (linha, coluna e caracter) constantemente.
* __-h (--help)__ : exibe o sumário das opções de linha de comando e encerra.
* __-m (--mouse)__ : habilita suporte ao mouse, caso esteja disponível no sistema. O mouse pode ser usado para posicionar o cursor, selecionar e executar atalhos.
* __-v (--view)__ : abre arquivo apenas para leitura.
* __-w (--nowrap)__ : desabilita a quebra de linhas longas.
* __-x (--nohelp)__ : desabilita a tela de ajuda que é exibida no rodapé do editor.

## Existem muitos mais comandos para usar no Nano.

#### Use o manual do [Nano](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=nano)

{% highlight bash %}
man nano
{% endhighlight %}


![Blog Linux](/assets/img/editores/editor-gnu-nano3.jpg "Blog Linux")


<sub style="color: #666;">
http://www.vivaolinux.com.br/artigo/Introducao-ao-Linux-O-editor-de-texto-Nano http://www.bosontreinamentos.com.br/linux/15-exemplos-de-uso-do-editor-de-textos-nano-no-linux/ http://www.uniriotec.br/~morganna/guia/nano.html
</sub>

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

