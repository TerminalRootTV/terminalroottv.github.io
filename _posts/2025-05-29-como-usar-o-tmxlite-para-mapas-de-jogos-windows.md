---
layout: post
title: "Como Usar o Tmxlite para Mapas de Jogos(Windows e Linux)"
date: 2025-05-29 08:23:43
image: '/assets/img/gamedev/tmxlite/tmxlite-map.png'
description: "🎮 Nesse exemplo mostramos no Windows e GNU/Linux e com Tiled e SFML, mas pode ser com SDL, OpenGL ou qualquer outro."
icon: 'ion:terminal-sharp'
iconname: 'GameDev'
tags:
- gamedev
- sfml
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Nós já fizemos [um vídeo](https://terminalroot.com.br/2022/06/como-criar-mapas-para-games-com-tiledmap.html) mostrando como renderizar [mapas](https://terminalroot.com.br/2024/05/conheca-10-opcoes-para-editores-de-mapa.html) para jogos feitos com [C++](https://terminalroot.com.br/tags#cpp), no entanto, [nesse exemplo](https://github.com/terroo/loadtmx) usando a [TinyXML2](https://terminalroot.com.br/2022/03/como-fazer-parser-de-xml-com-tinyxml2-cpp.html), mas há uma alternativa ainda melhor que é a **tmxlite**.

[tmxlite](https://github.com/fallahn/tmxlite) é uma biblioteca [C++](https://terminalroot.com.br/cpp) leve usada para carregar e ler arquivos de mapas no formato **TMX** (formato usado pelo editor de mapas [Tiled](https://terminalroot.com.br/2022/05/como-fazer-parser-de-tmx-com-cpp-para-tilemap.html)).

### Características:
* Foco em **leitura eficiente** de mapas TMX.
* Não faz rendering: apenas **carrega e interpreta os dados do `.tmx`** (como tiles, camadas, objetos etc.).
* Suporte a:
  * Camadas de [tile](https://terminalroot.com.br/2022/04/baixe-de-graca-5-tilesets-para-seus-games.html) (baseadas em matriz ou chunks)
  * Camadas de objetos (retângulos, polígonos, etc.)
  * Propriedades customizadas
  * Mapas codificados em [XML](https://terminalroot.com.br/2021/05/como-fazer-parser-de-xml-com-expat-em-c-cpp.html), [CSV](https://terminalroot.com.br/2023/05/como-fazer-parser-de-csv-com-cpp-moderno.html) e [base64](https://terminalroot.com.br/2021/04/funcoes-para-gerar-base64-encode-e-decode-no-cpp.html)


Se você quer carregar mapas `.tmx` no seu jogo em C++ (ex: com SFML, SDL, OpenGL), o **tmxlite** fornece a estrutura para **ler os dados**, e você cuida da renderização e lógica.

A seguir vamos ver como: **Instalar**, **Compilar** e **Rodar** o `tmxlite` no [Windows](https://terminalroot.com.br/tags#windows) e no [Ubuntu](https://terminalroot.com.br/tags#ubuntu)(ou qualquer distro [GNU](https://terminalroot.com.br/tags#gnu)/[Linux](https://terminalroot.com.br/tags#gnulinux)).


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

## Instalação
### No Windows
Antes de mais nada, você precisará das seguintes dependências instaladas no seu [Windows](https://terminalroot.com.br/tags#windows):
> Caso não tenha instala, clique no link que você irá direto para um tutorial que lhe mostrará como fazer!

**Dependências para Windows**:
+ [Git](https://terminalroot.com.br/2023/03/como-instalar-git-e-git-bash-no-windows.html)
+ [GCC MinGW](https://terminalroot.com.br/2022/12/como-instalar-gcc-gpp-mingw-no-windows.html)
+ [Meson](https://winstall.app/apps/mesonbuild.meson)
+ [Ninja](https://winstall.app/apps/Ninja-build.Ninja)
+ Opcional: [Clang](https://terminalroot.com.br/2024/07/como-instalar-o-clang-no-windows-com-um-unico-comando.html), será bom, pois na compilação do **tmxlite** ele pode tentar procurá-lo, no meu sistema mesmo procurou.
> Fechar e abrir o [terminal](https://terminalroot.com.br/tags#terminal)([PowerShell](https://terminalroot.com.br/tags#powershell)) após instalações é fundamental para as alterações surgirem efeito!

Agora vamos instalar o **tmxlite**, você pode rodar os comandos abaixo um de cada vez, ou criar um *script* [PowerShell](https://terminalroot.com.br/tags#powershell) e rodar:
> `InstallTmxlite.ps1`

{% highlight bash %}
git clone https://github.com/fallahn/tmxlite
cd .\tmxlite
meson setup build
meson compile -C build
meson install -C build --destdir "C:\tmxlite"
Copy-Item -Path '.\tmxlite\tmxlite\include' -Destination 'C:\tmxlite' -Recurse
{% endhighlight %}
> Se você fez o script, basta rodar com o **Windows PowerShell**: `powershell InstallTmxlite.ps1` ou com o [PowerShell](https://terminalroot.com.br/2025/05/personalize-seu-powershell-like-a-pro.html): `pwsh InstallTmxlite.ps1`.

> **Após instalado o tmxlite você já pode remover esse repositório que foi clonado!**

Como vamos testar com [SFML](https://terminalroot.com.br/sfml) e compilar com o [GNU GCC MinGW](https://terminalroot.com.br/2023/03/como-compilar-seus-jogos-em-sfml-com-gcc-mingw-no-windows.html) é importante você possuir a versão do [SFML](https://terminalroot.com.br/tags#sfml) para o [GCC](https://terminalroot.com.br/tags#gcc):

+ **Baixe** [esse arquivo `SFML-2.6.2-windows-gcc-13.1.0-mingw-64-bit.zip)`](https://www.sfml-dev.org/files/SFML-2.6.2-windows-gcc-13.1.0-mingw-64-bit.zip):
+ **Descompacte**; 
+ e **Mova**(a pasta `C:\SFML-2.5.1`) para `C:\SFML-2.5.1-GCC`(coloque um <b>-GCC</b> ao final da pasta para diferenciar da versão *VS*)

**Preparando seu projeto**:
+ Crie um pasta: `New-Item -ItemType Directory -Path 'MyProject'`
+ Faça download dos `assets/`(que usaremos como exemplo) clicando nesse link: <https://terminalroot.com/downloads/assets.zip> e descompacte(**Extrair aqui**).

{% highlight powershell %}
Invoke-WebRequest -Uri "https://terminalroot.com/downloads/assets.zip" -OutFile "assets.zip"
{% endhighlight %}

Se seu descompactador criou subpasta, você precisa deixar a pasta `assets/` assim(sem nenhuma subpasta dentro):
{% highlight bash %}
./assets/
├── box.jpg
├── floor.jpg
└── map.tmx

0 directories, 3 files
{% endhighlight %}

Está tudo pronto, quando mostrarmos o exemplo, direi como você compilar os arquivos aí dentro, agora vamos ver o procedimento para o Ubuntu.

---

### No Ubuntu
O processo é o quase o mesmo, só que basta usar o APT, para instalar as dependências:
{% highlight bash %}
sudo apt meson ninja-build build-essential git clang libsfml-dev curl
{% endhighlight %}
> Lembrando que o SFML precisa ser inferior a versão 3.

Para descobrir a versão do SFML que está no seu sistema, use um dos comando abaixo:
{% highlight bash %}
apt list --installed | grep libsfml
grep -R "SFML_VERSION" /usr/include/SFML/
{% endhighlight %}

Agora é só clonar, compilar e instalar o **tmxlite**:
{% highlight bash %}
git clone https://github.com/fallahn/tmxlite
cd tmxlite/
meson setup build
meson compile -C build
sudo meson install -C build
{% endhighlight %}


<details>
 <summary>Ele vai copiar para os caminhos ↓</summary>

{% highlight bash %}
Dropping privileges to "$USER" before running ninja...
ninja: Entering directory `./tmxlite/build'
ninja: no work to do.
Installing tmxlite/src/libtmxlite.so to /usr/local/lib/x86_64-linux-gnu
{% endhighlight %}

</details>

Depois é só copiar os includes(onde você ainda está, pois há outra pasta de nome tmxlite dentro de tmxlite):

{% highlight bash %}
sudo cp -r tmxlite/include/tmxlite /usr/local/include/
sudo ldconfig # Opcional
{% endhighlight %}

Se quiser ver a versão instalada do seu tmxlite, rode o comando abaixo:
{% highlight bash %}
curl \
  https://raw.githubusercontent.com/fallahn/tmxlite/refs/heads/master/meson.build \
  2>/dev/null | \
  grep ' version:'
{% endhighlight %}

Também crie seu projeto: `mkdir MyProject`, faça download desse `assets/` em: <https://terminalroot.com/downloads/assets.zip> e descompacte(**Extrair aqui**).. Se seu descompactador criou subpasta, você precisa deixar a pasta `assets/` assim(sem nenhuma subpasta dentro):
{% highlight bash %}
./assets/
├── box.jpg
├── floor.jpg
└── map.tmx

0 directories, 3 files
{% endhighlight %}

E vamos ao tutorial do **tmxlite**!


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

## Como usar o tmxlite?
Dentro do seu `MyProject`(tanto no Windows quando no GNU/Linux), crie um arquivo `main.cpp` para preenchermos com o código básico SFML e cole isso dentro:
> É um projeto básico SFML, para mais detalhes, faça nosso curso: <https://terminalroot.com.br/sfml>

{% highlight cpp %}
#include <SFML/Graphics.hpp>
#include <iostream>

int main(){
  sf::RenderWindow window(sf::VideoMode(1280,720), "SFML::Tmxlite"); 

  while(window.isOpen()){
    sf::Event event;
    while(window.pollEvent(event)){
      if(event.type == sf::Event::Closed){
        window.close();
      }
    }

    window.clear();
    window.display();
  }

  return EXIT_SUCCESS;
}
{% endhighlight %}

Agora vamos incrementá-lo com código para o **tmxlite**:

### 01. Incluir os cabeçalhos para o tmxlite:
{% highlight cpp %}
#include <tmxlite/Map.hpp>
#include <tmxlite/Layer.hpp>
#include <tmxlite/TileLayer.hpp>
#include <tmxlite/ObjectGroup.hpp>
{% endhighlight %}

### 02. Cria o objeto e lê o mapa: `./assets/map.tmx`
> Logo depois(abaixo) de `RenderWindow`.

Esse `map.tmx` foi feito com [Tiled Map](https://terminalroot.com.br/2022/06/como-criar-mapas-para-games-com-tiledmap.html)

{% highlight cpp %}
tmx::Map map;
if(!map.load("./assets/map.tmx")){
  std::cerr << "Falha ao carregar o mapa TMX.\n";
  return -1;
}
{% endhighlight %}

Imagens que mostra o processo de criação com o **Tiled Map Editor**:

![Tiled Map 01](/assets/img/gamedev/tmxlite/01-tiled-for-tmxlite.png) 
> Escolhendo as dimensões do mapa.

---

![Tiled Map 02](/assets/img/gamedev/tmxlite/02-tiled-for-tmxlite.png) 
> Criando um mapa simples.

### 03. Obtém a largura e altura do mapa e armazena em duas constantes
{% highlight cpp %}
const float map_width = static_cast<float>(map.getTileCount().x * map.getTileSize().x);
const float map_height = static_cast<float>(map.getTileCount().y * map.getTileSize().y);
{% endhighlight %}

### 04. Cria um vector de 'tmx::Layer' que pode ter os objetos: 
> `Layer::Type::Tile`, `Layer::Type::Object`, `Layer::Type::Image` ou `Layer::Type::Group`


{% highlight cpp %}
const auto& layers = map.getLayers();
{% endhighlight %}

### 05. Carrega imagens separadas como texturas individuais e criar o `Sprite`:
{% highlight cpp %}
sf::Texture floor_tex, box_tex;
if(!floor_tex.loadFromFile("./assets/floor.jpg") || !box_tex.loadFromFile("./assets/box.jpg")){
  std::cerr << "Falha ao carregar imagens dos tiles.\n";
  return -1;
}

sf::Sprite tile_sprite;
{% endhighlight %}

### 06. Desenha os *tiles* de cada camada do tipo *Tile*
Substitua o `window.clear()` pelo código abaixo:

{% highlight cpp %}
window.clear(sf::Color(138, 138, 138));

for (const auto& layer : layers) {
  if (layer->getType() == tmx::Layer::Type::Tile) {
    auto* tile_layer = dynamic_cast<const tmx::TileLayer*>(layer.get());
    const auto& tiles = tile_layer->getTiles();
    const auto layer_size = tile_layer->getSize();
    const auto tile_size = map.getTileSize();

    for (std::size_t y = 0; y < layer_size.y; ++y) {
      for (std::size_t x = 0; x < layer_size.x; ++x) {
        std::size_t index = x + y * layer_size.x;
        std::uint32_t tile_id = tiles[index].ID;

        // Tile vazio
        if (tile_id == 0){ 
          continue; 
        }

        // Decide qual imagem usar com base no: tile_id
        if(tile_id == 1){ 
          tile_sprite.setTexture(box_tex); 
        }else if(tile_id == 2){ 
          tile_sprite.setTexture(floor_tex);
        }else{
          continue;
        }

        tile_sprite.setPosition(static_cast<float>(x * tile_size.x), static_cast<float>(y * tile_size.y));
        window.draw(tile_sprite);
      }
    }
  }
}
{% endhighlight %}

Ok, o código mais básico **tmxlite** é esse, versão completa:


<details>
 <summary><code>main.cpp</code></summary>

{% highlight cpp %}
#include <SFML/Graphics.hpp>
#include <iostream>
#include <tmxlite/Map.hpp>
#include <tmxlite/Layer.hpp>
#include <tmxlite/TileLayer.hpp>
#include <tmxlite/ObjectGroup.hpp>

int main(){
  sf::RenderWindow window(sf::VideoMode(1280,720), "SFML::Tmxlite"); 

  tmx::Map map;
  if(!map.load("./assets/map.tmx")){
    std::cerr << "Falha ao carregar o mapa TMX.\n";
    return -1;
  }

  const float map_width = static_cast<float>(map.getTileCount().x * map.getTileSize().x);
  const float map_height = static_cast<float>(map.getTileCount().y * map.getTileSize().y);

  const auto& layers = map.getLayers();

  sf::Texture floor_tex, box_tex;
  if(!floor_tex.loadFromFile("./assets/floor.jpg") || !box_tex.loadFromFile("./assets/box.jpg")){
    std::cerr << "Falha ao carregar imagens dos tiles.\n";
    return -1;
  }

  sf::Sprite tile_sprite;

  while(window.isOpen()){
    sf::Event event;
    while(window.pollEvent(event)){
      if(event.type == sf::Event::Closed){
        window.close();
      }
    }

    window.clear(sf::Color(138, 138, 138));

    for (const auto& layer : layers) {
      if (layer->getType() == tmx::Layer::Type::Tile) {
        auto* tile_layer = dynamic_cast<const tmx::TileLayer*>(layer.get());
        const auto& tiles = tile_layer->getTiles();
        const auto layer_size = tile_layer->getSize();
        const auto tile_size = map.getTileSize();

        for (std::size_t y = 0; y < layer_size.y; ++y) {
          for (std::size_t x = 0; x < layer_size.x; ++x) {
            std::size_t index = x + y * layer_size.x;
            std::uint32_t tile_id = tiles[index].ID;

            if (tile_id == 0){ 
              continue; 
            }

            if(tile_id == 1){ 
              tile_sprite.setTexture(box_tex); 
            }else if(tile_id == 2){ 
              tile_sprite.setTexture(floor_tex);
            }else{
              continue;
            }

            tile_sprite.setPosition(static_cast<float>(x * tile_size.x), static_cast<float>(y * tile_size.y));
            window.draw(tile_sprite);
          }
        }
      }
    }

    window.display();
  }

  return EXIT_SUCCESS;
}
{% endhighlight %}

</details>

Agora vamos ver como construir e rodar no Windows e no Linux.


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

## Construir e rodar
### No Windows
Crie um *script* de nome: `build.ps1`(PowerShell) e insira esse conteúdo abaixo:
> Esse script copia as `.dll`, linka a `lib` e inclui a pasta `include` das duas bibliotecas(SFML e tmxlite).

{% highlight powershell %}
if ($args[0] -eq "--prepare") {
    Write-Output "Executando preparação..."
    Copy-Item -Path "C:\SFML-2.5.1-GCC\bin\*.dll" -Destination .
    Copy-Item -Path "C:\tmxlite\bin\*.dll" -Destination .
    g++ .\main.cpp -I C:\SFML-2.5.1-GCC\include\ -L C:\SFML-2.5.1-GCC\lib\ -I C:\tmxlite\include -L C:\tmxlite\lib -lsfml-main -lsfml-graphics -lsfml-system -lsfml-window -ltmxlite
    .\a.exe
} else {
    if (Test-Path ".\libtmxlite.dll") {
        Write-Output "Compilando..."
    g++ .\main.cpp -I C:\SFML-2.5.1-GCC\include\ -L C:\SFML-2.5.1-GCC\lib\ -I C:\tmxlite\include -L C:\tmxlite\lib -lsfml-main -lsfml-graphics -lsfml-system -lsfml-window -ltmxlite
    .\a.exe
    } else {
        Write-Output ""
        Write-Output "Use: pwsh build.ps1 --prepare"
        Write-Output ""
    }    
}
{% endhighlight %}

Note que primeiro você precisa usar o parâmetro `--prepare` para copiar os arquivos e depois da primeira cópia não precisa mais usá-lo:
> Os comandos com `.exe` no final no Windows são indiferentes, ou seja, ter ou não ter, não faz diferença. O mesmo serve para o `.\`(ponto barra invertida antes do nome do arquivo).

Exemplo com PowerShell:
{% highlight powershell %}
pwsh build.ps1 --prepare
{% endhighlight %}

Exemplo com Windows PowerShell:
{% highlight powershell %}
powershell build.ps1 --prepare
{% endhighlight %}

Se o *Windows Defender* emitir problema ao executar o comando, use assim para permitir a execução:
{% highlight powershell %}
# Windows PowerShell:
powershell -ExecutionPolicy Bypass -File build.ps1 --prepare

# PowerShell
pwsh -ExecutionPolicy Bypass -File build.ps1 --prepare
{% endhighlight %}

Depois de preparar e compilar, ele vai rodar o binário automaticamente, se não rodar, rode:
{% highlight powershell %}
.\a.exe
{% endhighlight %}

Vai aparecer essa janela:

![Rodando no Windows](/assets/img/gamedev/tmxlite/run-windows.jpg) 

---

## Em distros GNU/Linux(Ubuntu)
Basta compilar com as flags necessárias: `-lsfml-graphics -lsfml-window -lsfml-system`(para o SFML) e `-ltmxlite`(para o **tmxlite**):

{% highlight bash %}
g++ main.cpp -lsfml-graphics -lsfml-window -lsfml-system -ltmxlite
{% endhighlight %}

Depois é só rodar o binário criado:
{% highlight bash %}
./a.out
{% endhighlight %}

Vai aparecer a mesma imagem do Windows:

![Rodando no Ubuntu](/assets/img/gamedev/tmxlite/run-ubuntu.png) 

---

## Adicionando Câmera ao código
Como o mapa que eu criei possui uma largura de `3200` pixel e altura de `736`, a janela do nosso jogo possui largura de `1280` para ver todo o cenário eu criei uma câmera caso você queira editar o arquivo com Tiled e notar que após alterar nem precisa recompilar que todo cenário será modificado.

Para ver essa câmera eu criei um `patch`, se você quiser aplicá-lo para testar a câmera, faça o seguinte:

Crie um arquivo de nome: `camera.patch` e copie e cole o conteúdo abaixo:

{% highlight diff %}
29a30,40
>   sf::RectangleShape player(sf::Vector2f(64.f, 64.f));
>   player.setFillColor(sf::Color::Red);
> 
>   float player_x = 10.f;
>   float player_y = 512.f;
>   player.setPosition(player_x, player_y);
> 
>   float player_speed = 300.f;
>   sf::Clock clock;
> 
> 
37a49,67
>     float dt = clock.restart().asSeconds();
> 
>     if(sf::Keyboard::isKeyPressed(sf::Keyboard::Right)){
>       player_x += player_speed * dt;
>     }else if(sf::Keyboard::isKeyPressed(sf::Keyboard::Left)){
>       player_x -= player_speed * dt;
>     }
> 
>     if(player_x < 0.f) player_x = 0.f;
>     if(player_x > map_width - player.getSize().x) player_x = map_width - player.getSize().x;
> 
>     float view_offset_x = player_x + player.getSize().x / 2.f - window.getSize().x / 2.f;
> 
>     if(view_offset_x < 0.f) view_offset_x = 0.f;
>     if(view_offset_x > map_width - window.getSize().x)
>       view_offset_x = map_width - window.getSize().x;
> 
>     player.setPosition(player_x - view_offset_x, player_y);
> 
64c94,99
<             tile_sprite.setPosition(static_cast<float>(x * tile_size.x), static_cast<float>(y * tile_size.y));
---
>             float draw_x = static_cast<float>(x * tile_size.x) - view_offset_x;
>             float draw_y = static_cast<float>(y * tile_size.y);
> 
>             tile_sprite.setPosition(draw_x, draw_y);
> 
>             window.draw(player);
{% endhighlight %}

Salve o arquivo e aplique o *patch* com o comando:
{% highlight bash %}
patch main.cpp camera.patch
{% endhighlight %}

No Windows você pode instalar o comando `patch` de instalando o [Git Bash](https://terminalroot.com.br/2023/03/como-instalar-git-e-git-bash-no-windows.html), veja o tutorial abaixo:
### [Como Instalar Git e Git Bash no Windows](https://terminalroot.com.br/2023/03/como-instalar-git-e-git-bash-no-windows.html)
> Tutorial desse próprio blog: **Terminal Root**.

Após recompilar o resultado será similar ao git abaixo:
> O bloco <span class="color:red;">vermelho</span> simula o **Player**.

<video src="/assets/img/gamedev/tmxlite/camera-800x450.webm" controls autoplay loop muted></video>

---

## Versão com Programação Orientada a Objetos e [ECS](https://terminalroot.com.br/tags#ecs)
O ideal para [desenvolvimento de jogos](https://terminalroot.com.br/tags#gamedev) com certeza é **Programação Orientada a Objetos** e **ECS**, dependendo o tamnho do seu projeto ECS talvez não seja tão necessário assim, mas POO com certeza, pois torna o desenvolvimento menos trabalhoso e com ECS deixa mais organizado e de fácil manutenção para adicionar ou remover recursos.

Você pode fazer da maneira que mais lhe convém, eu mesmo costumo organizar meus projetos como [nesse vídeo](https://youtu.be/2JDzJoEscr0), mas, caso seu projeto seja grande o ideal é ECS mesmo.

Então, criei uma versão ECS para você notar que com **tmxlite** seus projetos ficam organizados e roda normalmente.

A estrutura do ECS está assim:

![ECS struct](/assets/img/gamedev/tmxlite/03-tiled-for-tmxlite.png) 
> O `System.hpp` não está sendo usado, mas deixei aí caso você queira implementá-lo na sua estrutura.

Para testar, basta fazer o download do arquivo `.zip` em: <https://terminalroot.com/downloads/ecs.zip>, descompactar e construir com [CMake](https://terminalroot.com.br/tags#cmake) e rodar.
> Exemplo:

{% highlight bash %}
wget -q https://terminalroot.com/downloads/ecs.zip
unzip ecs.zip -d ecs
cd ecs
cmake . -B build
cmake --build build
./build/ECS_Tilemap
{% endhighlight %}
> Essa versão já está com a câmera.

No Windows você pode [instalar o Cmake de acordo com esse tutorial](https://terminalroot.com.br/2023/03/como-instalar-o-cmake-no-windows.html), use o [Clang](https://terminalroot.com.br/2024/07/como-instalar-o-clang-no-windows-com-um-unico-comando.html), defina o `clang` como ambiente, [veja aqui um exemplo](https://terminalroot.com.br/2025/01/como-usar-curl-com-cpp-no-windows-com-powershell-e-cmake.html) e use `cmake -g "Unix Makefiles"` para compilar no terminal, ou sem para compilar com [MSVC no Visual Studio](https://terminalroot.com.br/2023/06/como-compilar-com-msvc-via-linha-de-comando.html).

---

Esse artigo ficou muito grande, pois faz parte da documentação do [jogo](https://terminalroot.com.br/tags#games) que que estou desenvolvendo. Tive que refazer [sprites](https://terminalroot.com.br/2021/12/instale-o-libresprite-uma-alternativa-ao-aseprite.html) , [mapas](https://terminalroot.com.br/2024/05/conheca-10-opcoes-para-editores-de-mapa.html),... ainda é só um esboço, mas abaixo tem uma ideia inicial de como está ficando. Feito d absoluto do zero:

<iframe width="800" height="450" src="https://www.youtube.com/embed/huTTvdflpj4" title="RootDev :: Game (Development MODE) #cpp #sfml" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>


