---
layout: post
title: "Conheça o Bun, um JavaScript runtime que vem fazendo muito sucesso!"
date: 2023-08-31 20:37:36
image: '/assets/img/js/bun.jpg'
description: 'Feito com Zig e C++'
icon: 'ion:terminal-sharp'
iconname: 'JavaScript'
tags:
- zig
- javascript
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**Bun** é um runtime [JavaScript](https://terminalroot.com.br/tags#javascript), mais uma alternativa entre: [Nodejs](https://terminalroot.com.br/tags#nodejs), [QuickJS](https://terminalroot.com.br/2022/03/instale-o-quickjs-uma-alternativa-ao-nodejs-e-denojs.html), Deno e entre outros.

Apesar de ainda estar em desenvolvimento, Bun está fazendo muito sucesso devido à sua performance, aceleramento de fluxos e execução de códigos de produção mais simples em ambientes com recursos limitados, como funções sem servidor. 

Bun é um kit de ferramentas completo para aplicativos JavaScript e TypeScript. 

Ele foi escrito em [Zig](https://terminalroot.com.br/tags#cpp) e [C++](https://terminalroot.com.br/tags#cpp), reduzindo drasticamente o tempo de inicialização e o uso de memória.


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

# Instalação
Existem algumas formas de instalar, a mais comum é usar o [cURL](https://terminalroot.com.br/2019/10/12-dicas-para-voce-usar-o-comando-curl-como-um-ninja.html) e adicionar ao seu arquivo de configuração da [Shell](https://terminalroot.com.br/tags#shell), basta rodar os comandos abaixo:

{% highlight bash %}
curl -fsSL https://bun.sh/install | bash
echo 'alias bun="${HOME}/.bun/bin/bun"' >> ~/.bashrc
exec $SHELL
{% endhighlight %}

Para testar, basta criar um código básico `index.js`:
{% highlight js %}
console.log("Hello, Bun!")
{% endhighlight %}

E rodar:
{% highlight bash %}
bun index.js
{% endhighlight %}

Outras formas de instalar pode ser com [npm](https://terminalroot.com.br/tags#npm), [Homebrew](https://terminalroot.com.br/2021/07/homebrew-o-gerenciador-de-pacotes-do-macos-no-gnu-linux.html) ou [Docker](https://terminalroot.com.br/tags#docker):
{% highlight bash %}
# Com npm
npm install -g bun

# Com Homebrew
brew tap oven-sh/bun
brew install bun

# Com Docker
docker pull oven/bun
docker run --rm --init --ulimit memlock=-1:-1 oven/bun
{% endhighlight %}

---

Para mais recursos do Bun use o `bun --help`,  acesse o [repositório no GitHub](https://github.com/oven-sh/bun) ou o endereço na web: <https://bun.sh/>.



