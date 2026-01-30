---
layout: post
title: "Vix: o 'Node.js' do C++, sem garbage collector"
date: 2026-01-30 12:47:39
image: '/assets/img/cpp/vix-cpp.jpg'
description: "🌐 Um runtime C++20 voltado para a construção de servidores web e APIs modernas, combinando I/O assíncrono, arquitetura modular e foco extremo em performance."
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
- web
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

`vix` é **um runtime/framework moderno em [C++20](https://terminalroot.com.br/tags#cpp)** para construir aplicações back-end de alto desempenho e distribuídas (offline-first, peer-to-peer etc.) — tipo alternativa nativa ao Node/Deno, com HTTP async, roteamento, ORM e módulos.

Serve para criar **servidores web, APIs e apps distribuídos em C++** com ergonomia contemporânea (sem garbage collector, sem overhead de frameworks "velhos"). Tem:

* Servidor HTTP async (Asio)
* Roteamento, middleware, JSON nativo
* [CLI](https://terminalroot.com.br/tags#cli) pra scaffold/build/run
* Módulos opcionais (ORM, WebSockets, utilitários)
  Tudo pensado para performance e aplicativos offline/P2P.


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

Clone o repositório e compile com [CMake](https://terminalroot.com.br/tags#cmake):

{% highlight sh %}
git clone https://github.com/vixcpp/vix.git
cd vix
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build -j
{% endhighlight %}
> Opcional: instale headers/artefatos no sistema (conforme docs do projeto).

Para usar como dependência em seu projeto, inclua os headers/libs compilados e configure CMake para linkar com "vix".

---

## Exemplo básico (Hello world HTTP)
Crie um arquivo `main.cpp`:

{% highlight cpp %}
#include <vix.hpp>
using namespace vix;

int main() {
    App app;

    app.get("/", [](Request&, Response& res) {
        res.send("Hello world from Vix!");
    });

    app.run(8080);
}
{% endhighlight %}

Compile com seu *CMakeLists* que linka o runtime Vix. Ao rodar, acesse> `localhost:8080`.

---

Para mais informações acesse: <https://github.com/vixcpp/vix>



