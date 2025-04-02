---
layout: post
title: "Conheça o Overload, um motor de jogos C++ com scripts em Lua"
date: 2025-04-02 14:30:51
image: '/assets/img/gamedev/overload.jpg'
description: "🎮 Open-Source 3D Game Engine"
icon: 'ion:terminal-sharp'
iconname: 'GameDev'
tags:
- gamedev
- motores-de-jogos
- 3d
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

[Overload](https://overloadengine.org/) é um [mecanismo de jogo](https://terminalroot.com.br/tags#gamedev) 3D gratuito e de código aberto feito em [C++](https://terminalroot.com.br/tags#cpp) com [Lua](https://terminalroot.com.br/tags#lua) como linguagem de script.

Originalmente criado em 2019 por *Benjamin VIRANIN* , *Max BRUN* e *Adrien GIVRY* como um projeto de graduação, ele evoluiu para uma iniciativa impulsionada pela comunidade e apoiada por dezenas de colaboradores.

### Os pilares do Overload são:
+ 🐣 Facilidade de uso
+ 📄 Documentação
+ 🤝 Comunidade
+ ⚙️ Código C++20 moderno

### Características
+ Script Lua
+ Editor de jogos
+ Renderização baseada em física (PBR)
+ Suporte a shaders personalizados
+ Construção de jogos para Windows
+ Ferramentas de criação de perfil
+ Editor de materiais
+ Áudio espacial
+ Física do corpo rígido
+ E muitos mais virão...

### Arquitetura
O Overload é dividido em 12 módulos: 10 bibliotecas (SDK) e 2 executáveis (Aplicativos).

### Overload SDK
O Overload SDK é o núcleo do mecanismo. É um conjunto de bibliotecas usadas por nossos aplicativos: OvGamee OvEditor. Essas bibliotecas foram prjetadas com a reutilização em mente. Elas são altamente modulares e fáceis de extrair de um contexto de mecanismo de jogo.

+ `OvAnalytics`: Criação de perfil de código e hardware
+ `OvDebug`: Registro e asserções
+ `OvTools`: Serialização, arquivos INI, eventos, relógio
+ `OvMaths`: Vetores, matrizes, quaternions, transformadas
+ `OvAudio`: Envolve irrKlang
+ `OvPhysics`: Envolve Bullet3
+ `OvRendering`: Mecanismo de renderização usando OpenGL
+ `OvWindowing`: GLFW e wrapper de API do Windows
+ `OvUI`: Caro ImGui encapsulado em um sistema de IU baseado em eventos e componentes
+ `OvCore`: Sistema de cena baseado em componentes, script e gerenciamento de recursos

---

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

### Dependências
O Overload depende de algumas bibliotecas de terceiros:
+ [OpenGL](https://terminalroot.com.br/tags#opengl) com GLEW (API gráfica)
+ GLFW (Janela e entradas)
+ Assimp (carregador de modelo 3D)
+ Bullet3 (Física)
+ irrKlang (Áudio)
+ Tinyxml2 (serializador XML)
+ Sol2 (ligação Lua)
+ [ImGui](https://terminalroot.com.br/tags#imgui) (GUI)
+ Premake5 (Geração de projeto)

Para mais informações acesse:
+ <https://overloadengine.org/>
+ <https://github.com/Overload-Technologies/Overload/>
+ <https://github.com/Overload-Technologies/Cargo-Demo>


