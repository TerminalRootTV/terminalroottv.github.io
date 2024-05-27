---
layout: post
title: "Conheça o Mold: Um Linker Moderno"
date: 2024-05-27 12:25:36
image: '/assets/img/cpp/mold.jpg'
description: '🦠 Um substituto mais veloz para linkers como: ld e lld.'
icon: 'ion:terminal-sharp'
iconname: 'Linker'
tags:
- cpp
- c
- nim
- rust
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**mold** é um substituto mais rápido para linkers Unix existentes. 

É várias vezes mais rápido que o vinculador [LLVM lld](https://terminalroot.com.br/tags#llvm) e o [GNU ld](https://terminalroot.com.br/tags#gnu).  

O `mold` visa aumentar a produtividade do desenvolvedor, minimizando o tempo de construção, especialmente em ciclos rápidos de depuração, edição e reconstrução.

Aqui está uma comparação de desempenho de *GNU ld*, *GNU gold*, *LLVM lld* e **mold** ao vincular executáveis finais habilitados para *debuginfo* para grandes programas em uma máquina simulada de 16 núcleos e 32 threads.

![Chart](/assets/img/cpp/chart.svg) 

| Programa (tamanho de saída do vinculador)  | GNU ld | GNU gold | LLVM lld | mold
|--------------------------------------------|--------|----------|----------|------
| MySQL 8.3 (0.47 GiB)                       | 10.84s | 7.47s    | 1.64s    | 0.46s
| Clang 19 (1.56 GiB)                        | 42.07s | 33.13s   | 5.20s    | 1.35s
| Chromium 124 (1.35 GiB)                    | N/A    | 27.40s   | 6.10s    | 1.52s

> o **mold** suporta: x86-64, i386, ARM64, ARM32, 64 bits/32 bits little/big-endian RISC-V, PowerPC de 32 bits, 64 bits big-endian PowerPC ELFv1, 64 bits little-endian PowerPC ELFv2 , s390x, LoongArch de 64/32 bits, SPARC64, m68k, SH-4 e DEC Alpha.

Aqui está uma comparação lado a lado do uso de CPU por núcleo para lld (esquerda) e molde (direita), vinculando o mesmo programa, um executável do Chromium.

![Htop mold](/assets/img/cpp/htop.gif) 

## Por que a velocidade de link é importante?
Se você estiver usando uma linguagem compilada como [C](https://terminalroot.com.br/tags#linguagemc), [C++](https://terminalroot.com.br/tags#cpp) ou [Rust](https://terminalroot.com.br/tags#rust), uma compilação consiste em duas fases. 

Na primeira fase, um compilador compila os arquivos fonte em arquivos objeto (arquivos `.o`). 

Na segunda fase, um vinculador pega todos os *arquivos-objeto* e os combina em um único arquivo executável ou de biblioteca compartilhada.
> A segunda fase pode ser demorada se a saída do *build* for grande. 

O mold pode acelerar esse processo, economizando tempo e evitando distrações enquanto espera a conclusão de uma longa construção.

A diferença é mais perceptível durante ciclos rápidos de depuração, edição e reconstrução.


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

# Instalação
O `mold` está disponível em quase todos os repositórios de gerenciadores de pacotes, exemplo:

{% highlight bash %}
sudo brew install mold # Brew
sudo apt install mold  # APT
sudo emerge mold       # Portage
sudo dnf install mold  # DNF
{% endhighlight %}
> E entre diversos outros! Use o *search* do seu gerenciador de pacotes para encontrá-lo!

---

# Utilização
Se você for compilar arquivos C/C++, por exemplo use a flag: `fuse-ld=mold`:
{% highlight bash %}
# Clang
clang++ -fuse-ld=mold main.cpp

# GCC
g++ -fuse-ld=mold main.cpp
{% endhighlight %}

Se for compilar arquivos [Assembly](https://terminalroot.com.br/tags#assembly), exemplo `hello.s`(GNU Assembler - GAS):

{% highlight nasm %}
.section .data
hello:
    .ascii "Hello, World!\n"

.section .text
.globl _start

_start:
    mov $1, %rax        # syscall: sys_write
    mov $1, %rdi        # file descriptor: stdout
    mov $hello, %rsi    # endereço da string
    mov $14, %rdx       # comprimento da string
    syscall             # chama o kernel

    mov $60, %rax       # syscall: sys_exit
    xor %rdi, %rdi      # status de saída: 0
    syscall             # chama o kernel
{% endhighlight %}

Compile normalmente:
{% highlight bash %}
as --64 -o hello.o hello.s
{% endhighlight %}

E use o mold para linkar:
{% highlight bash %}
mold -o hello hello.o
{% endhighlight %}

Verificando se o `elf` foi *linkado* com `mold`:
{% highlight bash %}
readelf -p .comment a.out

# Exemplo de saída

Despejo de cadeia da secção ".comment":
  [     0]  GCC: (Gentoo 13.2.1_p20240210 p14) 13.2.1 20240210
  [    33]  mold 2.31.0 (compatible with GNU ld)
  [    59]  GCC: (Gentoo 13.2.1_p20240503 p15) 13.2.1 20240503

{% endhighlight %}

---

Para mais informações [acesse o repositório no GiiHub](https://github.com/rui314/mold).

