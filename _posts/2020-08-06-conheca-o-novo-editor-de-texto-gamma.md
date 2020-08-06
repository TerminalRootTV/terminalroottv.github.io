---
layout: post
title: "Conheça o novo editor de texto Gamma"
date: 2020-08-06 12:49:31
image: '/assets/img/editores/gama.jpg'
description: 'Ele pretende ser o editor padrão do GNOME.'
icon: 'bx:bxs-edit'
iconname: 'editor'
tags:
- editores
- linux
---

![Conheça o novo editor de texto Gamma](/assets/img/editores/gama.jpg)

[Gamma (Γ)](https://gitlab.com/hamadmarri/gamma-text-editor) é um editor de texto leve. Ele pretende ser uma alternativa ao [Gedit](https://terminalroot.com.br/tags/#gedit) ou ao [Notepad++](https://notepad-plus-plus.org/). Embora a implementação atual seja testada no [Linux](https://terminalroot.com.br/tags/#linux) com ambiente desktop [GNOME](https://terminalroot.com.br/tags/#gnome), ele também pode ser executado no [Linux](https://terminalroot.com.br/linux), [Windows](https://terminalroot.com.br/tags/#windows) e [Mac](https://terminalroot.com.br/tags/#macos) se as dependências estiverem instaladas (consulte a seção Dependências abaixo). Gamma usa [GTK3](https://www.gtk.org/) (kit de ferramentas GUI de plataforma cruzada) e PyGObject que é um pacote [Python](https://terminalroot.com.br/tags/#python) que fornece ligações para bibliotecas baseadas em GObject, como GTK, GStreamer, WebKitGTK, GLib, GIO e muito mais.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# Por que um novo editor de texto?
+ Leve, sem fome de CPU/RAM
+ Sem curva de aprendizado (atalhos fáceis/familiares, uso fácil de plugins/extensões)
+ Totalmente personalizável de A a Z (mesmo o layout da interface do usuário)
+ Nova abordagem de UX para editores de texto
+ Sistema de plugins fácil
+ Feito usando Python para colaboradores python

# Dependencias
+ GTK+3
+ GtkSourceview 4 (works for 3.0 but currently need to manually change the version in python files)
+ Python 3
+ gobject-introspection

Se você estiver usando o Linux com um desktop [GNOME](https://terminalroot.com.br/2020/04/as-15-melhores-extensoes-para-seu-gnome.html), provavelmente já possui essas dependências instaladas. Eu não tenho certeza se as bibliotecas estão instaladas para outras áreas de trabalho, como KDE, XFCE ou [MATE](https://terminalroot.com.br/2017/09/como-instalar-o-mate-desktop-no-freebsd-11-1.html). Mas se você tem libgtk-3-0 e python3 instalados, então Gamma provavelmente vai funcionar.

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# Instalação
```sh
git clone https://gitlab.com/terminalroot/gamma-text-editor/
git clone 
cd gamma-text-editor 
chmod +x setup.sh
./setup.sh
```
> Observação: O repositório oficial é: <https://gitlab.com/hamadmarri/gamma-text-editor> , mas eu forkei e alterei a Shebang que está incorreta, para que você não precise alterar na "mão grande", eu enviei um Pull Request para eles, mas é uma alteração tão simples, que acredito que nem precisa disso, mas já comentei lá e acredito que eles vão alterar logo em breve.


# Utilização e configuração
O Gamma é um editor de texto muito intuitivo, mas caso você deseje mais informações, sugiro vocês consultarem a documentação oficial no Gitlab deles no endereço: <https://gitlab.com/hamadmarri/gamma-text-editor>

<!-- RETANGULO LARGO 2 -->
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


### Fui!
