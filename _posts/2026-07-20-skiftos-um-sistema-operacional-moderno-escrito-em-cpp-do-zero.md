---
layout: post
title: "SkiftOS: Um Sistema Operacional Moderno escrito em C++ do zero"
date: 2026-07-20 21:06:06
image: '/assets/img/cpp/skiftos.jpg'
description: "🔳 Seu principal objetivo não é competir com Windows ou Linux, mas servir como uma plataforma moderna para experimentação em sistemas operacionais."
icon: 'ion:terminal-sharp'
iconname: 'SO/C++'
tags:
- so
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

O **SkiftOS** é um sistema operacional open source desenvolvido praticamente do zero, sem depender de um [kernel Linux](https://terminalroot.com.br/tags#gnulinux) ou [BSD](https://terminalroot.com.br/tags#bsd).

> **Aviso:** o próprio desenvolvedor afirma que o projeto ainda está em estágio inicial e **não deve ser utilizado como sistema operacional principal ou em produção**.

Desenvolvido principalmente em **C++20**, que busca unir:

+ simplicidade;
+ modularidade;
+ design moderno;
+ APIs limpas;
+ interface gráfica integrada.

Diferente de muitos *hobby OS* que focam apenas no kernel, o SkiftOS possui praticamente toda uma stack própria:

* Bootloader
* Microkernel
* Framework gráfico
* Biblioteca padrão
* Toolkit de UI
* Desktop Environment
* Aplicações nativas

Tudo desenvolvido especificamente para o sistema.

Principais componentes:

+ Hjert: É o microkernel do sistema.
+ Karm: É a biblioteca base do projeto.
+ KarmUI: Framework gráfico reativo inspirado em tecnologias modernas.
+ Hideo: É o ambiente gráfico (Desktop Environment).

Tecnologias utilizadas:

O projeto faz uso de diversas tecnologias modernas:

* [C++20](https://terminalroot.com.br/tags#cpp)
* [LLVM/Clang](https://terminalroot.com.br/tags#clang)
* [Ninja](https://terminalroot.com.br/tags#ninja)
* [NASM](https://terminalroot.com.br/tags#asm)
* [Python](https://terminalroot.com.br/tags#python)
* [QEMU](https://terminalroot.com.br/tags#qemu)
* arquitetura x86-64
* microkernel
* IPC
* Capability-based Security


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

## Instalação

Atualmente o projeto não possui um instalador tradicional.

A maneira recomendada é compilar o sistema a partir do código-fonte.

No Linux ou macOS instale:

* Git
* Clang (18+)
* LLVM
* Ninja
* NASM
* Python 3.11+
* QEMU
* SDL2
* mtools
* liburing

O manual oficial traz comandos específicos para [Ubuntu e Arch Linux](https://docs.skiftos.org/building.html).

Em resumo: clone o projeto

{% highlight bash %}
git clone https://codeberg.org/skift/os.git

cd skift
{% endhighlight %}

Configure o ambiente:

{% highlight bash %}
./skift.sh tools setup
{% endhighlight %}

Depois confira se tudo foi instalado corretamente:

{% highlight bash %}
./skift.sh tools doctor
{% endhighlight %}

Instale dependências:

{% highlight bash %}
./skift.sh install
{% endhighlight %}

Compile:

Para iniciar o sistema no QEMU:

{% highlight bash %}
./skift.sh boot
{% endhighlight %}

Também é possível executar apenas o shell gráfico:

{% highlight bash %}
./skift.sh run --release hideo-shell
{% endhighlight %}

Ou gerar uma imagem de disco:

{% highlight bash %}
./skift.sh dist --format=hdd
{% endhighlight %}


<!-- RECTANGLE LARGE -->
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Informat -->
<ins class="adsbygoogle"
style="display:block"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="2327980059"
data-ad-format="auto"
data-full-width-responsive="true"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

## Utilização

Após iniciar a máquina virtual, o sistema carrega sua interface gráfica própria.

Entre os recursos disponíveis estão:

* gerenciador de janelas;
* terminal;
* editor de texto;
* visualizador de imagens;
* aplicações nativas;
* desktop integrado.

Ainda há diversas limitações, já que o projeto continua em desenvolvimento ativo.

---

O SkiftOS é um dos projetos de hobby OS mais interessantes da atualidade. Em vez de apenas implementar um kernel funcional, ele busca entregar uma experiência completa, incluindo microkernel, biblioteca padrão, framework gráfico, desktop e aplicações próprias.

Para mais informações acesse o [repositório do SkiftOS](https://codeberg.org/skift/os).


