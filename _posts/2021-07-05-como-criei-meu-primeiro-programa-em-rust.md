---
layout: post
title: "Como Criei Meu Primeiro Programa em Rust"
date: 2021-07-05 18:51:46
image: '/assets/img/rust/rust-thumb.jpg'
description: 'Como aprender Rust, sobre o código que criei, quais prós e contra do Rust na minha opinião...Foram alguns dos temas discutidos nesse vídeo.'
icon: 'ion:terminal-sharp'
iconname: 'Rust'
tags:
- rust
---

![Como Criei Meu Primeiro Programa em Rust](/assets/img/rust/rust-thumb.jpg)

[Rust](https://terminalroot.com.br/tags#rust) é uma [linguagem de programação](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html) multiparadigma compilada desenvolvida pela Mozilla Research. É projetada para ser "segura, concorrente e prática", suportando os estilos puramente funcional, procedural e orientado a objetos.

Nesse vídeo discutimos qual a melhor forma de aprender Rust . Fizemos uma breve análise do pequeno código que criei. O que eu achei dessa pequena experiência e os PRÓS e CONTRA que eu deparei com o Rust. Além de dicas de como programar em Rust.

# Assista ao Vídeo
<iframe width="910" height="390" src="https://www.youtube.com/embed/SDtFO6ZZtMk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Códigos para o programinha criado

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


# Instalação
Certifique-se primeiramente que possui o Rust e o Cargo instalados, exemplo:
{% highlight bash %}
sudo apt install rustc cargo
{% endhighlight %}
Ou via <https://rustup.rs/>

Em seguida clone e construa o binário:
{% highlight bash %}
git clone https://github.com/terroo/loterust
cd loterust
cargo build
{% endhighlight %}

Se quiser instalar para seu usuário, proceda com os comandos:
{% highlight bash %}
mkdir -p ~/.cargo/bin
echo 'export PATH="${PATH}:${HOME}/.cargo/bin"' >> ~/.bashrc
exec $SHELL
mv ./target/debug/loterust ~/.cargo/bin/
{% endhighlight %}

Para obter informações de uso:
{% highlight bash %}
loterust help
{% endhighlight %}

> Isso é só um exercício, fique à vontade para usá-lo para seus estudos com **Rust**.



