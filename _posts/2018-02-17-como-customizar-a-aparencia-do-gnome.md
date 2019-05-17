---
layout: post
title: "Como Customizar Totalmente a Aparência do GNOME"
date: 2018-02-17 23:23:49
image: '/assets/img/gnome/gnome.jpg'
description: 'Alteração dos ícones, dash, dock, painel transparente, conky entr e outras modificações interessantes no GNOME.'
main-class: 'web'
tags:
- gnome
---

> Alteração dos ícones, dash, dock, painel transparente, concky entre outras modificações interessantes no GNOME.

## Faça o download de todos os arquivo de uma única vez
<https://goo.gl/gyBpWr>

Temas, ícones, conky e outros
<http://gnome-look.org/>

Extensões do GNOME
<https://extensions.gnome.org/>

Arquivo para iniciar o __conky__ ao entrar na sessão. Crie o arquivo _/usr/share/applications/conky.desktop_ , insira os dados abaixo, lembre que o item __X-GNOME-Autostart-enabled=true__ é fundamental para o conky iniciar automaticamente, e o __Exec=conky -p 2__ você pode deixa o _tempo delay_ __-p__ como você deseja, ou nem pôr, se preferir.
{% highlight bash  %}
[Desktop Entry]
Type=Application
Name=Conky
Exec=conky -p 2
X-GNOME-Autostart-enabled=true
NoDisplay=true
{% endhighlight  %}

# Veja o Vídeo

# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=kLMXzIXEqvU)



## Comente!!!
