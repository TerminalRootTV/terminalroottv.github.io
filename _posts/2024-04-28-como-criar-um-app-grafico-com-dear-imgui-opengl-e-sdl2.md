---
layout: post
title: "Como Criar um App Gráfico com Dear ImGui, OpenGL e SDL2"
date: 2024-04-28 19:56:23
image: '/assets/img/imgui/genpass.jpg'
description: "🎥 Nesse vídeo vamos criar um: Gerador de Senhas Alfanuméricas"
icon: 'ion:terminal-sharp'
iconname: 'Dear ImGui'
tags:
- imgui
- sdl2
- opengl
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

Nesse vídeo vamos criar um simples gerador de senhas alfanuméricas com: [C++](https://terminalroot.com.br/tags#cpp), [Dear ImGui](https://terminalroot.com.br/tags#imgui), [OpenGL](https://terminalroot.com.br/tags#opengl) e [SDL2](https://terminalroot.com.br/tags#sdl2) para treinarmos conceitos fundamentais sobre **Dear ImGui**.

---

# Assista ao Vídeo

<iframe width="1253" height="705" src="https://www.youtube.com/embed/Wru7t8djnto" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

# 👀 Links utilizados no vídeo:
+ 🔗 [Como Compilar Projetos com OpenGL, SDL2 e Dear ImGui](https://terminalroot.com.br/2024/03/como-compilar-projetos-com-opengl-sdl2-e-dear-imgui.html)
+ 🔗 [Como Gerar Senhas com C++](https://terminalroot.com.br/2024/03/como-gerar-senhas-com-cpp.html
+ 🔗 [Como Copiar para área de transferência com C++](https://terminalroot.com.br/2023/12/como-copiar-para-area-de-transferencia-com-cpp.html)

---

# Compilando e rodando o projeto na sua máquina
> Lembre-se de instalar antes as dpendências citadas [nesse artigo](https://terminalroot.com.br/2024/03/como-compilar-projetos-com-opengl-sdl2-e-dear-imgui.html)

```bash
git clone https://github.com/terroo/genpass --recurse-submodules
cd genpass
make
./a.out
```

Caso queria a versão sem a rotina de copiar(com X11), faça um checkout:
```bash
git checkout 447dd22
make
./a.out
```

Acesse o projeto no repositório: <https://github.com/terroo/genpass>.


