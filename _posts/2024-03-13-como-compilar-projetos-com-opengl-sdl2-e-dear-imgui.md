---
layout: post
title: "Como Compilar Projetos com OpenGL, SDL2 e Dear ImGui"
date: 2024-03-13 20:10:23
image: '/assets/img/imgui/opengl-sdl2-imgui.jpg'
description: 'Para desenvolver aplicativos gráficos modernos com C++'
icon: 'ion:terminal-sharp'
iconname: 'Dear ImGui'
tags:
- imgui
- opengl
- sdl2
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Uma das melhores formas de trabalhar com [Dear ImGui](https://terminalroot.com.br/tags#imgui) é unindo com [OpenGL](https://terminalroot.com.br/tags#opengl) e [SDL2](https://terminalroot.com.br/tags#sdl2).

Para conseguirmos seguir esse tutorial, precisaremos das ferramentas devidamente pré-instaladas no nosso sistema. Nós possuímos todos os tutoriais de instalação, são elas:

+ [Como Instalar o SDL2 no Windows e Linux para Criar Jogos C/C++ e Primeiros Passos](https://terminalroot.com.br/2023/01/como-instalar-o-sdl2-no-windows-e-linux-para-criar-jogos-c-cpp-e-primeiros-passos.html)
+ [Aprenda a Usar o Dear ImGui com SDL2](https://terminalroot.com.br/2023/10/aprenda-a-usar-o-dear-imgui-com-sdl2.html)
+ [Tutorial de OpenGL para Iniciantes](https://terminalroot.com.br/2024/02/tutorial-de-opengl-para-iniciantes.html)

Nesse artigo veremos como compilar Dear ImGui com OpenGL e SDL2 no seu sistema, seja ele no [Windows](https://terminalroot.com.br/tags#windows), [macOS](https://terminalroot.com.br/tags#macos) ou [GNU/Linux](https://terminalroot.com.br/tags#gnulinux).

Vamos às etapas!


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

# Etapas

### 1. Clone o repositório do [Dear ImGui](https://terminalroot.com.br/tags#imgui)
{% highlight bash %}
git clone https://github.com/ocornut/imgui/ --depth=1
{% endhighlight %}

### 2. Crie um diretório e um sub-diretório para seu projeto 
{% highlight bash %}
mkdir -p myproject/imgui
{% endhighlight %}

### 3. Copie todos os arquivos do repositório `imgui` listados abaixo para o sub-diretório do seu projeto: `imgui`
{% highlight bash %}
cp imgui/*.cpp imgui/*.h myproject/imgui/
{% endhighlight %}

### 4. Copie também os arquivos adicionais para compilar
{% highlight bash %}
cp imgui/examples/libs/emscripten/emscripten_mainloop_stub.h \
   imgui/backends/imgui_impl_opengl3* \
   imgui/backends/imgui_impl_sdl2* myproject/imgui
{% endhighlight %}

### 5. Crie esse arquivo `main.cpp` na raiz do seu projeto: `myproject/main.cpp` e insira o conteúdo abaixo:
{% highlight cpp %}
#include "imgui/imgui.h"
#include "imgui/imgui_impl_sdl2.h"
#include "imgui/imgui_impl_opengl3.h"
#include <SDL2/SDL.h>
#include <SDL2/SDL_opengles2.h>

#ifdef __EMSCRIPTEN__
#include "imgui/emscripten_mainloop_stub.h"
#endif

int main(){
  SDL_Init(SDL_INIT_VIDEO);
  SDL_Window* window = SDL_CreateWindow(
      "C++, Dear ImGui, SDL2, e OpenGL", 
      SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 
      320, 180, 
      SDL_WINDOW_OPENGL | SDL_WINDOW_RESIZABLE | SDL_WINDOW_ALLOW_HIGHDPI
      );
  SDL_GLContext gl_context = SDL_GL_CreateContext(window);
  SDL_GL_MakeCurrent(window, gl_context);
  SDL_GL_SetSwapInterval(1);

  // ImGui START
  IMGUI_CHECKVERSION();
  ImGui::CreateContext();
  ImGuiIO& io = ImGui::GetIO(); (void)io;
  io.ConfigFlags |= ImGuiConfigFlags_NavEnableKeyboard;
  ImGui::StyleColorsDark();
  ImGui_ImplSDL2_InitForOpenGL(window, gl_context);
  ImGui_ImplOpenGL3_Init("#version 100");

  ImVec4 clear_color = ImVec4(0.45f, 0.55f, 0.60f, 1.00f);

#ifdef __EMSCRIPTEN__
  io.IniFilename = nullptr;
  EMSCRIPTEN_MAINLOOP_BEGIN
#else
    while (true)
#endif
    {

      SDL_Event event;
      while (SDL_PollEvent(&event)) {
        ImGui_ImplSDL2_ProcessEvent(&event);
        if (event.type == SDL_QUIT){
          exit(0);
        }
      }

      ImGui_ImplOpenGL3_NewFrame();
      ImGui_ImplSDL2_NewFrame();
      ImGui::NewFrame();

      ImGui::Begin("Hello, World!");
      ImGui::Text("C++, SDL2, OpenGL e Dear ImGui");
      ImGui::End();

      ImGui::Render();
      glViewport(0, 0, (int)io.DisplaySize.x, (int)io.DisplaySize.y);
      glClearColor(clear_color.x * clear_color.w, clear_color.y * clear_color.w, clear_color.z * clear_color.w, clear_color.w);
      glClear(GL_COLOR_BUFFER_BIT);
      ImGui_ImplOpenGL3_RenderDrawData(ImGui::GetDrawData());
      SDL_GL_SwapWindow(window);
    }
#ifdef __EMSCRIPTEN__
  EMSCRIPTEN_MAINLOOP_END;
#endif

  ImGui_ImplOpenGL3_Shutdown();
  ImGui_ImplSDL2_Shutdown();
  ImGui::DestroyContext();

  SDL_GL_DeleteContext(gl_context);
  SDL_DestroyWindow(window);
  SDL_Quit();

  return 0;
}
{% endhighlight %}

### 6. Crie um [Makefile](https://terminalroot.com.br/tags#make) para compilarmos
{% highlight bash %}
vim Makefile
{% endhighlight %}

E insira o conteúdo abaixo:
{% highlight makefile %}
CXX=g++
TARGET=a.out
IMGUI_DIR = imgui
SOURCES = main.cpp
SOURCES += $(IMGUI_DIR)/imgui.cpp $(IMGUI_DIR)/imgui_demo.cpp $(IMGUI_DIR)/imgui_draw.cpp $(IMGUI_DIR)/imgui_tables.cpp $(IMGUI_DIR)/imgui_widgets.cpp
SOURCES += $(IMGUI_DIR)/imgui_impl_sdl2.cpp $(IMGUI_DIR)/imgui_impl_opengl3.cpp
OBJS = $(addsuffix .o, $(basename $(notdir $(SOURCES))))
UNAME_S := $(shell uname -s)
LINUX_GL_LIBS = -lGL
CXXFLAGS = -std=c++11 -I$(IMGUI_DIR) -I$(IMGUI_DIR)
CXXFLAGS += -g -Wall -Wformat
LIBS =

ifeq ($(UNAME_S), Linux) #LINUX
	ECHO_MESSAGE = "Linux"
	LIBS += $(LINUX_GL_LIBS) -ldl `sdl2-config --libs`

	CXXFLAGS += `sdl2-config --cflags`
	CFLAGS = $(CXXFLAGS)
endif

ifeq ($(UNAME_S), Darwin) #APPLE
	ECHO_MESSAGE = "Mac OS X"
	LIBS += -framework OpenGL -framework Cocoa -framework IOKit -framework CoreVideo `sdl2-config --libs`
	LIBS += -L/usr/local/lib -L/opt/local/lib

	CXXFLAGS += `sdl2-config --cflags`
	CXXFLAGS += -I/usr/local/include -I/opt/local/include
	CFLAGS = $(CXXFLAGS)
endif

ifeq ($(OS), Windows_NT)
    ECHO_MESSAGE = "MinGW"
    LIBS += -lgdi32 -lopengl32 -limm32 `pkg-config --static --libs sdl2`

    CXXFLAGS += `pkg-config --cflags sdl2`
    CFLAGS = $(CXXFLAGS)
endif

%.o:%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

%.o:$(IMGUI_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

%.o:$(IMGUI_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

all: $(TARGET)
	@echo Build complete for $(ECHO_MESSAGE)

$(TARGET): $(OBJS)
	$(CXX) -o $@ $^ $(CXXFLAGS) $(LIBS)

clean:
	rm -f $(TARGET) $(OBJS)
{% endhighlight %}

### 7. Agora é só compilar:
{% highlight bash %}
make
{% endhighlight %}

### 8. E rodar o projeto:
{% highlight bash %}
./a.out
{% endhighlight %}

A possível saída será similar a imagem abaixo:

![Rodando](/assets/img/imgui/gl-sdl2-imgui-cpp.png) 

---

Qualquer dúvida, revise os caminhos de instalação das libs no seu sistema!



