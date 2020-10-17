---
layout: post
title: "Como Converter seu Shell Script em Binário"
date: 2019-08-01 11:20:47
image: '/assets/img/shellpro/shell-script-binario.jpg'
description: 'Como criar um arquivo binário do seu Shell Scripting.'
tags:
- bash
- shellscript
- shellpro
---

![Bin Bash](/assets/img/shellpro/shell-script-binario.jpg)

Este artigo irá ajudá-lo a criar um arquivo binário do seu Shell Scripting, para que ninguém possa ver o código-fonte do seu script e podemos usá-lo como um comando. Para criar um arquivo binário a partir de um script, usamos o compilador SHC

## Introdução

[shc](https://neurobin.org/projects/softwares/unix/shc/) , um compilador de Shell Script, produz o código-fonte em C. O código fonte gerado é então compilado e vinculado para produzir um executável binário separado.

O binário compilado continuará a ser dependente do shell especificado na primeira linha do código de shell (ou seja, shebang) (ou seja, `#!/bin/sh`), portanto shc não cria binários completamente independentes.

O próprio shc não é um compilador como o [gcc](https://gcc.gnu.org/), ele codifica e criptografa um script em shell e gera o código-fonte em C com o recurso de expiração adicionado. Em seguida, ele usa o compilador do sistema para compilar um binário separado que se comporta exatamente como o script original. Após a execução, o binário compilado irá descriptografar e executar o código com a opção `shell -c`.

## Instalação

No [Gentoo](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=Gentoo) e similares, use o portage que o *shc* já está disponível na árvore:

{% highlight bash %}
emerge dev-util/shc
{% endhighlight %}

Para outras distribuições, exemplo derivadas do [APT](https://www.debian.org/doc/manuals/apt-howto/index.pt-br.html) , instale primeiro as dependências necessárias:

{% highlight bash %}
sudo apt-get install libc6-dev # Debian, Ubuntu, Mint, ...
sudo yum install glibc-devel # RHEL, CentOS, Fedora, ...
{% endhighlight %}

Depois baixe o pacote, decompacte e compile o código:

{% highlight bash %}
wget https://github.com/neurobin/shc/archive/release.zip
cd shc-*
make
sudo make install
{% endhighlight %}

## Utilização

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

Crie um arquivo teste pra ver como funciona: `vim script.sh`

{% highlight bash %}
#!/bin/bash

echo -e "Os 3 primeiros caracteres de cada arquivo/diretório de local, são:\n"
for i in *; do
	echo "$i" | cut -c 1-3 | tr '\n' '\ '
done
echo
{% endhighlight %}

Depois use o **shc** para transformar em binário:

{% highlight bash %}
shc -f script.sh -o binario
{% endhighlight %}

E apenas rode o programa: `./binario`

Se você tentar ver o conteúdo do arquivo **binario** , verá tudo *codificado*, exemplo:

`cat binario`

{% highlight bash %}
...
@x@�@�@�@�@�@�@�@�@�@�H�H��/H��t��H���5�/�%�/@�%�
�@����%�/h
          �0����%�/h
�����%r/h�����%j/h������%b/h
...
{% endhighlight %}

Para mais informações e opções via linha de comando, utilize a ajuda e o manual:

{% highlight bash %}
shc --help
man shc
{% endhighlight %}

## Página Oficial do shc
<https://neurobin.org/projects/softwares/unix/shc/>

Ficou alguma dúvida ? Comente!    


