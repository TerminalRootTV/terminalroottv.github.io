---
layout: post
title: "Conheça o Arch Hurd"
date: 2022-02-23 10:42:53
image: '/assets/img/gnu/archhurd.jpg'
description: 'O Arch Linux com o Kernel GNU/Hurd .'
icon: 'ion:terminal-sharp'
iconname: 'GNU/Hurd'
tags:
- gnu
- so
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

O [Arch Linux](https://terminalroot.com.br/tags#archlinux) nem sempre é [Linux](https://terminalroot.com.br/linux) ele pode ter outros kernels, como já postamos sobre o [PacBSD](https://terminalroot.com.br/2019/07/conheca-o-pacbsd-o-arch-linux-com-kernel-freebsd.html) que é o **Arch** com o kernel do [FreeBSD](https://terminalroot.com.br/tags#freebsd) .

O [Arch Hurd](https://archhurd.org/) são os pacotes do Arch com o kernel [GNU/Hurd](https://www.gnu.org/software/hurd/hurd.html) e lógico com as ferramentas do [GNU](https://www.gnu.org/software/) .

O projeto **Arch Hurd** foi fundado em um tópico do fórum Arch Linux em janeiro de 2010 e, após algumas semanas com muitas contribuições, progrediu ao ponto de poder inicializar em uma máquina virtual. 

Ele tem como objetivo fornecer um ambiente de usuário semelhante ao Arch (scripts de inicialização no estilo [BSD](https://terminalroot.com.br/tags#bsd), pacotes otimizados para **i686**, uso do gerenciador de pacotes pacman , *rolling-release* e uma configuração [KISS](https://en.wikipedia.org/wiki/KISS_principle) ) no **Hurd** que é estável o suficiente para usar.

Apesar de ter uma pequena equipe de desenvolvimento, muito progresso foi feito desde sua fundação, como inicializar em hardware real, empacotar tudo para um servidor web básico, e a produção de um LiveCD gráfico não oficial.

Em junho de 2011, Arch Hurd anunciou a integração bem-sucedida do **Device Driver Environment ( DDE )** — a estrutura para drivers Linux no Hurd, que melhora o suporte de hardware de rede na distribuição e o torna utilizável.

Vamos conhecer essa proposta de sistema operacional que ainda está em desenvolvimento, mas já merece nossa atenção .

---

# Testando o LiveCD em uma máquina virtual ou física
Faça o [download](https://archhurd.org/download/) do [arquivo](https://files.archhurd.org/iso/2018.09.28/)
{% highlight sh %}
wget https://files.archhurd.org/iso/2018.09.28/archhurd-2018.09.28.img.xz
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

[Descompacte](https://terminalroot.com.br/2019/10/como-extrair-varios-formatos-compactados-com-um-comando.html) o arquivo:
{% highlight sh %}
unxz archhurd-2018.09.28.img.xz
{% endhighlight %}
> Ou `xd -d archhurd-2018.09.28.img.xz`

Transforme o `.img` em `.iso`, mas antes você vai precisar do [iat](https://www.berlios.de/software/iso9660-analyzer-tool), exemplo de instalação no [Gentoo](https://terminalroot.com.br/tags#gentoo) e também no [Debian](https://terminalroot.com.br/tags#debian), [Ubuntu](https://terminalroot.com.br/tags#ubuntu) e derivados:
{% highlight sh %}
sudo emerge iat # Gentoo, Funtoo,...
sudo apt install iat # Debian, Ubuntu, Mint, ... 
{% endhighlight %}

Após instalado, transforme em `.iso`:
> Caso você queira testar no [VirtualBox](https://terminalroot.com.br/2018/03/como-instalar-o-mac-os-x-em-virtualbox-no-linux.html).
{% highlight sh %}
iat -i archhurd-2018.09.28.img --iso -o archhurd-2018.09.28.iso
{% endhighlight %}
> Esse processo pode demorar um pouco.

Após terminado basta você carregá-lo no seu VirtualBox ou até mesmo gravar um [USB](https://terminalroot.com.br/2019/07/a-maneira-mais-facil-de-gravar-um-iso-no-pendrive-disco-usb.html) ou [DVD](https://terminalroot.com.br/2017/09/como-gravar-cd-dvd-pelo-terminal.html) e instalar na sua máquina física .

Se quiser tentar no [QEMU](https://terminalroot.com.br/2021/02/como-instalar-o-qemu-kvm-no-linux-mint-ubuntu-e-outras-distros.html), rode:
{% highlight sh %}
qemu-img create hd0.img 10G
qemu-system-x86_64 -m 1G -drive file=hd0.img -cdrom archhurd-2018.09.28.img
{% endhighlight %}

> **Dica**: Tente pelo método com VirtualBox.

---

# Instalação
O processo de instalação é similar do [Arch Linux](https://terminalroot.com.br/2020/01/arch-linux-openbox-tint2.html) e você pode ver todo o processo na página que há o [Guia de instalação](https://wiki.archlinux.org/title/Installation_guide) no endereço: <https://wiki.archlinux.org/title/Installation_guide> .

Para mais informações acesse os links abaixo:

+ <https://archhurd.org/>
+ <https://archhurd.org/download/>
+ <https://www.gnu.org/software/hurd/hurd/running/arch_hurd.html>
+ <https://www.gnu.org/software/>
+ <https://www.gnu.org/software/hurd/hurd.html>
+ <https://en.wikipedia.org/wiki/Arch_Hurd>
+ <https://en.wikipedia.org/wiki/KISS_principle>
+ <https://terminalroot.com.br/2017/09/como-gravar-cd-dvd-pelo-terminal.html>
+ <https://terminalroot.com.br/2019/07/a-maneira-mais-facil-de-gravar-um-iso-no-pendrive-disco-usb.html>
+ <https://terminalroot.com.br/2019/10/como-extrair-varios-formatos-compactados-com-um-comando.html>
+ <https://wiki.archlinux.org/title/Installation_guide>
+ <https://www.berlios.de/software/iso9660-analyzer-tool>

---

## Conheça também:
+ [Debian GNU/Hurd , uma outra opção ao Linux](https://terminalroot.com.br/2016/04/debian-gnuhurd-uma-outra-opcao-ao-linux.html)
+ [Conheça o PacBSD, o Arch Linux com o Kernel FreeBSD](https://terminalroot.com.br/2019/07/conheca-o-pacbsd-o-arch-linux-com-kernel-freebsd.html)




