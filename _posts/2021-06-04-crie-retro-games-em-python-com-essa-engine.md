---
layout: post
title: "Crie retrô games em Python com essa Engine"
date: 2021-06-04 08:57:03
image: '/assets/img/python/pyxel.jpg'
description: 'Simples, intuitivo e magnífico.'
icon: 'ion:terminal-sharp'
iconname: 'Python'
tags:
- python
- games
- dev-games
---

![Crie retrô games em Python com essa Engine](/assets/img/python/pyxel.jpg)

**Pyxel** é uma engine de jogos retrô para Python.

Graças às suas especificações simples inspiradas em consoles de jogos retrô, assim como permitir a exibição de apenas 16 cores e apenas 4 sons poderem ser reproduzidos ao mesmo tempo, você pode se sentir à vontade para fazer jogos em estilo pixel art.

As especificações do console e APIs do Pyxel fazem referência ao incrível [PICO-8](https://www.lexaloffle.com/pico-8.php) e [TIC-80](https://tic.computer/).

Pyxel é open source e livre para utilização.

## Especificações

- Executável no Windows, Mac e Linux
- Código escrito em Python3
- Paleta fixa de 16 cores
- 3 bancos de imagens de tamanho 256x256
- 8 tilemaps de tamanho 256x256
- 4 canais com 64 sons definíveis
- 8 músicas que podem combinar sons arbitrários
- Entrada de teclado, mouse e joystick
- Editor de imagem e som

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


### Paleta de cores

<img src="https://github.com/kitao/pyxel/raw/master/pyxel/examples/screenshots/05_color_palette.png">
<br><br>
<img src="https://github.com/kitao/pyxel/raw/master/images/pyxel_palette.png">

## Como instalar

### Windows

Primeiro, instale o [Python3](https://www.python.org/) (versão 3.6.8 ou superior).

Durante a instalação utilizando o instalador oficial do Python, não esqueça de **adicionar o Python no PATH** selecionando a seguinte opção:

<img src="https://github.com/kitao/pyxel/raw/master/images/python_installer.png">

Em seguida, instale o Pyxel com o seguinte comando do `pip` na linha de comando:

{% highlight bash %}
pip install -U pyxel
{% endhighlight %}

### Mac

Primeiro, no ambiente com o [Homebrew] (https://brew.sh/) instalado, instale o [Python3] (https://www.python.org/) (versão 3.6.8 ou superior) e os pacotes necessários com o próximo comando:

{% highlight bash %}
brew install python3 gcc sdl2 sdl2_image gifsicle
{% endhighlight %}

Você pode instalar o Python3 de outras maneiras, mas lembre-se de que você deve instalar outras bibliotecas.

Em seguida, **reinicie o terminal** e instale o Pyxel com o commando `pip3`:

{% highlight bash %}
pip3 install -U pyxel
{% endhighlight %}

### Linux

Instale [Python3](https://www.python.org/) (versão 3.6.8 ou superior) e os requisitos específicos para cada distribuição.

**Ubuntu:**

<!-- RETANGULO LARGO 2 -->
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

{% highlight bash %}
sudo apt install python3 python3-pip libsdl2-dev libsdl2-image-dev gifsicle
sudo -H pip3 install -U pyxel
{% endhighlight %}

### Outros ambientes

Para instalar o Pyxel em ambientes diferentes dos anteriores (Linux 32-bit, Raspberry PI, etc.), siga os passos abaixo:

#### Instale as ferramentas e pacotes necessários

- Conjunto de ferramentas C++ (deve incluir os comandos gcc e make)
- libsdl2-dev and libsdl2-image-dev
- [Python3](https://www.python.org/) (versão 3.6.8 ou superior) e o comando pip

#### Execute o comando seguinte em qualquer diretório

{% highlight bash %}
git clone https://github.com/kitao/pyxel.git
cd pyxel
make -C pyxel/core clean all
pip3 install .
{% endhighlight %}

### Instalando exemplos

Após instalar o Pyxel, os exemplos serão copiados para o diretório atual com o seguinte comando:

{% highlight bash %}
install_pyxel_examples
{% endhighlight %}

Os exemplos copiados são os seguintes:

- [01_hello_pyxel.py](https://github.com/kitao/pyxel/raw/master/pyxel/examples/01_hello_pyxel.py) - Aplicação simples
- [02_jump_game.py](https://github.com/kitao/pyxel/raw/master/pyxel/examples/02_jump_game.py) - Jogo de pulo com o arquivo de recursos do Pyxel
- [03_draw_api.py](https://github.com/kitao/pyxel/raw/master/pyxel/examples/03_draw_api.py) - Demonstração da API de desenho
- [04_sound_api.py](https://github.com/kitao/pyxel/raw/master/pyxel/examples/04_sound_api.py) - Demonstração da API de som
- [05_color_palette.py](https://github.com/kitao/pyxel/raw/master/pyxel/examples/05_color_palette.py) - Lista da paleta de cores
- [06_click_game.py](https://github.com/kitao/pyxel/raw/master/pyxel/examples/06_click_game.py) - Jogo de clique com mouse
- [07_snake.py](https://github.com/kitao/pyxel/raw/master/pyxel/examples/07_snake.py) - Jogo Snake com BGM
- [08_triangle_api.py](https://github.com/kitao/pyxel/raw/master/pyxel/examples/08_triangle_api.py) - Demonstração da API de desenho de triângulo
- [09_shooter.py](https://github.com/kitao/pyxel/raw/master/pyxel/examples/09_shooter.py) - Jogo de tiro com transição de tela

Os exemplos podem ser executados como um programa Python comum:

**Windows:**

{% highlight bash %}
cd pyxel_examples
python 01_hello_pyxel.py
{% endhighlight %}

**Mac / Linux:**

{% highlight bash %}
cd pyxel_examples
python3 01_hello_pyxel.py
{% endhighlight %}

## Como usar
### Criando uma aplicação Pyxel
Depois de importar o módulo Pyxel para o seu código Python, primeiro especifique o tamanho da janela com a função `init`, depois inicie a aplicação Pyxel com a função `run`.

{% highlight python %}
import pyxel

pyxel.init(160, 120)

def update():
    if pyxel.btnp(pyxel.KEY_Q):
        pyxel.quit()

def draw():
    pyxel.cls(0)
    pyxel.rect(10, 10, 20, 20, 11)

pyxel.run(update, draw)
{% endhighlight %}

Os argumentos da função `run` são as funções `update`, para atualizar cada frame, e `draw` para desenhar a tela quando for necessário.

Em uma aplicação real, é recomendado colocar código pyxel em uma classe, como feito abaixo:

{% highlight python %}
import pyxel

class App:
    def __init__(self):
        pyxel.init(160, 120)
        self.x = 0
        pyxel.run(self.update, self.draw)

    def update(self):
        self.x = (self.x + 1) % pyxel.width

    def draw(self):
        pyxel.cls(0)
        pyxel.rect(self.x, 0, 8, 8, 9)

App()
{% endhighlight %}

Também é possível escrever um código simples utilizando as funções `show` e `flip` para desenhar gráficos e animações simples.

A função `show` desenha na tela e espera até a tecla `ESC` ser pressionada.

{% highlight python %}
import pyxel

pyxel.init(120, 120)
pyxel.cls(1)
pyxel.circb(60, 60, 40, 7)
pyxel.show()
{% endhighlight %}

A função `flip` atualiza a tela uma vez.

{% highlight python %}
import pyxel

pyxel.init(120, 80)

while True:
    pyxel.cls(3)
    pyxel.rectb(pyxel.frame_count % 160 - 40, 20, 40, 40, 7)
    pyxel.flip()
{% endhighlight %}

Veja alguns gifs de exemplos:

<!-- RETANGULO LARGO -->
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

<img src="https://github.com/kitao/pyxel/raw/master/pyxel/examples/screenshots/01_hello_pyxel.gif" width="48%">
<img src="https://github.com/kitao/pyxel/raw/master/pyxel/examples/screenshots/02_jump_game.gif" width="48%">
<img src="https://github.com/kitao/pyxel/raw/master/pyxel/examples/screenshots/03_draw_api.gif" width="48%">
<img src="https://github.com/kitao/pyxel/raw/master/pyxel/examples/screenshots/04_sound_api.gif" width="48%">
<img src="https://github.com/kitao/pyxel/raw/master/pyxel/editor/screenshots/image_tilemap_editor.gif" width="48%">
<img src="https://github.com/kitao/pyxel/raw/master/pyxel/editor/screenshots/sound_music_editor.gif" width="48%">

Para mais informações e detalhes consulte o GitHub do Pyxel:
### <https://github.com/kitao/pyxel>


