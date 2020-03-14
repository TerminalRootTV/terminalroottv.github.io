---
layout: post
title: "Aprenda a explorar o comando wget"
date: 2019-05-24 10:29:52
image: '/assets/img/gnu/gnu-wget.jpg'
description: 'Muita gente instala utilitários de download, mesmo sem saber que seu Linux já possui o melhor utilitário que existe: wget.'
tags:
- gnu
- wget
- dicas
---

![Aprenda a explorar o comando wget](/assets/img/gnu/gnu-wget.jpg)

# Introdução

O [GNU Wget](https://www.gnu.org/software/wget/manual/wget.html) ou simplesmente *wget* é um utilitário gratuito para download não interativo de arquivos da Web criado em [Linguagem C](http://terminalroot.com.br/2017/01/codigo-de-linguagem-c-para-aprendizado.html) pelo [Projeto GNU](https://www.gnu.org/) como o próprio nome correto sugere. Suporta os protocolos HTTP, HTTPS e FTP, bem como a recuperação através de proxies HTTP.

# Instalação

A maioria das distribuições [Linux](http://terminalroot.com.br/) já possuem o `wget` instalado por padrão, mas se por algum motivo não houver utilize o gerenciador de pacotes da sua distribuição para instalar que, com certeza, o wget está no repositório, não só das distros Linux como nos sistemas baseados em [BSD](http://terminalroot.com.br/2016/05/comparando-bsd-e-linux.html), exemplos:

- Para instalar no [Arch Linux](http://terminalroot.com.br/2018/07/como-instalar-facilmente-o-arch-linux.html)
{% highlight bash %}
pacman -S wget
{% endhighlight %}

- Para instalar no [FreeBSD](http://terminalroot.com.br/2017/09/por-que-freebsd.html)
{% highlight bash %}
pkg install wget
{% endhighlight %}

## 1 - Uso básico

> Se você quiser você pode omitir o http, https, ftp,... , ele reconhece os protocolos automaticamente. Se você baixar um arquivo de mesmo nome, ele não sobrescreve o arquivo que já possui, baixa automaticamente com o mesmo nome, mas o .1 , se já tiver tb o .1, ele baixa como .2, e assim sucessivamente, depois do final do nome/extensão do arquivo, ex.: arquivo.iso.1 , depois 

{% highlight bash %}
wget https://site.com/arquivo.iso
{% endhighlight %}

> É possível baixa múltiplos arquivos, ex.: `wget http://site.com/file.fs ftp.site.com/doc.txt ...` , ou até mesmo usar o parâmetro -i e logo depois informar o arquivo que contém os links (geralmente linha por linha, até mesmo separados pôr linhas em branco).

## 2 - Salvando com um nome definido pelo usuário

> O redirecionamento de stdout com o símbolo '>' não funciona no wget, o arquivo que você pediu é criado, mas ele fica com 0 bytes, ou seja, vazio . Pra redirecionar e salvar num arquivo definido pelo usuário, deve-se usar o parâmetro '-O' (letra O maiúsculo)

> Como os parâmetros são tratados com getopt , a ordem é indiferente, desde que o nome do arquivo venha depois do -O pra gerar o OPTARG .

{% highlight bash %}
wget https://site.com/arquivo.iso -O novo_nome.iso # funciona
wget -O novo_nome.iso https://site.com/arquivo.iso # funciona
wget -O https://site.com/arquivo.iso novo_nome.iso # NÃO funciona
wget novo_nome.iso https://site.com/arquivo.iso -O # NÃO funciona
{% endhighlight %}

> Com o parâmetro -P , além de criar um arquivo vc ainda cria o(s) diretórios que você deseja que ele seja salvo:

{% highlight bash %}
wget https://site.com/arquivo.iso -P caminho/aqui/novo_nome.iso
{% endhighlight %}

## 3 - Você também pode limitar a velocidade do download

> Muito utilizado quando você não deseja usar toda banda da sua rede, com `--limit-rate`

{% highlight bash %}
wget --limit-rate=100k https://site.com/arquivo.iso
{% endhighlight %}

## 4 - Retomar um download cancelado

> Se você tiver fazendo um download e quiser pausar ou alterar a velocidade do *limit-rate* , você pode teclar **Ctrl+c** para pausar o download e depois retomar, basta usar o parâmetro '-c':

{% highlight bash %}
wget -c https://site.com/arquivo.iso # retomando com a banda total disponível.
wget -c --limit-rate=150k https://site.com/arquivo.iso # retomando com uma velocidade MAIOR.
wget -c --limit-rate=64k https://site.com/arquivo.iso # retomando com uma velocidade MENOR.
{% endhighlight %}

> Se quiser você fechar o terminal, ou desligar pra retomar outro dia se desejar.

## 5 - Deixando o download em background

> Com o parâmetro '-b'

{% highlight bash %}
wget -b https://site.com/arquivo.iso
{% endhighlight %}

Automaticamente ele cria um arquivo no diretório do download com nome *wget-log* e você pode acompanhar esse download com o comando `tail -f wget-log`.

> Detalhe que você fechar o terminal e até deslogar que o download continua, se logar com outro usuário basta procurar o o PID do processo `ps -U [nome_do_usuário]` e se quiser terminá-lo , use o comando: sudo kill -9 [número_do_processo_visto_com_ps]

Vc ainda pode retomar ele com '-c' como vimos e pôr em background novamente com '-c -b' , lembrando que com esse comando ele não faz um novo download, mas criar um novo arquivo *wget-log.1* para você acompanhar, a menos que você já tenha excluído o arquivo anterior.

Você também poderia usar o `nohup` a gente detalha sobre ele e processos de forma profunda no [Curso Extremamente Avançado de Shell Script](http://terminalroot.com.br/shell)

## 6 - Entre outras opções:

+ `--pinnedpubkey=[arquivo_com_a_hash]` - Especifica uma *hash* pro **wget** , você também pode usar `--keep-badhash`
+ `--no-check-certificate` - Ignora o certificado para sites que lhe obrigarem informar.
+ `--use=[nome_de_usuário] e --password=[senha_do_usuário] , ou especificar com o protocolo ex.: --http-password` - para logins em ftp e proxy .
+ `-r` - baixa sites completos , com todos os arquivos e subdiretórios.

Para mais informações consulte o book completo oficial do Projeto GNU: <https://www.gnu.org/software/wget/manual/wget.html>
ou a 1º página do man: `man 1 wget`

## Assista ao vídeo
<iframe width="1246" height="701" src="https://www.youtube.com/embed/-1v1Qy_lXks" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Quer ficar fera no Terminal e em comandos Linux ?

Conheça nossos cursos de [Shell Script](http://terminalroot.com.br/shell) e [entre outros](http://terminalroot.com.br/cursos).

## Comente!

Valeu!

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

