---
layout: post
title: "codi.vim: O bloco de notas interativo para hackers"
date: 2020-10-22 14:50:56
image: '/assets/img/vim/codi.png'
description: 'Resultado do código em tempo real'
icon: 'cib:vim'
iconname: 'editor de texto'
tags:
- vim
- editores
---

![codi.vim: O bloco de notas interativo para hackers](/assets/img/vim/codi.gif)

Codi é um bloco de notas interativo para [hackers](https://terminalroot.com.br/tags#hacker) . Ele abre um painel sincronizado com seu buffer principal que exibe em tempo real o resultado de cada linha conforme você digita (com [Vim ou NeoVim](https://terminalroot.com.br/vim/) ). É extensível a quase qualquer linguagem que forneça um [REPL (intérprete interativo)](https://en.m.wikipedia.org/wiki/Read-eval-print_loop)!

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Linguagens com suporte integrado: [Python](https://terminalroot.com.br/2019/12/as-30-melhores-bibliotecas-e-pacotes-python-para-iniciantes.html), [JavaScript](https://terminalroot.com.br/2020/09/aprenda-16-funcoes-de-arrays-javascript-com-gifs.html), CoffeeScript, Haskell, PureScript, [Ruby](https://terminalroot.com.br/2020/02/como-instalar-corretamente-o-ruby-bundler-e-jekyll-no-ubuntu-linux.html), OCaml, R, Clojure/ClojureScript, [PHP](https://terminalroot.com.br/php/), [Lua](https://terminalroot.com.br/2016/11/blog-linux-lua.html), [C++](https://terminalroot.com.br/cpp/), [Julia](https://terminalroot.com.br/2019/10/julia-vs-python-qual-e-a-melhor-para-a-ciencia-de-dados.html), Elm, Elixir, TypeScript, Mathjs, ...
> Observação: Não há suporte assíncrono, a avaliação será acionada ao segurar o cursor em vez de alterar o texto.

# Instalação
Para instalar use seu gerenciador de pacotes favoritos para o [Vim](https://terminalroot.com.br/vim/). Exemplo, utilizando o *Plug*:
{% highlight viml %}
Plug 'metakirby5/codi.vim'
{% endhighlight %}

# Utilização
+ `Codi [filetype]` ativa Codi para o buffer atual, usando o tipo de arquivo informado ou o tipo de arquivo do buffer.
+ `Codi!` desativa Codi para o buffer atual.
+ `Codi!! [filetype]` alterna Codi para o buffer atual, usando o tipo de arquivo informado ou o tipo de arquivo do buffer.

Uma boa forma de utilizar o `codi.vim` é adicionar essa função ao seu `~/.bashrc`
{% highlight bash %}
# Codi
# Usage: codi [filetype] [filename]
codi() {
  local syntax="${1:-python}"
  shift
  vim -c \
    "let g:startify_disable_at_vimenter = 1 |\
    set bt=nofile ls=0 noru nonu nornu |\
    hi ColorColumn ctermbg=NONE |\
    hi VertSplit ctermbg=NONE |\
    hi NonText ctermfg=0 |\
    Codi $syntax" "$@"
}
{% endhighlight %}

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Existem diversas opções de utilização do `codi.vim` , para mais informações consulte o help, exemplo: `:h codi-introduction-warnings`, `h codi-introduction-gotchas` e direto no [endereço oficial do projeto no GitHub](https://github.com/metakirby5/codi.vim) .


