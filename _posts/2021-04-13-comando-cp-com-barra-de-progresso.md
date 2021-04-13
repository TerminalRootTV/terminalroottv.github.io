---
layout: post
title: "Comando cp com Barra de Progresso"
date: 2021-04-13 12:33:20
image: '/assets/img/gnu/cp-progress-bar.png'
description: 'Útil para acompanhar o andamento das cópias via linha de comando.'
icon: 'ion:terminal-sharp'
iconname: 'GNU'
tags:
- gnu
- comandos
- terminal
---

![Comando cp com Barra de Progresso](/assets/img/gnu/cp-progress-bar.png)

 O comando `cp` faz parte do [GNU CoreUtils](https://www.gnu.org/software/coreutils/) e um dos recursos que muita gente queria que fosse implementado seria uma **barra de progresso**, mas como isso ainda não aconteceu , um programador criou um patch o disponibilizou no [GitHub](https://github.com/jarun/advcpmv) que pode ser implementado ao GNU CoreUtils e você usá-lo!

# Instalação
O procedimento é bem simples, basta seguir os passos:

+ **1.** Antes de mais nada certifique-se das ferramentas de construção de software no seu computador, exemplo:
{% highlight bash %}
sudo apt install gcc g++ make build-essential
{% endhighlight %}

+ **2.** Baixe o GNU CoreUtils
{% highlight bash %}
wget http://ftp.gnu.org/gnu/coreutils/coreutils-8.32.tar.xz
{% endhighlight %}

+ **3.** Descompacte
{% highlight bash %}
tar xvJf coreutils-8.32.tar.xz
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


+ **4.** Entre no diretório e depois baixe o *patch*
{% highlight bash %}
cd coreutils-8.32/
wget https://raw.githubusercontent.com/jarun/advcpmv/master/advcpmv-0.8-8.32.patch
{% endhighlight %}

+ **5.** Aplique o *patch*
{% highlight bash %}
patch -p1 -i advcpmv-0.8-8.32.patch
{% endhighlight %}

+ **6.** Compile
{% highlight bash %}
./configure
make
{% endhighlight %}

---

O binário será criado no diretório `src` , ou seja `coreutils-8.32/src/cp`, você pode movê-lo para substituir o `cp` original com o comando: `sudo cp src/cp $(which cp)`(cp copia cp 😃 ).

Ou criar um alias(acho mais recomendado):
{% highlight bash %}
mkdir -p ~/.local/bin
cp src/cp ~/.local/bin/cp
echo 'alias cp="${HOME}/.local/bin/cp"' >> ~/.bashrc
exec $SHELL
{% endhighlight %}

E testar, exemplo:
> Use o parâmetro `--progress-bar`
{% highlight bash %}
cp --progress-bar Documentos/Fedora-Workstation-Live-x86_64-33-1.2.iso .
copying at 111,2 MiB/s (about 0h 0m 23s remaining)
Documentos/Fedora-Workstation-Live-x86_64-33-1.2.iso                   340,9 MiB /   1,9 GiB
[===============================>
{% endhighlight %}

Se quiser evitar de ficar usando esse parâmetro, já crie o alias com o parâmetro, exemplo:
> `vim ~/.vimrc` e deixe o alias nesse arquivo assim:


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


{% highlight bash %}
alias cp="${HOME}/.local/bin/cp --progress-bar"
{% endhighlight %}

Feche, execute `source ~/.bashrc` e teste sem o parâmetro, o mesmo será incluso automaticamente:
{% highlight bash %}
cp Documentos/Fedora-Workstation-Live-x85_64-33-1.2.iso .
copying at 111,2 MiB/s (about 0h 0m 23s remaining)
Documentos/Fedora-Workstation-Live-x86_64-33-1.2.iso                   340,9 MiB /   1,9 GiB
[===============================>
{% endhighlight %}

O mesmo pode ser usado para o comando `mv` que também ficará em `src`, no entanto, dê preferência para o parâmetro `-g` em vez do ~~`--progress-bar`~~, é mais simples! Mas sinceramente não vejo utilidade em usar isso no `mv` até porque as coisas são movidas de maneiras tão rápida que nem precisa disso.

Por hoje é só!

