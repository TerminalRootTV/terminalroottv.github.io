---
layout: post
title: "TermMark: Markdown direto no terminal, sem dependências"
date: 2026-04-07 19:13:05
image: '/assets/img/terminal/termark.jpg'
description: "Se você curte CLI raiz e produtividade, um visualizador de Markdown minimalista feito em C++ que roda direto no terminal."
icon: 'ion:terminal-sharp'
iconname: 'Terminal'
tags:
- terminal
- cli
- markdown
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')


---

O TermMark é um **Markdown viewer para terminal**, focado em simplicidade e performance. Ele renderiza arquivos `.md` com formatação legível — sem precisar de browser, Electron ou libs pesadas.


+ **Zero dependências**
+ **Extremamente leve (C++)**
+ **Interface baseada em terminal (TUI simples)**

---

## Instalação 

```bash
git clone https://github.com/ishanawal/TermMark.git
cd TermMark
mkdir build && cd build
cmake ..
make
sudo install -v termmark /usr/local/bin/
```

Para utilizar consulte o `help` rápido:

```bash
termmark --help
```

Para mais informações acesse o repositório: <https://github.com/ishanawal/TermMark>.

