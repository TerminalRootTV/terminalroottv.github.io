---
layout: post
title: "Crie Galeria de Imagens a partir de um vídeo"
date: 2025-11-21 19:56:20
image: '/assets/img/cpp/vig.jpg'
description: "🎞️ O aplicativo que eu criei com C++ e FFmpeg pra facilitar lembrar de trechos dos vídeos."
icon: 'ion:terminal-sharp'
iconname: 'C++/FFmpeg'
tags:
- cpp
- ffmpeg
- dicas
- multimidia
- terminal
- comandos
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')


---

Eu costumo assistir *bastante* [filmes](https://x.com/TerminalRootTV/status/1974127375618302448), apesar de muitos deles assistir online, há outros que eu faço download na internet muitas vezes que a operadora de streaming que eu uso não há algum título que eu desejo disponível.

E sempre crio uma galeria de imagens com um software. Mas, há vezes que salvo os filmes, assisto e gostaria de lembrar de algum trecho pra saber se realmente já assisti.

Quando há muitos filmes e quero fazer galeria, precisava fazer manualmente via [interface gráfica](https://terminalroot.com.br/tags#gui) e isso toma bastante tempo, foi aí que eu tive a ideia de criar o: `vig`.

`vig` é um utilitário via [linha de comando](https://terminalroot.com.br/tags#comandos) escrito em [C++](https://terminalroot.com.br/tags#cpp) que usa as bibliotecas: [FFmpeg](https://terminalroot.com.br/tags#ffmpeg) e [stb](https://github.com/nothings/stb).

Ele cria galerias facilmente e de forma rápida. Antigamente eu usava o **Totem**, pois havia possibilidade ed usar via linha de comando, mas já faz alguns anos que eles removeram o utilitário para [terminal](https://terminalroot.com.br/tags#terminal), chegue até fazer [essa postagem em 2015](https://terminalroot.com.br/2015/08/como-criar-uma-galeria-de-fotos-pelo_19.html) mostrando como usar, isso sem dizer que possui muitas limitações, como, por exemplo, só cria galerias de 30 imagens no máximo e entre outros pormenores.

Com o `vig` não, você pode criar a quantidade e combinação que desejar: `1x1`(1 imagem), `4x4`(16 imagens), `5x3`(15 imagens), `10x10`(100 imagens) e assim por diante.

No momento, ele só está disponível para sistemas [Unix-like](https://terminalroot.com.br/tags#unix), mas em um futuro próximo vou criar uma versão para [Windows](https://terminalroot.com.br/tags#windows) usando a [ffpp](https://terminalroot.com.br/2025/06/como-utilizar-o-ffmpeg-com-cpp-windows-e-gnu.html), mas o Windows possui uma alternativa bacana, se não me engano é o nome é: **MPC-HC**, mas não sei dizer se funciona também via linha de comando.

Abaixo vamos como compilar e instalar na sua máquina!


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

## Dependências
Lógico, que antes de tudo você precisará de algumas básicas dependências, além do [C++23](https://terminalroot.com.br/2025/04/como-instalar-o-gcc-14-e-usar-o-cpp23.html), [Git](https://terminalroot.com.br/tags#git) e [CMake](https://terminalroot.com.br/tags#cmake), ou seja, o básico.

O que você precisa mesmo é usar seu gerenciador de pacotes para instalar o: FFmpeg, a stb não precisa já está incorporada no código.

Exemplos:

APT:
{% highlight bash %}
sudo apt update
sudo apt install \
    libavformat-dev \
    libavcodec-dev \
    libavutil-dev \
    libswscale-dev \
    libswresample-dev \
    libavdevice-dev
{% endhighlight %}

Pacman:
{% highlight bash %}
sudo pacman -S ffmpeg
{% endhighlight %}

---

## Compilar and Instalar
Depois é só usar o CMake para compilar e instalar:
> Após clonar o projeto!

{% highlight bash %}
git clone https://github.com/terroo/vig
cd vig
cmake . -B build
cmake --build build
sudo cmake --install build
cd ..
rm -rf vig
{% endhighlight %}

---

## Uso
Abaixo exemplos simples para gerar suas galerias.
> As imagens são geradas no mesmo diretório onde você executou o `vig`, com o seguinte formato de nome:
> 
> **gallery-[data]-[hora]-[nome-do-video].jpg**

Exemplos:

{% highlight bash %}
# Basic
vig video.mp4

# Generate 4 cols and rows = 16 frames 
vig --res=4x4 video.mp4

# Generate 5 cools x 3 rows = 15 frames
vig --res=5x3 video.mp4

# Help
vig --help
{% endhighlight %}

---

Se quiser desinstalar basta rodar:

{% highlight bash %}
sudo rm $(which vig)
{% endhighlight %}

---

Ahh! Não esqueça de deixar sua ⭐ lá no [repositório do `vig` no GitHub](https://github.com/terroo/vig).


