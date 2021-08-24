---
layout: post
title: "Conheça o LunarVim - Outra distro Neovim"
date: 2021-08-24 00:40:31
image: '/assets/img/neovim/lunarvim.jpg'
description: 'Mais uma customização para o Neovim com plugins escritos em Lua.'
icon: 'ion:terminal-sharp'
iconname: 'Neovim'
tags:
- neovim
- vim
- lua
---

![Conheça o LunarVim - Outra distro Neovim](/assets/img/neovim/lunarvim.jpg)

LunarVim é mais uma opção para você configurar seu [Neovim](https://terminalroot.com.br/tags#neovim) de forma automática, é extensível e rápida. O LunarVim aproveita os recursos mais recentes do Neovim, como o suporte para [Treesitter](https://tree-sitter.github.io/tree-sitter/) e [Language Server Protocol](https://en.wikipedia.org/wiki/Language_Server_Protocol).

Os recursos incluem autocomplete, terminal integrado, explorador de arquivos, localizador fuzzy, LSP, linting, formatação e depuração.

# Instalação
A instalação também é automática basta utilizar um dos comandos abaixo, há três opções:
### Versão *Stable*:
> Sem avisos e sem informações adicionais.
{% highlight bash %}
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
{% endhighlight %}

### Versão *Rolling*:
> Versão em desenvolvimento mas com novos recursos.
{% highlight bash %}
LVBRANCH=rolling bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/rolling/utils/installer/install.sh)
{% endhighlight %}

Ou simplesmente:
> *É necessário possuir o Neovim 0.5 ou superior*
{% highlight bash %}
bash <(curl -s https://raw.githubusercontent.com/lunarvim/LunarVim/rolling/utils/bin/install-latest-neovim)
{% endhighlight %}


<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


Após instalação rode o comando `lvim` e em seguida: `:PackerInstall`

## Utilização
Para habilitar o syntax highlight, rode:
{% highlight viml %}
:TSInstall <TAB>
{% endhighlight %}

Para instalar o LSP:
{% highlight viml %}
:LspInstall <TAB>
{% endhighlight %}

Para criar o arquivo de configuração do LSP:
{% highlight viml %}
:NlspConfig <TAB>
:NlspConfig <NOME_DO_SERVIDOR_DE_LINGUAGEM>
{% endhighlight %}

Para que os ícones sejam exibidos corretamente instale as [Nerd Fonts](https://www.nerdfonts.com/).

Para mais informações acesse o [repositório do LunarVim](https://github.com/LunarVim/LunarVim).

## Alguns screenshots do LunarVim
![LunarVim 1](/assets/img/neovim/lunarvim-1.jpg)


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

![LunarVim 2](/assets/img/neovim/lunarvim-2.jpg)

---

Por que o título tem o termo **Outra opção** ?

Porque já publicamos um vídeo sobre o [NvChad](https://terminalroot.com.br/2021/08/customize-seu-neovim-com-a-linguagem-de-programacao-lua.html) que também é um distribuição Neovim, caso você se interesse em também conhecer, assista abaixo:

<iframe width="900" height="380" src="https://www.youtube.com/embed/ylY1ngUhFMI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

