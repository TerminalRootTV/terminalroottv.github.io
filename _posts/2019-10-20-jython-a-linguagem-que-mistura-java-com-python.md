---
layout: post
title: "Jython - A linguagem que mistura Java com Python"
date: 2019-10-20 12:37:39
image: '/assets/img/dev/jython/jython.jpg'
description: 'Essa linguagem une duas boas ferramentas numa só.'
tags:
- jython
- python
- java
- programacao
- desenvolvimento
---

![Jython - A linguagem que mistura Java com Python](/assets/img/dev/jython/jython.jpg)
Essa linguagem une duas boas ferramentas numa só. 🐍

## Introdução

[Jython](https://www.jython.org/) é uma implementação da linguagem [Python](https://terminalroot.com.br/2019/10/script-basico-de-python-para-aprendizado.html) que gera bytecode para máquinas Java (JVM - Java Virtual Machine). Com ela é possível fazer o desenvolvimento de aplicações híbridas que unem código em Java e Python. 

Esta ferramenta é muito útil também para embutir uma linguagem para criação de scripts em aplicações que requerem este tipo de funcionalidade. Também inclui um compilador que converte código fonte Python em Java bytecode, permitindo que programadores Python possam escrever classes que possam ser utilizadas por um programa Java.

Entre suas vantagens, destacam-se:

+ 🐍 - Velocidade de desenvolvimento: Python é uma linguagem de desenvolvimento rápido (RAD - Rapid Application Development).
+ 🐍 - Praticidade: Não é necessário compilar o código Jython para testá-lo. Isto torna a depuração muito mais rápida. Depois de terminado o processo, utiliza-se o compilador Jythonc para compilar o programa, para incluir as bibliotecas do Jython existe a opção do freeze.
+ 🐍 - Tempo de aprendizado: Por ter uma sintaxe simples, limpa e coerente o seu aprendizado é muito fácil.

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

> Aprenda **Java** da forma correta:
> 
> <https://terminalroot.com.br/java>


## Instalação
> Procedimento no [Linux](https://terminalroot.com.br/linux)

+ **1**. - Instale as dependências 
Primeiramente você precisará ter o instalados no seu sistema:
+ [JDK](https://openjdk.java.net/) - Ambiente de desenvolvimento para Java;
+ e o [IcedTea](https://icedtea.classpath.org) - Um software de integração.

Use o gerenciador de pacotes da sua distribuição para instalá-los, exemplo, como instalei aqui no [Gentoo](https://terminalroot.com.br/2017/05/como-instalar-o-gentoo.html):
{% highlight bash %}
sudo USE="-cups -alsa" emerge -a dev-java/openjdk-bin dev-java/openjdk-jre-bin
{% endhighlight %}
> Nesse caso eu rejeitei os módulos: *cups* e *alsa* e o icedtea foi instalado automaticamente, pois é uma dependência.

+ **2**. - Instalando o [Jython](https://www.jython.org/)

Agora baixe o Jython no endereço: <https://sourceforge.net/projects/jython/> . Após baixar extraia o pacote:
> Antes crie e entre um diretório, para os arquivos não ficarem espalhados
{% highlight bash %}
mkdir ambiente && cd ambiente/
mv ../jython* .
jar xj jython.jar
java -jar jython_installer-*.jar
{% endhighlight %}

Após esse último comando, ele abrirá um **wizard** para você seguir, acompanhe as imagens abaixo:

![Jython Wizard](/assets/img/dev/jython/jython01.png)
![Jython Wizard](/assets/img/dev/jython/jython02.png)
![Jython Wizard](/assets/img/dev/jython/jython03.png)
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

> Nessa 4º imagem ↓ parte você ainda poderia escolhe um diretório personalizado, exemplo de de `~/.config/jython`, seria o mais ideal para não poluir sua pasta pessoal.
![Jython Wizard](/assets/img/dev/jython/jython04.png)

![Jython Wizard](/assets/img/dev/jython/jython05.png)
![Jython Wizard](/assets/img/dev/jython/jython06.png)
![Jython Wizard](/assets/img/dev/jython/jython07.png)
![Jython Wizard](/assets/img/dev/jython/jython08.png)
![Jython Wizard](/assets/img/dev/jython/jython09.png)
![Jython Wizard](/assets/img/dev/jython/jython10.png)


Após o **finish** agora vamos editar o seu `vim ~/.bashrc` e adicione a seguinte linha:
> Nesse caso minha versão e nome do diretório é **2.5.2** , verifique a sua.
{% highlight bash %}
PATH="${PATH}:${HOME}/jython2.5.2/bin/"
{% endhighlight %}

Depois rode o comando `source ~/.bashrc` ou feche e abra o terminal para poder que o comando `jython` seja encontrado.

## Criando sua primeira aplicação
> Um mini aplicativo que efetua soma de dois números.
Crie um arquivo como nome `vim soma.py`
{% highlight bash %}
import javax.swing as libswing 
pnumero = libswing.JOptionPane.showInputDialog("Digite um Numero Inteiro: ") 
snumero = libswing.JOptionPane.showInputDialog("Digite um Numero Inteiro: ") 
soma = int(pnumero) + int(snumero) 
libswing.JOptionPane.showMessageDialog(None, "A soma eh %d " % soma)
{% endhighlight %}

Salve e rode da seguinte maneira:
{% highlight bash %}
jython soma.py
{% endhighlight %}

> No [Shell](https://terminalroot.com.br/shell) irá aparecer as saídas do programa, mas não significa que é um *problema*, e sim que está enviando os *outputs* corretamente.

![Jython Wizard](/assets/img/dev/jython/jython11.png)
![Jython Wizard](/assets/img/dev/jython/jython12.png)

Perceba que nesse caso eu somei 8 + 8 e o resultado foi o esperado. 😁️

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# Explicando o código
+ `import javax.swing as libswing` - Importa a biblioteca do Java.
+ `pnumero = libswing.JOptionPane.showInputDialog("Digite um Numero Inteiro: ")` - Mostra a primeira caixa de diálogo e armazena o valor na variável pnumero.
+ `snumero = libswing.JOptionPane.showInputDialog("Digite um Numero Inteiro: ")` - Mostra a segunda caixa de diálogo e armazena o valor na variável snumero.
+ `soma = int(pnumero) + int(snumero)` - Converte os valores de pnumero e snumero para inteiros e soma os dois armazenando o resultado na variável soma.
+ `libswing.JOptionPane.showMessageDialog(None, "A soma eh %d " % soma)` - Mostra na tela o resultado da soma, simples não é?

## [Curso de Java para Iniciantes](https://terminalroot.com.br/java)
### <https://terminalroot.com.br/java>

# Assista ao Vídeo

<!--<iframe width="910" height="390" src="https://www.youtube.com/embed/IOx2Hynwzh4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->

<iframe width="1253" height="705" src="https://www.youtube.com/embed/IOx3Hynwzh4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

## Conclusão

Eu particularmente curti o Jython 🙌️ e vou me aprofundar mais sobre ele e provavelmente haverá mais tutoriais aqui sobre o mesmo. E você ?! Curtiu ?! Conte-nos usando o campo de comentários .
Abraços!

## Links úteis

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:50px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

+ <https://www.jython.org/>
+ <https://sourceforge.net/projects/jython/>
+ <https://wiki.python.org.br/IntroducaoJython>
+ <http://www.linhadecodigo.com.br/artigo/490/introducao-ao-jython.aspx>
+ <https://pt.wikipedia.org/wiki/Jython>
    


