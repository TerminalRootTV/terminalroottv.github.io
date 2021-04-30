---
layout: post
title: "Zellij um novo terminal escrito em Rust"
date: 2021-04-30 10:33:59
image: '/assets/img/rust/zellij.jpg'
description: 'Um multiplexador de terminal estilo TMUX e GNU Screen .'
icon: 'ion:terminal-sharp'
iconname: 'Rust'
tags:
- rust
- terminal
---

![Zellij um novo terminal escrito em Rust](/assets/img/rust/zellij.jpg)

Zellij é um multiplexador de terminal estilo [TMUX](https://terminalroot.com.br/2018/01/como-instalar-e-utlizar-o-tmux.html) e [GNU Screen](https://terminalroot.com.br/2019/10/multiplexando-seu-terminal-com-gnu-screen.html), só que escrito em [Rust](https://terminalroot.com.br/tags#rust) .

![Zellij 1](/assets/img/rust/zellij-1.png)

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


Zellij inclui um mecanismo de layout, permitindo aos usuários definir um mapa de painéis em um arquivo **yaml** e carregá-lo ao iniciar o aplicativo. Dessa forma, pode-se ter seus painéis dispostos da maneira que se deseja, sem ter que fazer todo o trabalho de configuração.

![Zellij 2](/assets/img/rust/zellij-2.png)

# Instalação
O Zellij dispõe de uma versão para [Linux](https://terminalroot.com.br/tags#linux) e outra para [macOS](https://terminalroot.com.br/tags#macos) . 

<a href="https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz" class="btn btn-success btn-lg" target="_blank" rel="noopener noreferrer">DOWNLOAD para Linux</a>

<a href="https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-apple-darwin.tar.gz" class="btn btn-info btn-lg" target="_blank" rel="noopener noreferrer">DOWNLOAD para macOS</a>

![Zellij 3](/assets/img/rust/zellij-3.png)

Após feito o download do [tar.gz](https://terminalroot.com.br/2019/10/como-extrair-varios-formatos-compactados-com-um-comando.html) basta [descompactar](https://terminalroot.com.br/2019/10/como-extrair-varios-formatos-compactados-com-um-comando.html) e instalar o binário `zellij` no local escolhido, exemplo:
{% highlight bash %}
sudo install zellij /usr/local/bin
{% endhighlight %}

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


O Zellij dispõe também de uma documentação detalhada sobre todos os recursos que podem ser acessados [aqui](https://zellij.dev/documentation/introduction.html) .

Veja um GIF do Zellij em ação:

![Zellij GIF](/assets/img/rust/zellij.gif)


