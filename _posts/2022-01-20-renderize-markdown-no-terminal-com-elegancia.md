---
layout: post
title: "Renderize Markdown no terminal com elegância"
date: 2022-01-20 07:39:25
image: '/assets/img/go/glow.jpg'
description: 'Escrito em Go e com diversas opções de configuração.'
icon: 'ion:terminal-sharp'
iconname: 'Markdown'
tags:
- markdown
- go
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**Glow** é um leitor de arquivos [markdown](https://terminalroot.com.br/tags#markdown) baseado em terminal projetado desde o início para realçar a beleza - e o poder - do [CLI](https://terminalroot.com.br/tags#comandos).

Use-o para descobrir arquivos de remarcação, ler a documentação diretamente na linha de comando e armazenar arquivos de remarcação em sua própria coleção particular para que você possa lê-los em qualquer lugar.

A propósito, todos os dados armazenados são criptografados de ponta a ponta: somente você pode descriptografá-los.

---

# Instalação
Glow está disponível para diversos sistemas operacionais e [distribuições](https://terminalroot.com.br/tags#distros) [Linux](https://terminalroot.com.br/tags#linux), veja o procedimento de acordo com o seu caso:

{% highlight sh %}
# macOS or Linux
brew install glow

# macOS (with MacPorts)
sudo port install glow

# Arch Linux (btw)
yay -S glow

# Void Linux
xbps-install -S glow

# Nix
nix-env -iA nixpkgs.glow

# FreeBSD
pkg install glow

# Solus
eopkg install glow

# Windows (with Scoop)
scoop install glow

# Android (with termux)
pkg install glow
{% endhighlight %}

Se nenhuma das opções acima há seu sistema então compile utilizando o [Go](https://terminalroot.com.br/tags#go):
{% highlight sh %}
git clone https://github.com/charmbracelet/glow.git
cd glow
go build
sudo mv ~/go/bin/glow /usr/local/bin/
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
Para exibir um arquivo markdown basta passá-lo como parâmetro:
{% highlight sh %}
glow file.md
{% endhighlight %}

Se quiser paginar a saída use o parâmetro `-p`:
{% highlight sh %}
glow -p file.md
{% endhighlight %}

Se quiser visualizar com uma largura maior ou menor informe usando o `-w [num]`:
{% highlight sh %}
glow -w 150 file.md
{% endhighlight %}

Também é possível visualizar arquivos online:
{% highlight sh %}
glow https://host.tld/file.md
{% endhighlight %}

Para mais informações e dicas de utilização use o `glow help`, saída:
{% highlight sh %}
Render markdown on the CLI, with pizzazz!

Usage:
  glow [SOURCE|DIR] [flags]
  glow [command]

Available Commands:
  config      Edit the glow config file
  help        Help about any command
  stash       Stash a markdown

Flags:
  -a, --all             show system files and directories (TUI-mode only)
      --config string   config file (default /home/marcos/.config/glow/glow.yml)
  -h, --help            help for glow
  -l, --local           show local files only; no network (TUI-mode only)
  -p, --pager           display with pager
  -s, --style string    style name or JSON path (default "auto")
  -w, --width uint      word-wrap at width

Use "glow [command] --help" for more information about a command.
{% endhighlight %}

Para mais informações acesse o [repositório](https://github.com/charmbracelet/glow) do projeto.

