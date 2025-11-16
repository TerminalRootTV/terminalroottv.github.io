---
layout: post
title: "Como Combinar Imagens com C++ e ImageMagick"
date: 2025-11-16 00:13:07
image: '/assets/img/futebol/resultado.jpg'
description: "⚽ Nesse exemplo juntamos em 2 linhas e 3 colunas 6 imagens de uma simulação do Campeonato Brasileiro."
icon: 'ion:terminal-sharp'
iconname: 'Dicas'
tags:
- cpp
- magick
- futebol
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

O <b>Campeonato Brasileiro de futebol</b> está se aproximando do fim, ou seja, faltam só 5 rodadas e muita gente quer saber quem será rebaixado(*além do Sport, é claro* 😃 ) e eu pedi pra o [DeepSeek](https://terminalroot.com.br/tags#ia) simular os próximos jogos e ele me disse os resultados de todos os jogos e eu preenchi no site do Globo Esporte na opção de [Simulação](https://interativos.ge.globo.com/futebol/brasileirao-serie-a/especial/simulador-do-brasileirao-2025) e <u>fiz uma captura de tela de todas as rodadas após recortar todas as seis imagens com resolução iguais</u>: `605x405` pixels.

Então, decidi combinar as imagens em <b>3 colunas e 2 linhas</b> para que coubesse em uma única imagem para eu postar nas [mídias sociais](https://www.instagram.com/terminalroot/) para que todos pudessem ver em uma única imagem todos os resultados e a tabela final em uma única imagem.

E para isso criei um código com [C++](https://terminalroot.com.br/tags#cpp) e [ImageMagick](https://terminalroot.com.br/2023/08/como-editar-imagens-com-cpp-e-imagemagick.html).


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

## Código

Se quiser testar na sua máquina, antes lembre-se de ter instalado o `ImageMagick Dev`(API `.h`), para isso rode:

{% highlight bash %}
sudo apt install imagemagick graphicsmagick-libmagick-dev-compat
{% endhighlight %}

### As 6 imagens que usei foram essas aqui, faça download de cada uma delas para o testar o código:

+ `1.jpg`
<img alt="Brasileirão Rodada 34" title="Brasileirão Rodada 34" style="width:30%;height:30%" src="/assets/img/futebol/1.jpg">

+ `2.jpg`
<img alt="Brasileirão Rodada 35" title="Brasileirão Rodada 35" style="width:30%;height:30%" src="/assets/img/futebol/2.jpg">

+ `3.jpg`
<img alt="Brasileirão Rodada 36" title="Brasileirão Rodada 36" style="width:30%;height:30%" src="/assets/img/futebol/3.jpg">

+ `4.jpg`
<img alt="Brasileirão Rodada 37" title="Brasileirão Rodada 37" style="width:30%;height:30%" src="/assets/img/futebol/4.jpg">

+ `5.jpg`
<img alt="Brasileirão Rodada 38" title="Brasileirão Rodada 38" style="width:30%;height:30%" src="/assets/img/futebol/5.jpg">

+ `6.jpg`
<img alt="Brasileirão Tabela Final" title="Brasileirão Tabela Final" style="width:30%;height:30%" src="/assets/img/futebol/6.jpg">

Crie um arquivo, por exemplo: `brasileirao.cpp` e insira esse código:

{% highlight cpp %}
#include <Magick++.h>
#include <print>

int main(int argc, char** argv){
  const std::string filename = "resultado.jpg";
  Magick::InitializeMagick(*argv);

  const int cols = 3, rows = 2, imgw = 605, imgh = 405, pad = 5;
  const Magick::Color bg_color("blue");

  std::vector<Magick::Image> imagens;
  for(int i = 1; i <= 6; ++i){
    std::string nome = std::to_string(i) + ".jpg";

    try{
      Magick::Image img;
      img.read(nome);
      img.resize(Magick::Geometry(std::to_string(imgw) + "x" + std::to_string(imgh)));
      imagens.push_back(img);
    }catch(const std::exception& e){
      std::println("{}: {}", nome, e.what());
      return EXIT_FAILURE;
    }
  }

  int totalw = cols * imgw + (cols - 1) * pad;
  int totalh = rows * imgh + (rows - 1) * pad;

  Magick::Image combined(Magick::Geometry(totalw, totalh), bg_color);
  combined.matte(true);

  size_t index = 0;
  for(int r = 0; r < rows; ++r){
    for(int c = 0; c < cols; ++c){
      if (index >= imagens.size()){
        break;
      }

      int x = c * (imgw + pad);
      int y = r * (imgh + pad);

      combined.composite(imagens[index], x, y, Magick::OverCompositeOp);
      ++index;
    }
  }

  combined.write(filename);
  std::println("{}: {}x{}", filename, totalw, totalh);
}
{% endhighlight %}
> Se não tiver o [C++23](https://terminalroot.com.br/2025/04/como-instalar-o-gcc-14-e-usar-o-cpp23.html), substitua o `std::println` por `std::cout`.

Compile:
{% highlight bash %}
g++ $(Magick++-config --cxxflags --cppflags) brasileirao.cpp $(Magick++-config --ldflags --libs)
{% endhighlight %}

E depois é só rodar o `./a.out` que será gerada a imagem: `resultado.jpg` com as 6 imagens combinadas. Igual a essa abaixo que foi gerada assim:

[![Resultado Brasileirão](/assets/img/futebol/resultado.jpg)](/assets/img/futebol/resultado.jpg) 
> Clique na imagem para vê-la em alta resolução, ela possui: `1825x815`.

Se quiser alterar para usar com suas imagens, altere:
+ `imgw` e `imgh` pela largura e altura das suas imagens, respectivamente;
+ `cols` e `rows` de acordo como deseja, note(no código) que no meu caso fiz 2 linhas e 3 colunas;
+ Você também pode alterar o `padding`(espaço entre as imagens), modificando a variável: `pad`.
E entre outras coisas que você desejar.

Se quiser usar um [Makefile](https://terminalroot.com.br/tags#make):
{% highlight makefile %}
CC       = g++ -std=c++23
DEBUG    = -g
OPT      = -O1
WARN     = -Wall -Werror
INCFLAGS = `Magick++-config --cxxflags --cppflags`
CCFLAGS  = $(DEBUG) $(OPT) $(WARN)
LDFLAGS  = `Magick++-config --ldflags --libs`
FILES    = brasileirao.cpp
all:
	$(CC) $(CCFLAGS) $(INCFLAGS) $(FILES) $(LDFLAGS)
	@rm -f *.o
{% endhighlight %}

Ou um [CMakeLists.txt](https://terminalroot.com.br/tags#cmake):
{% highlight cmake %}
cmake_minimum_required(VERSION 3.16)
project(brasileirao CXX)

# Captura CFLAGS do Magick++
execute_process(
    COMMAND Magick++-config --cxxflags --cppflags
    OUTPUT_VARIABLE RAW_MAGICKPP_CFLAGS
)

# Captura LDFLAGS do Magick++
execute_process(
    COMMAND Magick++-config --ldflags --libs
    OUTPUT_VARIABLE RAW_MAGICKPP_LIBS
)

# Limpeza: remove tabs, quebras de linha e espaços excessivos
string(REPLACE "\n" " " MAGICKPP_CFLAGS "${RAW_MAGICKPP_CFLAGS}")
string(REPLACE "\t" " " MAGICKPP_CFLAGS "${MAGICKPP_CFLAGS}")
string(REPLACE "\n" " " MAGICKPP_LIBS "${RAW_MAGICKPP_LIBS}")
string(REPLACE "\t" " " MAGICKPP_LIBS "${MAGICKPP_LIBS}")

string(STRIP "${MAGICKPP_CFLAGS}" MAGICKPP_CFLAGS)
string(STRIP "${MAGICKPP_LIBS}" MAGICKPP_LIBS)

# Agora separa corretamente
separate_arguments(MAGICKPP_CFLAGS)
separate_arguments(MAGICKPP_LIBS)

add_executable(brasileirao brasileirao.cpp)

target_compile_features(brasileirao PRIVATE cxx_std_23)
target_compile_options(brasileirao PRIVATE -g -O1 -Wall -Werror)

target_compile_options(brasileirao PRIVATE ${MAGICKPP_CFLAGS})
target_link_libraries(brasileirao PRIVATE ${MAGICKPP_LIBS})
{% endhighlight %}
> Rode: `cmake -B build . && cmake --build build && ./build/brasileirao`


Lembrando que se você usar o [Valgring]() pode obter um *falso-positivo*, para evitar isso, use a flag: `OMP_NUM_THREADS=1`, assim:
{% highlight bash %}
OMP_NUM_THREADS=1 valgrind --leak-check=full --track-origins=yes ./a.out
{% endhighlight %}
> A saída final será: `ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 from 0)`.

Só mais uma dica, para usar o ImageMagick no seu [LSP]() inclua no seu `~/.config/clangd/compile_flags.txt` a linha:
{% highlight bash %}
-I/usr/include/GraphicsMagick
{% endhighlight %}

Ou opcionalmente:
{% highlight bash %}
magick++ --cppflags >> .config/clangd/compile_flags.txt
# Ou
pkg-config --cflags Magick++ >> .config/clangd/compile_flags.txt
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

É uma dica simples, mas que além de ser útil é um bom exercício [C++](https://terminalroot.com.br/tags#cpp) 😃 .

---

## Veja também:
+ [Obtenha Emojis via Linha de Comando](https://terminalroot.com.br/2025/05/obtenha-emojis-via-linha-de-comando.html)
+ [Como editar imagens com C++ e ImageMagick](https://terminalroot.com.br/2023/08/como-editar-imagens-com-cpp-e-imagemagick.html)
+ [Como Instalar o GCC 14 e usar o C++23](https://terminalroot.com.br/2025/04/como-instalar-o-gcc-14-e-usar-o-cpp23.html)

Fui!

