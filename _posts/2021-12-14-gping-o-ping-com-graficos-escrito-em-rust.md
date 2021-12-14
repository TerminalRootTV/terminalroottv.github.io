---
layout: post
title: "gping, o ping com gráficos, escrito em Rust"
date: 2021-12-14 10:31:27
image: '/assets/img/comandos/gping.jpg'
description: 'Mais um comando moderno e estiloso!'
icon: 'ion:terminal-sharp'
iconname: 'Comandos'
tags:
- rede
- comandos
- terminal
---

![gping, o ping com gráficos, escrito em Rust](/assets/img/comandos/gping.jpg)

---

Muitos profissionais da tecnologia, administradores ou não de sistemas, usam(ou já usaram) quase frequentemente o comando `ping` para diversas finalidades: Testar conectividade, velocidade da conexão, obter endereço de ip e entre outros.

E nessas épocas de *provedores picaretas*(o meu então nem se fala 😞 ) muitos estão usando mais ainda. 

A boa notícia é que podemos desfrutar da [nova geração de comandos](https://terminalroot.com.br/2021/08/uma-lista-com-30-alternativas-modernas-para-os-comandos-do-unix.html) e que até o `ping` tem o seu sucessor que é o **gping** que possui saída com gráficos, para uma melhor noção das possíveis variações de velocidade, e foi escrito em [Rust](https://terminalroot.com.br/tags#rust) .


<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-2838251107855362"
     crossorigin="anonymous"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-2838251107855362"
     data-ad-slot="5351066970"
     data-ad-format="auto"></ins>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# Instalação
O `gping` já está disponível na maioria dos repositórios e/ou com algum ajuste de repositório básico. Mas a forma que eu fiz e recomendo é utilizando o [cargo](https://terminalroot.com.br/2021/07/como-criei-meu-primeiro-programa-em-rust.html), use o comando abaixo:

{% highlight sh %}
cargo install gping
{% endhighlight %}
> Precisa ter o diretório local do [cargo](https://rustup.rs/) na sua `$PATH`, ex.: 
> 
> `echo 'export PATH="${PATH}:${HOME}/.cargo/bin"' >> ~/.bashrc && source ~/.bashrc`

- No Debian, basta adicionar o `azlux` à sua lista do APT, e instalar da seguinte maneira:
{% highlight sh %}
echo "deb http://packages.azlux.fr/debian/ buster main" | sudo tee /etc/apt/sources.list.d/azlux.list
wget -qO - https://azlux.fr/repo.gpg.key | sudo apt-key add -
sudo apt update
sudo apt install gping
{% endhighlight %}

- No [Gentoo](https://terminalroot.com.br/tags#gentoo) também basta adicionar um simples [overlay](https://en.terminalroot.com.br/how-to-install-programs-via-layman-in-gentoo/):
{% highlight sh %}
sudo eselect repository enable dm9pZCAq
sudo emerge --sync dm9pZCAq
sudo emerge net-misc/gping::dm9pZCAq
{% endhighlight %}

- Para outros sistemas/distro, use:
  - `brew install gping` para [macOS](https://terminalroot.com.br/tags#macos) 
  - `sudo port install gping` macPorts
  - `brew install orf/brew/gping` [Linux Homebrew](https://terminalroot.com.br/2021/07/homebrew-o-gerenciador-de-pacotes-do-macos-no-gnu-linux.html)
  - `scoop install gping` ou `choco install gping` para [Windows](https://terminalroot.com.br/tags#windows)


<!-- QUADRADO -->
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
Você pode usar com um único IP `gping [número de ip]` ou testar o desempenho em muitos IPs de forma simultânea. Exemplo, agora o Terminal Root também é dono do domínio <https://terminalroot.com> , testando a conectividade com endereço **.br** e o **.com** e comparando ambos com o <https://google.com> seria o comando:

{% highlight sh %}
gping terminalroot.com terminalroot.com.br google.com
{% endhighlight %}
A saída é justamente a imagem de chamada desse artigo.

Show, né?!

Para mais opções use o `help`, que haverá alguns parâmetros para **IPv6** e entre outros:

{% highlight sh %}
$ gping --help
gping 1.2.6
Ping, but with a graph.

USAGE:
    gping [FLAGS] [OPTIONS] <hosts-or-commands>...

FLAGS:
        --cmd                Graph the execution time for a list of commands rather than pinging hosts
    -h, --help               Prints help information
    -4                       Resolve ping targets to IPv4 address
    -6                       Resolve ping targets to IPv6 address
    -s, --simple-graphics    Uses dot characters instead of braille
    -V, --version            Prints version information

OPTIONS:
    -b, --buffer <buffer>                    Determines the number of seconds to display in the graph. [default: 30]
    -n, --watch-interval <watch-interval>    Watch interval seconds (provide partial seconds like '0.5'). Default for
                                             ping is 0.2, default for cmd is 0.5.

ARGS:
    <hosts-or-commands>...    Hosts or IPs to ping, or commands to run if --cmd is provided.
{% endhighlight %}

---

# Links úteis
+ <https://github.com/orf/gping>
+ <https://en.wikipedia.org/wiki/Ping_(networking_utility)>
+ <https://github.com/iputils/iputils>
+ <https://pt.wikipedia.org/wiki/Ping>


