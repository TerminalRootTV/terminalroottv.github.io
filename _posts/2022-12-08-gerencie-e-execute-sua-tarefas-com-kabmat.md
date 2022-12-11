---
layout: post
title: "Gerencie e execute sua Tarefas com Kabmat"
date: 2022-12-08 10:36:13
image: '/assets/img/tui/kabmat.jpg'
description: 'Programa gráfico escrito em C++ que roda no terminal(TUI) para gerenciar quadros kanban com combinações de teclas estilo Vim.'
icon: 'ion:terminal-sharp'
iconname: 'TUI'
tags:
- tui
- cpp
- ncurses
- dicas
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**Kabmat** é um software via linha de comando escrito em [C++](https://terminalroot.com.br/tags#cpp) que utiliza a biblioteca [ncurses](https://terminalroot.com.br/ncurses) que facilita o gerenciamento dos quadros em Kanban.

Kanban é um estilo de organização e execução de tarefas em tempo real, ou seja, ele evita a famosa: procrastinação, em resumo seria:
> Agendou? Faça!

Foi desenvolvido pela Toyota(uma fabricante automotiva multinacional de origem Japonesa).

O Kabmat unido ao terminal, que é de fácil acesso, facilita ainda mais você agendar e executar suas tarefas.

---

# Instalação
Você precisará da seguintes dependências: [git](https://terminalroot.com.br/tags#git), [make](https://terminalroot.com.br/tags#make) e [gcc/g++](https://terminalroot.com.br/tags#gcc).

Após possuir todas as dependências clone o repositório, compile e instale com os comandos:

{% highlight bash %}
git clone https://github.com/PlankCipher/kabmat
cd kabmat
sed -i 's/-lncurses/-lncurses -ltinfo/g' Makefile
make
sudo make install
cd ..
rm -rf kabmat
{% endhighlight %}

Para verificar se está tudo certo, verifique a versão com o comando:
{% highlight bash %}
kabmat --version
{% endhighlight %}

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

# Utilização
Para abrir o Kabmat, basta rodar o comando:
{% highlight bash %}
kabmat
{% endhighlight %}

Pressione teclas no seu teclado para:
+ `c` → Criar um novo quadro, 
+ `i` → Para entrar no modo de inserção(`INSERT`, estilo [Vim](https://terminalroot.com.br/tags#vim) e escreva o nome do seu quadroi e salve com [ENTER].
+ `d` → E em seguida para
+ Use as teclas `j`, `k`, `l` e `h` para mover um quadro.
+ `d` → para deletar
+ `q` → duas vezes para sair do Kabmat

Para mais informações use o `help`:
{% highlight bash %}
kabmat --help
{% endhighlight %}

E consulte o [repositório do Kabmat no GitHub](https://github.com/PlankCipher/kabmat).


![Kabmat rodando](https://github.com/PlankCipher/kabmat/raw/master/assets/kabmat.gif) 

---

# links úteis
+ <https://en.wikipedia.org/wiki/Kanban>
+ <https://en.wikipedia.org/wiki/Kanban>



