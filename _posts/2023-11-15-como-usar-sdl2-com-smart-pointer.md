---
layout: post
title: "Como usar SDL2 com SMART POINTER"
date: 2023-11-15 14:09:35
image: '/assets/img/sdl2/sdl2-smart-pointer.jpg'
description: '🔊 Nesse vídeo veremos que utilizar Ponteiros Inteligentes com SDL2 possui algumas particularidades.'
icon: 'ion:terminal-sharp'
iconname: 'SDL2/C++'
tags:
- sdl2
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

🔊 Nesse vídeo veremos que utilizar [Ponteiros Inteligentes](https://terminalroot.com.br/2022/08/entenda-ponteiros-inteligentes-em-cpp-smart-pointers.html) com [SDL2](https://terminalroot.com.br/tags#sdl2) possui algumas particularidades devido a *Estrutura de Dados do SDL* que se diferencia como o [C++](https://terminalroot.com.br/tags#cpp) trata esses objetos.

---

# Assista ao Vídeo

<iframe width="1253" height="705" src="https://www.youtube.com/embed/fOkJP4eO32I" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

# Códigos Feitos e Usados no Vídeo


<!-- SQUARE - GAMES ROOT -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

#### Código Procedural com SMART POINTER
> `main.cpp`
{% highlight cpp %}
#include <SDL2/SDL.h>
#include <memory>

struct SDLContext {
  SDLContext(){
    SDL_Init(SDL_INIT_EVERYTHING);
  }

  ~SDLContext(){
    SDL_Quit();
  }
};

int main() {

  auto sdlContext = std::make_unique<SDLContext>();

  std::unique_ptr<SDL_Window, void(*)(SDL_Window*)> window(
     SDL_CreateWindow(
      "SDL2 It's Works!",
      50, 30,
      1280, 720,
      SDL_WINDOW_SHOWN
      ),
     SDL_DestroyWindow
  );

  std::unique_ptr<SDL_Renderer, void(*)(SDL_Renderer*)> renderer(
     SDL_CreateRenderer(window.get(), -1, 0),
     SDL_DestroyRenderer

  );

  std::unique_ptr<SDL_Surface, void(*)(SDL_Surface*)> surface(
    SDL_LoadBMP("./sdl.bmp"),
    SDL_FreeSurface

  );

  std::unique_ptr<SDL_Texture, void(*)(SDL_Texture*)> logo(
      SDL_CreateTextureFromSurface(renderer.get(), surface.get()),
      SDL_DestroyTexture
  );

   std::unique_ptr<SDL_Rect, void(*)(SDL_Rect*)> rect(
      new SDL_Rect{50, 20, surface->w, surface->h}, 
      [](SDL_Rect * r){delete r;}
   ); 

   std::unique_ptr<SDL_Rect, void(*)(SDL_Rect*)> rect2(
      new SDL_Rect{800, 20, 300, 300}, 
      [](SDL_Rect * r){delete r;}
   ); 

  while(true){
    SDL_Event event;
    while(SDL_PollEvent(&event)){
      if( event.type == SDL_QUIT ){
        exit(0);
      }else if( event.type == SDL_MOUSEBUTTONDOWN ){
        rect2->x -= 20;
      }
    }

    SDL_RenderClear(renderer.get());
    SDL_SetRenderDrawColor(renderer.get(), 255, 255, 255, 255);
    SDL_RenderFillRect(renderer.get(), rect2.get());
    SDL_SetRenderDrawColor(renderer.get(), 9, 20, 33, 255);
    SDL_RenderCopy(renderer.get(), logo.get(), NULL, rect.get());
    SDL_RenderPresent(renderer.get());
  }

  return 0;
}
{% endhighlight %}
> Compile: `g++ -Wall -Werror -Wextra -pedantic -g -fsanitize=address main.cpp -lSDL2`


<!-- RECTANGLE LARGE -->
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Informat -->
<ins class="adsbygoogle"
style="display:block"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="2327980059"
data-ad-format="auto"
data-full-width-responsive="true"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

#### Código com OPP com SMART POINTER
> `smart.hpp`

{% highlight cpp %}
#pragma once

#include <SDL2/SDL.h>
#include <stdexcept>
#include <memory>

extern std::unique_ptr<SDL_Window, decltype(&SDL_DestroyWindow)> window;
extern std::unique_ptr<SDL_Renderer, decltype(&SDL_DestroyRenderer)> renderer;
extern std::unique_ptr<SDL_Surface, decltype(&SDL_FreeSurface)> surface;
extern std::unique_ptr<SDL_Texture, decltype(&SDL_DestroyTexture)> logo;
//extern std::unique_ptr<SDL_Window, void(*)(SDL_Window*)> window;

struct SDLContext {
  SDLContext();
  ~SDLContext();
};

class SmartSdlOop {
  std::unique_ptr<SDLContext> sdlContext;
  std::unique_ptr<SDL_Rect> rect, rect2;
  std::unique_ptr<SDL_Event> event;

  public:
    SmartSdlOop();
    void run();
};
{% endhighlight %}

> `smart.cpp`
{% highlight cpp %}
#include "smart.hpp"

std::unique_ptr<SDL_Window, void(*)(SDL_Window*)> window(nullptr, SDL_DestroyWindow);
std::unique_ptr<SDL_Renderer, void(*)(SDL_Renderer*)> renderer(nullptr, SDL_DestroyRenderer);
std::unique_ptr<SDL_Surface, void(*)(SDL_Surface*)> surface(nullptr, SDL_FreeSurface);
std::unique_ptr<SDL_Texture, void(*)(SDL_Texture*)> logo(nullptr, SDL_DestroyTexture);

SDLContext::SDLContext() {
  if (SDL_Init(SDL_INIT_EVERYTHING  & ~(SDL_INIT_TIMER | SDL_INIT_HAPTIC)) != 0) {
    throw std::runtime_error("Erro ao inicializar o SDL2: " + std::string(SDL_GetError()));
  }
  //SDL_Init(SDL_INIT_EVERYTHING);
}

SDLContext::~SDLContext() {
  SDL_Quit();
}

SmartSdlOop::SmartSdlOop(){

  sdlContext = std::make_unique<SDLContext>();

  window.reset(SDL_CreateWindow("SDL2 It's Works!", 50, 30, 1280, 720, SDL_WINDOW_SHOWN));
  renderer.reset(SDL_CreateRenderer(window.get(), -1, 0));
  surface.reset(SDL_LoadBMP("./sdl.bmp"));
  logo.reset(SDL_CreateTextureFromSurface(renderer.get(), surface.get()));
  rect.reset(new SDL_Rect{50, 20, surface->w, surface->h});
  rect2.reset(new SDL_Rect{ 800, 20, 300, 300 });
  event = std::make_unique<SDL_Event>();
}

void SmartSdlOop::run(){
  while(true){
    while(SDL_PollEvent(event.get())){
      if( event->type == SDL_QUIT ){
        exit(0);
      }else if( event->type == SDL_MOUSEBUTTONDOWN ){
        rect2->x -= 20;
      }
    }

    SDL_RenderClear(renderer.get());
    SDL_SetRenderDrawColor(renderer.get(), 255, 255, 255, 255);
    SDL_RenderFillRect(renderer.get(), rect2.get());
    SDL_SetRenderDrawColor(renderer.get(), 9, 20, 33, 255);
    SDL_RenderCopy(renderer.get(), logo.get(), NULL, rect.get());
    SDL_RenderPresent(renderer.get());
  }
}
{% endhighlight %}

> `main.cpp`
{% highlight cpp %}
#include "smart.hpp"

int main(){
  auto smart = std::make_unique<SmartSdlOop>();
  smart->run();
  return 0;
}
{% endhighlight %}

> `CMakeLists.txt`
{% highlight cmake %}
cmake_minimum_required(VERSION 3.27.4)

project(SDL2_DESK_PROCEDURAL)

add_compile_options(-Wall -Wextra -Wpedantic -Wall -Werror -Wextra -pedantic -g -O2)

find_package(SDL2 REQUIRED)
include_directories(${SDL2_INCLUDE_DIRS})

add_executable(a.out main.cpp smart.cpp)
target_link_libraries(a.out ${SDL2_LIBRARIES})

# Copia a imagem para dentro do build
file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/sdl.bmp
     DESTINATION ${CMAKE_CURRENT_BINARY_DIR})
{% endhighlight %}

