---
layout: post
title: "Homebrew - O gerenciador de pacotes do macOS no GNU/Linux"
date: 2021-07-08 09:37:30
image: '/assets/img/mac/brew.jpg'
description: 'O gerenciador de pacotes Homebrew pode ser usado em Linux e Windows Subsystem for Linux (WSL).'
icon: 'ion:terminal-sharp'
iconname: 'Ferramentas'
tags:
- macos
- gnulinux
---

![Homebrew - O gerenciador de pacotes do macOS no GNU/Linux](/assets/img/mac/brew.jpg)

O gerenciador de pacotes Homebrew pode ser usado em [Linux](https://terminalroot.com.br/linux) e [Windows Subsystem for Linux (WSL)](https://terminalroot.com.br/2018/03/como-usar-o-shell-bash-no-windows.html). **Homebrew** era conhecido anteriormente como **Linuxbrew** quando executado em [Linux](https://terminalroot.com.br/tags#linux) ou WSL.

**Ele pode ser instalado em seu diretório pessoal, caso em que não usa o sudo.**

Ele não usa nenhuma biblioteca fornecida pelo seu sistema host, exceto [glibc](https://www.gnu.org/software/libc/) e [gcc](https://terminalroot.com.br/2019/12/gcc-vs-llvm-qual-e-o-melhor-compilador.html) se eles forem novos o suficiente. 

O Homebrew pode instalar suas próprias versões atuais do glibc e gcc para distribuições mais antigas do Linux.

# Instalação
Antes de qualquer coisa instale as dependências se você não possuir, exemplos:
+ [Debian](https://terminalroot.com.br/tags#debian), [Ubuntu](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=ubuntu), [Linux Mint](https://terminalroot.com.br/tags#mint) e derivados:
{% highlight bash %}
sudo apt install build-essential procps curl file git
{% endhighlight %}

+ [Fedora](https://terminalroot.com.br/2019/09/ambiente-de-desenvolvimento-fedora-30.html) e derivados:
{% highlight bash %}
sudo dnf groupinstall 'Development Tools'
sudo dnf install procps-ng curl file git
sudo dnf install libxcrypt-compat # Fedora 30
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


Próximo passo é só instalar:
{% highlight bash %}
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
{% endhighlight %}

# Utilização
Após instalado você rodar o comando para instalar aplicativos no seu sistema, exemplo:
{% highlight bash %}
sudo brew install allegro
{% endhighlight %}

Veja a lista de todos os pacotes disponíveis para GNU/Linux [neste link](https://formulae.brew.sh/formula-linux/).

Para mais informações e configurações adicionais consulte o site oficial:
## <https://brew.sh>

## Veja também
<iframe width="910" height="390" src="https://www.youtube.com/embed/2B8Q6IWvVa8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


