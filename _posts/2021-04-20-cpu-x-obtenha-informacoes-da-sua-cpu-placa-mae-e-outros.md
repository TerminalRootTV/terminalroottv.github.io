---
layout: post
title: "CPU-X, obtenha informações da sua CPU, placa-mãe e outros."
date: 2021-04-20 12:01:14
image: '/assets/img/hardware/cpux-cpufetch.jpg'
description: 'E também o cpufetch, uma alternativa.'
icon: 'ion:terminal-sharp'
iconname: 'CPU'
tags:
- hardware
- dicas
---

![CPU-X, obtenha informações da sua CPU, placa-mãe e outros.](/assets/img/hardware/cpux-cpufetch.jpg)

CPU-X é um aplicativo de perfil e monitoramento de sistema (semelhante ao CPU-Z para [Windows](https://terminalroot.com.br/tags#windows)), mas CPU-X é um software gratuito e de código aberto disponível para [GNU](https://terminalroot.com.br/tags#gnu)/[Linux](https://terminalroot.com.br/linux) e [FreeBSD](https://terminalroot.com.br/tags#freebsd).

Este software foi escrito em [C](https://terminalroot.com.br/tags#linguagemc) e construído com a ferramenta [CMake](https://terminalroot.com.br/2019/12/como-compilar-seus-programas-com-cmake.html).

Ele pode ser usado em modo gráfico usando [GTK](https://terminalroot.com.br/tags#gtkmm) ou em modo baseado em texto usando [NCurses](https://terminalroot.com.br/ncurses). Um modo de despejo está presente na [linha de comando](https://terminalroot.com.br/tags#comandos).

# Instalação
Há diversas formas de você obter o CPU-X no seu sistema, dentre elas:

### Gerenciador de Pacotes da sua distro
Exemplos:
+ [Debian](https://terminalroot.com.br/tags#debian): `sudo apt install cpu-x`
+ [Fedora](https://terminalroot.com.br/2019/09/ambiente-de-desenvolvimento-fedora-30.html): `sudo dnf install cpu-x`
+ [FreeBSD](https://terminalroot.com.br/tags#freeBsd): `sudo pkg install cpu-x`
+ [OpenMandriva](https://terminalroot.com.br/2020/06/conheca-a-distro-openmandriva.html): `sudo dnf install cpu-x`
+ Solus: `sudo eopkg install cpu-x`
+ [Ubuntu](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=ubuntu): `sudo apt install cpu-x`
+[ Arch Linux](https://terminalroot.com.br/tags#archlinux) ([AUR](https://terminalroot.com.br/2020/12/como-instalar-pacotes-do-aur-via-yay-no-arch-linux.html)): [cpu-x](https://aur.archlinux.org/packages/cpu-x/)/[cpu-x-git](https://software.opensuse.org//download.html?project=home%3AXorg&package=cpu-x-git)
+ [Slackware](https://terminalroot.com.br/tags#slackware): [SlackOnly](https://slackonly.com/)


### Baixar e construir no seu sistema
Para quem utiliza [Gentoo](https://terminalroot.com.br/tags#gentoo) ou [Funtoo](https://terminalroot.com.br/tags#funtoo) que já possui todas as ferramentas de construção disponíveis .

Mas antes certifique-se que possui as dependências instaladas: [CMake](https://terminalroot.com.br/2019/12/como-compilar-seus-programas-com-cmake.html), pkg-config, [GNU Make](ihttps://terminalroot.com.br/2019/12/como-criar-um-makefile.html), [GTK3+](https://terminalroot.com.br/tags#gtkmm), [Ncurses](https://terminalroot.com.br/ncurses), pciutils, libcpuid, GFLW, OpenCL e Procps-ng . Depois baixe a versão mais recente [aqui](https://github.com/X0rg/CPU-X/releases/latest) e compile .

### Ou via AppImage
A mais simples de todas

{% highlight bash %}
wget https://github.com/X0rg/CPU-X/releases/download/v4.2.0/CPU-X-v4.2.0-x86_64.AppImage
chmod +x CPU-X-v4.2.0-x86_64.AppImage
./CPU-X-v4.2.0-x86_64.AppImage
{% endhighlight %}

Caso queira rodar a versão [Ncurses](), use assim:
{% highlight bash %}
./CPU-X-v4.2.0-x86_64.AppImage --ncurses
{% endhighlight %}

Outra alternativa, não tão completa quanto o CPU-X, mas interessante é o **CPUfetch**:

[![CPUfetch](/assets/img/hardware/cpufetch.jpg)](/assets/img/hardware/cpufetch.jpg)

# Links Úteis
+ <https://x0rg.github.io/CPU-X/>
+ <https://github.com/X0rg/CPU-X/>

