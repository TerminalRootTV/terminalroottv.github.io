---
layout: post
title: "15 Motores de Jogos feitos com CSharp"
date: 2025-05-19 18:39:52
image: '/assets/img/csharp/motores-csharp/csharp-motores.png'
description: "🎮 Além de uma tabela comparativa, mais bindings e motores que possui CSharp como linguagem de script."
icon: 'ion:terminal-sharp'
iconname: 'C#'
tags:
- csharp
- gamedev
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

[C#](https://terminalroot.com.br/tags#csharp) é uma linguagem popular no [desenvolvimento de jogos](https://terminalroot.com.br/tags#gamedev), amplamente utilizada graças ao [Unity](https://terminalroot.com.br/2025/04/top-100-motores-de-jogos-cpp.html#03-unity), mas não se resume a ele. 

Neste artigo, apresento <b>15 motores de jogos desenvolvidos com C#</b>, mostrando alternativas variadas para quem quer explorar novas opções além dos mais conhecidos, além de uma tabela comparativa, mais bindings e motores que possui C# como linguagem de script.

---

## 01. [MonoGame](https://github.com/MonoGame/MonoGame)
![MonoGame](/assets/img/csharp/motores-csharp/01.png) 

Framework C# baseado no XNA. Foco em multiplataforma.
**Principais jogos:** *Stardew Valley*, *Fez*, *Axiom Verge*.

---

## 02. [SharpGDX](https://github.com/SharpGDX/SharpGDX)
![SharpGDX](/assets/img/csharp/motores-csharp/02.png) 

Port C# do libGDX. Projeto incompleto e desatualizado.
**Principais jogos:** Nenhum conhecido.

---

## 03. [MoonWorks](https://github.com/MoonsideGames/MoonWorks)
![MoonWorks](/assets/img/csharp/motores-csharp/03.png) 

Game engine moderna em C#, baseada em FNA, com design funcional e foco em performance.

---

## 04. [ShapeEngine](https://github.com/DaveGreen-Games/ShapeEngine)
![ShapeEngine](/assets/img/csharp/motores-csharp/04.png) 

Motor 2D em C# para jogos simples com suporte básico de física e UI.
**Principais jogos:** Nenhum conhecido.

---

## 05. [OSU Framework](https://github.com/ppy/osu-framework)
![OSU](/assets/img/csharp/motores-csharp/05.png) 

Framework C# usado para criar o jogo *osu!lazer*. Suporte avançado a UI e animações.
**Principais jogos:** *osu!lazer*.

---

## 06. [FlatRedBall](https://github.com/vchelaru/FlatRedBall)
![FlatRedBall](/assets/img/csharp/motores-csharp/06.png) 

Engine 2D C# com foco educacional e integração com MonoGame.
**Principais jogos:** *The Incredible Baron*, *Tiled Map Editor integrations*.

---

## 07. [FNA](https://github.com/FNA-XNA/FNA)
![FNA](/assets/img/csharp/motores-csharp/07.png) 

Reimplementação do XNA em C#. Alta compatibilidade e estabilidade para porte de jogos.
**Principais jogos:** *Celeste*, *Axiom Verge*, *FEZ* (portado).

---

## 08. [Murder](https://github.com/isadorasophia/murder)
![Murder](/assets/img/csharp/motores-csharp/08.png) 

Game engine 2D ECS em C# com editor embutido. Foco em produtividade.
**Principais jogos:** Internos/experimentais, sem lançamentos de destaque ainda.

---

## 09. [Prowl](https://github.com/ProwlEngine/Prowl)
![Prowl](/assets/img/csharp/motores-csharp/09.png) 

Engine 3D moderna em C#, ainda em desenvolvimento. Usa Vulkan via Veldrid.
**Principais jogos:** Nenhum publicado ainda.

---

## 10. [Stride](https://github.com/stride3d/stride)
![Stride](/assets/img/csharp/motores-csharp/10.png) 

Engine 3D completa em C#. Suporte para VR, PBR, C# scripting e editor robusto.
**Principais jogos:** *Children of the Galaxy*, projetos independentes.

---

## 11. [Duality](https://github.com/AdamsLair/duality)
![Duality](/assets/img/csharp/motores-csharp/11.png) 

Engine C# 2D com editor modular e sistema de plugins.
**Principais jogos:** Nenhum comercial de destaque.

---

## 12. [RogueSharp](https://github.com/FaronBracy/RogueSharp)
![RogueSharp](/assets/img/csharp/motores-csharp/12.png) 

Biblioteca C# para criação de roguelikes (mapas, FOV, pathfinding). Não é uma engine completa.
**Principais jogos:** Usado em protótipos e projetos pessoais.

---

## 13. [SadConsole](https://github.com/Thraka/SadConsole)
![SadConsole](/assets/img/csharp/motores-csharp/13.png) 

Biblioteca C# para jogos estilo console/roguelike. Baseado em grids e tiles ASCII.
**Principais jogos:** Nenhum conhecido publicamente.

---

## 14. [StereoKit](https://github.com/StereoKit/StereoKit) (com C++)
![StereoKit](/assets/img/csharp/motores-csharp/14.png) 

Framework para AR/VR em C# e C++. Suporte a OpenXR, HoloLens, Quest.
**Principais jogos:** Usado em experiências XR, não jogos comerciais.

---

## 15. [NeoAxis](https://github.com/NeoAxis/NeoAxisEngine) (com C++)
![NeoAxis](/assets/img/csharp/motores-csharp/15.png) 

Engine 3D C# + C++ com editor integrado, voltada para visualizações e jogos.
**Principais jogos:** Nenhum de grande destaque.

---

## Tabela comparativa

| Nome              | Linguagem | 2D | 3D | Editor Incluso | Ativo?  | Jogos Conhecidos                       | Link                                                     |
| ----------------- | --------- | -- | -- | -------------- | ------- | -------------------------------------- | -------------------------------------------------------- |
| **MonoGame**      | C#        | ✔️ | ✖️ | ✖️             | ✔️      | *Stardew Valley*, *Fez*, *Axiom Verge* | [GitHub](https://github.com/MonoGame/MonoGame)           |
| **SharpGDX**      | C#        | ✔️ | ✔️ | ✖️             | ✖️      | Nenhum                                 | [GitHub](https://github.com/SharpGDX/SharpGDX)           |
| **MoonWorks**     | C#        | ✔️ | ✖️ | ✖️             | ✔️      | Nenhum                                 | [GitHub](https://github.com/MoonsideGames/MoonWorks)     |
| **ShapeEngine**   | C#        | ✔️ | ✖️ | Parcial        | ✔️      | Nenhum                                 | [GitHub](https://github.com/DaveGreen-Games/ShapeEngine) |
| **osu!framework** | C#        | ✔️ | ✖️ | ✔️             | ✔️      | *osu!lazer*                            | [GitHub](https://github.com/ppy/osu-framework)           |
| **FlatRedBall**   | C#        | ✔️ | ✖️ | ✔️             | ✔️      | *The Incredible Baron*                 | [GitHub](https://github.com/vchelaru/FlatRedBall)        |
| **FNA**           | C#        | ✔️ | ✖️ | ✖️             | ✔️      | *Celeste*, *Axiom Verge*, *FEZ*        | [GitHub](https://github.com/FNA-XNA/FNA)                 |
| **Murder**        | C#        | ✔️ | ✖️ | ✔️             | ✔️      | Nenhum público                         | [GitHub](https://github.com/isadorasophia/murder)        |
| **Prowl**         | C#        | ✖️ | ✔️ | Parcial        | ✔️      | Nenhum                                 | [GitHub](https://github.com/ProwlEngine/Prowl)           |
| **Stride**        | C#        | ✔️ | ✔️ | ✔️             | ✔️      | *Children of the Galaxy*               | [GitHub](https://github.com/stride3d/stride)             |
| **Duality**       | C#        | ✔️ | ✖️ | ✔️             | Parcial | Nenhum                                 | [GitHub](https://github.com/AdamsLair/duality)           |
| **RogueSharp**    | C#        | ✔️ | ✖️ | ✖️             | ✔️      | Nenhum                                 | [GitHub](https://github.com/FaronBracy/RogueSharp)       |
| **SadConsole**    | C#        | ✔️ | ✖️ | Parcial        | ✔️      | Nenhum                                 | [GitHub](https://github.com/Thraka/SadConsole)           |
| **StereoKit**     | C#/C++    | ✖️ | ✔️ | Parcial        | ✔️      | XR demos                               | [GitHub](https://github.com/StereoKit/StereoKit)         |
| **NeoAxis**       | C#/C++    | ✔️ | ✔️ | ✔️             | ✔️      | Nenhum relevante                       | [GitHub](https://github.com/NeoAxis/NeoAxisEngine)       |

* "Editor Incluso" considera editor visual ou editor de cena.
* "Parcial" significa que possui algum nível de editor mas não completo.
* "Ativo?"" refere-se a atividade recente no GitHub (últimos meses).

---

## Bibliotecas que possui *bindings* para C#
> Ou que possui CSharp como linguagem de script.

### 01. [SFML](https://terminalroot.com.br/tags#sfml)
[SFML.NET](https://www.sfml-dev.org/download/sfml.net/) é o binding oficial do SFML para a família de idiomas .NET (C#, VB.NET, C ++/CLI, etc.). 

Ele é construído sobre a ligação C, CSFML, para garantir a máxima compatibilidade entre as plataformas. A API do SFML.NET está próxima do C ++ One, mas no estilo .NET: As convenções de nomeação são diferentes, o manuseio de eventos usa suporte a eventos nativos, etc. 

Endereço oficial: <https://www.sfml-dev.org/download/sfml.net/>

---

### 02. [Raylib](https://terminalroot.com.br/tags#raylib)
Existem diversos bindings de CSharp para Raylib, dentre eles:

+ [raylib-cs](https://github.com/raylib-cs/raylib-cs)
+ [Raylib-CsLo](https://github.com/NotNotTech/Raylib-CsLo)
+ [Raylib-CSharp-Vinculum](https://github.com/ZeroElectric/Raylib-CSharp-Vinculum)
+ [Raylib-CSharp](https://github.com/MrScautHD/Raylib-CSharp)

Nós possuímos um vídeo introdutório a CSharp e um protótipo de jogo com [CSharp](https://terminalroot.com.br/tags#csharp) e [Raylib](https://terminalroot.com.br/tags#raylib), veja em:
+ [Aprenda CSharp em 30 Minutos e crie um Jogo com Raylib](https://terminalroot.com.br/2023/07/aprenda-csharp-em-30-minutos-e-crie-um-jogo-com-raylib.html)

---

### 03. [SDL](https://terminalroot.com.br/tags#sdl)
O [SDL](https://terminalroot.com.br/tags#sdl) também possui bindings para CSharp, em duas versões:

+ Para **SDL2.0**: [SDL2-CS](https://github.com/flibitijibibo/SDL2-CS)
+ E para o **SDL 3.0**: [SDL3-CS](https://github.com/flibitijibibo/SDL3-CS)

---

### 04. [Allegro](https://terminalroot.com.br/tags#allegro)
O [AllegroDotNet](https://github.com/sub-c/AllegroDotNet) é uma biblioteca para .*NET Standard 2.0* ou *.NET 6+* para o Allegro 5. Compatível com AOT nativo (.NET 8).

---

### 05. Motores que possui CSharp para script
Trata-se de motores feito com [C++](https://terminalroot.com.br/tags#cpp), mas possui CSharp como linguagem de script para desenvolvimentos dos games:

+ [UnrealSharp](https://github.com/UnrealSharp/UnrealSharp)
+ [Unity](https://terminalroot.com.br/2025/04/top-100-motores-de-jogos-cpp.html#03-unity)
+ [Godot C#](https://docs.godotengine.org/en/stable/tutorials/scripting/c_sharp/index.html)

---

## Veja também
### [Top 100 Motores de Jogos C++](https://terminalroot.com.br/2025/04/top-100-motores-de-jogos-cpp.html)

