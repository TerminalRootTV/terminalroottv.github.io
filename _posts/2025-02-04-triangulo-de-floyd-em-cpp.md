---
layout: post
title: "Triângulo de Floyd em C++"
date: 2025-02-04 23:06:47
image: '/assets/img/shorts/piramide-de-floyd.jpg'
description: "🚀 Também conhecido como Pirâmide de Floyd."
icon: 'ion:terminal-sharp'
iconname: 'Vídeo Curto'
tags:
- cpp
- shorts
- tiktok
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

O **triângulo de Floyd** é uma matriz triangular de números naturais usada na educação em ciência da computação. Ele é nomeado em homenagem a **Robert Floyd**.

Abaixo um exemplo em [C++](https://terminalroot.com.br/tags#cpp):

---

## [Short](https://www.youtube.com/shorts/T4n3ERiS-SE?feature=share)

<iframe width="461" height="819" src="https://www.youtube.com/embed/T4n3ERiS-SE" title="Pirâmide de Floyd em C++" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

---

## [TikTok](https://www.tiktok.com/@terminalroot/video/7467750341266738437)

<blockquote class="tiktok-embed" cite="https://www.tiktok.com/@terminalroot/video/7467750341266738437" data-video-id="7467750341266738437" style="max-width: 605px;min-width: 325px;" > <section> <a target="_blank" title="@terminalroot" href="https://www.tiktok.com/@terminalroot?refer=embed">@terminalroot</a> Pirâmide de Floyd em C++ <a title="cpp" target="_blank" href="https://www.tiktok.com/tag/cpp?refer=embed">#cpp</a> <a title="cplusplus" target="_blank" href="https://www.tiktok.com/tag/cplusplus?refer=embed">#cplusplus</a> <a title="programming" target="_blank" href="https://www.tiktok.com/tag/programming?refer=embed">#programming</a> <a target="_blank" title="♬ Resenha do Arrocha - J. Eskine &#38; Alef Donk" href="https://www.tiktok.com/music/Resenha-do-Arrocha-7439851175086983169?refer=embed">♬ Resenha do Arrocha - J. Eskine &#38; Alef Donk</a> </section> </blockquote> <script async src="https://www.tiktok.com/embed.js"></script>

---

## Código
> `main.cpp`

{% highlight cpp %}
#include <iostream>

int main(){
  std::string sequence {};
  std::cout << "Enter your SEQUENCE: ";
  std::getline(std::cin, sequence);
  for(int i {}; i < sequence.length(); ++i){
   for(int j = sequence.length(); j >= i; --j){
    std::cout << " ";
   }
   for(int k {}; k <= i; ++k){
    std::cout << " " << 
      sequence[k];
   }
   ++i;
   std::cout.put('\n');
  }
  return EXIT_SUCCESS;
}
{% endhighlight %}


