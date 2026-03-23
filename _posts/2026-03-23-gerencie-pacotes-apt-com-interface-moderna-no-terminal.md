---
layout: post
title: "Gerencie pacotes APT com interface moderna no terminal"
date: 2026-03-23 11:09:49
image: '/assets/img/go/aptui.jpg'
description: "📦 Feito com Go que funciona como um frontend para o APT."
icon: 'ion:terminal-sharp'
iconname: 'Terminal Root'
tags:
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

O APTUI é uma [TUI (Terminal User Interface)](https://terminalroot.com.br/tags#tui) escrita em [Go](https://terminalroot.com.br/tags#go) que funciona como um frontend para o APT.

> A proposta é simples: **fazer tudo que você já faz com APT, mas sem sair da tela e sem ficar digitando comandos repetitivos**.

Principais recursos

* Filtro em tempo real enquanto você digita
* Busca fuzzy (não precisa nome exato)
* Fallback para `apt-cache search`


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

### Via Go

{% highlight bash %}
go install github.com/mexirica/aptui@latest
{% endhighlight %}

### Ou via APT (Debian/Ubuntu)
> (repositório próprio disponível no projeto)

Depois basta rodar:

{% highlight bash %}
aptui
{% endhighlight %}

---

Para mais informações acesse o [repositório](https://github.com/mexirica/aptui).


