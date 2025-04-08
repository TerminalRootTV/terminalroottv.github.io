---
layout: post
title: "Liste pastas com ícones com esse Go CLI"
date: 2025-04-08 10:04:06
image: '/assets/img/go/gtree.jpg'
description: "🚀 Mais aplicativo interessante feito em Go."
icon: 'ion:terminal-sharp'
iconname: 'Go/CLI'
tags:
- go
- cli
- comando
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

[gtree](https://github.com/kitagry/gtree) é um comando similar ao comando `tree` que funciona em qualquer [sistema operacional](https://terminalroot.com.br/tags#so), escrito em [Go](https://terminalroot.com.br/tags#go) e que [exibe os ícones do arquivos](https://terminalroot.com.br/2022/04/instale-um-ls-que-mostra-icones-dos-arquivos.html).

---

## Instalação
Primeiramente você precisa possuir a linguagem de programação [Go](https://terminalroot.com.br/tags#series-go) instalada no seu sistema, exemplos de como instalar Go:

[Windows](https://terminalroot.com.br/tags#windows)(com [WinGet](https://winget.run/pkg/GoLang/Go.1.19) no [PowerShell](https://terminalroot.com.br/tags#powershell)):
{% highlight powershell %}
winget install -e --id GoLang.Go.1.19
{% endhighlight %}

[macOS](https://terminalroot.com.br/tags#macos)(com [Brew](https://formulae.brew.sh/formula/go)):
{% highlight bash %}
brew install go
{% endhighlight %}

[Ubuntu](https://terminalroot.com.br/tags#ubuntu)(com APT):
{% highlight bash %}
sudo apt install golang-go
{% endhighlight %}

### Instale também as [Fonts Terminal Root](https://github.com/terroo/fonts) para que os ícones sejam exibidos corretamente.


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

Agora é só clonar o repositório e rodar os comandos abaixo:
{% highlight bash %}
git clone https://github.com/kitagry/gtree
cd gtree
go get github.com/kitagry/gtree
go build .
{% endhighlight %}

E mover para uma pasta do seu sistema, exemplo:
> Exemplo em sistemas UNIX-like.

{% highlight bash %}
sudo install -v gtree /usr/local/bin/
{% endhighlight %}
> É legal remover os arquivos e pastas feitos para construir, exemplo:
{% highlight bash %}
cd ..
rm -rf gtree/
sudo rm -rf go/
{% endhighlight %}

E teste:
{% highlight bash %}
gtree --version
gtree .
{% endhighlight %}

**DICA IMPORTANTE:** Evite usar o barra final, exemplo:
Em vez de:
{% highlight bash %}
gtree mydir/
{% endhighlight %}

Use assim:
{% highlight bash %}
gtree mydir
{% endhighlight %}

Ele não exibe os arquivos das pastas quando há um barra`/` no final.

Para mais informações acesse o [repositório no GitHub](https://github.com/kitagry/gtree) e use a ajuda: `gtree --help`.

---

## Veja também:
### [Instale um ls que mostra ícones dos arquivos](https://terminalroot.com.br/2022/04/instale-um-ls-que-mostra-icones-dos-arquivos.html) 
+ <https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/tree>
+ <https://en.wikipedia.org/wiki/Tree_(command)>
+ <https://github.com/kddnewton/tree>

