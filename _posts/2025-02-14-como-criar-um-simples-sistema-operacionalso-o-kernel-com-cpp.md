---
layout: post
title: "Como Criar um Simples Sistema Operacional(só o Kernel) com C++"
date: 2025-02-14 09:57:38
image: '/assets/img/cpp/so.jpg'
description: "🚀 O boot foi realizado na máquina física e conseguimos printar direto na VGA com um sistema de 32-bit feito com C++ e GNU Assembler."
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- sistemasoperacionais
- cpp
- assembly
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

🔊 Nesse vídeo mostrei passo a passo do processo para criar um *kernel* que é a base para um *Sistema Operacional*. O boot foi realizado na **máquina física** e conseguimos printar direto na **VGA** com um sistema de **32-bit** feito com [C++](https://terminalroot.com.br/tags#cpp) e [GNU Assembler](https://terminalroot.com.br/tags#assembly).

---

## Para construir na sua máquina
Use o gerenciador de pacotes para instalar o [GCC](https://terminalroot.com.br/tags#gcc), [make](https://terminalroot.com.br/tags#make), [as](https://terminalroot.com.br/tags#assembly) e [ld](https://terminalroot.com.br/tags#gnu)
{% highlight bash %}
sudo apt install build-essential
{% endhighlight %}

Clone o repositório e compile:

Depois é só compilar:
{% highlight bash %}
git clone https://github.com/terroo/terminalroot-os
cd terminal-root-os/
make
{% endhighlight %}

## Para testar no QEMU, por exemplo
{% highlight bash %}
sudo apt install qemu-kvm
{% endhighlight %}

E então testar:
{% highlight bash %}
qemu-system-i386 -kernel terminal-root-os.bin
{% endhighlight %}
> Até com o `qemu-system-x86-64 -kernel terminal-root-os.bin`.

Se você tem uma máquina virtual ou física com **GRUB Legacy**, você pode mover pro `/boot` e editar o `grub.cfg`:
> Exemplo:

{% highlight bash %}
sudo mv terminal-root-os.bin /boot/
sudo vim /boot/grub/grub.cfg
{% endhighlight %}

Adicione uma nova entrada no GRUB:
{% highlight bash %}
### BEGIN TERMINALROOTOS

menuentry 'Terminal Root OS' {
  multiboot /boot/terminal-root-os.bin
  boot
}

### END TERMINALROOTOS
{% endhighlight %}

---

## Assista ao Vídeo

<iframe width="1243" height="699" src="https://www.youtube.com/embed/3GwRF0IK1Ks" title="" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>


---

+ 👑 [Aprenda a criar sua própria linguagem de programação](https://terminalroot.com.br/mylang)
+ ✅ [Aprenda Criação de Games com C++ e SFML](https://terminalroot.com.br/games)
+ ✅ [Pacote Promocional C++](https://terminalroot.com.br/promo)
+ ✅ [Aprenda C++ e Qt](https://terminalroot.com.br/cpp)
+ ✅ [Conheça nossos Cursos](https://bit.ly/CursosTerminalRoot)
+ 🎁 [Todos os Cursos na Udemy](https://bit.ly/UdemyTerminalRoot)

Repositório do **Terminal Root OS** no GitHub: <https://github.com/terroo/terminalroot-os>.


