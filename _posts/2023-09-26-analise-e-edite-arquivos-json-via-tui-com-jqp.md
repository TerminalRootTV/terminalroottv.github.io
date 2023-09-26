---
layout: post
title: "Analise e edite arquivos JSON via TUI com jqp"
date: 2023-09-26 11:53:05
image: '/assets/img/go/jqp.jpg'
description: 'Feito com Golang!'
icon: 'ion:terminal-sharp'
iconname: 'Go/JSON'
tags:
- go
- tui
- json
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**jpq** é um utilitário [TUI](https://terminalroot.com.br/tags#tui), escrito em [Golang](https://terminalroot.com.br/tags#go) para editar e visualizar arquivos [JSON](https://terminalroot.com.br/tags#json), em resumo é um TUI para o comando [jq](https://jqlang.github.io/jq/).

Nós já publicamo um utilitário similar escrito em [C++](https://terminalroot.com.br/tags#cpp), caso tenha interesse em também conhecê-lo, [clique aqui](https://terminalroot.com.br/2022/01/visualize-json-de-forma-interativa-pelo-terminal.html) para saber mais!

# Instalação
Antes de qualquer coisa você precisará do [Go](https://go.dev/) instalado no seu sistema.

Você pode instalar usando alguns gerenciadores de pacotes para alguns sistemas operacionais, tais como:
{% highlight bash %}
brew install noahgorstein/tap/jqp // Homebrew
sudo port install jqp // Ports
yay -S jqp-bin // AUR
{% endhighlight %}

Mas, independente do sistema operacional você pode clonar, construir e instalar, para isso rode os comandos abaixo:
{% highlight bash %}
git clone https://github.com/noahgorstein/jqp
cd jqp/
go build
mkdir -p ~/.local/bin
cp ./jqp ~/.local/bin/
echo 'export PATH="${PATH}:${HOME}/.local/bin"'
exec shell
cd ..
rm -rf jqp/
{% endhighlight %}
> Depois é bom remover o repositório baixado: `cd .. && rm -rf jqp` e também a pasta `go/` que será criada: `rm -rf go/`.


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
O uso do **jqp** é bem simples basta rodar o comando `jqp` usar o parâmetro `-f` ou `--file` e indicar o arquivo JSON como argumento, exemplo:

> `example.json`
{% highlight json %}
{
  "name":"John", 
  "age":30, 
  "car":null
}
{% endhighlight %}

Abrindo o arquivo com **jqp**:
{% highlight bash %}
jqp -f example.json
{% endhighlight %}

---

Para mais informações use a ajuda:
{% highlight bash %}
jqp --help
{% endhighlight %}
E acesse o repositório: <https://github.com/noahgorstein/jqp>.


