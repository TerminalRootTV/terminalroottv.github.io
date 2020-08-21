---
layout: post
title: "Anjuta, o melhor IDE para C++ com gtkmm"
date: 2020-08-21 13:35:52
image: '/assets/img/anjuta/anjuta.jpg'
description: 'Instalação e resolvendo possíveis problemas.'
icon: 'mdi:language-cpp'
iconname: 'anjuta'
tags:
- anjuta
- cpp
- desenvolvimento
- programacao
---

![Anjuta, o melhor IDE para C++ com gtkmm](/assets/img/anjuta/anjuta.jpg)

[Anjuta](http://anjuta.org/) é um Ambiente de Desenvolvimento Integrado para C e C++ em GNU/Linux. Ele foi escrito para GTK+/GNOME e suporta muitas capacidades avançadas como gerenciamento de projetos e um poderoso editor de código fonte. Anjuta é software livre distribuído sob a licença GPL.

---

# Instalação
É bem possível que haja o Anjuta no repositório da sua distro, mas se tiver com algum [problema](https://bugs.gentoo.org/721946) é recomendado compilar e instalar na "mão", e é bem simples. Se você usa GNOME, provavelmente já há todas as dependências necessárias para rodar o Anjuta.

Mas se você for instalar do zero, antes voc precisará dessas dependências:
## Dependências
+ GTK libs (2.0 or later)
+ GNOME libs (2.0 or later)
+ gnome-xml (aka libxml1) (1.4.0 or later)
+ gnome-print
+ gdk-pixbuf
+ scrollkeeper
+ pkgconfig
+ gnome-build (the latest release)
+ gdl (the latest release)

Opcionalmente você também essas:
> O [Glade](https://glade.gnome.org/) eu acho importantíssimo possuir também:

+ devhelp (0.13 or later): for integrated API help
+ [glade](https://glade.gnome.org/)3 (3.1.5 or later): for integrated UI designing
+ libsvn: (www.subversion.org) to build subversion plugin
+ graphviz: for class hierarchy view and profiler.

## Download
Para esse exemplo vamos instalar a versão **3.34.0** , que de acordo com a data de publicação desse artigo, é a mais recente, mas verifique [aqui](https://download.gnome.org/sources/anjuta/) qual a versão mais recente.
```sh
wget https://download.gnome.org/sources/anjuta/3.34/anjuta-3.34.0.tar.xz
tar Jxvf anjuta-3.34.0.tar.xz
```
> Alternativamente você pode usar o [extract](https://terminalroot.com.br/2019/10/como-extrair-varios-formatos-compactados-com-um-comando.html) para descompactar.

## Compilando
```sh
cd anjuta-3.34.0/ 
./configure
make
sudo make install
```

## Resolvendo possíveis problemas
Em alguns casos, como o meu, por exemplo, ao abrir o Anjuta após a instalação, quando tentei abrir pelo *launcher* não abriu, então tentei rodar o comando pelo terminal e obtive esse erro:
> **anjuta: error while loading shared libraries: libanjuta-3.so.0: cannot open shared object file: No such file or directory**
```sh
anjuta -v
anjuta: error while loading shared libraries: libanjuta-3.so.0: cannot open shared object file: No such file or directory
```

Então *debuguei* as bibliotecas compartilhadas com [ldd]() e obtive logo nas primeiras linhas esse erro de **not found**:
```sh
ldd /usr/local/bin/anjuta 
linux-vdso.so.1 =>  (0x00007fff0e9c9000)
libgtksourceview-3.0.so.1 => /usr/lib/x86_64-linux-gnu/libgtksourceview-3.0.so.1 (0x00007f68faff9000)
libgdl-3.so.5 => /usr/lib/x86_64-linux-gnu/libgdl-3.so.5 (0x00007f68fadca000)
...
libanjuta-3.so.0 => not found
...
```

Esse *bendito* `libanjuta-3.so.0` está no caminho: `/usr/local/lib`
```sh
ls /usr/local/lib/libanjuta-3.so.0
```

Eu iria seguir a dica do [cesareriva](https://www.cesareriva.com/anjuta-an-alternative-ide-for-pygi/), de criar um [sh](https://terminalroot.com.br/shell) e adicionar ao `/etc/profile.d` com alteração na variável `$PATH` , mas além de não funcionar, polui sua **PATH** , então criei um link simbólico para ela no caminho que o Anjuta procura: `/usr/lib64/`
```sh
sudo ln -s /usr/local/lib/libanjuta-3.so.0 /usr/lib64/libanjuta-3.so.0
```

Pronto! Deu certo!
```sh
marcos@gentoo ~ $ anjuta -v
Anjuta 3.34.0
```

![Anjuta](/assets/img/anjuta/anjuta-ide.png)

## Links úteis:
+ <https://www.gtkmm.org/en/>
+ <https://terminalroot.com.br/cpp/>
+ <https://www.cesareriva.com/anjuta-an-alternative-ide-for-pygi/>
+ <https://colorschemesandthemes.wordpress.com/anjuta/>

# Fui!
