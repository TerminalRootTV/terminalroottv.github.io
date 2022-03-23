---
layout: post
title: "Conheça o RustPython, um Python escrito em Rust"
date: 2022-03-16 13:27:36
image: '/assets/img/rust/rustpython.jpg'
description: 'É o Rust reinventando todas as rodas possíveis!'
icon: 'ion:terminal-sharp'
iconname: 'Rust/Python'
tags:
- rust
- python
- programacao
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Com essa conversa de *memória segura* os programadores [Rust](https://terminalroot.com.br/tags#rust) estão reinventando todas as rodas possíveis!

Agora é a vez do [Python](https://terminalroot.com.br/tags#python)! É a cobra caindo na boca do caranguejo! 😃 

Brincadeiras à parte, vamos ver como instalar esse projeto!

---

# Instalação

Certifique de antes já possuir o [Rust](https://terminalroot.com.br/tags#rust) e o [Cargo](https://rustup.rs/) instalados no seu sistema:
{% highlight sh %}
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
{% endhighlight %}

Para uma maneira mais fácil de instalar, adicione o diretório local `~/.cargo` à sua variável `$PATH`:
> Nesse caso para `.bashrc`
{% highlight sh %}
echo 'export PATH="${PATH}:${HOME}/.cargo/bin"' >> ~/.bashrc
source ~/.bashrc
exec $SHELL
{% endhighlight %}

Agora, para instalar basta rodar esse comando abaixo:
{% highlight sh %}
cargo install --git https://github.com/RustPython/RustPython
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

O RustPython já estará automaticamente disponível na sua [Shell](https://terminalroot.com.br/shell) e então basta testá-lo:

{% highlight sh %}
rustpython --version
{% endhighlight %}

Teste um script de [Python](https://terminalroot.com.br/tags#python), exemplo:

> `vim script.py`
{% highlight python %}
def terminalroot():
    var = "Olá, eu sou o Python escrito em Rust"
    print(var)

terminalroot()
{% endhighlight %}

E rode:
{% highlight sh %}
rustpython script.py
{% endhighlight %}
> Provável saída: `Olá, eu sou o Python escrito em Rust`

Você também pode executá-lo em um subshell:
{% highlight sh %}
user@host ~ $ rustpython 
Welcome to the magnificent Rust Python 0.1.2 interpreter 😱 🖖
>>>>> print("Rodando na subshell!")
Rodando na subshell!
>>>>> exit()
user@host ~ $ 
{% endhighlight %}

Para mais informações acesse o [repositório do RustPython](https://github.com/RustPython/RustPython) .

<!--
O caranguejo com a conversinha da memória segura, agora quer enrolar a cobra! huahauhua
-->

