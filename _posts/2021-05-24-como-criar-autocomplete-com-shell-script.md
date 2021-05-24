---
layout: post
title: "Como Criar AUTOCOMPLETE com SHELL SCRIPT"
date: 2021-05-24 06:30:32
image: '/assets/img/bash/autocomplete.jpg'
description: 'Autocomplete é uma das facilidades que ajuda e muito na agilidade do desenvolvimento no terminal.'
icon: 'ion:terminal-sharp'
iconname: 'Bash'
tags:
- bash
- shellscript
- terminal
---

![Como Criar AUTOCOMPLETE com SHELL SCRIPT](/assets/img/bash/autocomplete.jpg)

Autocomplete é uma das facilidades que ajuda e muito na agilidade do desenvolvimento no [terminal](http://terminalroot.com.br/tags/#terminal).

Nesse vídeo vamos ver de maneira fácil e simples como fazer isso com [Shell Script](https://terminalroot.com.br/shell)!

# Assista o Vídeo
<iframe width="910" height="390" src="https://www.youtube.com/embed/xkemkB3JO1M" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


# Código exemplo do autocomplete
{% highlight bash %}
nome_da_funcao(){                 
  local cur
  COMPREPLY=()   
  cur=${COMP_WORDS[COMP_CWORD]}
  
  case "$cur" in
    --*) COMPREPLY=( $( compgen -W 'PARÂMETROS' -- $cur ) );;
  esac

  return 0
}

complete -F nome_da_funcao -o filenames nome_do_comando
{% endhighlight %}

Diretórios onde salvar seus autocomplete:
{% highlight bash %}
/etc/bash_completion.d/
# Ou
/usr/share/bash-completion/completions/
{% endhighlight %}

Saiba mais sobre autocomplete:
### [Como Funciona o Auto Complete no Shell GNU/Linux](https://terminalroot.com.br/2019/09/como-funciona-o-auto-complete-no-shell-gnulinux.html)

# Aprenda Ferramentas para o Terminal
### Pacote promocional: <https://terminalroot.com.br/promo>

# Aprenda C++
### <https://terminalroot.com.br/cpp>


