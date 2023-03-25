---
layout: post
title: "Como Instalar o SDL2 no Windows e Linux para Criar Jogos C/C++ e Primeiros Passos"
date: 2023-01-19 19:07:10
image: '/assets/img/gamedev/sdl2.jpg'
description: '🔊 SDL2 é uma biblioteca para criação de jogos 2D em C e C++, além de possuir bindings para diversas linguagens de programação.'
icon: 'ion:terminal-sharp'
iconname: 'GameDev'
tags:
- sdl2
- gamedev
- cpp
- linguagemc
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

🔊 SDL2 é uma biblioteca para criação de jogos 2D em C e C++, além de possuir bindings para diversas linguagens de programação. Nesse vídeo vamos ver como instalar no Windows e no Linux além de primeiros passos e dicas adicionais!

### Links úteis:
+ Site oficial do SDL2: <https://libsdl.org/>
+ Repositório no GitHub: <https://github.com/libsdl-org/SDL>
+ Repositório para Imagens: <https://github.com/libsdl-org/SDL_Image>
+ Repositório para Fontes: <https://github.com/libsdl-org/SDL_TTF>

### Veja também:
+ [Crie e Rode Código C++ no Android com esse App](https://terminalroot.com.br/2022/07/crie-e-rode-codigo-cpp-no-android-com-esse-app.html)
+ 

---

# Assista ao Vídeo

<iframe width="1253" height="705" src="https://www.youtube.com/embed/9IcIKdjSvfc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

# Arquivos para Download

## Arquivo para Teste Inicial: `main.cpp`
Ser ve tanto para [Windows](https://terminalroot.com.br/tags#windows) quanto para [Linux](https://terminalroot.com.br/tags#linux).

{% highlight cpp %}
#include <SDL2/SDL.h>

int main(int argc, char** argv) {
  SDL_Window* window = NULL;
  window = SDL_CreateWindow(
      "SDL2 It's Work!",
      SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
      640, 480,
      SDL_WINDOW_SHOWN
      );
  SDL_Renderer * renderer = SDL_CreateRenderer(window, -1, 0);
  SDL_SetRenderDrawColor(renderer, 9, 20, 33, 255);
  while(true){
    SDL_Event event;
    while(SDL_PollEvent(&event)){
      if( event.type == SDL_QUIT ){
        exit(0);
      }
    }
    SDL_RenderClear(renderer);
    SDL_RenderPresent(renderer);
  }
  SDL_DestroyRenderer(renderer);
  SDL_DestroyWindow(window);
  //SDL_Quit();
  return 0;
}
{% endhighlight %}

---

## Imagem utilizada de Exemplo
![SDL Bitmap](/assets/img/gamedev/sdl.bmp) 

---

## Código Feito no Vídeo

{% highlight cpp %}
#include <SDL2/SDL.h>

int main(int argc, char** argv) {
  SDL_Init(SDL_INIT_EVERYTHING);

  SDL_Window* window = SDL_CreateWindow(
      "SDL2 It's Works!",
      50, 30,
      1280, 720,
      SDL_WINDOW_SHOWN
      );

  SDL_Renderer * renderer = SDL_CreateRenderer(window, -1, 0);


  SDL_Surface * surface = SDL_LoadBMP("./sdl.bmp");
  SDL_Texture * logo = SDL_CreateTextureFromSurface(renderer, surface);
  SDL_FreeSurface(surface);

  SDL_Rect rect, rect2;
  rect.x = 50;
  rect.y = 20;
  rect.w = surface->w;
  rect.h = surface->h;

  rect2.x = 800;
  rect2.y = 20;
  rect2.w = 300;
  rect2.h = 300;

  while(true){
    SDL_Event event;
    while(SDL_PollEvent(&event)){
      if( event.type == SDL_QUIT ){
        exit(0);
      }else if( event.type == SDL_MOUSEBUTTONDOWN ){
        rect2.x -= 20;
      }
    }

    SDL_RenderClear(renderer);
    SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
    //SDL_RenderDrawRect(renderer, &rect2);
    SDL_RenderFillRect(renderer, &rect2);
    SDL_SetRenderDrawColor(renderer, 9, 20, 33, 255);
    SDL_RenderCopy(renderer, logo, NULL, &rect);
    SDL_RenderPresent(renderer);
  }

  SDL_DestroyTexture(logo);
  SDL_DestroyRenderer(renderer);
  SDL_DestroyWindow(window);
  SDL_Quit();
  return 0;
}
{% endhighlight %}

---


