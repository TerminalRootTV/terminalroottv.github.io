---
layout: post
title: "Conheça esse Gerenciador para Múltiplos Servidores SSH"
date: 2026-07-07 10:25:49
image: '/assets/img/go/lazyssh.jpg'
description: "🔳 Escrito em Go."
icon: 'ion:terminal-sharp'
iconname: 'TUI'
tags:
- go
- tui
- ssh
- terminal
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Se você gerencia vários servidores via SSH, vale conhecer o **LazySSH**.

É um gerenciador [SSH](https://terminalroot.com.br/tags#ssh) em modo [terminal](https://terminalroot.com.br/tags#terminal) ([TUI](https://terminalroot.com.br/tags#tui)), inspirado em ferramentas como *lazydocker* e *k9s*, que facilita a navegação e o gerenciamento das entradas do `~/.ssh/config`.

+ Busca por alias, IP ou tags
+ Fixar servidores favoritos
+ Adicionar, editar e remover hosts pela interface
+ Ping para verificar disponibilidade
+ Conexão SSH com um único Enter
+ Ordenação e filtros
+ Preserva seu `~/.ssh/config`, criando backups automáticos antes de alterações


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

## Instalação

### Homebrew (macOS e Linux)
{% highlight bash %}
brew install lazyssh
{% endhighlight %}

### Compilando com Go (Linux, macOS e Windows)
Se você já tem o Go instalado:

{% highlight bash %}
git clone https://github.com/adembc/lazyssh.git
cd lazyssh
go build -o lazyssh ./cmd
{% endhighlight %}

Depois, opcionalmente, mova o binário para um diretório do `PATH`:
{% highlight bash %}
sudo mv lazyssh /usr/local/bin/
{% endhighlight %}

Ou instale diretamente com:
{% highlight bash %}
go install github.com/Adembc/lazyssh/cmd@latest
{% endhighlight %}

---

## Utilizando

Após a instalação:

{% highlight bash %}
lazyssh
{% endhighlight %}

O programa lê automaticamente o arquivo:

{% highlight text %}
~/.ssh/config
{% endhighlight %}

Portanto, basta ter seus hosts SSH configurados normalmente para começar a utilizá-lo.

---

Para mais informações acesse> [https://github.com/adembc/lazyssh](https://github.com/adembc/lazyssh)


