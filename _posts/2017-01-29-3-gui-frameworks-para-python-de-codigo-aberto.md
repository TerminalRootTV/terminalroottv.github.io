---
layout: post
title: "3 GUI Frameworks para Python de Código Aberto"
date: 2017-01-29 12:42:47
image: '/assets/img/python/python-gui-mini.jpg'
description: "Chega um momento na jornada da maioria dos programadores que ele precisa construir uma interface gráfica para seu programa."
main-class: 'python'
color: '#3174a7'
tags:
- python
categories:
twitter_text: "3 GUI Frameworks para Python de Código Aberto"
introduction: "Chega um momento na jornada da maioria dos programadores que ele precisa construir uma interface gráfica para seu programa."
---

![GUI Frameworks Python](/assets/img/python/python-gui.jpg)

## Introdução

Chega um momento na jornada da maioria dos programadores que ele precisa construir uma interface gráfica para seu programa.

No Python, as etapas para começar com a programação GUI não são terrivelmente complexas, mas exigem que o usuário comece a fazer algumas escolhas. Por sua natureza como uma linguagem de programação de propósito geral com intérpretes disponíveis em todos os sistemas operacionais comuns, o Python precisa ser bastante agnóstico quanto às opções que apresenta para criar interfaces gráficas de usuário.

Felizmente, existem muitas opções disponíveis para os programadores que procuram criar uma maneira fácil para os usuários interagirem com seus programas. Há vínculos para vários frameworks de UI em uma variedade de plataformas, incluindo aqueles nativos do Windows, Mac e Linux, e muitos que irão funcionar em todos os três.

Antes de irmos mais longe e perguntar: Será que realmente faz sentido para o seu aplicativo para ter uma interface gráfica do usuário tradicional em tudo? Para alguns programas, a resposta é óbvia. Se o seu aplicativo é para ser executado localmente em uma única máquina, então sim, você provavelmente deve construir uma interface gráfica do desktop. Muitas vezes, isso é óbvio pelo que você está projetando.

A linha de comando oferece muitas vantagens - velocidade, acesso remoto, reutilização, scriptability e controle - que podem ser mais importantes para os usuários de sua aplicação do que uma interface gráfica, e há muitas bibliotecas como Click, Cement e Cliff que facilitam a Design grande linha de comando programas.

Da mesma forma, uma interface web, mesmo para um programa destinado a ser executado localmente, pode ser uma opção que vale a pena considerar, especialmente se você acha que seus usuários podem hospedar seu aplicativo remotamente, e projetos como Django, Flask ou Pyramid fazem tudo isso direto . Você pode até mesmo usar uma biblioteca como pywebview para colocar um wrapper fino em torno de um aplicativo da web em uma janela GUI mais nativa.

Ou você pode usar uma estrutura como Pyforms para criar uma experiência consistente em toda a web. Ainda tem certeza de que deseja criar uma GUI? Então, aqui estão três fantásticas bibliotecas de código aberto para você começar.

# PyQt

![PyQt](/assets/img/python/pyqt.jpg)

[PyQt](https://riverbankcomputing.com/software/pyqt/intro) implementa a popular biblioteca [Qt](http://www.qt.io/). Ele está sob uma licença comercial e [GPL](http://www.gnu.org/licenses/gpl-3.0.en.html), não ao contrário do próprio projeto Qt, e a principal empresa de suporte PyQt oferece uma [licença FAQ](https://www.riverbankcomputing.com/commercial/license-faq) para ajudar a entender o que isso significa para o seu aplicativo.

# Tkinter

![Tkinter](/assets/img/python/tcl-tk.jpg)

Se houvesse um único pacote que poderia ser chamado de "padrão" GUI toolkit para Python, seria [Tkinter](http://tkinter.unpythonic.net/wiki/). Tkinter é um wrapper em torno de [Tcl/Tk](http://www.tcl.tk/), uma interface gráfica popular e linguagem de emparelhamento popularizado no início dos anos 90. A vantagem de escolher Tkinter é o grande número de recursos, incluindo livros e amostras de código, bem como uma grande comunidade de usuários que podem ser capazes de ajudá-lo se você tiver dúvidas. [Exemplos simples](https://docs.python.org/2/library/tkinter.html) são fáceis de começar e razoavelmente legíveis para humanos.Tkinter está disponível sob a [licença Python](http://tkinter.unpythonic.net/wiki/Tkinter), em cima da licença BSD de Tcl/Tk.

# WxPython

![WxPython](/assets/img/python/wxpython.jpg)

O [WxPython](http://www.wxpython.org/) traz a biblioteca de GUI multiplataforma [wxWidgets](http://wxwidgets.org/) do C++ para Python. WxPython é uma abordagem um pouco mais moderna para, que parece um pouco mais nativo do que Tkinter em diferentes sistemas operacionais, uma vez que não tenta criar seu próprio conjunto de widgets (embora estes possam ser temáticos para se parecer com componentes nativos). Talvez você precise agrupar o wxPython com seus aplicativos, pois ele não é instalado automaticamente com o Python. O WxPython usa a [licença de biblioteca wxWindows](http://www.wxwidgets.org/about/licence/) que é aprovado pelo [OSI](https://opensource.org/licenses/wxwindows.php).

## Finalizando

Para mais opções, confira a página [GUI programming in Python](https://wiki.python.org/moin/GuiProgramming) no wiki oficial da Python Software Foundation, onde você encontrará dezenas de outras opções. Existem grandes bibliotecas para outras situações também, como [pygame](http://www.pygame.org/wiki/gui) e [pyglet](https://bitbucket.org/pyglet/pyglet/wiki/Home).

#### Você tem um favorito que não mencionamos aqui? Deixe-nos saber nos comentários abaixo!


Via: [OpenSource.com](https://opensource.com/life/16/5/open-source-python-gui-frameworks&Blog_Linux=Terminal_Root)

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

