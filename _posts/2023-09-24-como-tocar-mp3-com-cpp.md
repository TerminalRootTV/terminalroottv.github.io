---
layout: post
title: "🎶 Como Tocar MP3 com C++ 🎻 🎼 Code Music"
date: 2023-09-24 09:45:07
image: '/assets/img/cpp/playmp3.jpg'
description: 'Tutorial estilo "Code Music 🎵"'
icon: 'ion:terminal-sharp'
iconname: 'C++/MP3'
tags:
- multimidia
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Nesse artigo/vídeo veremos um código com [OOP](https://en.wikipedia.org/wiki/Object-oriented_programming) de como tocar [MP3](https://terminalroot.com.br/tags#multimidia) com [C++](https://terminalroot.com.br/tags#cpp), existem outras bibliotecas que também fazem isso, algumas outras só tocam [WAV](https://pt.wikipedia.org/wiki/WAV), por exemplo, as bibliotecas de [gamedev](https://terminalroot.com.br/tags#gamedev).

Antes de mais nada precisamos saber quais bibliotecas precisamos saber as diferenças entre: [Mpg123](https://www.mpg123.de/), [LibMPG123](https://www.mpg123.de/api/) e [Libao](https://xiph.org/ao/):

---

## [Mpg123](https://www.mpg123.de/)
É um reprodutor de áudio gratuito e de código aberto . Suporta formatos de áudio MPEG , incluindo MP3. É um aplicativo que funciona via linha de comando e não possui interface gráfica.

---

## [Libmpg123](https://www.mpg123.de/api/)
É a biblioteca desenvolvida e utilizada pelo aplicativo Mpg123. Ela também a mesma usada nos aplicativos: Audacious , XMMS e Winamp.

---

## [Libao](https://xiph.org/ao/)
É uma biblioteca de áudio multiplataforma que permite que os programas produzam áudio usando uma API simples em uma ampla variedade de plataformas.

É uma ferramenta desenvolvida pela **Xiph.Org**, a mesma que criou o tipo de arquivo: `ogg` e também o formato `FLAC`, que é uma alternativa livre ao `mp3` e entre outros formatos.


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

# Instalação
Lógico que você precisará delas para compilar o código, pesquise no gerenciador de pacotes do seu sistema operacional, ela funciona em todos: [Windows](https://terminalroot.com.br/tags#windows)(Recomendo você usar o Nuget e pesquisar), [GNU](https://terminalroot.com.br/tags#gnu)/[Linux](https://terminalroot.com.br/tags#linux), [macOS](https://terminalroot.com.br/tags#macos) e todos da família [BSD](https://terminalroot.com.br/tags#bsd) além de [Haiku](https://terminalroot.com.br/2021/05/conheca-o-haiku-um-sistema-operacional-escrito-em-cpp.html) e outros.

Exemplo no [Ubuntu](https://terminalroot.com.br/tags#ubuntu):
{% highlight bash %}
sudo apt update
sudo apt install libmpg123-dev libaio-dev
{% endhighlight %}

---

# Assista ao Vídeo

<iframe width="1253" height="705" src="https://www.youtube.com/embed/dufzn5br7WA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

# Código criado no vídeo

### Crie um projeto
{% highlight bash %}
mkdir playmp3
cd playmp3
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

### Adicione os arquivos com os códigos abaixo:

#### `playmp3.hpp`
{% highlight cpp %}
#pragma once

#include <mpg123.h>
#include <ao/ao.h>
#include <memory>
#include <iostream>

class PlayMP3 {
  // Primitive types
  std::size_t buffer_size, done;
  int driver, err, channels, encoding;
  long rate;
  std::string track;

  // LibMPG123 type and smart pointer
  mpg123_handle *mh;
  std::shared_ptr<char> buffer;

  // AO types
  ao_sample_format format;
  ao_device *dev;

  public:
    PlayMP3();
    ~PlayMP3();
    void music(char*);
    void play();
};
{% endhighlight %}

#### `playmp3.cpp`
{% highlight cpp %}
#include "playmp3.hpp"

PlayMP3::PlayMP3(){
  ao_initialize();
  driver = ao_default_driver_id();
  mpg123_init();
  mh = mpg123_new(NULL, &err);
  buffer_size = mpg123_outblock(mh);

  // Dont use make_shared here
  buffer = std::shared_ptr<char>(
    new char[buffer_size], 
    std::default_delete<char[]>()
  );
}

void PlayMP3::music(char* mp3){
  track = mp3;
  mpg123_open(mh, mp3);
  mpg123_getformat(mh, &rate, &channels, &encoding);

  format.bits = mpg123_encsize(encoding) * 8;
  format.rate = rate;
  format.channels = channels;
  format.byte_format = AO_FMT_NATIVE;
  format.matrix = 0;
  dev = ao_open_live(driver, &format, NULL);
}

void PlayMP3::play(){
  std::cout << "\033[33;1m\u25B6 Playing the song: \033[35;1m ";
  std::cout << track << "\033[m\n";

  while(mpg123_read(mh, buffer.get(), buffer_size, &done) == MPG123_OK){
    ao_play(dev, buffer.get(), done);
  }
}

PlayMP3::~PlayMP3(){
  ao_close(dev);
  mpg123_close(mh);
  mpg123_delete(mh);
  mpg123_exit();
  ao_shutdown();
}
{% endhighlight %}

#### `main.cpp`
{% highlight cpp %}
#include "playmp3.hpp"

int main(int argc, char **argv){
  if(argc > 1){
    auto p = std::make_unique<PlayMP3>();
    p->music(argv[1]);
    p->play();
  }else{
    std::cerr << "Enter the song\n";
    return EXIT_FAILURE;
  }
  return 0;
}
{% endhighlight %}


### Compilando e tocando um MP3
> Use a música que quiser como exemplo, faça o download da música [clicando aqui](/downs/music.mp3).
>  
> Música: **SAINt JHN - "Trap" ft. Lil Baby** (*Música disponível em <https://en.mygomp3.com/>*): `wget -q https://cutt.ly/musicmp3 -O music.mp3`.

{% highlight bash %}
g++ main.cpp playmp3.cpp -o playmp3 -lmpg123 -lao
./playmp3 music.mp3
{% endhighlight %}

---

# Links úteis
+ <https://pt.wikipedia.org/wiki/Xiph.Org>
+ <https://en.wikipedia.org/wiki/Audio_codec>
+ <https://xiph.org/ao/>
+ <https://en.wikipedia.org/wiki/Mpg123>
+ <https://mpg123.org/api/mpg123__to__out123_8c_source.shtml>
+ <https://mpg123.org/api/mpg123__to__out123_8c.shtml>
+ <https://mpg123.org/api/group__mpg123__examples.shtml>

