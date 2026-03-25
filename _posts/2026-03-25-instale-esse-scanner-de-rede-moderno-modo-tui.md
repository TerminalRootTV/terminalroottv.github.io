---
layout: post
title: "Instale esse Scanner de Rede Moderno modo TUI"
date: 2026-03-25 10:37:46
image: '/assets/img/go/nibble.jpg'
description: "Feito em Go e muito rápido e sem dor de cabeça."
icon: 'ion:terminal-sharp'
iconname: 'Rede'
tags:
- go
- tui
- terminal
- rede
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Se você já usou ferramentas como [nmap](https://terminalroot.com.br/2018/07/escaneado-redes-com-nmap.html) e achou pesado, verboso ou lento demais para tarefas simples, o **Nibble** resolve exatamente esse problema.

**Nibble** é um scanner de rede open-source focado em simplicidade, velocidade e usabilidade. Ele permite descobrir dispositivos e serviços na sua rede local sem precisar decorar comandos complexos ou configurar nada manualmente.Funciona em [GNU/Linux](https://terminalroot.com.br/tags#gnulinux), [macOS](https://terminalroot.com.br/tags#macos) e [Windows](https://terminalroot.com.br/tags#windows) (x86 e ARM).

---

## Instalação

* `brew install backendsystems/tap/nibble`
* `pipx install nibble-cli`
* `npm install -g @backendsystems/nibble`
* `go install github.com/backendsystems/nibble@latest`

Ou rodar direto com:

```
npx @backendsystems/nibble
```

---

Para mais informações acesse o [repositório](https://github.com/backendsystems/nibble).

