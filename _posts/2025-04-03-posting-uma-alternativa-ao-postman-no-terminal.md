---
layout: post
title: "Posting: Uma Alternativa ao Postman no Terminal"
date: 2025-04-03 18:49:51
image: '/assets/img/python/posting.jpg'
description: "Útil para desenvolvedores que preferem agilidade e simplicidade, mantendo a flexibilidade necessária para interagir com APIs e serviços web."
icon: 'ion:terminal-sharp'
iconname: 'Utilitários'
tags:
- web
- python
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')


---

O **Posting** é uma ferramenta de [linha de comando](https://terminalroot.com.br/tags#comandos) para realizar requisições *HTTP*, sendo uma alternativa leve ao [Postman](https://terminalroot.com.br/2021/02/como-instalar-o-postman-no-ubuntu-e-em-qualquer-distro-linux.html). Ele permite enviar requisições de maneira intuitiva, sem necessidade de interface gráfica, tornando-se ideal para desenvolvedores que preferem trabalhar diretamente no terminal.


<!-- SQUARE - GAMES ROOT -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

--

## Instalação
A instalação do Posting é simples e pode ser feita em diferentes sistemas operacionais:

### [Windows](https://terminalroot.com.br/tags#windows)
Certifique-se de ter o [Python 3](https://terminalroot.com.br/tags#python) instalado. No terminal (cmd ou [PowerShell](https://terminalroot.com.br/tags#powershell)), execute:
{% highlight sh %}
pip install posting
{% endhighlight %}

### [macOS](https://terminalroot.com.br/tags#macos)
Instale pelo [Homebrew](https://terminalroot.com.br/2021/07/homebrew-o-gerenciador-de-pacotes-do-macos-no-gnu-linux.html):
{% highlight sh %}
brew install posting
{% endhighlight %}

### [Ubuntu](https://terminalroot.com.br/tags#ubuntu)
1. Instale com o gerenciador `pip`:
{% highlight sh %}
pip install posting
{% endhighlight %}

Confirme a instalação:
> No [sistema operacional](https://terminalroot.com.br/tags#so) que você instalou

{% highlight sh %}
posting --help
{% endhighlight %}

---

## Exemplo de Uso
Após a instalação, o Posting pode ser usado para fazer requisições HTTP rapidamente.

### Realizando uma requisição GET
{% highlight sh %}
posting get https://jsonplaceholder.typicode.com/posts/1
{% endhighlight %}

### Enviando uma requisição POST com [JSON](https://terminalroot.com.br/tags#json)
{% highlight sh %}
posting post https://jsonplaceholder.typicode.com/posts -d '{"title": "foo", "body": "bar", "userId": 1}' -H "Content-Type: application/json"
{% endhighlight %}

### Adicionando cabeçalhos personalizados
{% highlight sh %}
posting get https://api.example.com/data -H "Authorization: Bearer SEU_TOKEN"
{% endhighlight %}

---

O Posting é uma ferramenta eficiente para realizar requisições HTTP diretamente do terminal, dispensando interfaces gráficas pesadas. 

Para mais informações acesse o [repositório oficial](https://github.com/darrenburns/posting)

