---
layout: post
title: "Conheça o sc-im, um 'Excel' para o terminal"
date: 2021-11-17 08:21:20
image: '/assets/img/terminal/sc-im.jpg'
description: 'Leve, rápido e intuitivo.'
icon: 'ion:terminal-sharp'
iconname: 'Dicas'
tags:
- terminal
- ncurses
- dicas
---

![Conheça o sc-im, um 'Excel' para no terminal](/assets/img/terminal/sc-im.jpg)

**sc-im** é um programa de planilha feita com [ncurses](https://terminalroot.com.br/ncurses) para [terminal](https://terminalroot.com.br/tags#terminal) .

O **sc-im** é baseado no [sc](https://en.wikipedia.org/wiki/Sc_(spreadsheet_calculator)) um aplicativo similar desenvolvido por **James Gosling**, o criador do [Java](https://terminalroot.com.br/tags#java).

Algumas das características do sc-im, são:
+ Movimentos estilo [Vim](https://terminalroot.com.br/vim) para mover entre as células;
+ Desfazer e refazer;
+ O número de linhas pode ser expandido para 1.048.576 se desejado;
+ CSV / TAB delimitado / importação e exportação de arquivo XLSX;
+ Importação de ODS. Exportação de Markdown;
+ Mapeamentos de teclas;
+ Backup automático;
+ Suporte direto a cores;
+ Exibição de gráficos;
+ Entre muitos outros.


<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# Instalação
Para instalar antes você precisará das dependências:
+ [ncurses](https://terminalroot.com.br/ncurses)
+ [bison](https://www.gnu.org/software/bison/)
+ [gcc](https://terminalroot.com.br/2019/12/gcc-vs-llvm-qual-e-o-melhor-compilador.html)
+ [make](https://terminalroot.com.br/2019/12/como-criar-um-makefile.html)
+ [pkg-config](https://www.freedesktop.org/wiki/Software/pkg-config/)
+ [git](https://terminalroot.com.br/git)

Depois de instalados, basta clonar, compilar e instalar:

{% highlight sh %}
https://github.com/andmarti1424/sc-im
cd sc-im
make
sudo make install
{% endhighlight %}

# Alguns screenshosts do `sc-im`

![sc-im 1](https://github.com/andmarti1424/sc-im/raw/main/screenshots/scim-plot-graph.gif?raw=true)

![sc-im 2](https://github.com/andmarti1424/sc-im/raw/main/screenshots/scim4.png?raw=true)

![sc-im 3](https://github.com/andmarti1424/sc-im/raw/main/screenshots/scimp3.png?raw=true)

---

Para o manual de instalação acesse [esse link](https://github.com/jonnieey/Sc-im-Tutorial) e o [repositório oficial no GitHub](https://github.com/andmarti1424/sc-im) .


