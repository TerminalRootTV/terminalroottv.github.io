---
layout: post
title: "Aprenda a Criar Jogos com Allegro C/C++ no Windows e Linux"
date: 2022-12-11 17:25:11
image: '/assets/img/gamedev/allegro-c-cpp.jpg'
description: 'Nesse vídeo vamos ver como instalar o Allegro no Windows 10, tanto no Visual Studio como com MinGW para compilar com gcc/g++ e escrever seu código no seu editor preferido.'
icon: 'ion:terminal-sharp'
iconname: 'GameDev/C/C++'
tags:
- gamedev
- allegro
- linguagemc
- cpp
- windows
- gnu
- linux
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

[Allegro](https://liballeg.org/) é uma biblioteca multiplataforma voltada principalmente para desenvolvimento de jogos em [C](https://terminalroot.com.br/tags#linguagemc) e [C++](https://terminalroot.com.br/tags#cpp), mas também é muito utilizada em programação multimídia.

Nesse vídeo vamos ver como instalar o **Allegro** no [Windows 10](https://terminalroot.com.br/tags#windowa), tanto no [Visual Studio](https://terminalroot.com.br/2021/12/os-32-melhores-ides-editores-de-texto-para-cpp.html) como com [MinGW para compilar com gcc/g++](https://terminalroot.com.br/2022/12/como-instalar-gcc-gpp-mingw-no-windows.html) e escrever seu código no seu editor preferido, seja o [VS Code](https://terminalroot.com.br/tags#vscode), [Vim](https://terminalroot.com.br/tags#vim), [Neovim](https://terminalroot.com.br/tags#neovim), [Code::Blocks e entre outros](https://terminalroot.com.br/2021/12/os-32-melhores-ides-editores-de-texto-para-cpp.html).

---

# Assista ao vídeo

<iframe width="1253" height="705" src="https://www.youtube.com/embed/mJFYV8Hk6jY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

# Códigos e Arquivos Utilizados no Vídeo

## Makefile para [Windows](https://terminalroot.com.br/tags#windows)
**DICA**: Renomei o arquivo `mingw32-make.exe` na pasta `C:\mingw64\bin\mingw32-make` para somente `make.exe`.

{% highlight makefile %}
TARGET=program.exe
CC=gcc
ALLEGRO=C:\allegro\include
STATIC=liballegro_monolith.dll.a
LD=gcc
OBJS=main.o
all: $(OBJS)
	$(LD) -I $(ALLEGRO) -o $(TARGET) $(OBJS)  $(STATIC)
	$(TARGET)
main.o: main.c
	$(CC) -I $(ALLEGRO) -c main.c -o main.o
{% endhighlight %}

Para compilar e rodar use o `CMD` ou o [PowerShell](https://terminalroot.com.br/2021/12/como-instalar-powershell-no-ubuntu-e-primeiros-passos.html) com o seguinte comando:
> Antes entre na pasta onde há seu arquivo `main.c` e o Makefile.

{% highlight bash %}
make
{% endhighlight %}
> Ou se não estiver renomeado o arquivo: `mingw32-make`

---

## Makefile para [GNU](https://terminalroot.com.br/tags#gnu)/[Linux](https://terminalroot.com.br/tags#linux)
{% highlight bash %}
TARGET=a.out
CC=gcc
DEBUG=-g
OPT=-O0
WARN=-Wall
ALLEGRO=-lallegro -lallegro_main -lallegro_audio -lallegro_dialog -lallegro_ttf -lallegro_image -lallegro_color -lallegro_memfile -lallegro_acodec -lallegro_primitives -lallegro_font
CCFLAGS=$(DEBUG) $(OPT) $(WARN) $(ALLEGRO)
LD=gcc
OBJS= main.o
all: $(OBJS)
	$(LD) -o $(TARGET) $(OBJS) $(CCFLAGS)
	@rm *.o
	@./$(TARGET)

main.o: main.c
	$(CC) -c $(CCFLAGS) main.c -o main.o
{% endhighlight %}


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

## Exemplo básico de teste
> `main.c`

{% highlight c %}
#include <allegro5/allegro.h>
#include <allegro5/allegro_font.h>

int main (){

  al_init();
  al_init_font_addon();

  ALLEGRO_DISPLAY * display = al_create_display(640,480);
  al_set_window_position(display, 200, 200);

  ALLEGRO_FONT* font = al_create_builtin_font();
  ALLEGRO_TIMER* timer = al_create_timer(1.0 / 60.0);

  ALLEGRO_EVENT_QUEUE * event_queue = al_create_event_queue();
  al_register_event_source(event_queue, al_get_display_event_source(display));
  al_register_event_source(event_queue, al_get_timer_event_source(timer));
  al_start_timer(timer);

  while(true){
    ALLEGRO_EVENT event;
    al_wait_for_event(event_queue, &event);
    if( event.type == ALLEGRO_EVENT_DISPLAY_CLOSE ){
      break;
    }

    al_clear_to_color(al_map_rgb(255,255,255));
    al_draw_text(font, al_map_rgb(0, 0, 0), 230, 200, 0, "Allegro is working!");
    al_flip_display();
  }

  al_destroy_font(font);
  al_destroy_display(display);
  al_destroy_event_queue(event_queue);

  return 0;
}
{% endhighlight %}
> Rode no [terminal](https://terminalroot.com.br/tags#terminal) dentro do diretório onde há o seu `main.c` e o `Makefile`: `make`.

---

## Image Sprite do Dragão
![Dragon Allegro Example](/downs/allegro/sprite.png) 


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

## Imagem de Fundo
![Background Image Allegro Example](/downs/allegro/bg.png) 


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

## Fonte para o Texto

<a href="/downs/allegro/font.ttf" class="btn btn-danger btn-lg">Clique aqui para baixar a fonte</a>

---

## Código Final do Exemplo

{% highlight c %}
#include <allegro5/allegro.h>
#include <allegro5/allegro_font.h>
#include <allegro5/allegro_ttf.h>
#include <allegro5/allegro_image.h>
#include <allegro5/keyboard.h>
//  573 / 3 = 191 → largura
// 644 / 4 = 161  → altura


int main (){

  al_init();
  al_init_font_addon();
  al_init_ttf_addon();
  al_init_image_addon();
  al_install_keyboard();

  ALLEGRO_DISPLAY * display = al_create_display(1280,720);
  al_set_window_position(display, 200, 200);
  al_set_window_title(display, "Here be Dragons!");

  ALLEGRO_FONT* font = al_load_font("./font.ttf", 25, 0);
  ALLEGRO_TIMER* timer = al_create_timer(1.0 / 30.0);

  ALLEGRO_BITMAP * sprite = al_load_bitmap("./dragon.png");
  ALLEGRO_BITMAP * bg = al_load_bitmap("./bg.png");

  ALLEGRO_EVENT_QUEUE * event_queue = al_create_event_queue();
  al_register_event_source(event_queue, al_get_display_event_source(display));
  al_register_event_source(event_queue, al_get_timer_event_source(timer));
  al_register_event_source(event_queue, al_get_keyboard_event_source() );
  al_start_timer(timer);

  float frame = 0.f;
  int pos_x = 0, pos_y = 0;
  int current_frame_y = 161;

  while(true){
    ALLEGRO_EVENT event;
    al_wait_for_event(event_queue, &event);
    if( event.type == ALLEGRO_EVENT_DISPLAY_CLOSE ){
      break;
    }else if( event.keyboard.keycode == ALLEGRO_KEY_RIGHT ){
      current_frame_y = 161;
      pos_x += 20;
    }else if( event.keyboard.keycode == ALLEGRO_KEY_LEFT ){
      current_frame_y = 161 * 3;
      pos_x -= 20;
    }else if( event.keyboard.keycode == ALLEGRO_KEY_DOWN ){
      current_frame_y = 161 * 2;
      pos_y += 20;
    }else if( event.keyboard.keycode == ALLEGRO_KEY_UP ){
      current_frame_y = 0;
      pos_y -= 20;
    }

    frame += 0.3f;
    if( frame > 3){
      frame -= 3;
    }

    al_clear_to_color(al_map_rgb(255,255,255));
    al_draw_bitmap(bg, 0, 0, 0);
    al_draw_text(font, al_map_rgb(0,0,0), 7, 7, 0, "SCORE: dragon");
    al_draw_text(font, al_map_rgb(255,255,255), 5, 5, 0, "SCORE: dragon");
    al_draw_bitmap_region(sprite, 191 * (int)frame, current_frame_y, 191, 161, pos_x, pos_y, 0);
    al_flip_display();
  }

  al_destroy_bitmap(bg);
  al_destroy_bitmap(sprite);
  al_destroy_font(font);
  al_destroy_display(display);
  al_destroy_event_queue(event_queue);

  return 0;
}
{% endhighlight %}

---

# Links Úteis
+ 🔗 [Como Instalar GCC/G++ MinGW no Windows](https://terminalroot.com.br/2022/12/como-instalar-gcc-gpp-mingw-no-windows.html)
+ 🔗 [Como Instalar o Vim e Neovim no Windows](https://terminalroot.com.br/2022/12/como-instalar-o-vim-e-neovim-no-windows.html)
+ 🔗 [Conheça 5 Bibliotecas para Criação de Jogos 2D em C++](https://youtu.be/6_uFAeW1PAM)
+ 🔗 [Crie Jogos para Windows, Linux e Web com Raylib C/C++](https://youtu.be/LZUMVdkWWrg)
+ <https://liballeg.org/>
+ <https://liballeg.org/examples_demos.html>

### ✅ Aprenda Criação de Games com C++ e SFML: <https://terminalroot.com.br/games>
### ✅ Pacote Promocional C++: <https://terminalroot.com.br/promo>
### ✅ Aprenda C++ e Qt: <https://terminalroot.com.br/cpp>
### ✅ Conheça nossos Cursos: <https://bit.ly/CursosTerminalRoot>
> 🎁 Todos os Cursos na Udemy: <https://bit.ly/UdemyTerminalRoot>
