---
layout: post
title: "Crie Jogos 2D com Lua e SFML"
date: 2022-07-20 14:14:35
image: '/assets/img/gamedev/luasfml-min.jpg'
description: 'Use SFML em seus scripts feitos com Lua.'
icon: 'ion:terminal-sharp'
iconname: 'Lua/GameDev'
tags:
- lua
- gamedev
- sfml
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

🔊 **LuaSFML** é uma ligação da linguagem de programação [Lua](https://terminalroot.com.br/tags#lua) para a biblioteca de criação de jogos 2D: [SFML](https://terminalroot.com.br/tags#sfml) . 

Ou seja, permite que você use SFML em seus scripts feitos com Lua.

# Assista ao Vídeo

<iframe width="1253" height="705" src="https://www.youtube.com/embed/rF7QXsIc3mo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

# Como instalar o LuaSFML ?
Passos utilizados no vídeo e também descritos no [repositório](https://github.com/terroo/luasfml) do projeto .

# Dependências
+ [gcc/g++](https://gcc.gnu.org/)
+ [SFML](https://www.sfml-dev.org/)
+ [Make](https://www.gnu.org/software/make/)
+ [CMake](https://cmake.org/)
+ [Lua 5.1](https://www.lua.org/)

Examplo no Ubuntu
```bash
sudo apt update
sudo apt install build-essential g++ make cmake lua5.1 liblua5.1-0 liblua5.1-0-dev
```

---

# Compilar e instalar

```bash
git clone https://github.com/terroo/luasfml
cd luasfml
mkdir build && cd build
cmake ..
make
sudo make install
```

### Obteve o erro abaixo ?
```bash
/usr/bin/ld: could not find -llua: No such file or directory
collect2: error: ld returned 1 exit status
make[2]: *** [CMakeFiles/luasfml.dir/build.make:801: luasfml] Erro 1
make[1]: *** [CMakeFiles/Makefile2:84: CMakeFiles/luasfml.dir/all] Erro 2
make: *** [Makefile:136: all] Erro 2
```

Para corrigir no [Ubuntu](https://terminalroot.com.br/tags#ubuntu), por exemplo, rode os comandos abaixo:

```bash
sudo ln -s /usr/lib/x86_64-linux-gnu/liblua5.1.so /usr/lib/x86_64-linux-gnu/liblua.so
```
> Para outros sistemas rode `find /usr/lib* -name 'liblua5.1.so'` para encontrar o arquivo e crie um link simbólico no mesmo diretório. Ou execute o comando abaixo:

```bash
sudo ln -s $(find /usr/lib* -name 'liblua5.1.so') \
           $(find /usr/lib* -name 'liblua5.1.so' | sed 's/5.1//g')
```

E depois rode o comando `make` novamente:

```bash
make
sudo make install
```

Para rodar o exemplo básico
```bash
cd .. # Se estiver dentro do directory `build` ainda
cd assets/
luasfml main.lua
```

Para mais informações acesse o repositório: <https://github.com/terroo/luasfml> .


