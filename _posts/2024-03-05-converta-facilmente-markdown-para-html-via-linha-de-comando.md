---
layout: post
title: "Converta facilmente Markdown para HTML via linha de comando"
date: 2024-03-05 13:45:52
image: '/assets/img/markdown/md-to-html.jpg'
description: 'Um aplicativo CLI escrito com C++'
icon: 'ion:terminal-sharp'
iconname: 'Markdown/C++'
tags:
- markdown
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Para você que precisa perodiodicamente fazer conversões de [Markdown](https://terminalroot.com.br/tags#markdown) para [HTML](https://terminalroot.com.br/tags#html), há um aplicativo muito intuitivo e de fácil utilização para linha de comando, escrito em [C++](https://terminalroot.com.br/tags#cpp) que vai lhe ajudar.

O **Markdown-CLI** é Um analisador CLI markdown que converte facilmente Markdown em HTML rapidamente!

---

# Instalação
Para instalar basta usar o [Git](https://terminalroot.com.br/tags#git), um [compilador](https://terminalroot.com.br/tags#gcc) e o comando [make](https://terminalroot.com.br/tags#make), para isso rode:

{% highlight bash %}
git clone https://github.com/margual56/Markdown-CLI
cd Markdown-CLI/
make
sudo install -v bin/MarkdownCLI /usr/local/bin/markdown-cli
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
Para utilizar o Markdown-CLI é muito simples. Se ainda estiver no repositório clonado, basta usar o próprio exemplo `testing.md` para isso, exemplo:
{% highlight bash %}
bin/MarkdownCLI -i testing.md index.html
{% endhighlight %}

Agora é só abrir no navegador e ver o resultado:
> Em distros [GNU/LInux](https://terminalroot.com.br/tags#gnulinux)

{% highlight bash %}
gio open index.html 
{% endhighlight %}

Se você instalou no sistema, rode:
{% highlight bash %}
markdown-cli -i testing.md index.html
{% endhighlight %}

---

Para mais informações acesse o [repositório oficial no GitHub](https://github.com/margual56/Markdown-CLI)


