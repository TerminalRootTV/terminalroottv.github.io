---
layout: post
title: "Termshark: Um Wireshark pelo Terminal"
date: 2020-10-19 12:54:14
image: '/assets/img/rede/termshark.jpg'
description: 'Uma interface de usuário via linha de comando, inspirada no Wireshark'
icon: 'cib:go'
iconname: 'termshark'
tags:
- redes
- go
---

![Termshark: Um Wireshark pelo Terminal](/assets/img/rede/termshark.jpg)

**Termshark** é uma interface de usuário via linha de comando, inspirada no Wireshark.

# Recursos

+ Ler arquivos `pcap` ou analisar interfaces ativas (com as devidas permissões)
+ Filtrar `pcaps` ou capturas ao vivo usando os filtros de exibição do Wireshark
+ Remonte e inspecione os fluxos TCP e UDP
+ Ver conversas de rede por protocolo
+ Copie intervalos de pacotes para a área de transferência do terminal
+ Escrito em [Golang](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html#04-go), compila em um único executável em cada plataforma - downloads disponíveis para [Linux](https://terminalroot.com.br/tags#linux), [macOS](https://terminalroot.com.br/tags#macos), [FreeBSD](https://terminalroot.com.br/tags#freebsd), [Android (termux)](https://terminalroot.com.br/tags#android) e [Windows](https://terminalroot.com.br/tags#windows).

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# Instalação
Primeiramente você precisar instalar o [Go](https://golang.org/), para isso use o gerenciador de pacotes da sua distribuição, exemplos:
{% highlight bash %}
emerge go # Gentoo, Funtoo, ...
sudo apt install go # Debian, Ubuntu, Mint, ...
sudo pacman -S go # Arch, Manjaro, ...
sudo dnf install go # Red Hat, CentOS, Fedora, ...
{% endhighlight %}

Também instale as dependências:
+ [tshark](https://www.wireshark.org/docs/man-pages/tshark.html) - analisador de protocolo de rede de linha de comando, parte do [Wireshark](https://wireshark.org/)
+ [tcell](https://github.com/gdamore/tcell) - um pacote de gerenciamento de terminal baseado em células, inspirado no termbox
+ [gowid](https://github.com/gcla/gowid) - widgets de interface de usuário de terminal de composição, inspirados em [urwid](http://urwid.org/), construídos em tcell

Após isso basta usar o comando `go` para instalar:
{% highlight bash %}
go get github.com/gcla/termshark/v2/cmd/termshark
{% endhighlight %}
E inclua o caminho na sua variável `$PATH`, exemplo:
{% highlight bash %}
echo 'export PATH="${PATH}:~/go/bin/' | tee -a ~/.bashrc
{% endhighlight %}

# Exemplo de uso
Capture pacotes de ping na interface **enp1s0**:
{% highlight bash %}
termshark -i eth0 enp1s0
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

Para mais informações rode o comando:
{% highlight bash %}
termshark -h
{% endhighlight %}
E visite o endereço oficial do projeto: <https://github.com/gcla/termshark>
