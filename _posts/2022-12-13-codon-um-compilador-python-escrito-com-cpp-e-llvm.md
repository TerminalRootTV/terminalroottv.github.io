---
layout: post
title: "Codon, um Compilador Python escrito com C++ e LLVM"
date: 2022-12-13 09:17:21
image: '/assets/img/python/codon.jpg'
description: 'Alto desempenho e nenhum tipo de sobrecarga! Em um teste que eu fiz, o ganho de desempenho foi maior que 600%.'
icon: 'ion:terminal-sharp'
iconname: 'Python'
tags:
- python
- cpp
- llvm
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**Codon** é um compilador [Python](https://terminalroot.com.br/tags#python) de alto desempenho que compila código Python para código de máquina nativo sem qualquer sobrecarga de tempo de execução.

O compilador foi escrito com [C++](https://terminalroot.com.br/cpp) e utiliza [LLVM](https://terminalroot.com.br/tags#llvm) como optimizador de código Assembly final. Ao contrário do Python, o Codon suporta multithreading nativo, o que pode levar a acelerações ainda maiores. 

---

# Instalação
Você pode compilar o Codon na sua máquina, no entanto, existem binários pré-compilados para [Linux](https://terminalroot.com.br/tags#linux) e [macOS](https://terminalroot.com.br/tags#macos).

No caso do Linux basta rodar esse comando abaixo:
> É necessário possuir o [cURL](https://terminalroot.com.br/2019/10/12-dicas-para-voce-usar-o-comando-curl-como-um-ninja.html) instalado.

{% highlight bash %}
/bin/bash -c "$(curl -fsSL https://exaloop.io/install.sh)"
{% endhighlight %}

Ao final da instalação ele pedirá para você confirmar a adição do binário à sua variável `$PATH`, tecle `y` para sim. Se não funcionar, mesmo abrindo em um novo terminal, como ele mesmo orienta, rode os seguintes  comandos:
{% highlight bash %}
echo 'export PATH=${HOME}/.codon/bin:${PATH}' >> ~/.bashrc
exec $SHELL
{% endhighlight %}

Para testar rode:
{% highlight bash %}
codon --version
{% endhighlight %}


<!-- SQUARE - GAMES ROOT -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# Utilização
Suponhamos que você possua esse código [Python](https://terminalroot.com.br/tags#python) que é uma função *Fibonacci*, você pode interpretar o código com o próprio Codon:
{% highlight bash %}
codon run fib.py
{% endhighlight %}

No entanto, o desempenho não será muito bom. O correto mesmo é você compilar esse código para um binário e então rodar o binário, exemplo:
{% highlight bash %}
codon build -release -exe fib.py
./fib
{% endhighlight %}

Você ainda pode compilar com optimização do [LLVM](https://terminalroot.com.br/tags#llvm)
{% highlight bash %}
codon build -release -llvm fib.py
./fib
{% endhighlight %}

---

# Analisando o desempenho
Quando utilizamos um `loop for` com 1 milhão de ciclos em Python, como fizemos [nesse vídeo](https://www.youtube.com/watch?v=spLIBqiv2Og), o Codon foi cerca de 600% mais veloz que o interpretador nativo(versão `3.10.9`).
> O arquivo/código de teste pode ser obtido [aqui](https://github.com/terroo/langs-test-loop/blob/main/round1/main.py).

### Resultado usando `/usr/bin/python`
{% highlight bash %}
time python main.py 
1000000Ok
real	0m6,264s
user	0m3,530s
sys     0m2,415s
{% endhighlight %}
Ou seja, execução real: **mais de 6 segundos**. 😞 

### Resultado usando `codon`
{% highlight bash %}
codon build -release -exe main.py
time ./main
1000000Ok
real	0m0,795s
user	0m0,254s
sys     0m0,063s
{% endhighlight %}

Execução real: **em menos de 1 segundo!!!** 😲

---

<!-- RECTANGLE LARGE -->
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

# Links úteis
+ [Repositório oficial do Codon](https://github.com/exaloop/codon)
+ [Documentação do Codon](https://docs.exaloop.io/codon/)
+ [Para construir/compilar o Codon do zero](https://docs.exaloop.io/codon/advanced/build)

