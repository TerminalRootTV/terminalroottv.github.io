---
layout: post
title: "Jogue Hyperball feito com C++ e SFML"
date: 2026-10-25 01:54:14
image: '/assets/img/gamedev/hyperball.png'
description: "🔳 Simples jogo de futebol feito com C++ e SFML, baseado no Hyperball online"
icon: 'ion:terminal-sharp'
iconname: 'GameDev'
tags:
- sfml
- gamedev
- cpp
- cmake
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

## Dependências:
+ Compilador C++: GCC ou Clang
+ SFML 2.6
+ CMake

---

## Clone, compile e rode:
{% highlight bash %}
git clone https://github.com/terroo/hyperball
cd hyperball
cmake . -B build
cmake --build build
./build/hyperball
{% endhighlight %}

---

> Se quiser debugar:
{% highlight bash %}
g++ -std=c++23 -O2 -fno-omit-frame-pointer -Wfloat-conversion -Wsign-conversion -Wnull-dereference -Wdouble-promotion -Wformat=2 -Wcast-align -Wconversion -g -Wall -Werror -Wextra -Wshadow -Wpedantic -fsanitize=address -fsanitize=undefined -fsanitize=leak main.cpp hyperball.cpp -lsfml-graphics -lsfml-window -lsfml-system
{% endhighlight %}

