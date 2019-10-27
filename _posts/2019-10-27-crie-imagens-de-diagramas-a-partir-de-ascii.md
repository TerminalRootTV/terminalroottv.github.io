---
layout: post
title: "Crie imagens de diagramas a partir de ASCII"
date: 2019-10-27 13:56:58
image: '/assets/img/java/ditaa.jpg'
description: 'A partir daí podem sair ideias com simples parâmetros via linha de comando. 💡️'
tags:
- ditaa
- java
- ascii
- terminal
- comando
---

[![Crie imagens de diagramas a partir de ASCII](/assets/img/java/ditaa.jpg)](/assets/img/java/ditaa.jpg)

As tecnologias antigas nunca morrem. Lógico que existem várias soluções gráficas e online, mas fazer o uso de caracteres *ASCII* lhe dá mais domínio sobre as coisas e sem dizer que a partir dessa ideia podem sair diversas outras mais intuitivas que podem se concretizar com simples parâmetros via **linha de comando** .

## Introdução

[ditaa](http://ditaa.sourceforge.net/) é um pequeno utilitário de linha de comando escrito em [Java](https://openjdk.java.net), que pode converter diagramas desenhados usando arte ascii em gráficos de imagem.

## Instalação

Lógico que você precisará possuir o [JRE](https://openjdk.java.net) instalado no seu sistema, exemplos:
{% highlight bash %}
sudo emerge openjdk-jre-bin # Gentoo, Funtoo,..
sudo apt install openjdk-9-jre # Debian, Ubuntu, Linux Mint,..
# Veja o nome do pacote na sua distro.
{% endhighlight %}

Após isso, é necessário fazer o download do **ditaa**:
{% highlight bash %}
wget git.io/ditaa -O ditaa.jar
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

## Criando seu primeiro diagrama

Vamos ver um exemplo bem básico . Supondo que você possui esse conteúdo dentro de uma arquivo **.txt** : `vim exemplo.txt`
{% highlight bash %}
+-----------------+     +-------------------------+    +-----------------------------+
|                 |     |                         |    |                             |
|  Terminal Root  +-->  | Linux e Desenvolvimento +--> | Super usuário da Tela Preta +
|       {d}       |     |                         |    |                             |
+---------+-------+     +-------------------------+    +-----------------------------+
          :                                                          ^
          |                     terminalroot.com.br                  |
          +----------------------------------------------------------+
{% endhighlight %}
> A tag **{d}** deixará esse campo com curvas na parte inferior, note na imagem.
Depois rode o comando:
> Lembrando que o arquivo baixado(**dita.jar**) precisa estar no mesmo diretório do **exemplo.txt**
{% highlight bash %}
java -jar ditaa.jar exemplo.txt saida.png
{% endhighlight %}

O arquivo de imagem **saida.png** foi criado e você já pode abrí-lo para ver a saída: `gio open saida.png`
![Exemplo saida.png](/assets/img/java/saida.png)

Se quiser você ainda pode customizar seu diagrama com cores, geralmente é o nome da cor em inglês(maiúscula), ou o código da cor, iniciado com a letra **c**(minúsculo). Veja o exemplo anterior agora customizado com cores:
{% highlight bash %}
+-----------------+     +-------------------------+    +-----------------------------+
|                 |     |                         |    |                             |
|  Terminal Root  +-->  | Linux e Desenvolvimento +--> | Super usuário da Tela Preta +
|   cRED {d}      |     |      c469               |    |          c000               |
+---------+-------+     +-------------------------+    +-----------------------------+
          :                                                          ^
          |                     terminalroot.com.br                  |
          +----------------------------------------------------------+
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

Depois é só rodar: `java -jar ditaa.jar exemplo.txt saida-com-cores.png`:
![Exemplo saida-com-cores.png](/assets/img/java/saida-com-cores.png)

Dá pra fazer muita coisa, veja esse diagrama que eu criei pro [Crontab](https://terminalroot.com.br/2014/12/como-utilizar-o-crontab.html)
{% highlight bash %}
java -jar ditaa.jar crontab.txt crontab.png
{% endhighlight %}
![Exemplo saida.png](/assets/img/java/crontab.png)

Legal, né ? Eu particularmente curto desenhar via ASCII esses diagramas (encaro como uma terapia 😘️), mas se você acha que irá perder muito tempo, você pode pegar **exemplos prontos** e somente editá-los à sua maneira para suprir sua necessidade. Veja nesse link diversos exemplos prontos:
> Inclusive diversos formatos possíveis
### [https://bl.ocks.org/nicerobot/8379371](https://bl.ocks.org/nicerobot/8379371)

Por hoje é só! Abraços!

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script> 

## Página oficial do ditaa
+ <http://ditaa.sourceforge.net/>
