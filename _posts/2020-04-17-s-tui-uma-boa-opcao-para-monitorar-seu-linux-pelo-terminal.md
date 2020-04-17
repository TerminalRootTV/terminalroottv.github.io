---
layout: post
title: "S-TUI uma boa opção para-monitorar seu Linux pelo terminal"
date: 2020-04-17 10:43:00
image: '/assets/img/terminal/s-tui.jpg'
description: 'Monitora a temperatura, a frequência, a potência e a utilização da CPU de forma gráfica a partir do terminal.'
icon: 'ion:terminal-sharp'
iconname: 'terminalroot'
tags:
- terminal
- python
- comandos
---

# S-TUI uma boa opção para-monitorar seu Linux pelo terminal
![S-TUI uma boa opção para-monitorar seu Linux pelo terminal](/assets/img/terminal/s-tui.jpg)

Aqui no blog já mostramos um software similar que também usa [TUI](https://en.m.wikipedia.org/wiki/Text-based_user_interface)(Terminal User Interface,  Interface de usuário baseada em texto), o [gotop](https://terminalroot.com.br/2019/07/instale-o-gotop-um-monitor-grafico-do-sistema-via-terminal.html), escrito em [Go](https://golang.org/), bem como também como você pode começar a desenvolver esse tipo de interface: [Monitore seu Linux com Gráficos pelo Terminal](https://youtu.be/-6O7_UQ765g) que utiliza [Node.js](https://terminalroot.com.br/2019/11/como-instalar-nodejs-no-linux-e-primeiros-passos.html).

Mas o [S-TUI](https://github.com/amanusk/s-tui) é mais uma opção, no entanto, escrita em [Python](https://terminalroot.com.br/2019/12/as-30-melhores-bibliotecas-e-pacotes-python-para-iniciantes.html). Ele monitora a temperatura, a frequência, a potência e a utilização da CPU de forma gráfica a partir do terminal.

# Instalação
É possível instalar via [pip](https://pypi.org/project/pip/) , se seu sistema não tiver o pip instalado, instale-o via o gerenciador de pacote da sua distro, exemplos:
{% highlight bash %}
sudo emerge dev-python/pip # Gentoo, Funtoo, Pentoo ...
sudo apt install python-pip # Debian, Ubuntu, Mint, ...
sudo pacman -S python-pip # Arch, Manjaro,...
{% endhighlight %}

Após possuir o pip, basta usá-lo para instalar o s-tui:
{% highlight bash %}
pip install s-tui --user
{% endhighlight %}
> Lembrando que essa forma, ele será instalado em `~/.local/bin` então você precisará adicionar esse caminho à sua `$PATH`.

Se quiser instalar em todo o sistema, rode com *sudo* e sem o parâmetro ~~--user~~:
{% highlight bash %}
sudo pip install s-tui
{% endhighlight %}

<!-- LISTA MIN -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Se você não gosta de usar gerenciadores de terceiros, no [GitHub](https://github.com/amanusk/s-tui) deles possuem diversas outras formas de instalação.

# Uso
Depois instalado é só rodar o comando:
{% endhighlight %}
s-tui
{% endhighlight %}

As teclas direcionais servem para obter informações detalhadas e para fechar os boxes que se abrirão, use a tecla *ESC* e para sair vá até *Quit* e pressione *ENTER* . Eu testei em um contêiner com [Docker](https://terminalroot.com.br/2019/08/tutorial-definitivo-de-docker-para-iniciantes-ubuntu.html) e o resultado foi esse:

![S-TUI rodando em Docker](/assets/img/terminal/s-tui-docker.png)

Simples e fácil! 😃

### Página oficial do S-TUI: <https://github.com/amanusk/s-tui>
