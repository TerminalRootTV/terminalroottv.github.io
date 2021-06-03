---
layout: post
title: "Conheça o Helix, um editor escrito em Rust estilo Vim"
date: 2021-06-03 12:20:34
image: '/assets/img/'
description: 'Mais pra conta do Rust!'
icon: 'ion:terminal-sharp'
iconname: 'Rust'
tags:
- rust
- vim
---

![Conheça o Helix, um editor escrito em Rust estilo Vim](/assets/img/rust/helix.jpg)

O mundo [Rust](https://terminalroot.com.br/tags#rust) está cada vez mais se ampliando. Estamos sempre trazendo novidades desse mundo, tais como esse vídeo:
+ [Redox OS - Um sistema escrito em Rust - Instalação e Conceitos](https://www.youtube.com/watch?v=7yZb3HLU1tU)

Também publicamos sobre o [GVim](https://terminalroot.com.br/2021/04/gnvim-um-neovim-grafico-escrito-em-rust.html) também *vim-style*.

E entre outros softwares escritos nessa baita linguagem de programação que podem ser consultados [aqui](https://terminalroot.com.br/tags#rust) .

Mas hoje vamos conhecer um editor bem bacana escrito em Rust: **Helix** .

---

# Introdução
**Helix** é um editor de texto fortemente baseado em [Kakoune](https://kakoune.org/) que por sua vez é baseado no [Vim](https://terminalroot.com.br/vim) assim como [NeoVim](https://terminalroot.com.br/tags/#neovim).

Ele utiliza:
+ [Tree-sitter](https://github.com/tree-sitter/tree-sitter) em vez de [Regex](https://terminalroot.com.br/regex) direta para fazer Syntax-Highlight .
+ A documentação ainda está em desenvolvimento, mas já possui um conceito objetivo e bem detalhado.
+ Roda diretamente no [terminal](http://terminalroot.com.br/tags/#terminal) através do comando `hx`.
+ Não utiliza [ElectronJs](https://terminalroot.com.br/2019/11/conheca-e-instale-o-veonim-um-editor-baseado-no-vim-e-neovim.html), [JavaScript](https://terminalroot.com.br/2021/05/instale-o-vieb-um-navegador-minimalista-estilo-vim.html) e nem [Vimscript](https://terminalroot.com.br/vim).

# Instalação
Para instalar o Helix, logicamente você vai precisar do [Rust](https://www.rust-lang.org/) e do [Cargo](https://doc.rust-lang.org/cargo/index.html), além de possuir o [Git](https://terminalroot.com.br/git) . A maneira mais recomendada de instalar o Rust e Cargo é via [Curl](https://terminalroot.com.br/2019/10/12-dicas-para-voce-usar-o-comando-curl-como-um-ninja.html)

Se você utiliza [Ubuntu](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=ubuntu), [Debian](https://terminalroot.com.br/tags#debian), [Linux Mint](https://terminalroot.com.br/tags#mint) ou derivados, instale o Git e o Curl com esse comando:
{% highlight bash %}
sydo apt install git curl
{% endhighlight %}
> Para outras [distros](https://terminalroot.com.br/tags#distros) utilize o gerenciador de pacotes da sua distro com o mesmo nome de pacote.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Você ainda pode usar seu próprio gerenciador de pacotes para instalar o Rust e o Cargo, exemplo:
{% highlight bash %}
sudo apt install rustc cargo
{% endhighlight %}

Mas a maneira mais recomendada(pela a equipe do Rust e Cargo) é usando o comando abaixo:
{% highlight bash %}
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
{% endhighlight %}
> Não esqueça de incluir o cargo para sua `$PATH` com o comando: `echo 'export PATH="${PATH}:${HOME}/.cargo/bin"' >> ~/.bashrc && exec $SHELL`.

Após devidamente instaladas as dependências, basta clonar e compilar o Helix com os comandos abaixo:
{% highlight bash %}
git clone --recurse-submodules --shallow-submodules -j8 https://github.com/helix-editor/helix
cd helix
cargo install --path helix-term
{% endhighlight %}

Após compilado, o comando `hx` já estará disponível(se você incluiu ele à sua `$PATH` como dito acima).

# Utilização
Alguns comandos do Helix:

### Básicos
+ `hx --help` - Exibe a ajuda
+ `hx` - Abre o editor sem arquivos para editar
+ `hx [arquivo]` - Abre com um arquivo específico

### Modo comando
O Helix não utiliza as teclas direcionais, logo, para movimentar o cursor utilize as teclas: h, j, k e l. Que são justamente os movimentos:
{% highlight bash %}
  k
h   l
  j  
{% endhighlight %}

+ `:w` ou `:write` salva um arquivo
+ `:q` ou `:quit` sai do editor

Além de diversos outros comandos e teclas de atalho que podem ser consultadas na [documentação](https://docs.helix-editor.com/keymap.html)

Veja abaixo um vídeo demonstrativo do [Helix](https://helix-editor.com/)

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

---

<iframe style="background: transparent; border:none;" width="910" height="390" src="/assets/img/rust/helix.mp4" frameborder="-1" allowfullscreen></iframe>

Página Oficial do Helix: <https://helix-editor.com/>.


