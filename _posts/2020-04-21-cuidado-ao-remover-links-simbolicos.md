---
layout: post
title: "CUIDADO ao remover links simbólicos"
date: 2020-04-21 16:25:53
image: '/assets/img/dicas/remove-symbolic-link.jpg'
description: 'As vezes soluções simples evitam problemas complexos! 😱'
icon: 'ion:terminal-sharp'
iconname: 'terminalroot'
tags:
- comandos
- dicas
- linux
---

![CUIDADO ao remover links simbólicos](/assets/img/dicas/remove-symbolic-link.jpg)

Dia desse recebi um e-mail de uma pessoa me perguntando como recuperar os arquivos do EFI, sim aqueles que ficam guardados no caminho: `/boot/efi` .

Segundo a pessoa, o sistema havia criado o diretório no caminho: `/boot/grub/x86_64-efi` e o grub de um segundo sistema estava tentando encontrar em `/boot/efi` , então ela resolveu criar um link simbólico para tentar solucionar o problema:
{% highlight bash %}
ln -s /boot/grub/x86_64-efi /boot/efi
{% endhighlight %}

Só que isso não solucionou e ela decidiu remover o link simbólico com o seguinte comando:
{% highlight bash %}
rm -rf /boot/efi
{% endhighlight %}

O que acontece é que o diretório `/boot/grub/x86_64-efi` não foi removido, mas os arquivos sim! 😱
![Que tristeza](/assets/img/dicas/triste.jpg)

Se você criar um teste aí no seu sistema com diretórios em sua `/home/$USER/` só pra isso, perceberá que realmente é isso que acontecerá!

# E como evitar isso ?

Bom, a medida a ser tomada para que isso não aconteça é usar o comando `unlink` antes de remover. Tomemos o exemplo dela como exemplo.

Primeiramente ela deveria "*deslinkar*" o diretório, assim:
{% highlight bash %}
unlink /boot/efi
{% endhighlight %}

E somente após isso usar o comando `rm`:
{% highlight bash %}
rm -rf /boot/efi
{% endhighlight %}

As vezes(somente, às vezes mesmo, não vá se acostumando), soluções simples evitam problemas complexos!

#FicaAdica

Abraços!
