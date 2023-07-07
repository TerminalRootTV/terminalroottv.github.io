---
layout: post
title: "Lista dos 10 Melhores Compiladores C/C++"
date: 2023-07-06 22:24:52
image: '/assets/img/cpp/compilers/1.jpg'
description: 'Aqueles que estão atualizados!'
icon: 'ion:terminal-sharp'
iconname: 'C/C++'
tags:
- cpp
- linguagemc
- gcc
- clang
- llvm
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Criar um Compilador C/C++ é algo muito difícil de escrever e leva anos, em muitos casos: décadas. E além disso é tentar competir com aqueles que dominam o mercado e serão quase impossíveis de serem substituidos.

A [linguagem C](https://terminalroot.com.br/tags#linguagemc) teve seu primeiro compilador(`cc` *C Compiler*) feito pelo seu próprio criador: [Dennis Ritchie](https://terminalroot.com.br/2022/05/top-6-maiores-nomes-da-tecnologia.html). Assim também foi o [C++](https://terminalroot.com.br/tags#cpp), o seu primeiro compilador(`Cfront`) foi escrito pelo seu criador: [Bjarne Stroustrup](https://terminalroot.com.br/2022/05/top-6-maiores-nomes-da-tecnologia.html).

As pessoas sempre gostam de ferramentas alternativas por *n* motivos. 

Então, nesse artigo veremos uma **lista de 10 compiladores para C e C++** e eles estão separadas numericamente de acordo com sua eficiência e atualização da seguinte forma:

+ **1.** do número `01` ao `03` - Os 3 <u>melhores</u> e **mais atualizados** do mercado;
+ **2.** entre os números `04` ao `07` - os compiladores alternativos que podem um dia entrar na lista dos melhores;
+ **3.** os números: `08` e `09` - projetos recentes e com grande potencial;
+ **4.** e finalmente o número `10` - por uma questão de *honra*! 😃 

Vamos à lista!

---

# 01. [GNU Compiler Collection](https://gcc.gnu.org) `gcc/g++`
![GCC](/assets/img/cpp/compilers/gcc.jpg) 

Esse, com certeza, tinha e deve ser sempre o primeiro em qualquer lista de compiladores [C/C++](https://terminalroot.com.br/tags#cpp). Pois, é o que suporta o maior números de arquiteturas, o mais antigo entre os melhores e serviu de base/inspiração(em alguns casos até *fork*) para diversos outros, inclusive os outros dois melhores.

É um compilador completo e também **otimizador** produzido pelo [Projeto GNU](https://terminalroot.com.br/tags#gnu) que suporta várias linguagens de programação, arquiteturas de hardware e sistemas operacionais. A **Free Software Foundation (FSF)** distribui o [GCC](https://terminalroot.com.br/tags#gcc) como [software livre](https://terminalroot.com.br/tags/#freesoftware) sob a [GNU General Public License (GNU GPL)](https://www.gnu.org/licenses/gpl-3.0.html). 

Com cerca de **15 milhões de linhas de código** em 2019, o <u>GCC é um dos maiores softwares gratuitos existentes</u>.

Quando foi lançado pela primeira vez em 1987 por [Richard Stallman](https://terminalroot.com.br/2018/10/Etica-vigilancia-e-democracia-na-visao-de-richard-stallman.html), o GCC 1.0 foi nomeado o *GNU C Compiler*, pois lidava apenas com a [linguagem de programação C](https://terminalroot.com.br/2019/10/por-que-a-linguagem-de-programacao-c-ainda-esta-em-alta.html). Foi estendido para compilar [C++](https://terminalroot.com.br/cpp) em dezembro daquele ano. Hoje ele possui uma lista com diversas outras [linguagens de programação](https://terminalroot.com.br/tags#programacao)

+ Página oficial: <https://gcc.gnu.org/>
+ Tutoriais de instalação: [Em sistemas GNU e Unix-like](https://terminalroot.com.br/tags#gcc) e no [Windows](https://terminalroot.com.br/2022/12/como-instalar-gcc-gpp-mingw-no-windows.html)

Exemplos de uso:
> Compilar um código C++, ex.: `main.cpp`
{% highlight bash %}
g++ main.cpp
{% endhighlight %}

> Compilar um código C, ex.: `main.c`
{% highlight bash %}
gcc main.c
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


# 02. [Clang/LLVM](https://clang.llvm.org/) `clang/clang++`
![Clang](/assets/img/cpp/compilers/clang.jpg) 

Esse compilador é, com certeza, o maior concorrente do GCC, podendo até(quem sabe um dia), ultrapassá-lo! 

Foi desenvolvido inicialmente por [Chris Lattner](https://github.com/lattner)(talvez, atualmente o cara que mais entende de compiladores/interpretadores no mundo) e posteriomente por uma equipe, que inclui nomes, que o próprio Chris Lattner diz que: se não fosse eles o Clang/LLVM não seria tão bom.

O Chris Lattner já afirmou diversas vezes que foi entrevistado que sua maior fonte de inspiração foi o GCC.

O [Clang](https://terminalroot.com.br/tags#clang) nada mais é que um **front-end** para o [LLVM](https://terminalroot.com.br/tags#llvm).

**LLVM** é quem de fato transforma o código! Ele é escrito em [C++](https://terminalroot.com.br/tags#cpp) e levou cerca de duas décadas para ficar pronto, e isso só foi possível, pois a [Apple](https://terminalroot.com.br/tags#macos) foi a empresa responsável em sustentar financeiramente os programadores do LLVM durante todo esse tempo, mas também teve apoio das empresas: Google, Microsoft, ARM, Sony, Intel, e AMD.

> O LLVM é também usado pelas linguagens: [Zig](https://terminalroot.com.br/2021/11/primeiros-passos-com-a-linguagem-de-programacao-zig.html), [Swift](https://terminalroot.com.br/2022/02/como-instalar-a-linguagem-de-programacao-swift-no-ubuntu.html), [Rust](https://terminalroot.com.br/tags#rust), [Codon](https://terminalroot.com.br/2022/12/codon-um-compilador-python-escrito-com-cpp-e-llvm.html) e entre diversas outras. Por isso, essas novas linguagens são, na verdade, **front-end** para **C++/LLVM**, eis um dos motivos delas terem aparecido em tantos números nos últimos anos!

Além do C/C++ o Clang/LLVM também compila os códigos das linguagens: Objective-C, Objective-C++, OpenMP, OpenCL, RenderScript e CUDA.

+ Página oficial: <https://clang.llvm.org>
+ Tutoriais de instalação: [Windows e Unix-like](https://clang.llvm.org/get_started.html)

Exemplos de uso:
> Compilar um código C++, ex.: `main.cpp`
{% highlight bash %}
clang++ main.cpp
{% endhighlight %}

> Compilar um código C, ex.: `main.c`
{% highlight bash %}
clang main.c
{% endhighlight %}


<!-- MINI ADS -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# 03. [Microsoft Visual C++](https://learn.microsoft.com/en-us/cpp/?view=msvc-170) `msvc/cl`
![MSVC](/assets/img/cpp/compilers/msvc.jpg) 

**MSVC** era originalmente um produto autônomo, mas depois se tornou parte do [Visual Studio](https://terminalroot.com.br/2021/12/os-32-melhores-ides-editores-de-texto-para-cpp.html#23-visual-studio). Possui ferramentas para desenvolver e depurar código C e C++.

+ Página oficial: <https://learn.microsoft.com/en-us/cpp>
+ Tutoriais de instalação: [Windows](https://terminalroot.com.br/2023/06/como-compilar-com-msvc-via-linha-de-comando.html)

Exemplos de uso:
> Compilar um código C++, ex.: `main.cpp`
{% highlight bash %}
cl main.cpp
{% endhighlight %}

> Compilar um código C, ex.: `main.c`
{% highlight bash %}
cl main.c
{% endhighlight %}


<!-- RECTANGLE LARGE -->
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

---

# 04. [Intel C++ Compiler](https://www.intel.com/content/www/us/en/developer/tools/oneapi/dpc-compiler.html) `icpx/icx`
![icx](/assets/img/cpp/compilers/intel.jpg) 

Esse compilador faz parte do kit de ferramentas Intel OneAPI HPC que são compiladores Intel C, C++ ,SYCL e Data Parallel C++ (DPC++) para sistemas baseados em processador Intel, disponível para sistemas operacionais [Windows](https://terminalroot.com.br/tags#windows), [GNU/Linux](https://terminalroot.com.br/tags#gnu) e [macOS](https://terminalroot.com.br/tags#macos)

+ Endereço na internet: <https://www.intel.com/content/www/us/en/developer/tools/oneapi/dpc-compiler.html>
+ Tutoriais de instalação: [Em distros Linux](https://www.intel.com/content/www/us/en/docs/dpcpp-cpp-compiler/get-started-guide/2023-0/get-started-on-linux.html) e no [Windows](https://www.intel.com/content/www/us/en/docs/dpcpp-cpp-compiler/get-started-guide/2023-0/get-started-on-windows.html)

Exemplos de uso:
> Compilar um código C++ no Linux, ex.: `main.cpp`
{% highlight bash %}
icpx main.cpp
{% endhighlight %}

> Compilar um código C++ no Windows, ex.: `main.cpp`
{% highlight bash %}
icx main.cpp
{% endhighlight %}


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

# 05. [IBM XL C/C++ Compilers](https://www.ibm.com/products/c-and-c-plus-plus-compiler-family) `ibm-clang/ibm-clang++`
![IBM XL C/C++](/assets/img/cpp/compilers/ibm.jpg) 

XL C/C++ é o nome dos compiladores da IBM para C/C++.

São front-ends, incluindo um otimizador de alto nível. Apesar de independerem das arquiteturas de hardware, eles são destinados à: POWER, BlueGene/Q e IBM Z.

+ Endereço na internet: <https://www.ibm.com/products/c-and-c-plus-plus-compiler-family>
+ Tutoriais de instalação: <https://www.ibm.com/docs/en/openxl-c-and-cpp-lop/17.1.1?topic=installation>

Exemplos de uso:
> Compilar um código C++, ex.: `main.cpp`
{% highlight bash %}
ibm-clang++ main.cpp
{% endhighlight %}

> Compilar um código C, ex.: `main.c`
{% highlight bash %}
ibm-clang main.c
{% endhighlight %}

---

# 06. [Oracle C++ Compiler](https://docs.oracle.com/cd/E37069_01/html/E37073/gkobs.html) `CC`
![Oracle](/assets/img/cpp/compilers/oracle.jpg) 

O compilador Oracle C++ consiste em um front-end, otimizador, gerador de código, montador, prelinker de modelo e editor de link. O comando `CC` chama cada um desses componentes automaticamente, a menos que você use opções de linha de comando para especificar o contrário.

+ Endereço na internet: <https://docs.oracle.com/cd/E37069_01/html/E37073/gkobs.html>
+ Tutoriais de instalação: <https://docs.oracle.com/cd/E36784_01/html/E49624/gnwql.html>

Exemplos de uso:
> Compilar um código C++, ex.: `main.cpp`
{% highlight bash %}
CC main.cpp
{% endhighlight %}

> Compilar um código C, ex.: `main.c`
{% highlight bash %}
CC main.c
{% endhighlight %}

---

# 07. [EDG C++ Front End](https://www.edg.com/c) `eccp`
![EDG](/assets/img/cpp/compilers/edg.jpg) 

Trata-se de um compilador front-end iC/C++ desenvolvido pela empresa: **Edison Design Group**. 

Suporta o padrão ISO/IEC 14882. As versões C++17, C++14, C++11 e C++98/03 da linguagem são totalmente suportadas. O trabalho está em andamento para oferecer suporte aos recursos de linguagem C++20.

+ Endereço  na internet e tutoriais de instalação: <https://www.edg.com/c>

Exemplos de uso:
> Compilar um código C++, ex.: `main.cpp`
{% highlight bash %}
eccp -c main.cpp
{% endhighlight %}

> Compilar um código C, ex.: `main.c`
{% highlight bash %}
eccp -c main.c
{% endhighlight %}

---

# 08. [Circle](https://github.com/seanbaxter/circle/) `circle`
![Circle](/assets/img/cpp/compilers/circle.jpg) 

Circle é um compilador novo, diferente e inclui sua própria linguagem, a: Circle. 

Ele se concentra em um novo mecanismo de versão que permite ao compilador corrigir defeitos e tornar o C++ mais seguro e produtivo, mantendo 100% de compatibilidade com os código existentes.

Apesar do projeto já haver versões disponíveis para uso, ele ainda está em desenvolvimento.

Se endereço na internet: <https://www.circle-lang.org/>

Até a data de publicação desse artigo, só versão disponível para distribuições GNU/Linux e a mais recente é o `Build 198`.

Pode ser instalado da seguinte forma:
{% highlight bash %}
mkdir bin-circle
cd bin-circle
wget https://www.circle-lang.org/linux/build_198.tgz
tar zxvf circle_build_198.tgz
sudo install -v circle /usr/local/bin/
{% endhighlight %}

Testando o Circle:
{% highlight bash %}
cat << EOF >> main.cpp  
> #include <iostream>
> 
> int main(){
>   std::cout << "Hello Circle\n";
> }
> EOF
{% endhighlight %}

Como o Circle não possui caminho definido para `STL`, você deverá utilizar a biblioteca padrão de outro compilador para evitar o erro: `cannot find header iostream`. Nesse caso, por exemplo, se você tem o GCC 11 instalado o caminho para compilar seria:

{% highlight bash %}
circle -nostdinc \
      -I/usr/include/c++/11 \
      -I/usr/include/x86_64-linux-gnu/c++/11 \
      -I/usr/lib/gcc/x86_64-linux-gnu/11/include \
      main.cpp
{% endhighlight %}
> Para mais informações veja [aqui](https://github.com/seanbaxter/circle/issues/124).

---

# 09. [C++ Builder](https://www.embarcadero.com/products/cbuilder) 
![C++ Builder](/assets/img/cpp/compilers/cpp-builder.jpg) 

Além de compilador e otimizador, o C++ Builder é também um ambiente de desenvolvimento rápido de aplicativos(RAD) para desenvolvimento de software na linguagem de programação C++. 

Originalmente desenvolvido pela Borland ,a partir de 2009 é propriedade da Embarcadero Technologies , uma subsidiária da Idera. O C++ Builder pode compilar aplicativos para Windows (tanto IA-32 quanto x64 ), iOS, macOS e Android(somente 32 bits).

Seu endereço na internet e como instalar: <https://www.embarcadero.com/products/cbuilder>
> O C++ Builder não possui ferramentas via linha de comando para usar diretamente no [Terminal](https://terminalroot.com.br/tags#terminal).

---

# 10. [Comeau C/C++](https://en.wikipedia.org/wiki/Comeau_C/C++)
![Cfront](/assets/img/cpp/compilers/cfront.jpg) 

Lembra que no início do artigo falei sobre questão de honra? Pois é, o **Comeau C/C++** é o novo nome do primeiro compilador C++: `Cfront`.

Em 2006-2008, foi descrito como o único compilador C++ convencional a oferecer suporte total à palavra-chave `export`.

Esse compilador é de propriedade da empresa *Comeau Computing* que é a membro-fundadora do comitê C++!

Hoje em dia, esse compilador está **obsoleto**, mas você pode obter mais informações [aqui](https://www.comeaucomputing.com/).

---

Espero que tenham gostado da lista e até a próxima!

<!-- Via:

+ <https://en.wikipedia.org/wiki/List_of_compilers>
+ <https://en.wikipedia.org/wiki/Category:C_(programming_language)_compilers>
+ <https://www.stroustrup.com/compilers.html>

---

+ <https://en.wikipedia.org/wiki/GNU_Compiler_Collection>
+ <https://en.wikipedia.org/wiki/Cfront>
+ <https://en.wikipedia.org/wiki/Intel_C++_Compiler>
+ <https://en.wikipedia.org/wiki/Microsoft_Visual_C++>
+ <https://en.wikipedia.org/wiki/Clang>
+ <https://en.wikipedia.org/wiki/LLVM>
+ <https://en.wikipedia.org/wiki/IBM_XL_C/C++_Compilers>
+ <https://en.wikipedia.org/wiki/C++Builder>

-->

