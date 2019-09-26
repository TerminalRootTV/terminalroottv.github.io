---
layout: post
title: "Veja Como remover arquivos duplicados no seu PC"
date: 2017-11-11 16:10:56
image: '/assets/img/dicas/como-remover-arquivos-duplicados-no-linux.jpg'
description: "Fdupes é um utilitário Linux capaz de encontrar arquivos duplicados no conjunto de diretórios e subdiretórios."
main-class: 'linux'
tags:
- Linux
- Dicas
---

# O que é ?

> [Fdupes](https://github.com/adrianlopezroche/fdupes "Fdupes") é um utilitário Linux capaz de encontrar arquivos duplicados no conjunto de diretórios e subdiretórios. Fdupes reconhecer duplicatas através da comparação MD5 assinatura de arquivos seguido por um byte-to-byte comparação. Um monte de opções podem ser passadas com Fdupes para listar, excluir e substituir os arquivos com hardlinks para duplicatas.

# Instalação
+ No Gentoo
{% highlight bash %}
emerge --ask app-misc/fdupes
{% endhighlight %}

+ Debian, Ubuntu e derivados
{% highlight bash %}
apt-get install fdupes -y
{% endhighlight %}

# Ferramenta para testes

{% highlight bash %}
mkdir TerminalRoot
for i in $(seq 1 15); do echo "Terminal Root é GNU/Linux!" >> TerminalRoot/TerminalRoot$i.txt; done;
{% endhighlight %}

### Comando básico, se houver arquivos duplicados naquele diretório (ele não irá ver recursivamente) ele mostrará, se não voltará a exibir nome e host no prompt

{% highlight bash %}
fdupes [diretório]
{% endhighlight %}

Opções

+ __-r__ - procura recursivamente

+ __-S__ - mostra o tamanho de cada arquivo

+ __-Sr__ - ambos juntos

+ __-d__ - Para excluir os arquivos duplicados, preservando uma cópia, você pode usar a opção '-d'. Deve-se tomar cuidado ao usar esta opção, senão você pode acabar perdendo arquivos necessários ou dados , pois esse processo é irreversível.

+ __-f__ - protege um arquivo , se eles estiverem nomeados como: nome, cópia, 2° cópia, 3° cópia,...

+ __-h__ - ajuda

### Ele lhe pergunta qual arquivo você deseja manter:

{% highlight bash %}
   [-] TerminalRoot/.TerminalRoot13.txt
   [-] TerminalRoot/.TerminalRoot1.txt
   [-] TerminalRoot/.TerminalRoot9.txt
   [-] TerminalRoot/.TerminalRoot6.txt

Set 1 of 1, preserve files [1 - 4, all]: 2-4
{% endhighlight %}

### se vc digitar 2 , significa que o segundo arquivo será preservado, justamente o .TerminalRoot1.txt

### se vc digitar 1 , significa que o segundo arquivo será preservado, justamente o .TerminalRoot13.txt


*Você ainda pode salvar a saída num arquivo, pra conferir os arquivos duplicados, caso deseje:*

{% highlight bash %}
fdupes -Sr [diretório] > output.txt
{% endhighlight %}

__E se quiser criar até um script depois para removê-los__. 

### Manual, quase o mesmo do *-h*

{% highlight bash %}
man fdupes
{% endhighlight %}

## Softwares similares, outra forma

# FSlint

### Instalação
+ No Gentoo
{% highlight bash %}
emerge --ask app-misc/fslint
{% endhighlight %}

+ Debian, Ubuntu e derivados
{% highlight bash %}
apt-get install fslint -y
{% endhighlight %}

# Use

{% highlight bash %}
fslint-gui
{% endhighlight %}

## Aplicativo gráfico


![FSlint](/assets/img/duplicados/fslint-gui.jpg "FSlint")

# Para obter informações dele:

{% highlight bash %}
man fdupes
man fslint
{% endhighlight %}

# [Assista ao Vídeo](https://www.youtube.com/watch?v=V_esbx5r_BY)

<iframe width="920" height="400" src="https://www.youtube.com/embed/V_esbx5r_BY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

# Internet:

[https://is.gd/I4plGa](https://is.gd/I4plGa "FSlint")

# Endereço oficial do projeto 

<https://github.com/adrianlopezroche/fdupes>

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

