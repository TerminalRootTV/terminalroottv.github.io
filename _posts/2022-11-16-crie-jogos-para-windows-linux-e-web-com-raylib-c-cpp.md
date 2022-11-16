---
layout: post
title: "Crie Jogos para Windows, Linux e Web com Raylib C/C++ "
date: 2022-11-16 19:07:14
image: '/assets/img/gamedev/raylib/raylib.jpg'
description: 'Apesar de ter suporte nativo para C/C++, é possível utilizá-la em outras linguagens de programação como: Lua, Golang, C#, Python, PHP, Java e entre outras.'
icon: 'ion:terminal-sharp'
iconname: 'Desenvolvimento de Games'
tags:
- gamedev
- cpp
- raylib
- linguagemc
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

🔊 Raylib é uma biblioteca utilizada para [desenvolvimento de games](https://terminalroot.com.br/tags#gamedev), no entanto, existem outras áreas de aplicação. Apesar de ter suporte nativo para [C](https://terminalroot.com.br/tags#linguagemc)/[C++](https://terminalroot.com.br/tags#cpp), é possível utilizá-la em outras linguagens de programação como: [Lua](https://terminalroot.com.br/tags#lua), [Golang](https://terminalroot.com.br/tags#go), [C#](https://terminalroot.com.br/tags#csharp), [Python](https://terminalroot.com.br/tags#python), [PHP](https://terminalroot.com.br/tags#php), [Java](https://terminalroot.com.br/tags#java) e entre outras.

Algumas características da Raylib são:
+ Não possui interface clicável, é um biblioteca para programadores que gostam de escrever código;
+ Multiplataforma disponível para: Windows, [GNU](https://terminalroot.com.br/tags#gnu)/[Linux](https://terminalroot.com.br/tags#linux), [macOS](https://terminalroot.com.br/tags#macos), [Android](https://terminalroot.com.br/tags#android), [HTML5](https://terminalroot.com.br/tags#html) e entre outros;
+ Escrita em [C99](https://terminalroot.com.br/tags#linguagemc) ;
+ Suporta gráficos 2D e 3D;
+ É fácil, simples e diferenciada!

---

# Assista ao vídeo
<iframe width="1253" height="705" src="https://www.youtube.com/embed/LZUMVdkWWrg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

# Instalação

## Windows

01. Abra seu navegador
02. Acesse o endereço: <https://github.com/raysan5/raylib>
03. Selecione e clique em `Releases` ao lado direto na tela
04. Role o curso até abaixo e faça o download da versão: [raylib_installer_v4.2.mingw.exe](https://github.com/raysan5/raylib/releases/download/4.2.0/raylib_installer_v4.2.mingw.exe)
05. Após finalizado o download dê um duplo clique no arquivo, clique em *Permitir*
06. Install e Finish
07. Abra o atalho: *[Notepad++ for Raylib]*
08. Como o exemplo que já vai estar aberto, tecle `F6` e depois pressione **[OK]** para compilar

## GNU/Linux
### Dependências:

{% highlight bash %}
# Ubuntu
sudo apt install libasound2-dev mesa-common-dev libx11-dev libxrandr-dev libxi-dev xorg-dev libgl1-mesa-dev libglu1-mesa-dev

# Fedora
sudo dnf install alsa-lib-devel mesa-libGL-devel libX11-devel libXrandr-devel libXi-devel libXcursor-devel libXinerama-devel libatomic

# Arch Linux
sudo pacman -S alsa-lib mesa libx11 libxrandr libxi libxcursor libxinerama
{% endhighlight %}
> Para mais informações [clique aqui](https://github.com/raysan5/raylib/wiki/Working-on-GNU-Linux#build-raylib-using-cmake).

### Instalando a Raylib:

{% highlight bash %}
git clone https://github.com/raysan5/raylib
cd raylib
mkdir build && cd build
cmake -DBUILD_SHARED_LIBS=ON ..
make
sudo make install
sudo cp /usr/local/lib/libraylib.so.420 /usr/lib/ 
{% endhighlight %}
> Já pode remover o diretório que foi clonado: `cd ../.. && rm -rf raylib`

### Copie esse exemplo:
> `main.cpp`

{% highlight cpp %}
#include "raylib.h"

int main(){
  InitWindow(800, 450, "raylib [core] example - basic window");

  while (!WindowShouldClose()){
    BeginDrawing();
    ClearBackground(RAYWHITE);
    DrawText("Congrats! You created your first window!", 190, 200, 20, LIGHTGRAY);
    EndDrawing();
  }

  CloseWindow();
  return 0;
}
{% endhighlight %}

### Compile:
{% highlight bash %}
g++ main.cpp -lraylib -lGL -lm -lpthread -ldl -lrt -lX11
{% endhighlight %}

---

# Imagens e exemplo usados no vídeo

## `sprite.png`
<a href="/assets/img/gamedev/raylib/sprite.png">
 <img src="/assets/img/gamedev/raylib/sprite.png" alt="Carro básico">
</a>

## `bg.png`
<a href="/assets/img/gamedev/raylib/bg.png">
 <img src="/assets/img/gamedev/raylib/bg.png" alt="Fundo para o game">
</a>

## Código utilizado no vídeo 
> `main.cpp`
{% highlight cpp %}
namespace ray {
  #include <raylib.h>
};

int main (){
  ray::InitWindow(1280, 720, "Primeiros passos com a Raylib");

  ray::Texture sprite, bg;
  sprite = ray::LoadTexture("./sprite.png");
  bg = ray::LoadTexture("./bg.png");

  float posx = -sprite.width;

  while( !ray::WindowShouldClose() ){

    posx += 0.9f;
    if( posx > 1280 ){
     posx = -sprite.width; 
    }

    ray::BeginDrawing(); 
    ray::ClearBackground(ray::WHITE);
     ray::DrawText("Primeiros passos com a Raylib", 50, 100, 50, ray::BLACK);
     ray::DrawTexture(bg, 0, 0, ray::WHITE);
     ray::DrawTexture(sprite, posx, 630 - sprite.height, ray::WHITE);
    ray::EndDrawing();
  }

  ray::CloseWindow();

  return 0;
}
{% endhighlight %}

---

# Links Úteis
+ O site oficial da Raylib: <https://www.raylib.com/>
+ Repositório oficial no GitHub: <https://github.com/raysan5/raylib>


