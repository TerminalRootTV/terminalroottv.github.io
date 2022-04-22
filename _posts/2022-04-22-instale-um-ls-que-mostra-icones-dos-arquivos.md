---
layout: post
title: "Instale um ls que mostra ícones dos arquivos"
date: 2022-04-22 09:20:22
image: '/assets/img/go/logo-ls.jpg'
description: 'Escrito em Golang.'
icon: 'ion:terminal-sharp'
iconname: 'Comandos'
tags:
- go
- comandos
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Existem diversas alternativas ao comando `ls` algumas delas você pode encontrar [nesse artigo](https://terminalroot.com.br/2021/08/uma-lista-com-30-alternativas-modernas-para-os-comandos-do-unix.html) .

E hoje vamos conhecer uma nova alternativa que é escrita em [Golang](https://terminalroot.com.br/tags#go) e o diferencial dela em relação ao do [GNU Coreutils ls](https://www.gnu.org/software/coreutils/manual/html_node/ls-invocation.html#ls-invocation) é que além de listar os arquivos, ele também exibe os ícones de acordo com o *mime-type* .

# Instalação
É possível instalá-lo em diversas arquiteuras e sistemas operacionais([Windows](https://terminalroot.com.br/tags#windows), [macOS](https://terminalroot.com.br/tags#macos), [BSD](https://terminalroot.com.br/tags#bsd)), para ver o correspondente ao seu acesse a [página de releases](https://github.com/Yash-Handa/logo-ls/releases).

No caso para [GNU/Linux](https://terminalroot.com.br/tags#gnu) 64-bit, use os comandos abaixo:

{% highlight sh %}
wget -q https://github.com/Yash-Handa/logo-ls/releases/download/v1.3.7/logo-ls_Linux_x86_64.tar.gz
tar zxvf logo-ls_Linux_x86_64.tar.gz
cd logo-ls_Linux_x86_64/
sudo install -v logo-ls /usr/local/bin/
{% endhighlight %}

Se quiser também instalar o manual, rode:

{% highlight sh %}
sudo cp logo-ls.1.gz /usr/share/man/man1/
{% endhighlight %}

Agora é só testar rodando o comando:
{% highlight sh %}
logo-ls
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

Possível saída:
![Logo ls](/assets/img/go/logo-ls-test.png) 

Se quiser que ele seja seu `ls` padrão, basta criar um `alias` para ele, exemplo em [BASH](https://terminalroot.com.br/shell):
{% highlight sh %}
echo 'alias ls="logo-ls"' >> ~/.bashrc
exec $SHELL
ls
{% endhighlight %}

Para mais informações use os comandos:
{% highlight sh %}
logo-ls --help
man 1 logo-ls
{% endhighlight %}

E para mais detalhes acesse o [repositório do logo-ls no GitHub](https://github.com/Yash-Handa/logo-ls) .

