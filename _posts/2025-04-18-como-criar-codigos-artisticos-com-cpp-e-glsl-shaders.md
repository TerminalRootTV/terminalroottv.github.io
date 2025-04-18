---
layout: post
title: "Como Criar Códigos Artísticos com C++ e GLSL(Shaders)"
date: 2025-04-18 19:45:27
image: '/assets/img/opengl/shader-glsl-sfml-cpp.jpg'
description: "🚀 GLSL é uma linguagem para criar sombreamentos(ou shaders em inglês) de alto nível. Ela é baseada no C, por isso possui uma sintaxe muito similar."
icon: 'ion:terminal-sharp'
iconname: 'GLSL'
tags:
- opengl
- cpp
- sfml
- gamedev
- multimidia
- glsl
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**GLSL** é uma linguagem para criar *sombreamentos*(ou **shaders** em inglês) de alto nível. Ela é baseada no [C](https://terminalroot.com.br/tags#linguagemc), por isso possui uma sintaxe muito similar.

GLSL é a principal linguagem de sombreamento para [OpenGL](https://terminalroot.com.br/tags#opengl), é muito usada por programadores artistas, ou seja, um código para criar arte e vice-versa.

---

## ▶️ Assista ao Vídeo

<iframe width="1280" height="720" src="https://www.youtube.com/embed/OIdxsFEYAgY" title="Como Criar Códigos Artísticos com C++ e GLSL(Shaders)" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


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

## 👀 Códigos criados no Vídeo

> `shader.frag`
{% highlight glsl %}
#version 150 core

uniform float iTime;
uniform vec3 iResolution;
out vec4 fragColor;

vec3 rand_colors(float f){
  vec3 a = vec3(0.5f, 0.5f, 0.5f);
  vec3 b = vec3(0.5f, 0.5f, 0.5f);
  vec3 c = vec3(1.0f, 1.0f, 1.0f);
  vec3 d = vec3(0.123f, 0.456f, 0.567f);

  return a + b * cos(6.5 * (c * f + d));
}

void main(){
  vec2 fragCoord = gl_FragCoord.xy;
  vec2 uv = (fragCoord * 2.0 - iResolution.xy) / iResolution.y;

  for(int i = 0;  i < 4; ++i){
    uv = fract(uv);
    uv -= 0.5;

    float d = length(uv);

    vec3 color = rand_colors(d + iTime);

    d = sin(d * 8.f + iTime * 3.f) / 6.f;
    d = abs(d);
    //d -= 0.5;
    d = 0.02f / d;
    color *= d;

    fragColor = vec4(color, 1.0);
  }
}
{% endhighlight %}

> Código básico `.frag` para criar um projeto do zero:
{% highlight glsl %}
#version 150 core

uniform float iTime;
uniform vec3 iResolution;
out vec4 fragColor;

void main(){
  vec2 fragCoord = gl_FragCoord.xy;
}
{% endhighlight %}

---


## 🔗 Links citados no Vídeo
+ <https://www.shadertoy.com/>
+ Shader criado no vídeo: <https://www.shadertoy.com/view/33sSzM>
+ Shader usado no final do vídeo: <https://www.shadertoy.com/view/w3lSzN>
+ <https://thebookofshaders.com/>
+ Doc função `length`: <https://thebookofshaders.com/glossary/?search=length>
+ [Tutorial de OpenGL para Iniciantes](https://terminalroot.com.br/2024/02/tutorial-de-opengl-para-iniciantes.html)

Links para cursos:
+ [👑 Aprenda a criar sua própria linguagem de programação](https://terminalroot.com.br/mylang)
+ [✅ Aprenda Criação de Games com C++ e SFML](https://terminalroot.com.br/games)
+ [✅ Pacote Promocional C++](https://terminalroot.com.br/promo)
+ [✅ Aprenda C++ e Qt](https://terminalroot.com.br/cpp)
+ [✅ Conheça nossos Cursos](https://bit.ly/CursosTerminalRoot)
+ [🎁 Todos os Cursos na Udemy](https://bit.ly/UdemyTerminalRoot)

Links adicionais:
+ <https://pt.wikipedia.org/wiki/GLSL>
+ <https://pt.wikipedia.org/wiki/Pixel_Shader>
+ <https://www.khronos.org/opengl/wiki/Core_Language_(GLSL)>
+ <https://iquilezles.org/articles/>
+ <https://registry.khronos.org/OpenGL-Refpages/gl4/html/length.xhtml>
+ <https://iquilezles.org/articles/palettes/>
