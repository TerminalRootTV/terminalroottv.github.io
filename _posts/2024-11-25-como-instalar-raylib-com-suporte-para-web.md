---
layout: post
title: "Como Instalar Raylib com suporte para Web"
date: 2024-11-25 08:07:07
image: '/assets/img/raylib/raylib-web.png'
description: "🚀 A união da Raylib com o Emscripten!"
icon: 'ion:terminal-sharp'
iconname: 'Raylib'
tags:
- raylib
- gamedev
- emscripten
- cpp
- web
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Nós já fizemos um [vídeo](https://terminalroot.com.br/2022/11/crie-jogos-para-windows-linux-e-web-com-raylib-c-cpp.html) que mostra como instalar(após compilar) a biblioteca [Raylib](https://terminalroot.com.br/tags#raylib), mas aquele procedimento é com biblioteca [dinâmica](https://terminalroot.com.br/2024/09/diferenca-entre-bibliotecas-estatica-e-dinamica.html), mas não serve para uso da Raylib para web.

Então, nessa postagem vamos mostrar como como compilar e instalar a Raylib, além de poder usar para desktop, também para usar seu desenvolvimento para rodar no browser.

---

## Dependências
Para usar como base, iremos focar no sistema operacional [Ubuntu](https://terminalroot.com.br/tags#ubuntu) usando o *APT*, no entanto, o procedimento pode ser adaptado para qualquer outro sistema operacional, bastando somente encontrar os nomes de pacotes correspondentes para seu gerenciador de pacotes e/ou caminhos de instalação.

Primeiramente é necessário possuir os seguintes pacotes devidamente instalados no seu sistema:
{% highlight bash %}
sudo apt install libasound2-dev mesa-common-dev libx11-dev libxrandr-dev \
   libxi-dev xorg-dev libgl1-mesa-dev libglu1-mesa-dev \
   build-essential cmake make g++ \
   freeglut3-dev libglfw3 libglfw3-dev
{% endhighlight %}
> A sessão precisa ter sido iniciada pelo X11, se estiver no Wayland, encerre a sessão e logue novamente escolhendo o [Xorg](https://terminalroot.com.br/2021/05/5-dicas-rapidas-para-cpp.html).

Depois, é importantantíssimo possuir o [Emscripten](https://terminalroot.com.br/2023/02/como-transformar-seus-jogos-c-cpp-para-web-com-emscripten-sdl2.html) instalado, nós mostramos através de vídeo como fazer isso, mas em resumo, basta rodar esses comandos abaixo:
> Lembre-se de possuir o [Git](https://terminalroot.com.br/tags#git) instalado e atualizado.

{% highlight bash %}
cd
git clone https://github.com/emscripten-core/emsdk .emsdk
cd emsdk
git pull
./emsdk install latest
./emsdk activate latest
echo 'source "$HOME/.emsdk/emsdk_env.sh" 2>/dev/null' >> ~/.bashrc
exec $SHELL
{% endhighlight %}


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

## Compilar e instalar a Raylib
Após possuir os pacotes necessários e o Emscripten, agora basta compilar e instalar a Raylib com os seguintes comandos:

{% highlight bash %}
git clone https://github.com/raysan5/raylib
cd raylib
emcmake cmake . -DPLATFORM=Web
emmake make
sudo make install
{% endhighlight %}

<details>
 <summary>Aqui, um resumo para onde são copiados os arquivos:</summary>

{% highlight bash %}
...
[ 99%] Built target textures_textured_curve
[100%] Built target textures_to_image
Install the project...
-- Install configuration: "Debug"
-- Installing: /home/marcos/.emsdk/upstream/emscripten/cache/sysroot/lib/libraylib.a
-- Installing: /home/marcos/.emsdk/upstream/emscripten/cache/sysroot/include/raylib.h
-- Installing: /home/marcos/.emsdk/upstream/emscripten/cache/sysroot/include/rlgl.h
-- Installing: /home/marcos/.emsdk/upstream/emscripten/cache/sysroot/include/raymath.h
-- Installing: /home/marcos/.emsdk/upstream/emscripten/cache/sysroot/lib/pkgconfig/raylib.pc
-- Installing: /home/marcos/.emsdk/upstream/emscripten/cache/sysroot/lib/cmake/raylib/raylib-config-version.cmake
-- Installing: /home/marcos/.emsdk/upstream/emscripten/cache/sysroot/lib/cmake/raylib/raylib-config.cmake
{% endhighlight %}

</details>


O procedimento acima instala as dependências somente para Web, no entanto, ainda é necessário instalar também para Desktop, usando o [CMake](https://terminalroot.com.br/tags#cmake):
> Note que não foi usado o argumento: ~~-DBUILD_SHARED_LIBS=ON~~.

{% highlight bash %}
cmake -B build -DPLATFORM=PLATFORM_DESKTOP -DPLATFORM=Desktop;Web .
cmake --build build
sudo cmake --install build/
{% endhighlight %}
> Note que não precisa copiar o `.so`, pois não há.

<details>
 <summary>Aqui, outro resumo para onde são copiados os arquivos, inclusive o arquivo <code>libraylib.a</code>:</summary>

{% highlight bash %}
[sudo] senha para marcos: 
-- Install configuration: "Debug"
-- Installing: /usr/local/lib/libraylib.a
-- Installing: /usr/local/include/raylib.h
-- Installing: /usr/local/include/rlgl.h
-- Installing: /usr/local/include/raymath.h
-- Installing: /usr/local/lib/pkgconfig/raylib.pc
-- Installing: /usr/local/lib/cmake/raylib/raylib-config-version.cmake
-- Installing: /usr/local/lib/cmake/raylib/raylib-config.cmake
{% endhighlight %}

</details>


<!-- RECTANGLE 2 - OnParagragraph -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:block; text-align:center;"
data-ad-layout="in-article"
data-ad-format="fluid"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="8549252987"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

## Testando e rodando
Agora basta criar um arquivo de exemplo: `main.cpp` com o código [C++](https://terminalroot.com.br/tags#cpp) e [Raylib](https://terminalroot.com.br/tags#raylib) abaixo:

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

Para compilar, antes certifique-se de possui um arquivo HTML de base para uso, você pode [baixar do repositório da Raylib](https://github.com/raysan5/raylib/blob/master/src/shell.html) com o seguinte comando:

{% highlight bash %}
wget https://raw.githubusercontent.com/raysan5/raylib/refs/heads/master/src/shell.html
{% endhighlight %}

Após isso basta compilar com o comando:

{% highlight bash %}
em++ -o game.html main.cpp -Os -Wall -I ~/.emsdk/upstream/emscripten/cache/sysroot/include \
    -L ~/.emsdk/upstream/emscripten/cache/sysroot/lib/libraylib.a -s USE_GLFW=3 -s ASYNCIFY \
    --shell-file shell.html -DPLATFORM_WEB ~/.emsdk/upstream/emscripten/cache/sysroot/lib/libraylib.a
{% endhighlight %}

Após isso é só rodar o comando abaixo e será aberto automaticamente no seu navegador padrão:
{% highlight bash %}
emrun game.html
{% endhighlight %}

![Exemplo rodando no navegador](/assets/img/raylib/raylib-run-web.png) 
> Exemplo rodando no navegador. Abra a imagem em uma nova guia para ver em uma resolução maior, caso queira.

Se quiser usar o mesmo código para rodar como desktop, como você já deve saber o comando deve ser: `g++ main.cpp -lraylib -lGL -lm -lpthread -ldl -lrt -lX11 && ./a.out`.

---

Lembrando que o exemplo é sem `ASYNCIFY`, para mais informações [veja aqui](https://github.com/raysan5/raylib/wiki/Working-for-Web-(HTML5)#42-use-standard-raylib-whilewindowshouldclose-loop).


