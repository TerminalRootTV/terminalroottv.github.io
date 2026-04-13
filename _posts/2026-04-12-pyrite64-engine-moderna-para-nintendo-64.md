---
layout: post
title: "Pyrite64, engine moderna para Nintendo 64"
date: 2026-04-12 22:06:32
image: '/assets/img/gamedev/pyrite64.jpg'
description: "🎮 Apesar de ter Py de Python esse motor é para desenvolvimento(scripts) com C++ ou C. "
icon: 'ion:terminal-sharp'
iconname: 'GameDev'
tags:
- gamedev
- cpp
- linguagemc
- c
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**Pyrite64** é uma engine + editor visual open source para criar jogos **3D nativos de Nintendo 64** — não "estilo N64", mas que rodam de verdade no hardware original ou em emuladores precisos. Para desenvolvimento(scripts) com [C++](https://terminalroot.com.br/cpp) ou [C](https://terminalroot.com.br/c)

Qual a ideia?

* Substituir o workflow antigo (SDKs confusos + toolchains quebradas)
* Trazer algo mais próximo de Unity/Godot, mas focado no N64
* Gerar ROMs reais compatíveis com o console


Com:
* Editor visual com gerenciamento de cenas
* Import de modelos (GLTF / Blender + Fast64)
* Node graph (script visual básico)
* Engine runtime (render, colisão, áudio, etc.)
* HDR + bloom adaptado ao N64
* Asset manager com limpeza automática ([AlternativeTo][2])


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

### [Windows](https://terminalroot.com.br/tags#windows)
O próprio projeto automatiza quase tudo.

1. Baixe o release (ou clone o repo)
2. Execute o editor
3. Ele instala automaticamente:


### [GNU/Linux](https://terminalroot.com.br/tags#gnulinux)

Dependências:
* [GCC](https://terminalroot.com.br/tags#gcc)/[Clang](https://terminalroot.com.br/tags#llvm)
* [CMake](https://terminalroot.com.br/tags#cmake)
* `libs` básicas de `build`
* toolchain do `libdragon`

Depois é só clonar, compilar e instalar

{% highlight bash %}
git clone https://github.com/HailToDodongo/pyrite64
cd pyrite64
mkdir build && cd build
cmake ..
make
sudo make install
{% endhighlight %}

---

## Primeiros passos

1. Criar projeto

Dentro do editor:

* New Project
* Define nome + pasta
* Ele cria estrutura com `project.p64proj`

---

2. Configurar toolchain + emulador

Arquivo:

{% highlight json %}
project.p64proj
{% endhighlight %}

Campos importantes:

{% highlight json %}
"pathEmu": "ares",
"pathN64Inst": "/caminho/toolchain"
{% endhighlight %}

* `pathEmu` → comando do emulador
* `pathN64Inst` → raiz da toolchain ([Instagit][3])

---

3. Importar assets

Fluxo típico:

* Modela no Blender
* Exporta GLTF
* Importa no editor

4. Montar cena

* Adiciona objetos
* Ajusta transform
* Define materiais

---

5. Lógica do jogo

Duas opções:

* Node graph (visual)
* [C++](https://terminalroot.com.br/promo) (mais controle)

6. Build e rodar

* Botão “Run”
* Gera ROM
* Abre no emulador automaticamente

---

Para mais informações acesse o [site oficial com FAQ](https://hailtododongo.github.io/pyrite64/docs/faq.html#do-i-need-to-know-programming).

---

## Veja também:
+ [Curso de Criação de Games com C++ e SFML para Windows e Linux](https://terminalroot.com.br/sfml/)
+ [Curso Moderno de C++](https://terminalroot.com.br/cpp/)


