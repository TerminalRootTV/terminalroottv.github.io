---
layout: post
title: "Aprenda a Usar o Dear ImGui com SDL2"
date: 2023-10-21 16:20:15
image: '/assets/img/sdl2/sdl2imgui.jpg'
description: '🔊 Nesse vídeo veremos como implementar o Dear ImGui ao SDL2.'
icon: 'ion:terminal-sharp'
iconname: 'SDL2/Dear ImGui'
tags:
- sdl2
- sdl
- imgui
- cpp
- gamedev
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

🔊 Nesse vídeo veremos como implementar o [Dear ImGui](https://github.com/ocornut/imgui) ao [SDL2](https://terminalroot.com.br/tags#sdl2).

O **Dear ImGui**, em resumo, para quem ainda não o conhece, ele cria janelas de modo imediato. Isso quer dizer que você não cria interfaces gráficas do zero com o Dear ImGui. 

Ele usa alguma biblioteca que possui janelas gráficas e sobrepõe seus widgets nessa janela para facilitar alterações e configurações sem precisar sair da tela que você está.

---

# Assista ao Vídeo

<iframe width="1253" height="705" src="https://www.youtube.com/embed/HT1MFDfcNmo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

# Códigos utilizados no vídeo

#### `main.cpp`
```cpp
#include "sdl2imgui/imgui.h"
#include "sdl2imgui/imgui_impl_sdl2.h"
#include "sdl2imgui/imgui_impl_sdlrenderer2.h"
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

  IMGUI_CHECKVERSION();
  ImGui::CreateContext();
  ImGuiIO& io = ImGui::GetIO(); (void)io;
  ImGui_ImplSDL2_InitForSDLRenderer(window, renderer);
  ImGui_ImplSDLRenderer2_Init(renderer);

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

  float imcolor[4] = { (float)0 / 255, (float)255 / 255, (float)64 / 255, (float)64 / 255 };

  while(true){
    SDL_Event event;
    while(SDL_PollEvent(&event)){
      ImGui_ImplSDL2_ProcessEvent(&event);
      if( event.type == SDL_QUIT ){
        exit(0);
      }/*else if( event.type == SDL_MOUSEBUTTONDOWN ){
        rect2.x -= 20;
      }*/
    }

    ImGui_ImplSDLRenderer2_NewFrame();
    ImGui_ImplSDL2_NewFrame();
    ImGui::NewFrame();

    ImGui::Begin("SDL2 com Dear ImGui");
    ImGui::Text("Isso é só um Olá Mundo básico");
    ImGui::ColorEdit4("Change BG SDL2", imcolor);
    ImGui::End();
    ImGui::Render();

    SDL_RenderClear(renderer);
    SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
    //SDL_RenderDrawRect(renderer, &rect2);
    SDL_RenderFillRect(renderer, &rect2);
    SDL_SetRenderDrawColor(renderer, imcolor[0] * 255, imcolor[1] * 255, imcolor[2] * 255, imcolor[3] * 255);
    SDL_RenderCopy(renderer, logo, NULL, &rect);
    ImGui_ImplSDLRenderer2_RenderDrawData(ImGui::GetDrawData());
    SDL_RenderPresent(renderer);
  }

  ImGui_ImplSDL2_Shutdown();
  ImGui::DestroyContext();
  SDL_DestroyTexture(logo);
  SDL_DestroyRenderer(renderer);
  SDL_DestroyWindow(window);
  SDL_Quit();
  return 0;
}
```

#### `Makefile`
```makefile
TARGET=a.out
CXX=g++ -std=c++17
DEBUG=-g
OPT=-O0
WARN=-Wall
SDL2=`pkg-config --cflags --libs sdl2`
INCSDL2=-I /usr/include/SDL2
CXXFLAGS=$(DEBUG) $(OPT) $(WARN) $(SDL2)
LD=g++
OBJS= main.o imgui.o imgui_draw.o imgui_impl_sdl2.o imgui_impl_sdlrenderer2.o imgui_tables.o imgui_widgets.o
all: $(OBJS)
	$(LD) -o $(TARGET) $(OBJS) $(CXXFLAGS)
	@rm *.o
	@./$(TARGET)

main.o: main.cpp
	$(CXX) -c $(CXXFLAGS) main.cpp -o main.o

imgui.o: sdl2imgui/imgui.cpp
	$(CXX) -c $(DEBUG) $(OPT) sdl2imgui/imgui.cpp -o imgui.o

imgui_draw.o: sdl2imgui/imgui_draw.cpp
	$(CXX) -c $(DEBUG) $(OPT) sdl2imgui/imgui_draw.cpp -o imgui_draw.o

imgui_impl_sdl2.o: sdl2imgui/imgui_impl_sdl2.cpp
	$(CXX) $(INCSDL2) -c $(DEBUG) $(OPT) sdl2imgui/imgui_impl_sdl2.cpp -o imgui_impl_sdl2.o

imgui_impl_sdlrenderer2.o: sdl2imgui/imgui_impl_sdlrenderer2.cpp
	$(CXX) $(INCSDL2) -c $(DEBUG) $(OPT) sdl2imgui/imgui_impl_sdlrenderer2.cpp -o imgui_impl_sdlrenderer2.o

imgui_tables.o: sdl2imgui/imgui_tables.cpp
	$(CXX) -c $(DEBUG) $(OPT) sdl2imgui/imgui_tables.cpp -o imgui_tables.o

imgui_widgets.o: sdl2imgui/imgui_widgets.cpp
	$(CXX) -c $(DEBUG) $(OPT) sdl2imgui/imgui_widgets.cpp -o imgui_widgets.o

```

---

# 👀 Links úteis:
+ 🔗 [Como Instalar o SDL2 no Windows e Linux para Criar Jogos C/C++ e Primeiros Passos:](https://www.youtube.com/watch?v=9IcIKdjSvfc)
+ 🔗 [Como Usar Imagens PNG e JPG com SDL2 images no Windows:](https://terminalroot.com.br/2023/03/como-usar-imagens-png-e-jpg-com-sdl2-images-no-windows.html)
+ 🔗 [Como Transformar seus Jogos C/C++ para Web com Emscripten (SDL2):](https://terminalroot.com.br/2023/02/como-transformar-seus-jogos-c-cpp-para-web-com-emscripten-sdl2.html)
+ 🔗 [Como Implementar Dear ImGUi com SFML no Windows 10:](https://terminalroot.com.br/2022/07/como-implementar-dear-imgui-com-sfml-no-windows-10.html)
+ 🔗 [Como Criar Interfaces Gráficas com Dear ImGui e SFML:](https://www.youtube.com/watch?v=XmiEkoqodcg)
+ 🔗 [Faça Testes Unitários e Benchmark para C++ Moderno com Catch2:](https://terminalroot.com.br/2023/10/faca-testes-unitarios-e-benchmark-para-cpp-moderno-com-catch2.html)


