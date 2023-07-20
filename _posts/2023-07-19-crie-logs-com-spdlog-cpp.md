---
layout: post
title: "Crie Logs com SpdLog C++"
date: 2023-07-19 21:38:25
image: '/assets/img/cpp/spdlog.jpg'
description: 'Uma biblioteca C++ veloz e útil para log dos seus softwares!'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Se você deseja deixar os logs dos seus software LIKE A PRO, então **SpdLog** é a melhor opção!

É uma biblioteca [C++](https://terminalroot.com.br/tags#cpp) rápida e completa para criar logs.

---

# Instalação
Ela já está disponível no repositório da maioria dos sistemas operacionais, então para instalá-la basta usar o gerenciador de pacotes correspondente à seu caso:
+ vcpkg: `vcpkg install spdlog`
+ conan: `spdlog/[>=1.4.1]`
+ Homebrew: `brew install spdlog`
+ MacPorts: `sudo port install spdlog`
+ Debian: `sudo apt install libspdlog-dev`
+ FreeBSD: `pkg install spdlog`
+ Fedora: `dnf install spdlog`
+ Gentoo: `emerge dev-libs/spdlog`
+ Arch Linux: `pacman -S spdlog`
+ openSUSE: `sudo zypper in spdlog-devel`
+ conda: `conda install -c conda-forge spdlog`
+ build2: depends: `spdlog ^1.8.2`

Mas, se quiser compilar e instalar manualmente, rode os comandos abaixo:
> Lembrando que você precisa ter a [libfmt]() instalada, pois a SpdLog usa ela como dependência!

{% highlight bash %}
git clone https://github.com/gabime/spdlog
cd spdlog
cmake -B build .
cd build && make -j
sudo make install
cd ../..
rm -rf spdlog
{% endhighlight %}

---

# Utilizando
O uso dela pode ser aplicado em diversas situações, a forma mais básica é o exemplo abaixo:
> `main.cpp`

{% highlight cpp %}
#include "spdlog/spdlog.h"

int main(){
 spdlog::info("Welcome to spdlog!");
 spdlog::error("Some error message with arg: {}", 1);
 
 spdlog::warn("Easy padding in numbers like {:08d}", 12);
 spdlog::critical("Support for int: {0:d};  hex: {0:x};  oct: {0:o}; bin: {0:b}", 42);
 spdlog::info("Support for floats {:03.2f}", 1.23456);
 spdlog::info("Positional args are {1} {0}..", "too", "supported");
 spdlog::info("{:<30}", "left aligned");
 
 spdlog::set_level(spdlog::level::debug); // Set global log level to debug
 spdlog::debug("This message should be displayed..");    
 
 // change log pattern
 spdlog::set_pattern("[%H:%M:%S %z] [%n] [%^---%L---%$] [thread %t] %v");
 
 // Compile time log levels
 // define SPDLOG_ACTIVE_LEVEL to desired level
 SPDLOG_TRACE("Some trace message with param {}", 42);
 SPDLOG_DEBUG("Some debug message");
}

{% endhighlight %}

Para compilar rode sem flags adicionais:
{% highlight cpp %}
g++ main.cpp
./a.out
{% endhighlight %}

Para mais informações acesse o [repositório](https://github.com/gabime/spdlog).



