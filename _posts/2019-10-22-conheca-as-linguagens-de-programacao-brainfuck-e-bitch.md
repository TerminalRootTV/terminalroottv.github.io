---
layout: post
title: "Conheça as Linguagens de Programação: BRAINFUCK e BITCH"
date: 2019-10-22 10:09:53
image: '/assets/img/esolangs/brainfuck-e-bitch.jpg'
description: 'Possuem um PUTA CÓDIGO FODIDO!'
tags:
- brainfuck
- bitch
- esolang
- programacao
- desenvolvimento
- humor
---

[![BRAINFUCK e BITCH](/assets/img/esolangs/brainfuck-e-bitch.jpg)](/assets/img/esolangs/brainfuck-e-bitch.jpg)

Dia desse eu tava navegando na internet e procurando conteúdo de teste de compiladores e acabei encontrando algumas coisas um tanto *diferentes*, entre elas , encontrei algumas linguagens de programação bem estranhas .

Mais conhecidas como linguagens ESOTÉRICAS. 😱

## Introdução

Uma linguagem de programação esotérica (ess-oh-terr-ick), ou esolang , é uma linguagem de programação de computador projetada para experimentar idéias estranhas, difícil de programar ou como uma piada, e não para uso prático.

Existe uma comunidade pequena, mas ativa, na Internet, de pessoas que criam linguagens de programação esotéricas e escrevem programas nelas, além de debater suas propriedades computacionais (por exemplo, se essas linguagens estiverem completas em Turing ).

## [brainfuck](http://aminet.net/package.php?package=dev/lang/brainfuck-2.lha)

**brainfuck**, também conhecido como [brainf*ck*](https://esolangs.org/wiki/Brainfuck) ou BF, é uma linguagem de programação esotérica notada pelo seu extremo minimalismo, criada por Urban Müller, em 1993. Ela é uma linguagem Turing completa, desenhada para desafiar e confundir os programadores, e não é útil para uso prático. 

Pela sua simplicidade, o desenvolvimento de compiladores e interpretadores para essa linguagem é muito mais fácil do que para outras linguagens. O nome da linguagem é geralmente não-capitalizado (começa com uma letra minúscula), apesar de ser um substantivo próprio.

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

### Escrevendo um "Olá, Mundo!" em brainfuck

Primeiramente, crie um arquivo com extensão **.bf** : `vim ola-mundo.bf` e insira o seguinte conteúdo no arquivo:
> Esse é o **Olá, Mundo!**(famoso: Hello, World!) em brainfuck
{% highlight bash %}
++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.++++++
+..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>.
{% endhighlight %}

Agora nós precisamos possuir um interpretador para gerar a saída. Recomendo você instalar o [bff](https://github.com/apankrat/bff) , no [Gentoo](https://terminalroot.com.br/2017/05/como-instalar-o-gentoo.html) você pode instalar usando o [Portage](https://wiki.gentoo.org/wiki/Portage):
{% highlight bash %}
emerge bff
{% endhighlight %}

> Existem outros tais como: [beef](https://github.com/andreabolognani/beef), por exemplo. Se não me engano, esse está disponível para [Debian](https://terminalroot.com.br/2017/09/como-instalar-o-debian-remotamente-via-ssh.html), [Ubuntu](https://terminalroot.com.br/2018/10/como-instalar-o-funtoo-pelo-ubuntu-ou-linux-mint.html), [Linux Mint](https://terminalroot.com.br/2019/07/como-customizar-seu-linux-mint-com-i3-polybar-rofi.html) e entre outras distros, para instalar seria: `sudo apt install beef`.

Após instalar use o comando do interpretador para rodar, usando o bff:
{% highlight bash %}
bff ola-mundo.bf
{% endhighlight %}

O resultado será o esperado! 😀
[![brainfuck terminal output](/assets/img/esolangs/bitch.png)](/assets/img/esolangs/bitch.png)

Para mais informações, consulte o site deles: <http://aminet.net/package.php?package=dev/lang/brainfuck-2.lha>

## [Bitch](https://github.com/Helen0903/bitch)

A linguagem [Bitch](https://github.com/Helen0903/bitch) foi criada por Helen 0903 . O nome do BITCHWISE é um portmanteau entre "cadela" e "bit a bit". Ele se origina da palavra "bit a bit", como significando "operações bit a bit" - as únicas operações matemáticas disponíveis nos dois idiomas.

O uso da "puta" palavrão em "BITCHWISE" é transmitir raiva de maneira brusca e rude. Eles se combinam para ajudar a transmitir a combinação de dificuldade e design esotérico no idioma.

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

### Escrevendo um "Olá, Mundo!" em Bitch

A proposta da Bitch é um pouco diferente , ela usa o compilador do [Java](https://terminalroot.com.br/2019/10/jython-a-linguagem-que-mistura-java-com-python.html) juntamente com um interpretador. Então, para criar e gerar o **Olá, Mundo!** crie um arquivo **.bitch**:
{% highlight bash %}
vim ola-mundo.bitch
{% endhighlight %}

E insira esse conteúdo dentro:
{% highlight bash %}
#72/#101/#108/#108/#111/#44/#32/#119/#111/#114/#108/#100/#33/
{% endhighlight %}

Agora vamos tranformar essa *bagaça* . Para usar o compilador, siga esses comandos:
{% highlight bash %}
git clone https://github.com/Helen0903/bitch
cd bitch/
javac bitch.java
java bitch -c ola-mundo.bitch
{% endhighlight %}

Veja imagem abaixo:
> Lógico que você precisará do JDK e do Git.

[![bitch terminal output](/assets/img/esolangs/brainfuck.png)](/assets/img/esolangs/brainfuck.png)

Se quiser testar online use o [tio.sh](https://tio.run/#bitch), e lembre-se de adicionar o parâmetro `-c`, assim:
+ **Command-line options** → **✚ add** → **-c**. Depois é só clicar no **play ▶️**  na parte superior.

————————— ◆ —————————

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

## Conclusão

Esse assunto realmente não é para todo mundo, é mais pra quem gosta de saber o "*debaixo dos panos*" . Está muito além de um emprego de com salário de 1.200 reais para programar em uma linguagem de programação famosa! ☺️  . Se você curte esses assuntos, recomendo você visitar o site: <https://esoteric.codes/>, tem muita coisa bacana lá! 😯

Abraços!
    
