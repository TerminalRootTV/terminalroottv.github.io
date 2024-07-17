---
layout: post
title: "Como Instalar a PDCurses, a ncurses no Windows"
date: 2024-07-17 20:24:30
image: '/assets/img/windows/pdcurses.jpg'
description: "⚪ Uma biblioteca idêntica a ncurses, mas para DOS/Windows."
icon: 'ion:terminal-sharp'
iconname: 'Windows'
tags:
- windows
- tui
- ncurses
- cpp
- linguagemc
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**PDCurses** é uma biblioteca de interface de usuário baseada em texto que oferece uma API compatível com a [ncurses](https://terminalroot.com.br/ncurses).

Com a **PDCurses** é possível desenvolver aplicações [TUI](https://terminalroot.com.br/tags#tui) independente da plataforma. Ela foi projetada para ser usada em diversos sistemas operacionais, incluindo [Windows](https://terminalroot.com.br/tags#windows), DOS, OS/2, e plataformas [Unix-like](https://terminalroot.com.br/tags#unix).


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

## Dependências
Antes de qualquer coisa é necessário possuir as seguintes ferramentas instaladas no seu [Windows](https://terminalroot.com.br/tags#windows):

+ **01**. **[MinGW](https://terminalroot.com.br/2022/12/como-instalar-gcc-gpp-mingw-no-windows.html)**: Você pode(e deve) instalar conforme esse artigo: [Como Instalar GCC/G++ MinGW no Windows](https://terminalroot.com.br/2022/12/como-instalar-gcc-gpp-mingw-no-windows.html)
> Lembre de renomear o arquivo `mingw32-make` para `make` somente, como descreve [esse passo `05` no artigo](https://terminalroot.com.br/2022/12/como-instalar-gcc-gpp-mingw-no-windows.html#05-dica-adicional-e-importante)

+ **02**. **[Git](https://terminalroot.com.br/2023/03/como-instalar-git-e-git-bash-no-windows.html)**: Você pode instalar seguindo esse tutorial: [Como Instalar Git e Git Bash no Windows](https://terminalroot.com.br/2023/03/como-instalar-git-e-git-bash-no-windows.html).

---

## Como Compilar e Instalar a PDCurses no Windows
Após todas as dependências satisfeitas, agora vamos clonar, compilar e instalar a biblioteca PDCurses.

Abra o [Windows Terminal](https://terminalroot.com.br/2023/04/melhore-seu-desempenho-utilizando-o-windows-terminal.html) ou o [PowerShell](https://terminalroot.com.br/tags#powershell) ou até mesmo o `CMD` e siga os passos.
> Dica: O ideal após abrir um desses aplicativos é entrar na *Área de Trabalho*, pois teremos certeza que não haverá problemas de permissão:
{% highlight bash %}
cd Desktop
{% endhighlight %}

#### Primeiramente clone o repositório oficial no GitHub:
{% highlight bash %}
git clone https://github.com/wmcbrine/PDCurses
{% endhighlight %}

#### Agora entre na pasta clonada do PDCurses e na subpasta `wincon`
{% highlight bash %}
cd .\PDCurses\wincon
{% endhighlight %}

#### Agora é só rodar o comando `make`
Conforme renomeado, pois ele pode ser `mingw32-make`, caso você não tenha feito isso!

{% highlight bash %}
make
{% endhighlight %}

---

## Instalar os arquivos
Após finalizada a compilação, ainda dentro de onde você está `PDCurses\wincon` no: Windows Terminal, PowerShell ou CMD. Copie os arquivos para subpastas de `C:\mingw64`:

Copie a biblioteca estática do PDCurses, rode esse comando:
{% highlight bash %}
copy pdcurses.a C:\mingw64\lib\
{% endhighlight %}

E copie também o cabeçalho, mas antes saia da pasta `wincon`:
{% highlight bash %}
cd ..
copy curses.h C:\mingw64\include\
{% endhighlight %}

Caso queria, já pode até deletar o repositório clonado: `PDCurses\`.

---

## Testando um `Hello, World!`
Feito todos os passos de forma correta, agora crie um arquivo de nome `main.cpp`, ou o nome que preferir em um local que você pode criar(exemplo: na *Área de Trabalho*) e insira esse conteúdo:

{% highlight cpp %}
#include <curses.h>

int main(){	
  initscr();			
  printw("Hello, PDCurses!");	
  refresh();			
  getch();			
  endwin();			

  return 0;
}
{% endhighlight %}

Para compilar rode esse comando:

{% highlight bash %}
g++ -I C:\mingw64\include main.cpp C:\mingw64\lib\pdcurses.a
{% endhighlight %}
> Indicando o caminho da pasta onde encontrar o arquivo `curses.h` e compilar em conjunto com o arquivo `pdcurses.a`, em alguns casos á possibilidade de usar somente a flag: `-lpdcurses`, mas acredito que no seu caso não funcionará.

Após compilado, agora é só rodar o binário: `a.exe` ou se estiver usando PowerShell:
{% highlight bash %}
.\a.exe
{% endhighlight %}

Todo conteúdo do terminal será limpo e aparecerá a mensagem, ao pressionar qualquer tecla sairá dessa mensagem e retornará para o terminal!

[![PDCurses rodando](/assets/img/windows/pdcurses-print-2.jpg)](/assets/img/windows/pdcurses-print-2.jpg)

---

Para mais informações sobre PDCurses eu recomendo acessar o endereço: <https://terminalroot.com.br/ncurses> que é idêntica a PDCurses!

E se quiser aprender [C++](https://terminalroot.com.br/cpp) conheça nossos Cursos no endereço:
## <https://terminalroot.com.br/cpp>

Se quiser aprender [Linguagem C](https://terminalroot.com.br/c) acesse o endereço:
## <https://terminalroot.com.br/c>


