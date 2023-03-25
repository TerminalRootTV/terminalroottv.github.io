---
layout: post
title: "Como Usar Imagens PNG e JPG com SDL2 images no Windows"
date: 2023-03-25 10:58:24
image: '/assets/img/sdl2/sdl2-image-windows-min.jpg'
description: 'Simples e funcional para compilar seus Jogos!'
icon: 'ion:terminal-sharp'
iconname: 'SDL2/Windows'
tags:
- sdl2
- windows
- gamedev
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

# Introdução
O [SDL2](https://terminalroot.com.br/tags#sdl2), nativamente, como já mostramos [nesse vídeo](https://terminalroot.com.br/2023/01/como-instalar-o-sdl2-no-windows-e-linux-para-criar-jogos-c-cpp-e-primeiros-passos.html) não há suporte para formatos de imagem `png` e `jpg/jpeg`, somente para o formato `bmp`.

No entanto, existe um pacote adicional disponibilizado pela própria equipe de desenvolvimento do SDL2 que serve para você conseguir utilizar PNG e JPG nos seu [games](https://terminalroot.com.br/tags#games).

Nesse artigo veremos como fazer para usar esses formatos em SDL2 no [Windows](https://terminalroot.com.br/tags#windows).

---

## Dependências
Primeiramente, antes de mais nada, é necessário que você possua o [GCC MinGW](https://terminalroot.com.br/2022/12/como-instalar-gcc-gpp-mingw-no-windows.html) devidamente instalado no seu Windows, veja o artigo abaixo para ver como fazer isso:
### [Como Instalar GCC/G++ MinGW no Windows](https://terminalroot.com.br/2022/12/como-instalar-gcc-gpp-mingw-no-windows.html)

Após devidamente instalado no seu sistema e funcionando corretamente, faça o download do SDL2 [nesse link](https://github.com/libsdl-org/SDL/releases/), escolha versão `SDL2-devel-X.XX.X-mingw.zip`, onde `X.XX.X` é o número da versão mais recente.

De acordo com a data de publicação desse artigo, a versão mais recente é a `2.26.4`, se quiser fazer o download diretamente por aqui, basta clicar no botão abaixo:

<a href="https://github.com/libsdl-org/SDL/releases/download/release-2.26.4/SDL2-devel-2.26.4-mingw.zip" class="btn btn-danger btn-lg">SDL2-devel-2.26.4-mingw.zip</a>

Após efetuado o download, clique com o botão direito do mouse e selecione `Extrair aqui`(precisa do Winrar instalado).

Renomei a pasta que foi descompactada para `SDL2` somente, fica mais fácil quando formos utilizá-la.

Agora recorte ou copie essa pasta para seu projeto.


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

## Usando o `SDL2_image`
Agora vamos fazer o download do `SDL2_image`. Acesse esse endereço: <https://github.com/libsdl-org/SDL_image/releases/> e selecione a versão mais recente do **SDL2_image**, de acordo com a data de publicação desse artigo é a `2.6.3`.

Faça o download do pacote: `SDL2_image-devel-X.X.X-mingw.zip`, onde `X.X.X` é a versão, se quiser a de acordo com esse artigo clique no botão abaixo:

<a href="https://github.com/libsdl-org/SDL_image/releases/download/release-2.6.3/SDL2_image-devel-2.6.3-mingw.zip" class="btn btn-warning btn-lg">SDL2_image-devel-2.6.3-mingw.zip</a>

Descompacte o arquivo baixado(botão direito do mouse: **Extrair aqui**), entre na pasta descompactada e copie o arquivo `SDL_image.h` e cole no caminho correspondente à pasta SDL2 que você colou no seu projeto.

### O caminho dela seria: `SDL2_image\x86_64-w64-mingw32\include\SDL2\SDL2_image.h` e cole em `SDL2\x86_64-w64-mingw32\include\SDL2\`, onde haverão outros arquivos.

Faça o mesmo, mas dessa vez para TODOS OS ARQUIVOS da pasta `bin` e `lib` em `SDL2_image` e cole nos caminhos correspondentes em `SDL2`, exemplo:
### Todos os arquivos dentro da pasta `bin`: `SDL2_image\x86_64-w64-mingw32\bin` para ``SDL2\x86_64-w64-mingw32\bin` 
### Todos os arquivos dentro da pasta `lib`: `SDL2_image\x86_64-w64-mingw32\lib` para ``SDL2\x86_64-w64-mingw32\lib` 

Para finalizar essa etapa das cópias, copie também o arquivo: `SDL2_image.dll` que está em `SDL2_image\x86_64-w64-mingw32\bin\SDL2_image.dll` para a "raiz" do seu projeto.

> DICA: Se quiser faça **backup** dessa pasta **SDL2** que já há todos os arquivos do **SDL2_image** para outro lugar para sempre utilizá-las em possíveis novos outros projetos e economizar tempo.

---

## Compilando
Para rodarmos nosso exemplo vamos usar essa imagem PNG abaixo:

![Pikachu SDL2 image Windows](/assets/img/sdl2/pikachu.png) 

Salve ela dentro do seu projeto!

Agora copie e código abaixo e cole dentro de um arquivo `main.cpp`(Não use o *Bloco de Notas* para criá-lo, use um editor de código: [VS Code](https://terminalroot.com.br/tags#vscode), por exemplo).
> Lógico, no mesmo local onde estão a pasta `SDL2`(já com os arquivos copiados do **SDL2_image**) e a imagem.

{% highlight cpp %}
#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>

int main(int argc, char** argv) {
  SDL_Init(SDL_INIT_EVERYTHING);

  SDL_Window* window = SDL_CreateWindow(
      "SDL2 Image no Windows",
      50, 30,
      1280, 720,
      SDL_WINDOW_SHOWN
      );

  SDL_Renderer * renderer = SDL_CreateRenderer(window, -1, 0);
  SDL_Texture * img = IMG_LoadTexture(renderer, "pikachu.png"); 

  SDL_Rect rect, rect2;
  rect.x = 50;
  rect.y = 20;
  rect.w = 400;
  rect.h = 400;

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
    SDL_SetRenderDrawColor(renderer, 240, 250, 50, 255);
    SDL_RenderFillRect(renderer, &rect2);
    SDL_SetRenderDrawColor(renderer, 9, 20, 33, 255);
    SDL_RenderCopy(renderer, img, NULL, &rect);
    SDL_RenderPresent(renderer);
  }

  SDL_DestroyTexture(img);
  SDL_DestroyRenderer(renderer);
  SDL_DestroyWindow(window);
  SDL_Quit();
  return 0;
}
{% endhighlight %}
> É um código similar ao do [vídeo criado no canal](https://terminalroot.com.br/2023/01/como-instalar-o-sdl2-no-windows-e-linux-para-criar-jogos-c-cpp-e-primeiros-passos.html), mas em vezde ler BMP ele ler PNG, poderia ser JPG também.

Note que nesse código temos 4 linhas fundamentais para ler e exibir a imagem corretamente, são as linhas:
{% highlight cpp %}
// Inclui a SDL2_image
#include <SDL2/SDL_image.h>

// Lê a imagem: pikachu.png
SDL_Texture * img = IMG_LoadTexture(renderer, "pikachu.png");

// Exibe nossa imagem
// NOTE que: o `rect` irá "encaixar" a imagem
SDL_RenderCopy(renderer, img, NULL, &rect);

// Liberar o espaço utilizado pela imagem na memória
SDL_DestroyTexture(img);
{% endhighlight %}

---

## Compilar via linha de comando
Para compilar o comando é similar ao que fizemos no vídeo, só há uma diferença, adicione a flag: `-lSDL2_image` ao final, exemplo:

{% highlight bash %}
g++ main.cpp -I SDL2\x86_64-w64-mingw32\include -L SDL2\x86_64-w64-mingw32\lib -lmingw32 -lSDL2main -lSDL2 -lSDL2_image
{% endhighlight %}

Agora basta rodar com o comando:
{% highlight bash %}
a.exe
{% endhighlight %}

![SDL2_image no Windows](/assets/img/sdl2/sdl2-image-windows.jpg) 
> Se não funcionar é porque você deve ter "pulado" alguma etapa, revise todas elas!


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

# Utilizando um `Makefile`
Para agilizar e digitar menos quando for compilar, você pode criar um arquivo(sem extensão, de novo não use o Bloco de Notas) de nome `Makefile` e insira esse conteúdo abaixo:

{% highlight makefile %}
all:
	g++ .\main.cpp -I .\SDL2\x86_64-w64-mingw32\include\ -L .\SDL2\x86_64-w64-mingw32\lib\ -lmingw32 -lSDL2main -lSDL2
{% endhighlight %}
> Lembre-se: Um [Makefile](https://terminalroot.com.br/tags#make) deve ser respeitado os `tabs` assim como o código está aqui, se não ele não funciona.

Após salvar, ainda dentro da pasta do seu projeto, como o [PowerShell](https://terminalroot.com.br/tags#powershell) ou `CMD`, rode o comando:
> Lembre-se também de antes ter renomeado o arquivo `mingw32-make` para somente `make` no caminho: `C:\mingw64\bin\`

{% highlight bash %}
make
{% endhighlight %}

---

## Utilizando um script [Lua](https://terminalroot.com.br/tags#lua)
O legal de usar um `script` de alguma linguage de script, é que você pode fazer verificações se arquivos existem e com isso ajuda a você *debugar* qual etapa você esqueceu.

Se quiser usar um script: [Python](https://terminalroot.com.br/tags#python), `Batch`, ... fique à vontade! 

Nesse exemplo eu fiz com [Lua](https://terminalroot.com.br/lua), para saber como instalar Lua no Windows veja o arquivo: [Como instalar Lua no Windows 10](https://terminalroot.com.br/2022/07/lua-windows.html)

Crie um arquivo de nome `build.lua` ainda dentro do seu projeto e insira o código abaixo:
{% highlight lua %}
function file_exists(name)
  local f = io.open(name, "r")
  return f ~= nil and io.close(f)
end

if(file_exists("SDL2.dll")) then
  print("Compilando..")
  os.execute("g++ main.cpp -I SDL2\\x86_64-w64-mingw32\\include -L SDL2\\x86_64-w64-mingw32\\lib -lmingw32 -lSDL2main -lSDL2 -lSDL2_image")
else
  print("Precisa do arquivo SDL2.dll para compilar.")
  print("Ele pode ser obtido em: SDL2\\x86_64-w64-mingw32\\bin")
  return 1
end
{% endhighlight %}
> Esse script verifica se você não esqueceu de copiar o arquivo `SDL2.dll` para dentro do seu projeto, você ainda pode melhorar e incluir também o arquivo `SDL2_image.dll`. Em Lua precisa escapar a barra invertida com outra barra invertida, ex.: `\\`.

E para rodar:
{% highlight bash %}
lua build.lua
{% endhighlight %}

Qualquer dúvida comenta lá no vídeo do SDL2 no canal: <https://youtu.be/9IcIKdjSvfc> .

---

# Veja também
+ [Como instalar o CMake no Windows](https://terminalroot.com.br/2023/03/como-instalar-o-cmake-no-windows.html)
+ [Preparando o Ambiente para C++ no Windows e no Linux](https://terminalroot.com.br/2023/02/preparando-o-ambiente-no-windows-e-no-linux.html)
+ [Como Instalar o SDL2 no Windows e Linux para Criar Jogos C/C++ e Primeiros Passos](https://terminalroot.com.br/2023/01/como-instalar-o-sdl2-no-windows-e-linux-para-criar-jogos-c-cpp-e-primeiros-passos.html)
+ [Como Transformar seus Jogos C/C++ para Web com Emscripten (SDL2)](https://terminalroot.com.br/2023/02/como-transformar-seus-jogos-c-cpp-para-web-com-emscripten-sdl2.html)
+ [Como instalar Lua no Windows 10](https://terminalroot.com.br/2022/07/lua-windows.html)
+ [Gua Definitivo de Lua](https://terminalroot.com.br/lua)
+ [Crie Jogos para Windows, Linux e Web com Raylib C/C++](https://terminalroot.com.br/2022/11/crie-jogos-para-windows-linux-e-web-com-raylib-c-cpp.html)
+ [Aprenda a Criar Jogos com Allegro C/C++ no Windows e Linux](https://terminalroot.com.br/2022/12/aprenda-a-criar-jogos-com-allegro-c-cpp-no-windows-e-linux.html)
+ [Como Instalar Git e Git Bash no Windows](https://terminalroot.com.br/2023/03/como-instalar-git-e-git-bash-no-windows.html)
+ [Aprenda Criar Games com C++ e SFML](https://terminalroot.com.br/games)
+ [10 Notebooks para Programadores em 2023](https://terminalroot.com.br/2023/02/10-notebooks-para-programadores-em-2023.html)


