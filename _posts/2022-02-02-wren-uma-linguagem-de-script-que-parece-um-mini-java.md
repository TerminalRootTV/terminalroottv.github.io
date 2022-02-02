---
layout: post
title: "Wren, uma linguagem de script que parece um mini Java"
date: 2022-02-02 09:25:13
image: '/assets/img/java/wren.jpg'
description: 'Concorrente, pequena, rápida e baseada em classes .'
icon: 'ion:terminal-sharp'
iconname: 'Programação'
tags:
- programacao
- desenvolvimento
- linguagens
- java
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**Wren** é uma linguagem de script concorrente pequena, rápida e baseada em classes .

Pense em [Smalltalk](https://www.gnu.org/software/smalltalk/) em um pacote do tamanho de [Lua](https://terminalroot.com.br/lua) com uma pitada de [Erlang](https://www.erlang.org/) e envolvido em uma sintaxe familiar e moderna, então, essa é Wren!

---

# Instalação
Wren está disponível para [Linux](https://terminalroot.com.br/tags#linux), [Windows](https://terminalroot.com.br/tags#windows) e [macOS](https://terminalroot.com.br/tags#macos) .

Você precisará do [Git](https://terminalroot.com.br/tags#git), do [GCC](https://terminalroot.com.br/tags#gcc) e do [Make](https://terminalroot.com.br/tags#make).

Após clonar o diretório de construção ficará em: `./wren/projects`, haverá procedimento para seu sistema operacional e IDE, exemplo no Linux:
{% highlight sh %}
git clone https://github.com/wren-lang/wren
cd wren/projects/make
make
{% endhighlight %}
O binário ficará na raiz do projeto e dentro do diretório `bin/` e com o nome `wren_test` , então você pode movê-lo para sua variável `$PATH`, exemplo:
{% highlight sh %}
sudo mv wren/wren_test /usr/local/bin/wren 
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
Wren não possui `version` nem `help`, mas para testar se está tudo certo, crie um arquivo de qualquer extensão, exemplo: `hello.wren` e insira o código abaixo:
{% highlight java %}
System.print("Hello, world!")
{% endhighlight %}

E rode com o `wren`:
{% highlight sh %}
wren hello.wren
{% endhighlight %}

Se imprimir o **Hello, world!** é porque está tudo certo.

Para mais informações acesse os links abaixo:
+ [Site oficial](https://wren.io/)
+ [Repositório](https://github.com/wren-lang/wren)



