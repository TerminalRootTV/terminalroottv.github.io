---
layout: post
title: "Como Criar uma Animação do Sistema Solar com C++ e Raylib"
date: 2025-04-01 18:27:29
image: '/assets/img/raylib/solar-system-raylib.jpg'
description: "🚀 Com DEPLOY NA WEB!"
icon: 'ion:terminal-sharp'
iconname: 'C++/Raylib'
tags:
- raylib
- cpp
- gamedev
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Nesse vídeo fizemos uma animação com [C++](https://terminalroot.com.br/tags#cpp) e [Raylib](https://terminalroot.com.br/tags#raylib) similar a [essa](https://terminalroot.com.br/2021/04/sistema-solar-feito-com-html-css-e-javascript-puro.html) que mostramos há um tempo atrás.

No final fizemos o [DEPLOY na WEB](https://terminalroot.com.br/web/solarsystem). 

---

## Assista ao Vídeo

<iframe width="1303" height="733" src="https://www.youtube.com/embed/ECBmzjOmLgA" title="" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

---

## Códigos criado no vídeo


<!-- SQUARE - GAMES ROOT -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

<details>
 <summary><code>solarsystem.hpp</code></summary>

{% highlight cpp %}
#pragma once

#include "raylib.h"
#include <memory>
#include <vector>
#include <cmath>

class SolarSystem {
  const float sun_size = 60.f;
  Vector2 window, center;

  std::vector<float> planet_radius, planet_sizes, 
    planet_velocities, planet_angle;
  std::vector<Color> colors;

  const float moon_size = 5, moon_radius = 30, 
        moon_velocity = 10;
  float moon_angle;
  int earth_pos;

  bool fullscreen;

  public:
    SolarSystem();
    void run();
};
{% endhighlight %}

</details>



<details>
 <summary><code>solarsystem.cpp</code></summary>

{% highlight cpp %}
#include "solarsystem.hpp"

SolarSystem::SolarSystem(){
  window = {1920, 1080};
  InitWindow(window.x, window.y, "Solar System");
  SetTargetFPS(60);
  center = {GetScreenWidth() / 2.f, GetScreenHeight() / 2.f};

  planet_radius = {80, 110, 165, 225, 310, 430, 515, 565};
  planet_velocities = {1.607f, 1.174f, 1.f, 0.802f, 0.434f, 0.323f, 0.228f, 0.182f};
  planet_sizes = {10, 15, 20, 18, 60, 55, 25, 22};
  colors = {
    {115, 147, 179, 255},
    {255, 87, 51, 255},
    {30, 144, 255, 255}, 
    {178, 34, 34, 255},
    {210, 105, 30, 255},
    {220, 20, 60, 255},
    {72, 209, 204, 255}, 
    {65, 105, 225, 255}
  };
  planet_angle.assign(8, 0);

  moon_angle = {0};
  for(size_t i = 0; i < planet_sizes.size();++i){
    if(planet_sizes[i] == 20){
      earth_pos = i;
    }
  }

  fullscreen = {false};
}

void SolarSystem::run(){
  while (!WindowShouldClose()){

    if(IsKeyPressed(KEY_F11)){
      fullscreen = !fullscreen;
      if(fullscreen){
        int monitor = GetCurrentMonitor();
        SetWindowSize(GetMonitorWidth(monitor), GetMonitorHeight(monitor));
        ToggleFullscreen();
      }else{
        ToggleFullscreen();
        SetWindowSize(window.x, window.y);
      }
    }

    for(size_t i = 0; i < planet_radius.size(); ++i){
      planet_angle[i] += planet_velocities[i] * 0.02f;
    }
    moon_angle += moon_velocity * 0.009f;

    BeginDrawing();
    ClearBackground(BLACK);
    DrawCircleV(center, sun_size, YELLOW);

    for(size_t i = 0; i < planet_radius.size(); ++i){
      DrawRing(center, planet_radius[i] - 1, planet_radius[i] + 1, 0, 360, 100, Color{60, 60, 60, 255});

      Vector2 planet_pos = {
        center.x + std::cos(planet_angle[i]) * planet_radius[i],
        center.y + std::sin(planet_angle[i]) * planet_radius[i]
      };
      DrawCircleV(planet_pos, planet_sizes[i], colors[i]);

      if((int)i == earth_pos){
        DrawRing(planet_pos, moon_radius - 1, moon_radius + 1, 0, 360, 100, Color{60, 60, 60, 255});
        Vector2 moon_pos = {
          planet_pos.x + std::cos(moon_angle) * moon_radius,
          planet_pos.y + std::sin(moon_angle) * moon_radius,
        };
        DrawCircleV(moon_pos, moon_size, WHITE);
      }
    }

    EndDrawing();
  }
  CloseWindow();
}
{% endhighlight %}

</details>

---


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

<details>
 <summary><code>main.cpp</code></summary>

{% highlight cpp %}
#include "solarsystem.hpp"

int main(){
  auto obj = std::make_unique<SolarSystem>();
  obj->run();
  return 0;
}
{% endhighlight %}

</details>

<details>
 <summary><a href="https://github.com/terroo/terlang">build.ter</a></summary>

{% highlight cpp %}
auto flags = "-g -Wall -Werror -Wpedantic -fsanitize=address"
flags = "-O3 -ffast-math"

auto build = "g++ " + flags + " *.cpp -lraylib -lGL -lm -lpthread -ldl -lrt -lX11"
output(build)

exec(build)
exec("./a.out >/dev/null")
{% endhighlight %}

</details>

---

## Links úteis
+ [👑 Aprenda a criar sua própria linguagem de programação](https://terminalroot.com.br/mylang)
+ [✅ Aprenda Criação de Games com C++ e SFML](https://terminalroot.com.br/games)
+ [✅ Pacote Promocional C++](https://terminalroot.com.br/promo)
+ [✅ Aprenda C++ e Qt](https://terminalroot.com.br/cpp)
+ [✅ Conheça nossos Cursos](https://bit.ly/CursosTerminalRoot)
+ [🎁 Todos os Cursos na Udemy](https://bit.ly/UdemyTerminalRoot)
+ [Rodando na Web](https://terminalroot.com.br/web/solarsystem)
+ <https://terminalroot.com.br/2021/04/sistema-solar-feito-com-html-css-e-javascript-puro.html>
+ <https://terminalroot.com.br/2022/11/crie-jogos-para-windows-linux-e-web-com-raylib-c-cpp.html>
+ <https://terminalroot.com.br/2024/11/como-instalar-raylib-com-suporte-para-web.html>
+ <https://github.com/terroo/terlang>

---

## 👀 Veja também:)
+ [🔗 Como 'hackear' a linguagem de programação Ter/Terlang](https://terminalroot.com.br/2025/03/como-hackear-a-linguagem-de-programacao-ter-terlang.html)
+ [🔗 Os 10 Melhores Livros de Programação de Todos os Tempos](https://terminalroot.com.br/2025/03/os-10-melhores-livros-de-programacao-de-todos-os-tempos.html)
+ [🔗 10 livros sobre Inteligência Artificial para Programadores](https://terminalroot.com.br/2025/03/10-livros-sobre-inteligencia-artificial-para-programadores.html)
+ [🔗 Conheça 8 flags para melhorar drasticamente a velocidade do seu software](https://terminalroot.com.br/2025/03/conheca-algumas-flags-para-melhorar-a-velocidade-do-seu-software.html)
+ [🔗 Como Automatizar Criptografia com script C++](https://terminalroot.com.br/2025/03/como-automatizar-criptografia-com-script-cpp.html)
+ [🔗 5 Extensões para VSCode independente da Linguagem de Programação](https://terminalroot.com.br/2025/03/5-extensoes-para-vscode-independente-da-linguagem-de-programacao.html)
+ [🔗 7 Exemplos de Uso do PowerShell](https://terminalroot.com.br/2025/03/7-exemplos-de-uso-do-powershell.html)
+ [🔗 Série Go: Uma abordagem sobre a Linguagem de Programação Golang)
](https://terminalroot.com.br/2025/03/serie-go-uma-abordagem-sobre-a-linguagem-de-programacao-golang.html)

