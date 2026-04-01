---
layout: post
title: "Como Criar um Raycaster(estilo DOOM) com C++"
date: 2025-03-11 07:06:41
image: '/assets/img/gamedev/raycaster.jpg'
description: "💥 Ray casting é um algoritmo utilizado em tratamento de imagem, e que tem como objetivo a sintetização de imagens 3D."
icon: 'ion:terminal-sharp'
iconname: 'GameDev'
tags:
- gamedev
- sfml
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**Ray casting** é um algoritmo utilizado em tratamento de imagem, e que tem como objetivo a <u>sintetização de imagens 3D</u>. Pode-se definir como sendo o primeiro estágio do algoritmo de *Raytracing*, diferenciando-se deste na sua simplicidade já que o Ray casting não é um método recursivo.

> Esse algoritmo dispara raios a partir do observador de forma a perceber qual a distância que estão os objetos que compõem a cena, um estilo **campo de visão da câmera**.

Ray casting é na verdade utilizado pelo jogo: **Wolfenstein 3D**. **DOOM**, na verdade, utiliza "*Column-based rendering*" que é uma abordagem mais avançada, onde o ambiente é dividido em setores e linhas de visão, mas o resultado é bem similar ao Ray casting, pois ambos são 2D, mas o DOOM é mais considerado um pseudo-3D.

Nesse tutorial veremos o desenvolvimento do zero com [C++](https://terminalroot.com.br/tags#cpp) e [SFML](https://terminalroot.com.br/tags#sfml) passo a passo de como o **Ray casting** funciona.


## 🎥 Assista ao Vídeo
> <https://youtu.be/2JDzJoEscr0>

<iframe width="1243" height="699" src="https://www.youtube.com/embed/2JDzJoEscr0" title="" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

---

## 🚀 Código no GitHub
### <https://github.com/terroo/raycaster>



