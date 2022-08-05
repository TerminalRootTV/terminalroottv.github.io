---
layout: post
title: "RhaiScript, Uma linguagem de script"
date: 2022-02-25 13:32:37
image: '/assets/img/rust/rhai.jpg'
description: 'Oferece uma maneira segura e fácil de adicionar scripts a qualquer aplicativo.'
icon: 'ion:terminal-sharp'
iconname: 'Script'
tags:
- programacao
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Rhai é simples e semelhante a JavaScript+Rust com tipagem dinâmica. De acordo com testes realizados se mostrouser bastante eficiente obtendo 1 milhão de iterações em 0,3 segundos em uma VM Linux de 2,3 GHz de núcleo único.

Possui forte integração com funções e tipos nativos do Rust, incluindo getters/setters, métodos e indexadores.

---

# Instalação
Você precisará antes das seguintes dependências:
+ [Git](https://terminalroot.com.br/tags#git)
+ [Rust](https://terminalroot.com.br/tags#rust)
+ [Cargo](https://rustup.rs/)

Após isso, proceda da seguinte forma:

Clone o repositório:
{% highlight sh %}
git clone https://github.com/rhaiscript/rhai
{% endhighlight %}

Entre no repositório e construa:
> Antes disso certifique-se possuir o `cargo` na sua `$PATH`, exemplo para [Bash](https://terminalroot.com.br/tags#bash): 
{% highlight sh %}
echo 'export PATH="${PATH}:${HOME}/.cargo/bin"' >> ~/.bashrc
source ~/.bashrc
exec $SHELL
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

E então rode:
{% highlight sh %}
cd rhai
cargo install --path . --bin rhai-run
{% endhighlight %}

Após isso você já pode sair e remover o diretório:
{% highlight sh %}
cd ..
rm -rf rhai
{% endhighlight %}

---

# Olá, RhaiScript!
Para testar um [Hello. World!](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html) crie um arquivo de extensão `.rhai`, exemplo: `vim hello.rhai`

E adicione o código abaixo:
{% highlight rs %}
print("Olá, Rhai!");
{% endhighlight %}

Para rodar use o comando `rhai-run`:
{% highlight sh %}
rhai-run hello.rhai
{% endhighlight %}

Para mais informações acesse [aqui](https://rhai.rs/book) .

---

# Links Úteis
+ [Página Oficial](https://rhai.rs/)
+ [Repositório no GitHub](https://github.com/rhaiscript/rhai)
+ [Documentação](https://rhai.rs/book)

