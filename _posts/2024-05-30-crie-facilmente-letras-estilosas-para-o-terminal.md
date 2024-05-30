---
layout: post
title: "Crie facilmente Letras estilosas para o Terminal"
date: 2024-05-30 00:17:00
image: '/assets/img/go/tdfgo.jpg'
description: "🏓 Um aplicativo via linha de comando feito com Golang"
icon: 'ion:terminal-sharp'
iconname: 'Golang'
tags:
- go
- tui
- comandos
- terminal
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**tdfgo**, iniciais para "**T**he**D**raw **F**ont renderer in **Go**", ou seja, é um: Renderizador de fontes estilosas no [terminal](https://terminalroot.com.br/tags#terminal) feito com a linguagem de programação: [Go](https://terminalroot.com.br/tags#go)

Este utilitário foi inspirado no utilitário CLI [tdfiglet](https://terminalroot.com.br/2015/03/como-gerar-desenhos-de-nomes-pelo.html). 


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
Para instalar precisa ter a linguagem [Go](https://terminalroot.com.br/tags#go) instalada no seu sistema e o [Git](https://terminalroot.com.br/tags#git).

Após isso basta clonar e compilar com os comandos abaixo:

{% highlight bash %}
git clone https://github.com/digitallyserviced/tdfgo.git
cd tdfgo
go build
{% endhighlight %}

Assim que terminar haverá um binário no mesmo diretório que você compilou. Se quiser testar todas as fontes com o texto que você escolher, exemplo a *palavra/frase*: "**Terminal Root**", rode:

{% highlight bash %}
./tdfgo/tdfgo fonts -vp -t "Terminal Root" | less
{% endhighlight %}
> O `less` é para paginar, pois são muitas fontes e estilos. Vá pressionando [Enter] para ir exibindo uma de cada vez!

Se quiser instalar no seu sistema para usar o comando `tdfgo`, rode:
> Ainda dentro do diretório que você compilou.

{% highlight bash %}
sudo install -v tdfgo /usr/local/bin/
{% endhighlight %}

Já pode remover o repositório clonado e também remova a pasta `go/` que foi criada automaticamente no seu diretório pessoal(com `sudo` ou `root`):

{% highlight bash %}
cd ..
rm -rf tdfgo/
sudo rm -rf go/
{% endhighlight %}

---

Para mais informações use o `help`:

{% highlight bash %}
tdfgo --help
{% endhighlight %}

E acesse o endereço do [repositório no GitHub](https://github.com/digitallyserviced/tdfgo).

