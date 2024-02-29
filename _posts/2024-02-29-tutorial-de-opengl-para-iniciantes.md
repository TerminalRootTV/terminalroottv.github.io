---
layout: post
title: "Tutorial de OpenGL para Iniciantes"
date: 2024-02-29 11:31:40
image: '/assets/img/cpp/opengl.jpg'
description: 'OpenGL é uma API gráfica que possui várias versões, cada uma introduzindo novos recursos e funcionalidades.'
icon: 'ion:terminal-sharp'
iconname: 'OpenGL'
tags:
- opengl
- cpp
- linguagemc
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

[OpenGL](https://terminalroot.com.br/tags#opengl) é uma API gráfica que possui várias versões, cada uma introduzindo novos recursos e funcionalidades. Para utilizar essas funcionalidades mais recentes, é necessário carregar as funções específicas da versão em tempo de execução com uso de bibliotecas:

A [GLAD](https://glad.dav1d.de/) é uma biblioteca utilizada para gerar carregadores de funções OpenGL. Ele ajuda a carregar as funções específicas da versão do OpenGL que você está usando em tempo de execução.

[GLFW](https://www.glfw.org/) é uma biblioteca que oferece suporte para a criação de janelas, tratamento de entrada e gerenciamento de contexto OpenGL. Ele facilita a configuração de uma janela e de um contexto OpenGL, mas não lida diretamente com a carga de funções OpenGL.

O GLFW, [SDL2](https://terminalroot.com.br/tags#sdl2), [SFML](https://terminalroot.com.br/tags#sfml) ou similares podem ser usados em conjunto com o OpenGL para facilitar o gerenciamento da janela e do contexto OpenGL enquanto você se concentra nas operações gráficas em si.

> O [Vulkan](https://www.vulkan.org/)(desenvolvido também pela mesma empresa, a [Khronos Group](https://www.khronos.org/)) e o [Direct3D](https://learn.microsoft.com/pt-br/windows/win32/direct3d) são alternativas ao **OpenGL**.

---

Nesse vídeo veremos:
+ Conceitos fundamentais do OpenGL;
+ Como instalar o OpenGL no Windows e no Ubuntu;
+ Como criar um código básico com OpenGL;
+ Como escutar eventos;
+ Dicas de links e leitura.

---

# Assista ao vídeo
<iframe width="1253" height="705" src="https://www.youtube.com/embed/fn-QaOF224o" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

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

# Links para instalação no Windows
+ Instale o MinGW: <https://terminalroot.com.br/2022/12/como-instalar-gcc-gpp-mingw-no-windows.html>
+ Download do GLAD: <https://glad.dav1d.de/>
+ Download do GLFW: <https://www.glfw.org/download.html>

Código do arquivo `task.json`:
{% highlight json %}
{
  "version": "2.0.0",
  "tasks": [
    {
      "type": "cppbuild",
      "label": "C/C++: g++.exe build active file",
      "command": "C:/path/to/g++.exe",
      "args": [
        "-g",
        "-std=c++17",
        "-I${workspaceFolder}/include",
        "-L${workspaceFolder}/lib",
        "${workspaceFolder}/src/main.cpp",
        "${workspaceFolder}/src/glad.c",
        "-lglfw3dll",
        "-o",
        "${workspaceFolder}/cutable.exe"
      ],
      "options": {
        "cwd": "${workspaceFolder}"
      },
      "problemMatcher": [
        "$gcc"
      ],
      "group": {
        "kind": "build",
        "isDefault": true
      },
      "detail": "compiler: C:/C:/path/to/g++.exe"
    }
  ]
}
{% endhighlight %}


Código do `main.cpp`:
{% highlight cpp %}
#include <iostream>
#include <glad/glad.h>
#include <GLFW/glfw3.h>

void framebuffer_size_callback(GLFWwindow* window, int width, int height){
  glViewport(0, 0, width, height);
}

int main(){
  if (!glfwInit()){
    std::cout << "Failed to initialize GLFW.\n";
    return -1;
  }

  glfwWindowHint(GLFW_SAMPLES, 4);
  glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
  glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
  glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);

  GLFWwindow* window;
  window = glfwCreateWindow(800, 600, "C++ OpenGL on Windows", NULL, NULL);
  if (window == NULL)  {
    std::cout << "Failed to open GLFW window.\n";
    return -1;
  }
  glfwMakeContextCurrent(window);

  if (!gladLoadGLLoader((GLADloadproc)glfwGetProcAddress)){
    std::cout << "Failed to initialize GLAD.\n";
    return -1;
  }

  glViewport(0, 0, 800, 600);
  glfwSetFramebufferSizeCallback(window, framebuffer_size_callback);

  while(!glfwWindowShouldClose(window))  {
    glfwSwapBuffers(window);
    glfwPollEvents();    
  }

  glfwTerminate();
  return 0;
}
{% endhighlight %}

Comando para compilar: 
{% highlight bash %}
g++ -g -std=c++17 -I include -L lib main.cpp src/glad.c -lglfw3dll
{% endhighlight %}


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

# Instalação no Ubuntu
Rode os comandos abaixo para instalar:
{% highlight bash %}
sudo apt update
sudo apt install pkg-config libgl1-mesa-dev freeglut3-dev libglfw3 libglfw3-dev
{% endhighlight %}

Código do `main.cpp` e ao final do arquivo formas para compilar:
{% highlight cpp %}
#include <GLFW/glfw3.h>

int main(){

  // Inicialize a biblioteca
  if (!glfwInit()){
    return -1;
  }

  // Crie uma janela em 'modo de janela' e seu contexto OpenGL
  GLFWwindow* window = glfwCreateWindow(800, 450, "C++ OpenGL", NULL, NULL);

  // Importante verificar, pois o servidor de janelas pode veriar de acordo com o sistema operacional
  if (!window)  {
    glfwTerminate();
    return -1;
  }

  // Tornar o contexto da janela atual
  glfwMakeContextCurrent(window);

  // Loop até que o usuário feche a janela
  while (!glfwWindowShouldClose(window)){
    // Renderizar aqui
    glClear(GL_COLOR_BUFFER_BIT);

    // Troca os buffers de cor para exibição correta
    glfwSwapBuffers(window);

    // Escutar eventos: mouse, teclado, fechar janela,...
    glfwPollEvents();
  }

  // Importante para deletar todos os ponteiros criados
  glfwTerminate();
  return 0;
}
// Pode ser que no Ubuntu a ordem importe! Passe os arquivos .cpp primeiro e as flags por último:
// g++ main.cpp $(pkg-config --libs --cflags glfw3) -lGL
// Ou 
// g++ main.cpp -lglfw -lGL -lX11 -lpthread -lXrandr -ldl
{% endhighlight %}

---

# Links úteis
+ <https://learnopengl.com/>
+ <https://registry.khronos.org/OpenGL/specs/gl/glspec46.core.pdf>

---

# Deseja aprender Linguagem C do Zero de forma Moderna?
## Acesse: <https://terminalroot.com.br/c>


