---
layout: post
title: "Top 10 Melhores Editores de Código para Linux"
date: 2019-11-29 18:43:01
image: '/assets/img/dev/editores/emacs-min.png'
description: 'Ranking baseado nas minhas experiências, mas vale a pena conhecer.'
tags:
- vim
- emacs
- atom
- anjuta
- codeblocks
- vscode
- neovim
- gedit
- spacemacs
- veonim
---

Editores de Código (ou editores de texto) são os programas mais utilizado no mundo para n tarefas, principalmente por desenvolvedores para escrever códigos de computador para desenvolvimento. Nesse artigo separamos os 10 melhores na nossa opinião entre os milhares que existem. Vamos lá a lista então!

***

![Vim](/assets/img/dev/editores/vim-logo.png)
## 1. [Vim](http://www.vim.org/)
![Vim](/assets/img/dev/editores/vim-min.png)

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

O [Vim](https://terminalroot.com.br/vim) é uma versão melhorada do editor do seu antecessor **Vi** e funciona via terminal, por isso seu acrônimo quer dizer **VI** **IM**proved . É o editor de código mais utilizado no mundo por desenvolvedores. O seu poder de customização é o maior fator desse grande adoção, entre milhares de outras utilidades. É o que editor que eu mais uso para inúmeras coisas . 

> Além disso ele possui versão gráfica: **Gvim** ou **Vim-gtk**

Site oficial: <http://www.vim.org/>

Para instalá-lo utilize o gerenciador de pacotes da sua distribuição, exemplos:
{% highlight bash %}
sudo emerge -a vim gvim # Gentoo, Funtoo, ..
sudo apt install vim vim-gtk # Debian, Ubuntu, Mint, ...
sudo pacman -S vim # Arch, Manjaro,...
{% endhighlight %}

Caso pretenda aprofundar seus conhecimentos em Vim, recomendados você adquirir nosso [Curso Completo de Vim e Vimscript](https://terminalroot.com.br/vim) também disponível na [Udemy](http://bit.ly/VimCuponsUdemy) .

Assista abaixo um vídeo sobre **10 dicas para você utilizar o Vim como um Ninja**:
<iframe width="920" height="400" src="https://www.youtube.com/embed/nFWQJiLvjnk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

***

![Emacs](/assets/img/dev/editores/emacs-logo.png)
## 2. [Emacs](https://www.gnu.org/software/emacs/)
![Emacs](/assets/img/dev/editores/emacs-min.png)

O [Emacs](https://www.gnu.org/software/emacs/) é o segundo editor de códigos mais utilizado no mundo por programadores . É o editor que mais possui funcionalidades no mundo, daí o motivo que muitos o chamam de *sistema operacional* , quase tudo é possível com o mesmo .

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

Ele também é altamente customizável , no entanto, a curva de aprendizado é um pouco mais mais difícil que o Vim, mas depois que você se acostuma, haja recursos que você vai descobrir para adicionar, ativar, configurar ,... Já usei algumas vezes principalmente para filtragem de dados via [Expressões Regulares](https://terminalroot.com.br/regex) , que ele possui diversas ferramentas bem legais. 

> Sua versão principal é gráfica, no entanto, se você rodar o mesmo no terminal com o parâmetro `-nw` ou `--no-window-system` , ele funcionará via terminal.

Site oficial: <https://www.gnu.org/software/emacs/>

Para instalá-lo utilize o gerenciador de pacotes da sua distribuição, exemplos:
{% highlight bash %}
sudo emerge -a emacs # Gentoo, Funtoo, ..
sudo apt install emacs # Debian, Ubuntu, Mint, ...
sudo pacman -S emacs # Arch, Manjaro,...
{% endhighlight %}

***

![Atom](/assets/img/dev/editores/atom-logo.png)
## 3. [Atom](https://atom.io/)

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

![Atom](/assets/img/dev/editores/atom-min.png)

O Atom criado pelo [GitHub](https://github.com/) com o framework que eles também desenvolveram: [ElectronJS](https://electronjs.org/) , é um editor bem bacana, gosto das cores da interface e também de alguns comandos que por sua vez também foram herdados do Vim . Uso ele para escrever códigos em HTML e CSS é bem bacana.

Site oficial: <https://atom.io/>

> É possível também customizá-lo, só que de forma mais bem limitada, se comparado com o Vim e com o Emacs.

Para instalá-lo utilize o gerenciador de pacotes da sua distribuição, exemplos:
{% highlight bash %}
sudo emerge -a app-editors/atom # Gentoo, Funtoo, ..
sudo apt install atom # Debian, Ubuntu, Mint, ...
sudo pacman -S atom # Arch, Manjaro,...
{% endhighlight %}

No [Gentoo](https://terminalroot.com.br/2017/05/como-instalar-o-gentoo.html) é mais interessante você instalar um pacote binário via [Layman](https://en.terminalroot.com.br/how-to-install-programs-via-layman-in-gentoo/):

> Precisa ter o layman instalado e devidamente configurado, para isso veja esse artigo: <https://en.terminalroot.com.br/how-to-install-programs-via-layman-in-gentoo/>

{% highlight bash %}
sudo layman -a dev1990-overlay
sudo layman -S
sudo emerge -a app-editors/atom-bin
{% endhighlight %}

***

![Anjuta](/assets/img/dev/editores/anjuta-logo.png)
## 4. [Anjuta](http://anjuta.org/)
![Anjuta](/assets/img/dev/editores/anjuta-min.png)


O [Anjuta](http://anjuta.org/) é um editor mais robusto, mas é bem restrito para linguagens específicas, mais indicado para desenvolvimento das [C](https://terminalroot.com.br/2011/10/criando-o-primeiro-programa-em-c.html), [C++](https://isocpp.org/), [Java](https://www.java.com/), [Python](https://terminalroot.com.br/2019/10/script-basico-de-python-para-aprendizado.html), [Vala](https://wiki.gnome.org/Projects/Vala) e [Javascript](https://terminalroot.com.br/2018/01/rodando-javascript-via-terminal-e-shell-via-js.html) . Uso bastante, para desenvolvimento em C++ .

Site Oficial: <http://anjuta.org/>

Para instalá-lo utilize o gerenciador de pacotes da sua distribuição, exemplos:
{% highlight bash %}
sudo emerge -a anjuta # Gentoo, Funtoo, ..
sudo apt install anjuta # Debian, Ubuntu, Mint, ...
sudo pacman -S anjuta # Arch, Manjaro,...
{% endhighlight %}

<!-- RETANGULO LARGO -->
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

***

![Code::Blocks](/assets/img/dev/editores/codeblocks-logo.png)
## 5. [Code::Blocks](http://www.codeblocks.org/)
![Code::Blocks](/assets/img/dev/editores/codeblocks-min.png)

O [Code::Blocks](http://www.codeblocks.org/) é um editor específico para as linguagens [C](https://terminalroot.com.br/2011/10/criando-o-primeiro-programa-em-c.html) e [C++](https://isocpp.org/) . Assim como Anjuta, uso para desenvolvimento em C++ ele também é complexo e robusto , no entanto, mais fácil de usar que o Anjuta .

Site Oficial: <http://www.codeblocks.org/>

Para instalá-lo utilize o gerenciador de pacotes da sua distribuição, exemplos:
{% highlight bash %}
sudo emerge -a codeblocks # Gentoo, Funtoo, ..
sudo apt install codeblocks # Debian, Ubuntu, Mint, ...
sudo pacman -S codeblocks # Arch, Manjaro,...
{% endhighlight %}

***

![Visual Studio Code](/assets/img/dev/editores/code-logo.png)
## 6.[Visual Studio Code](https://code.visualstudio.com/)
![Visual Studio Code](/assets/img/dev/editores/code-min.png)

Esse é o editor de códigos da [Microsoft](https://terminalroot.com.br/2017/10/a-aproximacao-da-microsoft-ao-software-livre.html) , desde lançado ganhou vários adeptos no mundo . Eu particularmente também gosto, apesar de usar muito pouco . Na verdade a versão que eu possuo instalada é o [VS Codium](https://terminalroot.com.br/2019/04/vscodium-um-vs-code-open-source-que-nao-te-rasrtreia.html) que é uma versão de terceiros.

Site Oficial: <https://code.visualstudio.com/>

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Para instalá-lo você pode fazer download do [.deb](https://terminalroot.com.br/2014/12/como-criar-pacotes-deb.html) , [.rpm](https://terminalroot.com.br/2013/04/curso-certificacao-linux-lpi-102_16.html) , [tar.gz](https://terminalroot.com.br/2019/10/como-extrair-varios-formatos-compactados-com-um-comando.html	) ou até mesmo do [snap](https://snapcraft.io/) pelo próprio site.

No [Gentoo](https://gentoo.org) você pode usar também um *overlay*, exemplo:
{% highlight bash %}
sudo layman -a dotnet
sudo layman -S
sudo emerge -a visual-studio-code
{% endhighlight %}

***

![Neovim](/assets/img/dev/editores/neovim-logo.png)
## 7. [Neovim](https://neovim.io/)
![Neovim](/assets/img/dev/editores/neovim-min.png)

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

O [Neovim](https://neovim.io/) é um fork do [Vim](https://terminalroot.com.br/vim) melhorado, principalemente no quesito organização dos plugins . No nosso curso de Vim também há bastante conteúdo de Neovim .

Site Oficial: <https://neovim.io/>

Para instalá-lo utilize o gerenciador de pacotes da sua distribuição, exemplos:
{% highlight bash %}
sudo emerge -a neovim # Gentoo, Funtoo, ..
sudo apt install neovim # Debian, Ubuntu, Mint, ...
sudo pacman -S neovim # Arch, Manjaro,...
{% endhighlight %}

***

![Gedit](/assets/img/dev/editores/gedit-logo.png)
## 8. [Gedit](https://wiki.gnome.org/Apps/Gedit)
![Gedit](/assets/img/dev/editores/gedit-min.png)

O [Gedit](https://en.terminalroot.com.br/display-the-gedit-preferences-menu/) é o editor do [GNOME](https://gnome.org) a maioria das distribuições que vem com o GNOME pré-instalado já possui o Gedit, mas caso você não o possua basta instalá-lo com o gerenciador de pacotes da sua distro . Gosto muito do Gedit , pois foi um dos primeiros editores que usei na minha vida e tenho uns plugins bem bacanas, além de ser possível você customizar: temas, snippets,...

Site Oficial: <https://wiki.gnome.org/Apps/Gedit>

***

![Spacemacs](/assets/img/dev/editores/spacemacs-logo.png)
## 9. [Spacemacs](https://www.spacemacs.org/)
![Spacemacs](/assets/img/dev/editores/spacemacs-min.png)

O [Spacemacs](https://www.spacemacs.org/) é uma customização do Emacs que possui comandos e recursos paralelos ao Vim, ou seja, ele mistura os dois melhores editores num só. Possui uma interface muito bonita e atraente . 

Site oficial: <https://www.spacemacs.org/>

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

Se quiser ver como instalar e utilizá-lo . Recomendo assistir à esse vídeo tutorial, tem bastante dicas legais:

<iframe width="920" height="400" src="https://www.youtube.com/embed/xsKpqWsupGg" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

***

![Veonim](/assets/img/dev/editores/veonim-logo.png)
## 10. [Veonim](https://terminalroot.com.br/2019/11/conheca-e-instale-o-veonim-um-editor-baseado-no-vim-e-neovim.html)
![Veonim](/assets/img/dev/editores/veonim-min.png)

O [Veonim](https://terminalroot.com.br/2019/11/conheca-e-instale-o-veonim-um-editor-baseado-no-vim-e-neovim.html) é um editor baseado no Vim e Neovim e assim como o Atom foi desenvolvido com ElectronJS , há um artigo bem bacana sobre ele aqui no blog que pode ser consultado no link: [Conheça e Instale o Veonim - Um editor baseado no Vim e NeoVim](https://terminalroot.com.br/2019/11/conheca-e-instale-o-veonim-um-editor-baseado-no-vim-e-neovim.html)

## Conclusão

Bom, alternativas é o que não faltam, mas assim como distribuição Linux, sistema, interface gráfica, gerenciador de janelas ,... editor de código é uma coisa bem pessoal. O interessante é escolher aquele que você se sinta confortável e lhe ajude a escrever seus códigos, ou seja, que lhe traga aquela sensação gostosa de estar excrevendo(desenvolvendo) seus projetos .

Esse é praticamente o segundo artigo aqui no blog sobre editores, a lista antiga pode ser consultada nesse link: [Os 8 melhores Editores de Texto para GNU/Linux](https://terminalroot.com.br/2016/05/os-8-melhores-editores-de-texto-para.html) . Além também de um vídeo bem bacana sobre os **5 Melhores Editores de Texto de Todos os Tempos para Linux**, assista agora:

<iframe width="920" height="400" src="https://www.youtube.com/embed/mmIycP6egqQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Espero que você tenham gostado da lista e do ranking. Caso tenha uma sugestão melhor de aplicativos ou ordem do ranking, fique à vontade em comentar!

Abraços!


