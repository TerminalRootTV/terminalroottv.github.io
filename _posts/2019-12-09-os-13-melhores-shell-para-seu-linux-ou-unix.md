---
layout: post
title: "Os 13 Melhores Shell para seu Linux ou Unix"
date: 2019-12-09 10:01:04
image: '/assets/img/shell/shell.jpg'
description: 'Um dos motivos que mais atribuiu o sucesso do Unix e Linux, foi o Shell.'
tags:
- shell
- unix
- linux
- shellscript
---

![Ranking dos 13 Melhores Shell para seu Linux ou Unix](/assets/img/shell/shell.jpg)

Já faz tempo que o pessoal me pede essa lista( principalmente como ranking ) . Lógico que a escolha vai depender do gosto de cada um, mas é interessante você conhecer a lista para que fique mais fácil de você não acabar comprando *gato por lebre*.

## Introdução
Um dos motivos que mais atribuiu o sucesso do [Unix](https://terminalroot.com.br/2016/11/blog-linux-unix.html) e do [Linux](https://terminalroot.com.br/linux) , com certeza foi o [Shell](https://wiki.gentoo.org/wiki/Shell) . Um local "abençoado" que geram diversas facilidades principalmente quando aprendemos a criar scripts que fazem, configuram tudo pra gente com um simples comando .

E a cada dia que passa usar comandos se torna mais útil . Quase todas as novidades que surgem, só funcionam no Shell, a linha de comando. O sucesso acabou "transbordando" para o [Windows](https://terminalroot.com.br/2018/03/como-usar-o-shell-bash-no-windows.html) que até então só tinha o CMD, mas logo deram um jeito de fazer a portabilidade do Shell mais famoso do mundo Linux .

E sem dizer que eles ainda desenvolveram um Shell próprio, apesar de que as características não tem feito usuário de: UNIX, [BSD](https://terminalroot.com.br/2016/05/caracteristicas-de-freebsd-openbsd-e-netbsd.html), Linux à adotá-los, por questão de familiaridade (misturar letras maiúsculas com minúsculas, por exemplo), algo que deixa mais confuso de se adaptar, deixa ligeiramente mais trabalhoso, algo que no mundo Unix e Linux, é totalmente inadmissível, o lema é: "Fazer menos e ter mais resultado!", que se resumem nos scripts que criam "Bots" que fazem tudo pra gente! 😄

Vamos lá a lista então!

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

## 13º - [Sash](http://members.tip.net.au/~dbell/)
Mais conhecido como **Stand-alone Shell**(significado do seu acrônimo) , é um shell Unix projetado para uso na recuperação de certos tipos de falhas no sistema.

Os comandos internos do sash têm todas as bibliotecas vinculadas estaticamente ; portanto, ao contrário da maioria dos shells no Linux, os comandos UNIX padrão não dependem de bibliotecas externas.

Por exemplo, o comando `copy` (cp) requer `libc.so` e `ld-linux.so` quando criado a partir do [GNU Core Utilities no Linux](https://www.gnu.org/software/coreutils/) . Se alguma dessas bibliotecas for corrompida, o comando coreutils `cp` não funcionará; no entanto, no `sash`, o comando interno, `cp`, não seria afetado.

Sua página oficial é: <http://members.tip.net.au/~dbell/> . E ele está disponível nos repositórios da maioria das distribuições Linux e BSD. Então você pode usar o gerenciador de pacotes para instalá-lo. Exemplo no Gentoo:
{% highlight bash %}
emerge app-shells/sash
{% endhighlight %}

---

## 12º - [Mksh](https://www.mirbsd.org/mksh.htm)
mksh é o MirBSD Korn Shell, uma implementação gratuita desenvolvida ativamente da linguagem de programação Korn Shell e sucessora do [Public Domain Korn Shell ( pdksh )](https://ecsoft2.org/pdksh-public-domain-korn-shell). Ele é desenvolvido como parte do Projeto [MirOS](https://www.mirbsd.org) como shell Bourne/POSIX/Korn nativo para o MirOS BSD, mas também para estar prontamente disponível em outros sistemas operacionais semelhantes ao UNIX. Destina-se a usuários que desejam um shell compacto, rápido, confiável e seguro, sem cortar extensões modernas, com suporte unicode.

Devido à sua velocidade, conformidade com POSIX e recursos avançados, é ideal para scripts. Mas também pode servir muito bem como um shell de login. É usado como shell padrão no Android .

Sua página oficial é: <https://www.mirbsd.org/mksh.htm> . E ele está disponível nos repositórios da maioria das distribuições Linux e BSD. Então você pode usar o gerenciador de pacotes para instalá-lo. Exemplo no Gentoo:
{% highlight bash %}
emerge app-shells/mksh
{% endhighlight %}

> Há uma comunidade bem bacana do Mksh no Freenode: [irc://chat.freenode.org/#!/bin/mksh](irc://chat.freenode.org/#!/bin/mksh)

---

## 11º - [Power Shell](https://docs.microsoft.com/en-us/powershell/)
PowerShell (incluindo o Windows PowerShell e o PowerShell Core) é um framework da Microsoft para automação de tarefas e gerenciamento de configuração, consistindo de um shell de linha de comando e linguagem de script associada embutida no framework .NET.

O PowerShell fornece acesso completo ao COM e o WMI, permitindo aos administradores realizar tarefas administrativas em sistemas Windows remotos e locais, bem como WS-Management e CIM que permite o gerenciamento de sistemas Linux remotos e dispositivos de rede. Inicialmente um componente apenas do Windows, o PowerShell tornou-se de código aberto e multiplataforma em 18 de agosto de 2016.

Sua página oficial é: <https://docs.microsoft.com/en-us/powershell/> . Diferentemente dos anteriores aqui citado, ele não está disponível nos repositórios das distribuições Linux e BSD, mas é possível usar manobras como: Compilar, usar repositórios de terceiros(como PPA no Ubuntu) e outros.

No [Gentoo](http://gpo.zugaina.org/dev-lang/powershell-bin) você pode instalar via Layman, exemplo:
{% highlight bash %}
sudo layman -a pentoo
sudo layman -S
emerge dev-lang/powershell-bin
{% endhighlight %}

---

## 10º - [Ion Shell](https://github.com/redox-os/ion)

![Ion Shell](/assets/img/shell/ionshell.png)

Ion é um shell de sistema moderno que apresenta uma sintaxe simples, porém poderosa. Está escrito inteiramente em Rust, o que aumenta muito a qualidade e a segurança geral do shell. Ele também oferece um nível de desempenho que excede o do [Dash/Ash](https://www.in-ulm.de/~mascheck/various/ash/), ao tirar proveito dos recursos da Ion. Embora seja desenvolvido ao lado e principalmente para o RedoxOS, ele é totalmente capaz em outras plataformas nix.

Sua página oficial é: <https://github.com/redox-os/ion> . Ele também não está disponível nos repositórios das distribuições Linux e BSD, mas é possível usar manobras como: Compilar, usar repositórios de terceiros(como PPA no Ubuntu) e outros.

Exemplo, no Ubuntu você pode adicionar um PPA:
{% highlight bash %}
sudo add-apt-repository ppa:mmstick76/ion-shell
{% endhighlight %}

---

## 9º - [Eshell](https://www.gnu.org/software/emacs/manual/html_mono/eshell.html)
Eshell é um interpretador de comandos semelhante a um shell implementado no Emacs Lisp. Ele não invoca processos externos, exceto aqueles solicitados pelo usuário. Ele se destina a ser uma alternativa ao REPL do IELM para o Emacs e com uma interface semelhante a shells de comando como bash , zsh , rc ou 4dos .

Sua página oficial é: <https://www.gnu.org/software/emacs/manual/html_mono/eshell.html> . E ele está disponível nos repositórios da maioria das distribuições Linux e BSD. Então você pode usar o gerenciador de pacotes para instalá-lo. Exemplo no Gentoo:
{% highlight bash %}
emerge app-xemacs/eshell
{% endhighlight %}

---

## 8º - [Tcsh](https://www.tcsh.org/)

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

![Tcsh](/assets/img/shell/tcsh.png)

É um shell Unix baseado em e compatível com o shell C (csh). É essencialmente o shell C com conclusão programável da linha de comando, edição da linha de comando e alguns outros recursos. Diferente dos outros shells comuns, as funções não podem ser definidas em um script tcsh e o usuário deve usar aliases (como no csh). É o shell raiz nativo para sistemas baseados em BSD, como o [FreeBSD](https://www.youtube.com/watch?v=hftefBW0bmM) .

O "t" no tcsh vem do "T" no TENEX , um sistema operacional que inspirou Ken Greer na Universidade Carnegie Mellon , autor do tcsh, com seu recurso de conclusão de comandos. Sua sintaxe possui um `if` com parênteses similar a diversas outras linguagems de programação, exemplo:
{% highlight bash %}
if ( "$input" =~ [0-9]* ) then
  echo "A entrada começa com um número inteiro."
else
  echo "A entrada NÃO começa com um número inteiro."
endif
{% endhighlight %}

Sua página oficial é: <https://www.tcsh.org/> . E ele está disponível nos repositórios da maioria das distribuições Linux e BSD. Então você pode usar o gerenciador de pacotes para instalá-lo. Exemplo no Gentoo:
{% highlight bash %}
emerge app-shells/tcsh
{% endhighlight %}

---

## 7º - [Sh (Thompson Shell)](https://github.com/yvesnrb/Thompson-Shell)
O shell Thompson(co-criador do Unix juntamente com Denis Rithie) é o primeiro shell Unix, introduzido na primeira versão do Unix em 1971, e foi escrito por Ken Thompson. Era um intérprete de comando simples, não projetado para scripts, mas introduziu vários recursos inovadores na interface da linha de comandos e levou ao desenvolvimento dos shells Unix posteriores.

Sua página não oficial é: <https://github.com/yvesnrb/Thompson-Shell> . Ele já está disponível(pré-instalado) em todas as distros Linux e BSD.

## 6º - [Zsh](https://terminalroot.com.br/2018/02/como-instalar-e-usar-o-shell-zsh-e-o-oh-my-zsh.html)
Zsh é um shell de login interativo que também pode ser usado como um poderoso intérprete de linguagem de script. É semelhante ao bash e ao Korn shell, mas oferece uma grande capacidade de configuração.

Sua página oficial é: <https://www.zsh.org/> . E ele está disponível nos repositórios da maioria das distribuições Linux e BSD. Então você pode usar o gerenciador de pacotes para instalá-lo. Exemplo no Gentoo:
{% highlight bash %}
emerge app-shells/zsh
{% endhighlight %}

Existe um vídeo bem bacana sobre ele que fizemos que pode ser visto abaixo:

<iframe width="920" height="400" src="https://www.youtube.com/embed/dn0usA-mI4A" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

## 5º - [Xonsh](https://terminalroot.com.br/2019/06/xonsh-um-shell-para-os-amantes-de-python.html)
O Xonsh é uma Shell e um prompt de comando compatíveis com Unix, Python e multiplataforma, disponível para Linux, macOS e Windows. É destinado à especialistas e novatos. Para quem é desenvolvedor Python, o Xonsh é uma verdadeira mão na roda , pois ele é praticamente um utilitário híbrido e reconhece duas linguagens no mesmo ambiente.

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

Sua página oficial é: <https://xon.sh/> . Você pode instalá-lo de acordo com esse tutorial que nós fizemos: [Xonsh - Um Shell para os Amantes de Python](https://terminalroot.com.br/2019/06/xonsh-um-shell-para-os-amantes-de-python.html) , bem como assistir ao vídeo:

<iframe width="920" height="400" src="https://www.youtube.com/embed/7dKWvTFoRts" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

## 4º - [Fish](https://terminalroot.com.br/2018/01/fish-shell-mais-produtividade-no-seu-shell-script.html)
Fish é uma linha de comando inteligente mais amigável para usuários, disponível para shell no Linux, OS X e o resto da família UNIX.

+ Possui cores para facilitar entendimentos;
+ Auto-complementação de comandos;
+ Syntax Highlight e outras opções.

Sua página oficial é: <http://fishshell.com/> . Você pode instalá-lo de acordo com esse tutorial que nós fizemos: [Fish Shell, mais produtividade no seu Shell Script](https://terminalroot.com.br/2018/01/fish-shell-mais-produtividade-no-seu-shell-script.html) e também de um aplicativo para customização do prompt do Fish: [Instale o Oh My Fish no seu Linux ou Unix-like](https://terminalroot.com.br/2019/09/oh-my-fish.html). Assista também o vídeo que fizemos:

<iframe width="920" height="400" src="https://www.youtube.com/embed/uCLmjMErXXU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

## 3º - [Ksh](http://www.kornshell.com/)
Sendo considerado o mais popular Shell em sistemas Unix, o Korn Shell foi desenvolvido por David Korn, do Bell Labs, e é um superconjunto do sh, isto é, possui todas as facilidades do sh e a elas agregou muitas outras. A compatibilidade total com o sh vem trazendo muitos usuários e programadores de Shell para este ambiente. Resumindo, KSH - korn Shell foi o primeiro Shell a introduzir recursos avançados.

Sua página oficial é: <http://www.kornshell.com/> . E ele está disponível nos repositórios da maioria das distribuições Linux e BSD. Então você pode usar o gerenciador de pacotes para instalá-lo. Exemplo no Gentoo:
{% highlight bash %}
emerge app-shells/ksh
{% endhighlight %}

---

## 2º - [Csh](http://bxr.su/NetBSD/bin/csh/)
O Csh ou C shell foi desenvolvido por Bill Joy da Universidade de Berkeley é o Shell mais utilizado em ambientes BSD e Xenix. Derivado originalmente da sexta edição do Unix /bin/sh (que era o Thompson shell), predecessor do Bourne shell.

A sintaxe foi modelada segundo a linguagem de programação C. O csh adicionou muitos aparatos em cima do Bourne shell, tais como aliases e histórico de comandos. Hoje, o csh original não é usado amplamente no Unix; foi superado por outros shells tais como o Tenex C shell (tcsh) baseado originalmente no código do C shell, adicionando complementação de nome de arquivos e edição de linhas de comando, comparado com o Korn shell (ksh), e o GNU Bourne-Again shell (bash). Um C shell independentemente desenvolvido e moderno, criado por Nicole Hamilton, também sobrevive no Windows na forma de Hamilton C shell.

Sua página oficial é: <http://bxr.su/NetBSD/bin/csh/> . E ele está disponível nos repositórios da maioria das distribuições Linux e BSD. Então você pode usar o gerenciador de pacotes para instalá-lo. Exemplo no Gentoo:
{% highlight bash %}
emerge app-shells/csh
{% endhighlight %}

---

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

## 1º - [Bash](https://terminalroot.com.br/bash)
E finalmente na primeiríssima colocação temos o [Bash](https://terminalroot.com.br/bash) . GNU Bash ou simplesmente Bash é uma linguagem de comando e shell do Unix escrita por Brian Fox para o GNU Project como um substituto de software livre para o shell Bourne .

Lançado pela primeira vez em 1989, foi amplamente utilizado como o shell de login padrão para a maioria das distribuições Linux e o macOS Mojave da Apple e versões anteriores. Uma versão também está disponível para o Windows 10 . Também é o shell do usuário padrão no Solaris 11.

Sua página oficial é: <https://www.gnu.org/software/bash/> . Ele já está disponível(pré-instalado) em quase todas as distros Linux.

Possuímos dois cursos de Shell Script aqui no site que podem ser adquiridos no links:
+ [Curso de Shell Script do Iniciante ao Avançado](https://terminalroot.com.br/bash): <https://terminalroot.com.br/bash>
+ [Curso Intensivo de Shell Script Avançado](https://terminalroot.com.br/shell): <https://terminalroot.com.br/shell>

Sendo que o primeiro você ainda pode adquirí-lo na [Udemy](https://www.udemy.com/user/marcos-oliveira-34/) no link abaixo:
+ [Curso de Shell Script do Iniciante ao Avançado](https://www.udemy.com/course/curso-de-shell-script-do-iniciante-ao-avancado/)

Além de vários tutoriais em texto e em vídeo como o abaixo:
<iframe width="920" height="400" src="https://www.youtube.com/embed/2_tnd8g-IMc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Conclusão
Caso você se interesse em mudar de Shell, você pode usar o comando `chsh`(**CH** ange **SH** ell) para isso, exemplo:
> Alterando para o *mksh* , você pode passar o caminho ou o somente o nome se desejar. Para descobrir o caminho, utilize o comando `which`, exemplo pra descobrir o caminho do próprio mksh: `which mksh`

{% highlight bash %}
chsh -s /bin/mksh
{% endhighlight %}

Se quiser ver uma comparação de recursos de cada um, veja esse link: [Comparação de Shells](https://en.wikipedia.org/wiki/Comparison_of_command_shells)

Espero que você tenham gostado da lista e do ranking, se tiver algo novo pra sugerir, use os comentários . E eu como sempre, escolho o Bash , meu companheiro de guerra! 😀 . Um forte abraço e até mais!
    
