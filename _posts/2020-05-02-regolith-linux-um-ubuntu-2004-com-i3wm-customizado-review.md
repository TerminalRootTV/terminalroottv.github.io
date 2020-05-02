---
layout: post
title: "Regolith Linux - Um Ubuntu 20.04 com i3wm customizado (REVIEW)"
date: 2020-05-02 09:55:06
image: '/assets/img/distros/regolith.jpg'
description: 'Uma mistura de Ubuntu, GNOME Flashback e i3wm.'
icon: 'cib:ubuntu'
iconname: 'ubuntu'
tags:
- ubuntu
- i3wm
- distros
- linux
---

![Regolith Linux - Um Ubuntu 20.04 com i3wm customizado (REVIEW)](/assets/img/distros/regolith.jpg)

O Regolith é um ambiente de desktop moderno projetado para permitir que você trabalhe mais rapidamente, reduzindo o estresse da CPU e uso de memória excessivo e desnecessário. Construído sobre o Ubuntu, GNOME Flashback e i3, o Regolith se baseia em uma base consistente e bem suportada.

### Alguns comandos básicos
+ `Super + shift + ?` - Abre ou Fecha o show-commands
+ `Super + espaço` - Abre o Rofi
+ `Super + enter` - Abre o terminal
+ `Super + shift + q` - Fecha uma janela
+ `Super + shift + e` - Abre um combo para encerrar a sessão

### Já vem com os apps instalados:
+ Vim
+ GNOME Aplicativos
+ LightDM
+ GNOME Terminal
+ Firefox

E todos que são padrão do Ubuntu 20.04

Lembrando que você pode customizar seu Ubuntu sem precisar instalar o Regolith, somente instalando os pacotes:
```sh
sudo add-apt-repository ppa:regolith-linux/release
sudo apt install regolith-desktop i3xrocks-net-traffic i3xrocks-cpu-usage i3xrocks-time
```

Se quiser remover:
```sh
sudo apt remove regolith-desktop i3xrocks-net-traffic i3xrocks-cpu-usage i3xrocks-time
sudo add-apt-repository --remove ppa:regolith-linux/release
sudo apt autoremove
sudo apt autoclean
```

# Assista ao vídeo

<iframe width="1234" height="694" src="https://www.youtube.com/embed/PpIGMj-8wd8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


Site: <https://regolith-linux.org/>
Download: <https://regolith-linux.org/download/>
Github unofficial fork i3wm: <https://github.com/regolith-linux/regolith-i3>

# Veja também
+ [Como Instalar e Configurar o i3wm e o i3blocks](https://www.youtube.com/watch?v=-geUXpuOJBU)
