---
layout: post
title: "libtree - Uma opção mais moderna ao ldd"
date: 2021-12-10 12:11:32
image: '/assets/img/comandos/libtree.png'
description: 'Ele lhe informa se uma biblioteca está ou não instalada e o porque.'
icon: 'ion:terminal-sharp'
iconname: 'Comandos'
tags:
- cpp
- linguagemc
---

![libtree - Uma opção mais moderna ao ldd](/assets/img/comandos/libtree.png)

Se você precisa saber quais bibliotecas um binário utiliza para posteriormente utilizá-las de alguma forma, nós sabemos que o o comando `ldd` é uma das alternativas mais utilizadas, no entanto possui algumas limitações, ou seja, há bibliotecas que não são encontradas e ele não informa.

Para isso você pode substituí-lo pelo **libtree**

---

# O que o `libtree` faz ?
+ `deciduous_tree` transforma o ldd em uma árvore
+ `point_up` explica porque as bibliotecas compartilhadas são encontradas e porque não
+ implanta executáveis e dependências em um único diretório

# Instalação
Não há nenhum segredo, basta baixar o binário, dá permissão de execução e utilizá-lo, assim:


<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

{% highlight sh %}
wget -qO libtree https://github.com/haampie/libtree/releases/download/v2.0.0/libtree_x86_64
chmod +x libtree
./libtree $(which man)
{% endhighlight %}

Caso queira, instale no seu sistema:

{% highlight sh %}
sudo install -v libtree /usr/local/bin/
{% endhighlight %}

E utilizá-lo como comando `libtree` .

Para deploy de binários e dependências em um diretório separado, use:

{% highlight sh %}
libtree $(which man) -d man.bundle --chrpath --strip
{% endhighlight %}

A saída será similar à abaixo:

{% highlight sh %}
$ libtree $(which man) -d man.bundle --chrpath --strip
man
├── libmandb-2.9.1.so [runpath]
│   ├── libman-2.9.1.so [runpath]
│   │   ├── libpipeline.so.1 [ld.so.conf]
│   │   └── libseccomp.so.2 [ld.so.conf]
│   └── libgdbm.so.6 [ld.so.conf]
├── libman-2.9.1.so (collapsed) [runpath]
└── libpipeline.so.1 (collapsed) [ld.so.conf]

Deploying to "man.bundle/usr"
"/usr/bin/man" => "man.bundle/usr/bin/man"
"/usr/lib/man-db/libmandb-2.9.1.so" => "man.bundle/usr/lib/libmandb-2.9.1.so"
"/usr/lib/man-db/libman-2.9.1.so" => "man.bundle/usr/lib/libman-2.9.1.so"
"/usr/lib/x86_64-linux-gnu/libpipeline.so.1.5.2" => "man.bundle/usr/lib/libpipeline.so.1.5.2"
  creating symlink "man.bundle/usr/lib/libpipeline.so.1"
"/usr/lib/x86_64-linux-gnu/libseccomp.so.2.5.1" => "man.bundle/usr/lib/libseccomp.so.2.5.1"
  creating symlink "man.bundle/usr/lib/libseccomp.so.2"
"/usr/lib/x86_64-linux-gnu/libgdbm.so.6.0.0" => "man.bundle/usr/lib/libgdbm.so.6.0.0"
  creating symlink "man.bundle/usr/lib/libgdbm.so.6"

$ tree man.bundle/
man.bundle/
└── usr
    ├── bin
    │   └── man
    └── lib
        ├── libgdbm.so.6 -> libgdbm.so.6.0.0
        ├── libgdbm.so.6.0.0
        ├── libman-2.9.1.so
        ├── libmandb-2.9.1.so
        ├── libpipeline.so.1 -> libpipeline.so.1.5.2
        ├── libpipeline.so.1.5.2
        ├── libseccomp.so.2 -> libseccomp.so.2.5.1
        └── libseccomp.so.2.5.1

3 directories, 9 files
{% endhighlight %}

Para mais informações visite o [repositório](https://github.com/haampie/libtree) .


