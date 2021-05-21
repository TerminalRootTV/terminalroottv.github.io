---
layout: post
title: "10 exemplos de uso do comando rsync"
date: 2021-05-21 12:01:58
image: '/assets/img/comandos/rsync.png'
description: 'É um comando substituto, mais moderno e eficaz que o scp.'
icon: 'ion:terminal-sharp'
iconname: 'Comandos'
tags:
- comandos
---

![10 exemplos de uso do comando rsync](/assets/img/comandos/rsync.png)

[rsync](https://rsync.samba.org/) é um utilitário amplamente usado para manter cópias de um arquivo em dois sistemas de computadores ao mesmo tempo.

É normalmente encontrado em sistemas do tipo Unix e em funções como um programa de sincronização de arquivos e transferência de arquivos. O algoritmo rsync, um tipo de codificação delta, é usado para minimizar o uso da rede. 

[Zlib](https://zlib.net/) pode ser usado para compressão adicional e o [SSH](https://terminalroot.com.br/2015/01/utilizando-o-ssh.html) ou *stunnel* pode ser usado para segurança de dados.

Rsync está em código aberto sob os termos da [GNU](https://terminalroot.com.br/tags#gnu) GPL Versão 2.

Para instalar o Rsync na sua [Distro](https://terminalroot.com.br/tags#distros), exemplos:
{% highlight bash %}
emerge rsync # Gentoo, Funtoo, ...
sudo apt install rsync # Debian, Ubuntu, Mint, ...
sudo pacman -S rsync # Arch, Manjaro, ...
sudo dnf install rsync # Red Hat, Fedora, ...
{% endhighlight %}

Agora vamos aos exemplos!

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# 01. Copiando arquivo local
Similar ao comando [cp](https://terminalroot.com.br/2021/04/comando-cp-com-barra-de-progresso.html)
{% highlight bash %}
rsync ~/Downloads/arquivo.txt .
{% endhighlight %}

---

# 02. Copiando de forma verbose
Ou seja, exiindo detalhes da operação
{% highlight bash %}
rsync -v Downloads/arquivo.txt .
cheat_sheet_sed.pdf

sent 471,766 bytes  received 35 bytes  943,602.00 bytes/sec
total size is 471,560  speedup is 1.00
{% endhighlight %}

---

# 03. Copiando diretórios recursivamente
O parâmetro é `-r` ou `--recursive`, mas agora é bom usar todos os comandos com `-v`
{% highlight bash %}
rsync -rv Downloads/my-dir/ .
{% endhighlight %}

---

# 04. Criando diretório durante a cópia
O problema do exemplo **03** é que o diretório `my-dir` não será criado e os arquivos ficarão espalhados.

O correto é usar ele criando o diretório:
{% highlight bash %}
rsync -rv Downloads/my-dir/ --mkpath my-dir
{% endhighlight %}

A saída exemplo:
{% highlight bash %}
sending incremental file list
created 1 directory for my-dir
arquivo-01.txt.jpg
arquivo-02.txt.jpg
arquivo-03.txt.jpg
arquivo-04.txt.jpg
arquivo-05.txt.jpg
arquivo-06.txt.jpg
arquivo-07.txt.jpg
arquivo-08.txt.jpg
arquivo-09.txt.jpg
arquivo-10.txt.jpg
arquivo-11.txt.jpg
arquivo-12.txt.jpg

sent 630,589 bytes  received 286 bytes  1,261,750.00 bytes/sec
total size is 629,625  speedup is 1.00
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


---

# 05. Copiando um arquivo remoto para seu sistema
Essa é estilo total [scp](https://terminalroot.com.br/2016/10/blog-linux-ssh.html)
{% highlight bash %}
rsync 192.168.189.36:~/arquivo-remoto.txt .
{% endhighlight %}

Ou especificando seu usuário e ainda também, verbose:
{% highlight bash %}
rsync -v user@192.168.189.36:~/arquivo-remoto.txt .
{% endhighlight %}

---

# 06. Copiando um diretório remoto
Assim como no `scp` precisa usar o `-r`, para esse caso remoto não precisa do `--mkpath`, os diretórios serão criados automaticamente.
{% highlight bash %}
rsync -rv user@192.168.189.36:~/my-dir .
{% endhighlight %}

Exemplo de saída:
{% highlight bash %}
user@192.168.189.36's password: 
receiving incremental file list
my-dir/
my-dir/arquivo-01.txt
my-dir/arquivo-02.txt
my-dir/arquivo-03.txt
my-dir/arquivo-04.txt
my-dir/subdir/
my-dir/subdir/outro-arquivo.txt

sent 135 bytes  received 501 bytes  84.80 bytes/sec
total size is 45  speedup is 0.07
{% endhighlight %}

---

# 07. Copiado com wildcards
A gente sabe que pode usar o `*` para copiar estilo [glob](https://terminalroot.com.br/bash), que não é [regex](https://terminalroot.com.br/regex). Então para copiar só os arquivos txt do diretório raiz remoto.

Lembrando que o diretório não será criado.
{% highlight bash %}
rsync -rv user@192.168.189.36:~/my-dir/*.txt .
{% endhighlight %}

---

# 08. Usando barra de progresso
Diferentemente do `scp`, se você cancelar a cópia o arquivo local deixará de existir, ou seja, ele não copia pedaços, é sempre de forma síncrona.
{% highlight bash %}
rsync -rv --progress user@192.168.189.36:~/distro.iso .
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


---

# 09. Definindo a velocidade da cópia
Cópia remota dentro da rede também consomem largura da banda baseada na velocidade da sua placa de rede, então para que você continue usando a rede ou a internet sem deixá-la lenta às vezes é interessante limitar a velocidade da cópia, para isso você pode usar o parametro `--bwlimit=[número]`, onde o [número] será em kilobits .
{% highlight bash %}
rsync -rv --bwlimit=64 --progress user@192.168.189.36:~/*.vdi .
{% endhighlight %}

A velocidade não ficará com exatos 64k, mas ficará em torno, um pouco acima ou abaixo, exemplo:
{% highlight bash %}
user@192.168.189.36's password: 
receiving incremental file list
distro.iso
        425,984   0%   64.81kB/s   17:04:05
{% endhighlight %}

---

# Manual e ajuda
E por fim, nos resta o manual e ajuda, pois lá ainda tem parâmetro pra caramba!
{% highlight bash %}
man rsync
rsync --help
{% endhighlight %}





