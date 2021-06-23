---
layout: post
title: "Compartilhe seu Terminal com o Navegador"
date: 2021-06-23 11:10:21
image: '/assets/img/python/termpair.jpg'
description: 'Um aplicativo escrito com Python e JavaScript'
icon: 'ion:terminal-sharp'
iconname: 'Python'
tags:
- python
- javascript
---

![Compartilhe seu Terminal com o Navegador](/assets/img/python/termpair.jpg)

**Termpair** permite você visualizar e controlar seu terminal através do seu navegador com bloqueio de criptografia de ponta a ponta.

# Instalação
Para instalar basta usar o [pip](https://pypi.org/project/pip/) , exemplo:

{% highlight bash %}
pip install termpair --user
{% endhighlight %}
> Ou use o `sudo` e ignore o parâmetro `--user`.

# Utilização
Utilizar é tão fácil quão instalar. Primeiramente abra a conexão com o servidor com o parâmetro `server`:

{% highlight bash %}
termpair serve --port 8000
{% endhighlight %}

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Enquanto o servidor estiver rodando, basta abrir uma nova aba/janela do [terminal](http://terminalroot.com.br/tags/#terminal) e rodar o comando:

{% highlight bash %}
termpair share --port 8000
{% endhighlight %}

Será aberta uma [subshell](https://terminalroot.com.br/shell) e informando o endereço para você acessar, exemplo de saída:

{% highlight bash %}
-----------------------------------------------------------------------------------------
Connection established with end-to-end encryption 🔒
Sharing '/bin/bash' at

http://localhost:8000/?terminal_id=bS23171a9411a31b0bf13b8ab94ecde4#RkauVqLrO2LdzNp+UzfrwQ==

Type 'exit' or close terminal to stop sharing.
-----------------------------------------------------------------------------------------
{% endhighlight %}

E então abra o link(ou só segure o Ctrl e clique no link que será aberto automaticamente no seu navegador padrão).

E pra quê serve isso ? Aí você que vai responder porque se falarmos de [SSH](https://terminalroot.com.br/2017/12/como-conectar-ao-linux-pelo-windows-via-ssh.html) haverá muitas formas de monitoramente via browser em tempo real.

Para sair tecle `exit` na janela da subshell e Ctrl + C na janela do server.

Veja um gif de exemplo:

![Termpair](https://raw.githubusercontent.com/cs01/termpair/master/termpair_browser.gif)

Para mais informações acesse o repositório no GitHub:
#### <https://github.com/cs01/termpair>


