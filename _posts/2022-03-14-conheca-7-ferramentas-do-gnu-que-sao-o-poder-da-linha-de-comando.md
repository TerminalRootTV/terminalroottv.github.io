---
layout: post
title: "Conheça 7 ferramentas do GNU que são o poder da linha de comando"
date: 2022-03-14 07:50:35
image: '/assets/img/gnu/gnu.png'
description: 'Ferramentas indispensáveis para você evoluir na intimidade com terminal .'
icon: 'ion:terminal-sharp'
iconname: 'GNU'
tags:
- gnu
- gcc
- bash
- comandos
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

O Projeto GNU é uma organização de [Software Livre](https://terminalroot.com.br/tags#freesoftware) que criou o termo [Open Source](https://terminalroot.com.br/tags#opensource) que hoje é largamente utilizado por diversas empresas .

O nome GNU é um acrônimo para: **G**NU, is **N**ot **U**nix . E isso quer dizer que:

Os comandos [Unix©](https://terminalroot.com.br/tags#unix) fizeram tanto sucesso que diversos programadores e empresas queriam "*copiá-los*" . E a maioria incluía o nome Unix© no próprio nome, exemplos: HP Unix, Berkeley Unix, ... e por aí vai. 

Mas a [AT&T](https://en.wikipedia.org/wiki/AT&T), detentora dos direitos autorais do Unix© e do seu nome, proibiu o uso do nome do Unix© para projetos similares à ele.

Daí o GNU teve a ideia de fazer uma *sátira* usando o nome, mas dizendo que não era Unix©. 😛 

Outra coisa é que o código fonte dos programas do Unix© não estavam disponíveis e mesmo assim, quando utilizados por fins de estudos, nesse caso para a Universidade da Califórnia, Berkley, que mais tarde deu início ao [BSD](https://terminalroot.com.br/tags#bsd), possuíam licenças restritivas .

Então, o GNU criou alternativas, ou seja, programas que faziam a mesma coisa e com o código fonte disponível, além de possuírem uma licença(criada por eles, a GPL) que permitia até a redistribuição . 

A organização que distribui os softwares criados pelo Projeto GNU é a [Free Software Foundation](https://www.fsf.org/) sob os termos da licença GNU General Public License (GNU GPL). [Saiba mais](https://en.wikipedia.org/wiki/GNU_Project) .

Um dos maiores diferenciais dos Softwares do GNU é o fato de usar o padrão POSIX que o torna portável para qualquer sistema operacional .

Avançar em comandos do GNU é avançar em ter destreza no terminal . Então, vamos lá conhecer 7 ferramentas indispensáveis do GNU para você !!!


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

# 1. [GCC](https://gcc.gnu.org/)
![GCC](/assets/img/gnu/gnu-gcc-logo.png) 

---

**GCC** significa **G**NU **C**ompiler **C**ollection, é uma coleção de compiladores e otimizadores para várias [linguagens de programação](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html), dentre elas: [C](https://terminalroot.com.br/tags#linguagemc), [C++](https://terminalroot.com.br/tags#cpp), [Java](https://terminalroot.com.br/tags#java), [Go](https://terminalroot.com.br/tags#go), Fortran, Ada, D, Objective-C, Objective-C++ e entre outras.

Com quase **20 milhões de linhas de código**, o **GCC** é um dos maiores programas gratuitos existentes no mundo .

Possui a maior *gama* de **suporte de arquiteturas**, dentre elas: 

AArch64, Alpha, ARM, AVR, Blackfin, eBPF, Epiphany (GCC 4.8), H8/300, HC12, IA-32 (x86), IA-64 (Intel Itanium), MIPS, Motorola 68000, MSP430, Nvidia GPU, Nvidia PTX, PA-RISC, PDP-11, PowerPC, R8C / M16C / M32C, RISC-V, SPARC, SuperH, System/390 / zSeries, VAX, x86-64, 68HC11, A29K, C6x, CR16, D30V, DSP16xx, ETRAX CRIS, FR-30, FR-V, IBM ROMP, Intel i960, IP2000, M32R, MCORE, MIL-STD-1750A, MMIX, MN10200, MN10300, Motorola 88000, NS32K, RL78, Stormy16, V850, Xtensa, Cortus APS3, ARC, AVR32, C166 and C167, D10V, EISC, eSi-RISC, Hexagon[73], LatticeMico32, LatticeMico8, MeP, MicroBlaze, Motorola 6809, MRISC32, MSP430, NEC SX architecture[74], Nios II and Nios, OpenRISC, PDP-10, PIC24/dsPIC, PIC32, Propeller, Saturn (HP48XGCC), System/370, TIGCC (m68k variant), TMS9900, TriCore, Z8000 e entre outras .

O GCC conta com uma lista de mais de **500 contribuidores**, todos os nomes podem ser acessados [aqui](https://gcc.gnu.org/onlinedocs/gcc/Contributors.html) .

Diversas empresas utilizam o GCC em muitos dos projetos de software livre, dentre elas as mais famosas como: [NASA](https://software.nasa.gov/), [Google](https://opensource.google/), [IBM](https://www.ibm.com/hu-en/products?types[0]=trial) e entre outras.

O maior concorrente do GCC é o [Clang/LLVM](https://terminalroot.com.br/tags#clang) que também é um ótimo compilador e apesar de ter sido escrito do zero, segundo seu próprio criador, [Chris Lattner](http://www.nondot.org/sabre/), disse em algumas entrevistas que sua maior referência foi o GCC, por isso o Clang tem todos os parâmetros utilizados pelo GCC, por questões também de compatibilidade .

Para instalar o GCC você pode usar o gerenciador de pacotes do seu sistema ou fazer o download do GCC [aqui](https://gcc.gnu.org/install/download.html).

### Exemplos de uso
Compilando programas escritos em linguagem [C](https://terminalroot.com.br/tags#linguagemc):
{% highlight sh %}
gcc main.c
./a.out # Roda o binário
{% endhighlight %}

Compilando programas em [C++](https://terminalroot.com.br/cpp):
{% highlight sh %}
g++ main.cpp
./a.out # Roda o binário
{% endhighlight %}

Compilando programas em [Java](https://terminalroot.com.br/tags#java):
{% highlight sh %}
gcj -C Hello.java # Compila para o Hello.class
gij Hello # Roda o Hello.class
{% endhighlight %}

O `gcc` é um dos programas mais ricos em parâmetros que existe. Para conhecer todos os parâmetros, use o manual:
{% highlight sh %}
man gcc
{% endhighlight %}

Para mais informações acesse a [Página Oficial do GCC](https://gcc.gnu.org/) .


---

# 2. [GNU Sed](https://www.gnu.org/software/sed/)
**GNU Sed** é um editor de fluxo de texto via linha de comando que analisa e transforma texto, usando uma linguagem de programação simples e compacta.

Existem algumas versões de Sed, e o GNU Sed é uma delas . Ao usar o GNU Sed e o Sed do [macOS](https://terminalroot.com.br/tags#macos), por exemplo, você pode se deparar com muitas [diferenças](https://stackoverflow.com/questions/4247068/sed-command-with-i-option-failing-on-mac-but-works-on-linux) entre ambos e notar que a usabilidade do GNU Sed é superior e possui mais parâmetros .

### Exemplo básico de uso
> Substituindo e modificando todas as ocorrências da palavra **Aquilo** pela palavra **Isso** em um arquivo de texto: `exemplo.txt`

{% highlight sh %}
sed -i 's/Aquilo/Isso/' exemplo.txt
{% endhighlight %}

Nós possuímos um [Curso Completo de Sed](https://terminalroot.com.br/sed) onde é utilizado no curso justamente o GNU Sed . Além também de [alguns artigos](https://terminalroot.com.br/tags#sed) como esse: [30 exemplos do comando Sed - com Regex](https://terminalroot.com.br/2015/07/30-exemplos-do-comando-sed-com-regex.html).

E também alguns vídeos no nosso [canal do Youtube](https://youtube.com/TerminalRootTV) como esse abaixo:

<iframe width="900" height="380" src="https://www.youtube.com/embed/vduHKQRPwEQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Para mais informações visite a [Página Oficial do GNU Sed](https://www.gnu.org/software/sed/) .


<!-- RECTANGLE 2 - OnParagragraph -->
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

---

# 3. [GNU Awk](https://www.gnu.org/software/gawk/manual/gawk.html)
GNU Awk é uma das variantes da linguagem específica de domínio: [AWK](https://terminalroot.com.br/2014/12/tutorial-basico-de-awk.html) . Assim como GNU Sed, seu diferencial principal é o fato de possuir o padrão POSIX como havíamos informado na introdução .

Ela também é bastante usada para edição de textos e filtragem de dados via linha de comando. O exemplo mais básico de uso seria:
> Lista somente a primeira coluna de um arquivo de texto gerado pelo comando `ls -l > arquivo.txt`.

{% highlight awk %}
awk '{print $1}' arquivo.txt
{% endhighlight %}

Nós possuímos alguns artigos [aqui no blog](https://terminalroot.com.br/tags#awk) e também um Guia Completo de Utilização do **GNU Awk** que pode ser assistido no vídeo abaixo:

<iframe width="900" height="380" src="https://www.youtube.com/embed/j0Qm6CzbNbg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Para mais informações acesse a [Página Oficial do GNU Awk](https://www.gnu.org/software/gawk/manual/gawk.html) .

---

# 4. [GNU Make](https://www.gnu.org/software/make/manual/make.html)
![GNU Make](/assets/img/gnu/makefile2.jpg)

---

**GNU Make** é uma ferramenta de automação de compilação que cria automaticamente programas e bibliotecas executáveis a partir do código-fonte lendo arquivos chamados **Makefiles** que especificam como derivar o programa de destino.

Embora ambientes de desenvolvimento integrados e recursos de compilador específicos de linguagem também possam ser usados para gerenciar um processo de compilação, o GNU Make continua sendo amplamente utilizado.

Existem algumas versões do comando `make` que é o comando utilizado pelo **GNU Make**, no entanto, em diversos sistemas o `make` é somente um alias para o **GNU Make** onde o comando original é o `gmake`, esse link simbólico pode ser descoberto pela combinação de outras duas ferramentas do GNU que é o [GNU Coreutils](https://www.gnu.org/software/coreutils/) com o seguinte comando: `ls -l $(which make)` .

Quando você possuí um Makefile corretamente criado, para compilar basta rodar o comando:
{% highlight sh %}
make
{% endhighlight %}
> Esse comando pode ser customizados com parâmetros de acordo com o Makefile .

Nós possuímos um artigo para iniciantes de **GNU Make** e *Makefile* que pode ser acessado no link: [Como Criar um Makefile](https://terminalroot.com.br/2019/12/como-criar-um-makefile.html) . 

Para mais informações acesse a [Página Oficial do GNU Make](https://www.gnu.org/software/make/manual/make.html) .

---

# 5. [GNU findutils](https://www.gnu.org/software/findutils/)
![GNU findutils](/assets/img/gnu/3d-gnu-head.jpg) 

---

O **GNU findutils** é um pacote que possui os comandos: `find`, `locate`, `updatedb` e `xargs`.

Dentre eles, o mais largamente utilizado no dia à dia é, com certeza, o `find` . O comando `find` do GNU possui mais facilidades de uso do que o do Unix© . Por exemplo:

Para você encontrar todos os arquivos de extensão `.txt` no seu diretório pessoal com o **GNU findutils** basta rodar o comando:
{% highlight sh %}
find ${HOME} -name *.txt
{% endhighlight %}

No `find` do Unix© você precisa explicitamente agrupar o alvo de pesquisa entre aspas, já no GNU `find` tanto com ou sem aspas, funciona do mesmo jeito. E entre diversas outras diferenças .

Nós possúimos um artigo com 20 exemplos de uso do comando `find` que pode ser acessado no link: [20 exemplos do comando find](https://terminalroot.com.br/2015/07/20-exemplos-do-comando-find.html) .

Para mais informações acesse a [Página Oficial do GNU findutils](https://www.gnu.org/software/findutils/) .

---

# 6. [GNU grep](https://www.gnu.org/software/grep/)
**GNU grep** é um utilitário de linha de comando para pesquisar conjuntos de dados de texto simples para padrões que correspondam a uma [expressão regular](https://terminalroot.com.br/regex) .

Existem variações do comando `grep` como: `egrep` e `fgrep` . Muitas usabilidades desses comandos são características específicas do **GNU grep** .

O **GNU grep** se torna poderoso de verdade para uso em conjunto com [RegEx](https://terminalroot.com.br/regex) .

Um exemplo básico de uso é, por exemplo, listar os grupos do sistema em que seu usuário faz parte com o seguinte comando:

{% highlight sh %}
grep "$USER" /etc/group | egrep -o '^[a-z]+'
{% endhighlight %}

Nós possuímos um [Curso Completo de Expressões Regulares](https://terminalroot.com.br/regex) que faz uso excessivo do **GNU grep** e suas variações .

Além de [artigos](https://terminalroot.com.br/tags#regex), e também esse vídeo apresentação do Curso:

<iframe width="900" height="380" src="https://www.youtube.com/embed/9knEvYl6D_o" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Para mais informações acesse a [Página Oficial do GNU grep](https://www.gnu.org/software/grep/) .



---

# 7. [GNU Bash](https://www.gnu.org/software/bash/)
O **GNU Bash** é uma melhoria do **Sh** do Unix© . O **GNU Bash** tornou muito mais simples e fácil automatizar comandos na [Shell](https://terminalroot.com.br/shell) devido à também sua estabilidade em relação às suas [opções](https://terminalroot.com.br/2019/12/os-13-melhores-shell-para-seu-linux-ou-unix.html) .

É o mais adotado no mundo e possui muitos recursos modernos que o diferenciam . Foi criado pelo programador [Brian J. Fox](https://en.wikipedia.org/wiki/Brian_Fox_(computer_programmer))

Ele possui diversos comandos tais como: `if`, `[[ ]]`, `for`, `while`,... que podem ser usados diretamente na [Shell](https://terminalroot.com.br/shell) e também combinados como uma [linguagem de script](https://en.wikipedia.org/wiki/Scripting_language) em um arquivo de qualquer extensão, no entanto, as extensões mais utilizadas para identificá-lo são `.sh` e `.bash` .

Essa foi uma das ferramentas do GNU que mais utilizei em minha vida em Administração de Servidores . Configurava um [servidor](https://terminalroot.com.br/tags#servidores) somente uma vez e depois juntava todos os passos em um **Bash script** . Algumas dessas configurações até guardei por um tempo aqui no blog(que era a forma que eu usava para documentar e lembrar de algumas coisas), dentre elas: 

+ Configuração de [Squid](https://terminalroot.com.br/2015/01/como-configurar-o-squid.html)
+ Configurações do [Postfix](https://terminalroot.com.br/2013/04/curso-certificacao-linux-lpi-102_8110.html)
+ Configuração do [DHCP](https://terminalroot.com.br/2013/03/curso-certificacao-linux-lpi-102_26.html)

E entre outros . Com o tempo, devido aos acessos(não intencionais) que esse blog passou a ter, eu modifiquei muitos artigos e transformei em cursos gratuitos. Com o tempo as pessoas me pediram para criar um Curso de Bash e eu o fiz, que foi o primeiro curso que fiz na minha vida.

Mas, como o tempo tive de privá-lo por conta de alguns comentários exigentes demais. As pessoas passaram até me enviar ofensas por que eu não disponibilizava um certificado . Então, decidi privá-lo e criei outro com certificado e mais avançado que pode ser adquirido nesse link: <https://terminalroot.com.br/shell> .

O curso antigo de [Bash](https://terminalroot.com.br/tags#bash) ainda está disponível somente na [Udemy](http://bit.ly/bash-udemy) e para [Membros do Canal TerminalRootTV](https://youtube.com/TerminalRootTV) , mas eu desativei ele por aqui .

Eu iria atualizar ele, mas desisti. Ainda esse ano pretendo impossibilitar ele de ser comercializado até na Udemy , isso pelo fato que acredito que aqui no blog tem diversos artigos sobre [Bash](https://terminalroot.com.br/tags#bash) que podem ser acessados pelas tags [#bash](https://terminalroot.com.br/tags#bash) e [#shellscript](https://terminalroot.com.br/tags#shellscript) e aprender ele facilmente .

E se a pessoa quiser descobrir outras coisas sobre Bash recomendo o curso de [Shell](https://terminalroot.com.br/shell) em que utilizamos o GNU Bash como ferramenta para explicar e aprender o Shell Script .

Eu criei diversas coisas na minha vida com **GNU Bash** e é impossível de listar todas elas. A última que eu fiz e ironicamente a que mais teve sucesso foi um aplicativo que adiciona vídeos como papel de parede.

Você pode ver o vídeo desse aplicativo funcionando abaixo:

<iframe width="900" height="380" src="https://www.youtube.com/embed/Mb0SXMft2sw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Muita gente enviou `issues` no [GitHub](https://github.com/terroo) e estou somente anotando os issues para corrigí-los com a refatoração desse código que será feita com [C++](https://terminalroot.com.br/cpp) .

Eu notei que uma das maiores reclamações é a não possibilidade de tornar os vídeos de background como Full HD, então para isso vou ter de usar bibliotecas mais avançadas .

Para mais informações acesse a [Página Oficial do GNU Bash](https://www.gnu.org/software/bash/) , essa é uma das melhores documentações de software de que já li .

---

# Conclusão

Existem, na verdade, diversas outras soluções do Projeto GNU, como por exemplo a [GNU Glibc](https://www.gnu.org/software/libc/) que é a interface em que o kernel Linux roda em cima e possibilita diversos: programas, interfaces gráficas, [gerenciadores de janelas](https://terminalroot.com.br/tags#wm) e ambientes desktop de funcionarem com um ótimo desempenho, e a maioria deles não funcionam sem a **GNU Glibc**.

## Para mais informações acesse:
# <https://gnu.org> .

---

# Links úteis
+ <https://en.wikipedia.org/wiki/GNU_Compiler_Collection>
+ <https://cutt.ly/7A2Tnlt>

> A *thumbnail* utilizada como chamada desse artigo foi criada e usada pela Red Hat [nesse link](https://access.redhat.com/documentation/en-us/red_hat_developer_toolset/7/html/user_guide/chap-gcc) . As outras imagens, com excessão do logo do GCC, foram encontradas no [Google Images](https://www.google.com.br/imghp) após pesquisa de termos relacionados aos utilizados nesse artigo .


