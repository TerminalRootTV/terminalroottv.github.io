---
layout: post
title: "Como utilizar o FFmpeg com C++ (Windows e GNU/Linux)"
date: 2025-06-01 14:40:34
image: '/assets/img/cpp/ffpp.jpg'
description: "📺 Criei uma Biblioteca Dinâmica com C++ para a API do FFmpeg em C para facilitar a integração para aplicativos gráficos e com mais velocidade."
icon: 'ion:terminal-sharp'
iconname: 'FFmpeg/C++'
tags:
- cpp
- ffmpeg
- api
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

`ffpp` é uma biblioteca dinâmica escrita em [C++](https://terminalroot.com.br/cpp) com [API](https://terminalroot.com.br/tags#api) para a maioria das tarefas principais com [FFmpeg](https://ffmpeg.org). Muito mais rápida para interfaces gráficas do que usar processos.

![ffpp](https://github.com/terroo/ffpp/raw/main/resources/ffpp-running-windows.jpg)
> Executando no [Windows](https://terminalroot.com.br/tags#windows).

![ffpp](https://github.com/terroo/ffpp/raw/main/resources/ffpp-running-gnu.png)
> Executando no [GNU](https://terminalroot.com.br/tags#gnu)/[Linux](https://terminalroot.com.br/tags#gnulinux).


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

## Uso no [Windows](https://terminalroot.com.br/tags#windows)
> Requer [Clang](https://terminalroot.com.br/2025/05/como-instalar-a-nova-versao-do-clang-llvm-no-windows.html)

1. [Baixe o `libffppwin`](https://bit.ly/libffppwin)

{% highlight powershell %}
Invoke-WebRequest -Uri "https://bit.ly/libffppwin" -OutFile "libffppwin.rar"
{% endhighlight %}

2. Extraia o `.rar`

3. Entre na pasta

{% highlight bash %}
cd .\libffppwin
{% endhighlight %}

4. Crie um código básico, exemplo: `main.cpp`

{% highlight cpp %}
#include "ffpp/ffpp.hpp"
#include <memory>

int main(){
  auto ffpp = std::make_unique<FFPP>();
  std::cout << "Duração: " 
    << ffpp->ffpp_info(FFPP_INFO::DURATION, "video.mp4") << '\n';
}
{% endhighlight %}

> Se quiser, use este vídeo como exemplo: [video.mp4](https://terminalroot.com/downloads/video.mp4)

5. Compile e execute:

{% highlight powershell %}
# PowerShell
pwsh build.ps1 main.cpp # Ou mais arquivos

# Ou: Windows [PowerShell](https://terminalroot.com.br/tags#powershell)
powershell build.ps1 main.cpp # Ou mais arquivos

# Ou diretamente
.\build.ps1 main.cpp # Ou mais arquivos
{% endhighlight %}

Se o *Windows Defender* bloquear a execução, permita o script:

{% highlight powershell %}
pwsh -ExecutionPolicy Bypass -File build.ps1 main.cpp # Ou mais arquivos
{% endhighlight %}

**O script `build.ps1` compila e executa o binário gerado. A saída fornece, por exemplo, a duração do vídeo: `Duração: 00:00:05`**

> Se quiser baixar o *libffmpeg* e compilar a *dll* do zero, veja este arquivo: [build-win.md](https://github.com/terroo/ffpp/blob/main/resources/build-win.md).

---

## No [GNU](https://terminalroot.com.br/tags#gnu)/[Linux](https://terminalroot.com.br/tags#gnulinux)

Dependências:

### No [Arch](https://terminalroot.com.br/2022/02/conheca-o-arch-hurd.html):

{% highlight bash %}
sudo pacman -S gcc ffmpeg make cmake pkg-config git
{% endhighlight %}

### No [Debian/Ubuntu/Mint](https://terminalroot.com.br/tags#ubuntu):

{% highlight bash %}
sudo apt install build-essential ffmpeg make cmake pkg-config git
{% endhighlight %}

### Compilar e instalar

> Execute todos os comandos abaixo:

{% highlight bash %}
git clone https://github.com/terroo/ffpp
cd ffpp
cmake . -B build
cmake --build build
sudo cmake --install build
# Importante após a instalação
# Algo como: export LD_LIBRARY_PATH=/usr/local/lib
# Mas para todo o sistema:
echo /usr/local/lib | sudo tee /etc/ld.so.conf.d/ffpp.conf
sudo ldconfig
{% endhighlight %}

Crie um código básico, exemplo: `main.cpp`

{% highlight cpp %}
#include <ffpp/ffpp.hpp>
#include <memory>

int main(){
  auto ffpp = std::make_unique<FFPP>();
  std::cout << "Duração: " 
    << ffpp->ffpp_info(FFPP_INFO::DURATION, "video.mp4") << '\n';
}
{% endhighlight %}

> Se quiser, use este vídeo como exemplo: [video.mp4](https://terminalroot.com/downloads/video.mp4)

Compile e execute:

{% highlight bash %}
g++ main.cpp -lavformat -lavcodec -lavutil -lswscale -lffpp
./a.out
{% endhighlight %}

> Exemplo de saída: `Duração: 00:00:05`.


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

## Exemplos da API

Assumindo que você criou o objeto no heap (`auto ffpp = std::make_unique<FFPP>();`).

### 01. Converter `MP4` para `WMV`:

{% highlight cpp %}
ffpp->ffpp_convert("video.mp4", "new.wmv");
{% endhighlight %}

> Converte apenas entre extensões de vídeo: `.mp4`, `.flv`, `.wmv` e `.mov`

---

### 02. Extrair quadros:

{% highlight cpp %}
ffpp->ffpp_extract_frames("video.mp4", "my_frames_dir");
{% endhighlight %}

> Imagens `.ppm` serão geradas na pasta fornecida (`my_frames_dir/`).

---

### 03. Obter informações de um vídeo:

{% highlight cpp %}
std::cout << "Duração: " 
  << ffpp->ffpp_info(FFPP_INFO::DURATION, "video.mp4") << '\n';
std::cout << "Taxa de bits: " 
  << ffpp->ffpp_info(FFPP_INFO::BITRATE, "video.mp4") << '\n';
std::cout << "FPS: " 
  << ffpp->ffpp_info(FFPP_INFO::FPS, "video.mp4") << '\n';
std::cout << "Frequência do áudio: " 
  << ffpp->ffpp_info(FFPP_INFO::AUDIO_FREQUENCY, "video.mp4") << '\n';
std::cout << "Resolução: " 
  << ffpp->ffpp_info(FFPP_INFO::RESOLUTION, "video.mp4") << '\n';  
{% endhighlight %}

---

### 04. Cortar um vídeo de um tempo até um certo comprimento:

{% highlight cpp %}
ffpp->ffpp_cut("video.mp4", "00:00:10", 6, "output.mp4");
{% endhighlight %}

> O corte começa após 10 segundos do vídeo e dura 6 segundos.

---

## 📹 Assista ao Vídeo

<iframe width="1280" height="720" src="https://www.youtube.com/embed/3bm84QckF8E" title="Como utilizar o FFmpeg com C++ (Windows e GNU/Linux)" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

## 👀 Veja Também
+ 👑 [Aprenda a criar sua própria linguagem de programação](https://terminalroot.com.br/mylang)
+ ✅ [Aprenda Criação de Games com C++ e SFML](https://terminalroot.com.br/games)
+ ✅ [Pacote Promocional C++](https://terminalroot.com.br/promo)
+ ✅ [Aprenda C++ e Qt](https://terminalroot.com.br/cpp)
+ ✅ [Conheça nossos Cursos](https://bit.ly/CursosTerminalRoot)
+ 🎁 [Todos os Cursos na Udemy](https://bit.ly/UdemyTerminalRoot )