Compile e rode:
{% highlight bash %}
cmake -B build .
cd build && make
./a.out
{% endhighlight %}

---

# 👀 Veja também:
+ [🔗 Instale o CSFML, o SFML para Linguagem C](https://terminalroot.com.br/2023/11/instale-o-csfml-o-sfml-para-linguagem-c.html)
+ [🔗 Jogue Pac-Man no Terminal](https://terminalroot.com.br/2023/11/jogue-pac-man-no-terminal.html)
+ [🔗 As 10 Melhores Extensões do VSCode para C/C++](https://terminalroot.com.br/2023/11/as-10-melhores-extensoes-do-vscode-para-c-cpp.html)
+ [🔗 Utilize C++ com Mustache](https://terminalroot.com.br/2023/11/utilize-cpp-com-mustache.html)

---

+ ✅ Aprenda Criação de Games com C++ e SFML: <https://terminalroot.com.br/games>
+ ✅ Pacote Promocional C++: <https://terminalroot.com.br/promo>
+ ✅ Aprenda C++ e Qt: <https://terminalroot.com.br/cpp>
+ ✅ Conheça nossos Cursos: <https://bit.ly/CursosTerminalRoot>
+ 🎁 Todos os Cursos na Udemy: <https://bit.ly/UdemyTerminalRoot>




