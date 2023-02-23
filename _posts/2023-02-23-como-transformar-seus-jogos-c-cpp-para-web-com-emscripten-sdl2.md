---
layout: post
title: "Como Transformar seus Jogos C/C++ para Web com Emscripten (SDL2)"
date: 2023-02-23 14:33:37
image: '/assets/img/gamedev/emscripten.jpg'
description: 'Esse vídeo mostra como instalar o EmScripten e como transformar em JavaScript e WebAssembly, transformaremos um exemplo de SDL2 com C++ já feito nesse canal.'
icon: 'ion:terminal-sharp'
iconname: 'Emscripten'
tags:
- gamedev
- cpp
- sdl2
- emscripten
- web
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

[EmScripten](https://emscripten.org/) é um compilador que traduz códigos escritos em [C](https://terminalroot.com.br/tags#linguagemc) e [C++](https://terminalroot.com.br/tags#cpp) para [WebAssembly](https://webassembly.org/), ou para um subconjunto de [JavaScript](https://terminalroot.com.br/tags#javascript) conhecido como `asm.js`).

Os aplicativos compilados com Emscripten possuem mais desempenho e consequentemente são mais rápidos do que o JavaScript interpretado ou compilado dinamicamente .

Nesse vídeo veremos como instalar o EmScripten e como utilizar através de um exemplo que já fizemos aqui no canal no [vídeo sobre SDL2](https://terminalroot.com.br/2023/01/como-instalar-o-sdl2-no-windows-e-linux-para-criar-jogos-c-cpp-e-primeiros-passos.html).

---

# Assista ao vídeo

<iframe width="1253" height="705" src="https://www.youtube.com/embed/c-g5PYBg_VA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

# Arquivos criados e utilizados no vídeo

## `main.cpp`
{% highlight cpp %}

#include <SDL2/SDL.h>
#include <emscripten.h>
#include <iostream>

struct Context {
  std::string title;
  int width, height;
  SDL_Renderer * renderer;
  SDL_Event event;
  SDL_Rect rect, rect2;
  SDL_Texture * logo;
};

void callback(void * arg){
  Context * context = static_cast<Context*>(arg);
    while(SDL_PollEvent(&context->event)){
      if( context->event.type == SDL_QUIT ){
        exit(0);
      }else if( context->event.type == SDL_MOUSEBUTTONDOWN ){
        context->rect2.x -= 20;
      }
    }

    SDL_RenderClear(context->renderer);
    SDL_SetRenderDrawColor(context->renderer, 255, 255, 255, 255);
    //SDL_RenderDrawRect(renderer, &rect2);
    SDL_RenderFillRect(context->renderer, &context->rect2);
    SDL_SetRenderDrawColor(context->renderer, 9, 20, 33, 255);
    SDL_RenderCopy(context->renderer, context->logo, NULL, &context->rect);
    SDL_RenderPresent(context->renderer);
}

int main(int argc, char** argv) {
  Context context;
  SDL_Init(SDL_INIT_EVERYTHING);

  context.title = "SDL2 It's Works!";
  context.width = 1280;
  context.height = 720;

  SDL_Window* window = SDL_CreateWindow(
      context.title.c_str(),
      50, 30,
      context.width, context.height,
      SDL_WINDOW_SHOWN
      );

  SDL_Renderer * renderer = SDL_CreateRenderer(window, -1, 0);
  context.renderer = renderer;


  SDL_Surface * surface = SDL_LoadBMP("./sdl.bmp");
  context.logo = SDL_CreateTextureFromSurface(renderer, surface);
  SDL_FreeSurface(surface);

  context.rect.x = 50;
  context.rect.y = 20;
  context.rect.w = surface->w;
  context.rect.h = surface->h;

  context.rect2.x = 800;
  context.rect2.y = 20;
  context.rect2.w = 300;
  context.rect2.h = 300;

  emscripten_set_main_loop_arg(callback, &context, -1, 1);

  SDL_DestroyTexture(context.logo);
  SDL_DestroyRenderer(renderer);
  SDL_DestroyWindow(window);
  SDL_Quit();
  return 0;
}
{% endhighlight %}

## `index.html`
{% highlight html %}
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <center>
      <canvas id="canvas" oncontextmenu="event.preventDefault()"></canvas>
      <script type='text/javascript'>
        var Module = {
          canvas: (function() { return document.getElementById('canvas'); })()
        };
      </script>
      <script src="index.js"></script>
    </center>
  </body>
</html>
{% endhighlight %}

## Comando para compilar:
{% highlight bash %}
em++ main.cpp -s WASM=1 -s USE_SDL=2 -s USE_SDL_IMAGE=2 -s SDL2_IMAGE_FORMATS='["bmp"]' --preload-files sdl.bmp -o index.html
{% endhighlight %}

---


