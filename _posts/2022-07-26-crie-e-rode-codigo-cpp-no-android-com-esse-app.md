---
layout: post
title: "Crie e Rode Código C++ no Android com esse App"
date: 2022-07-26 18:02:04
image: '/assets/img/cpp/android.jpg'
description: 'Serve para: testar seu: game, app e outros, além de ser um forma de distração e treinamento .'
icon: 'ion:terminal-sharp'
iconname: 'C++/Android'
tags:
- cpp
- android
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

Nesse vídeo vamos ver alguns recursos do CXX Droid, tais como:

+ Bibliotecas como SFML, ALlegro e mais precisamente: o SDL2 e entre outras .
+ Como escrever seu código C++ e compilar pelo terminal no Android .
+ E também dica de outro aplicativo para treinar C++
+ Além de uma review geral do aplicativo.

---

# Assista ao Vídeo

<iframe width="1253" height="705" src="https://www.youtube.com/embed/q0JwQJb9KjE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

# Código e links citados no vídeo

Código do `sdl-main.cpp` :
> Que foi o exemplo para mostrar o SDL2 funcionando no Android!

{% highlight cpp %}
// Modificado de: https://gist.github.com/jrdmcgr/7253017
#include <SDL2/SDL.h>
#include <stdio.h>

int x, y;
Uint32 buttons;

void clear(SDL_Renderer * renderer) {
  SDL_SetRenderDrawColor(renderer, 0, 0, 255, 255);
  SDL_RenderClear(renderer);
  SDL_RenderPresent(renderer);
}

void draw(SDL_Renderer * renderer, SDL_Rect * rect) {
  SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255);
  SDL_RenderFillRect(renderer, rect);
  SDL_RenderPresent(renderer);
}

int main(int argc, char* argv[]) {

  SDL_Window *window;
  SDL_Renderer *renderer;

  SDL_Init(SDL_INIT_VIDEO);

  window = SDL_CreateWindow(
      "Movendo Quadrado com Clique do Mouse com SDL2",
      SDL_WINDOWPOS_UNDEFINED,
      SDL_WINDOWPOS_UNDEFINED,
      640,
      480,
      SDL_WINDOW_OPENGL
      );

  if (window == NULL) {
    printf("Could not create window: %s\n", SDL_GetError());
    return 1;
  }

  renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);

  if (renderer == NULL) {
    printf("Could not create window: %s\n", SDL_GetError());
    return 1;
  }

  SDL_Rect rectangle = {
    .x = 10,
    .y = 10,
    .w = 100,
    .h = 100
  };

  clear(renderer);

  int quit = 0;
  while (!quit) {
    SDL_Event event;
    while (SDL_PollEvent(&event)) {
      if (event.type == SDL_QUIT) {
        quit = 1;
        puts("QUIT!");
        break;
      }

      buttons = SDL_GetMouseState(&x, &y);

      if ((buttons & SDL_BUTTON_LMASK) != 0) {
        rectangle.x +=10;
        rectangle.x = x;
        rectangle.y = y;
      }

    }
    SDL_PumpEvents();  // make sure we have the latest mouse state.

    clear(renderer);
    draw(renderer, &rectangle);
  }

  SDL_DestroyRenderer(renderer);
  SDL_DestroyWindow(window);
  SDL_Quit();
  return 0;
}
{% endhighlight %}

---

👀 Links:
+ 🔗 [Como Verificar Qual o Sistema Operacional com C++](https://terminalroot.com.br/2022/07/como-verificar-qual-o-sistema-operacional-com-cpp.html)
+ 🔗 [CXX Droid](https://play.google.com/store/apps/details?id=ru.iiec.cxxdroid)
+ 🔗 [C++ Quiz](https://play.google.com/store/apps/details?id=com.vsklamm.cppquiz)



