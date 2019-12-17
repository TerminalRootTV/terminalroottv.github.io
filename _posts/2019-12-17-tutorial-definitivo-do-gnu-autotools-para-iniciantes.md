---
layout: post
title: "Tutorial Definitivo do GNU Autotools para Iniciantes"
date: 2019-12-17 14:07:46
image: '/assets/img/gnu/gnu-autotools-2.png'
description: 'Decidi documentar um teste moderno e bem simplista que eu criei.'
tags:
- gnu
- autotools
- make
- language-c
- cpp
---

![Tutorial Definitivo de Como Usar o GNU AutoTools](/assets/img/gnu/gnu-autotools-2.png)

Apesar de existirem algumas outras alternativas às ferramentas automáticas do [GNU](https://gnu.org), o **GNU Autotools** ainda é o mais utilizado no mundo por motivos de confiança em relação à resultados finais. Ou seja, a **experiência** levou à essa **estabilidade**.

Infelizmente, há muita documentação obsoleta na internet sobre o **Autotools** e muitas reclamações sobre ferramentas automáticas, por esse motivo decidi documentar um teste moderno e bem simplista que eu criei e vou compartilhar com vocês essa experiência que fiz questão de torná-la o mais básico possível para poder alcançar o entendimento.

Mas ainda assim, não deixe de exibir exemplos que funcionem em projetos maiores, que por sinal a ideia é a mesma, só precisa ter um pouco mais de atenção nas configurações.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

#### Esse artigo se resumirá em:

> Todos os tópicos foram separados com **Passo à Passo** e **Listas ordenadas** para facilitar a compreensão.

### 1. Introdução
### 2. Preparação do Ambiente
### 3. Utilização das ferramentas automáticas
### 4. Explicações teóricas de cada comando e arquivo
### 5. Recursos prontos no Git (meus exemplos)
### 6. Scripts em Bash (facilitam notar os passos)
### 7. Resumo (Mini mapa mental)
### 8. Referências bibliográficas

---

## Introdução
O [GNU Autotools](https://www.gnu.org/software/autoconf/) , também conhecido como [GNU Build System](https://www.gnu.org/software/automake/) , é um conjunto de ferramentas de programação projetadas para ajudar a tornar os pacotes de código-fonte portáteis para muitos sistemas Unix .

Pode ser difícil tornar um programa de software portátil: o compilador [C](https://terminalroot.com.br/2017/01/codigo-de-linguagem-c-para-aprendizado.html) difere de sistema para sistema; algumas funções da biblioteca estão ausentes em alguns sistemas; arquivos de cabeçalho podem ter nomes diferentes. Uma maneira de lidar com isso é escrever código condicional, com blocos de código selecionados por meio de diretivas de pré-processador (`#ifdef`); mas devido à grande variedade de ambientes de construção, essa abordagem rapidamente se torna incontrolável. O [Autotools](https://www.gnu.org/software/libtool/) foi projetado para solucionar esse problema de maneira mais fácil.

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

O **Autotools** faz parte da cadeia de ferramentas GNU e é amplamente utilizado em muitos pacotes de software livre e de código aberto . Suas ferramentas componentes são licenciadas por software livre sob a Licença Pública Geral GNU, com exceções especiais de licença permitindo seu uso com software proprietário .

O GNU Build System possibilita a criação de muitos programas usando um processo de duas etapas: configure seguido por make .

O Autotools consiste nos programas utilitários [GNU Autoconf](https://www.gnu.org/software/autoconf/) , [Automake](https://www.gnu.org/software/automake/) e [Libtool](https://www.gnu.org/software/libtool/) . Outras ferramentas relacionadas frequentemente usadas ao lado dele incluem o programa [GNU make](https://www.gnu.org/software/make/), o [GNU gettext](https://www.gnu.org/software/gettext/) , o [pkg-config](https://www.freedesktop.org/wiki/Software/pkg-config/) e o [GNU Compiler Collection](https://gcc.gnu.org/) , também chamada **GCC/G++**.

---

## 1º Parte: Configurando os arquivos para testes

+ **1** → Criar os diretórios para os testes:
{% highlight bash %}
mkdir testes && cd testes
mkdir doc examples man scripts src
{% endhighlight %}

+ **2** → Criar os arquivos para os teste
{% highlight bash %}
touch doc/README.md examples/my-example-teste.dat man/teste.1 scripts/script-teste.sh src/teste.c
{% endhighlight %}

+ **3** → Popular os arquivos

{% highlight bash %}
# Conteúdo para o arquivo em doc/
echo "Documentação para o teste" >> doc/README.md

# Conteúdo para o arquivo em examples/
echo -e '#!/bin/bash\necho "Teste em Bash"\nexit 0' >> examples/my-example-teste.dat

# Conteúdo para o arquivo em man/
echo -e '.\" DO NOT MODIFY THIS FILE!  It was generated by help2man 1.47.8.
.TH teste "1" "October 2019" "teste 1.1" "User Commands"
.SH NAME
teste \- Only teste for Autotools.' > man/teste.1

# Conteúdo para o arquivo em scripts/
echo -e '#!/bin/sh\nprintf "Only a teste\\n" "%s"\nexit 0' > scripts/script-teste.sh

# Conteúdo para o arquivo em src/
echo -e '#include <stdio.h>

int main(){
	printf("Somente um teste para o Autotools\\n");
	return 0;
}' > src/teste.c
{% endhighlight %}

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

+ **4** → Resultado final dos arquivos:
{% highlight bash %}
testes/
├── doc
│   └── README.md
├── examples
│   └── my-example-teste.dat
├── man
│   └── teste.1
├── scripts
│   └── script-teste.sh
└── src
    └── teste.c
5 directories, 5 files
{% endhighlight %}

+ **5** → Opcional: hash do diretório:
{% highlight bash %}
ls ../testes/ | md5sum
ac0bacadc6861ab22a44af572b255ff1  -
{% endhighlight %}

---

## 2º Parte: Utilizando as ferramentas do GNU Autotools

+ **1** → Gerar o arquivo `configure.ac`, execute:
{% highlight bash %}
autoscan
{% endhighlight %}

> Foram criados os arquivos: `autoscan-2.69.log` e `configure.scan` . Onde o conteúdo de *autoscan-2.69.log* está vazio e o conteúdo de *configure.ac* é:

{% highlight bash %}
#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([FULL-PACKAGE-NAME], [VERSION], [BUG-REPORT-ADDRESS])
AC_CONFIG_SRCDIR([src/teste.c])
AC_CONFIG_HEADERS([config.h])

# Checks for programs.
AC_PROG_CC

# Checks for libraries.

# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

AC_OUTPUT
{% endhighlight %}

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

+ **2** → Renomear o arquivo `configure.scan` para `configure.ac`:
{% highlight bash %}
mv configure.scan configure.ac
{% endhighlight %}

+ **3** → Alterar a linha do arquivo `configure.ac` que possui as informações: **AC_INIT(FULL-PACKAGE-NAME, VERSION, BUG-REPORT-ADDRESS)** para os nomes do seu projeto, ex.:
**AC_INIT(teste, 1.0, teste@terminalroot.com.br)** . Caso deseje, use o [Sed]() para isso, assim:
{% highlight bash %}
sed -i 's/FULL-PACKAGE-NAME\],/teste],/g' configure.ac
sed -i 's/VERSION\],/1.0],/g' configure.ac
sed -i 's/BUG-REPORT-ADDRESS\]/teste@terminalroot.com.br]/g' configure.ac
{% endhighlight %}
> Ou use um editor de texto de preferência, exemplo: [Vim]() .

Ao final meu arquivo ficou assim:
{% highlight bash %}
#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([teste], [1.0], [teste@terminalroot.com.br])
AC_CONFIG_SRCDIR([src/teste.c])
AC_CONFIG_HEADERS([config.h])

# Checks for programs.
AC_PROG_CC

# Checks for libraries.

# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

AC_OUTPUT
{% endhighlight %}

+ **4** → Gerando um script `configure` inicial:
{% highlight bash %}
autoconf
{% endhighlight %}
> Foram criados: 1 novo diretório e 1 novo arquivo: `autom4te.cache/` e o `configure` . O conteúdo dos mesmos são extensos, o `configure` por exemplo possui **3549 linhas**.

+ **5** → Criando o arquivo `Makefile.am`:
{% highlight bash %}
vim Makefile.am
{% endhighlight %}

E insira esse conteúdo dentro:
{% highlight bash %}
AUTOMAKE_OPTIONS = foreign
SUBDIRS = src doc examples man scripts
{% endhighlight %}

+ **6** → Criando o arquivo `Makefile.am` só que desta vez dentro do diretório `src/`:
{% highlight bash %}
vim src/Makefile.am
{% endhighlight %}

E insira esse conteúdo dentro:
{% highlight bash %}
# what flags you want to pass to the C compiler & linker
CFLAGS = --pedantic -Wall -std=c99 -O2
# LDFLAGS =
# this lists the binaries to produce, the (non-PHONY, binary) targets in
# the previous manual Makefile
bin_PROGRAMS = teste
teste_SOURCES = teste.c
{% endhighlight %}

+ **7** → Criando o arquivo `Makefile.am` só que desta vez dentro do diretório `man/`:
{% highlight bash %}
vim man/Makefile.am
{% endhighlight %}

E insira esse conteúdo dentro:
{% highlight bash %}
man_MANS = teste.1
{% endhighlight %}

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

+ **8** → Criando o arquivo `Makefile.am` só que desta vez dentro do diretório `scripts/`:
{% highlight bash %}
vim scripts/Makefile.am
{% endhighlight %}

E insira esse conteúdo dentro:
{% highlight bash %}
bin_SCRIPTS = script-teste.sh
{% endhighlight %}

+ **9** → Criando o arquivo `Makefile.am` só que desta vez dentro do diretório `doc/`:
{% highlight bash %}
vim doc/Makefile.am
{% endhighlight %}

E insira esse conteúdo dentro:
{% highlight bash %}
docdir = $(datadir)/doc/@PACKAGE@
doc_DATA = README.md
{% endhighlight %}

+ **10** → Criando mais um arquivo `Makefile.am` só que desta vez dentro do diretório `examples/`:
{% highlight bash %}
vim examples/Makefile.am
{% endhighlight %}

E insira esse conteúdo dentro:
{% highlight bash %}
exampledir = $(datarootdir)/doc/@PACKAGE@
example_DATA = my-example-teste.dat
{% endhighlight %}

+ **11** → Integrando a parte da checagem (autoconf) com a parte da compilação (automake):
> Abra o arquivo `vim configure.ac`

E insira o conteúdo **AM_INIT_AUTOMAKE(teste, 1.0)**, logo depois do **AC_INIT([teste], [1.0], [teste@terminalroot.com.br])**:
> Se quiser que fique mais fácil, basta usar esse comando abaixo( [Sed]() ):
{% highlight bash %}
sed -i '/AC_INIT/{p;s/.*/AM_INIT_AUTOMAKE(teste, 1.0)/;}' configure.ac
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

+ **12** → Deixe o autoconf gerar um script configure cuja saida será Makefiles para todos os diretórios citados:
> Alterando a linha que contém: **AC_OUTPUT** com [Sed]() (caso deseje use um editor de texto e faça manualmente):

{% highlight bash %}
sed -i 's@AC_OUTPUT@AC_OUTPUT(Makefile src/Makefile doc/Makefile examples/Makefile man/Makefile scripts/Makefile)@' configure.ac
{% endhighlight %}

+ **13** → Fazendo as ferramentas produzirem o script `configure` e os modelos de Makefile:
{% highlight bash %}
aclocal
{% endhighlight %}
> Foi gerado mais um arquivo no diretório raíz do projeto, com o nome: `aclocal.m4`

+ **14** → Produzindo o arquivo `Makefile.in` com o argumento `--add-missing`:
{% highlight bash %}
automake --add-missing
{% endhighlight %}

A saída será algo similar ou igual(se usou os arquivos desse tutorial) à:
{% highlight bash %}
configure.ac:6: warning: AM_INIT_AUTOMAKE: two- and three-arguments forms are deprecated.  For more info, see:
configure.ac:6: https://www.gnu.org/software/automake/manual/automake.html#Modernize-AM_005fINIT_005fAUTOMAKE-invocation
configure.ac:11: installing './compile'
configure.ac:6: installing './install-sh'
configure.ac:6: installing './missing'
configure.ac:8: error: required file 'config.h.in' not found
src/Makefile.am: installing './depcomp'
src/Makefile.am:2: warning: 'CFLAGS' is a user variable, you should not override it;
src/Makefile.am:2: use 'AM_CFLAGS' instead
src/Makefile.am:3: warning: 'LDFLAGS' is a user variable, you should not override it;
src/Makefile.am:3: use 'AM_LDFLAGS' instead
{% endhighlight %}

Perceba a linha: **configure.ac:8: error: required file 'config.h.in' not found** , se isso aparecer também para você, rode:
{% highlight bash %}
autoreconf -fi
{% endhighlight %}

+ **15** → E finalmente geramos o script final do `configure`:
{% highlight bash %}
autoconf
{% endhighlight %}

Se quiser verificar se está tudo certo, rode o `./configure`, o `make` e teste a execução do programa: `cd src/ && ./teste` , a saída será: **Somente um teste para o Autotools** .
E se quiser instalar no sistema, rode:
> Considerando que você tem o `sudo` instalado e faz parte do grupo, caso contrário o `make install` só funcionará com o `root`.

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

{% highlight bash %}
./configure
make
sudo make install
{% endhighlight %}
A instalação vai criar alguns diretório e fazer as seguintes cópias dos arquivos para os caminhos:
{% highlight bash %}
/bin/mkdir -p '/usr/local/bin'
/usr/bin/install -c teste '/usr/local/bin'

/bin/mkdir -p '/usr/local/share/doc/teste'
/usr/bin/install -c -m 644 README.md '/usr/local/share/doc/teste

/bin/mkdir -p '/usr/local/share/doc/teste'
/usr/bin/install -c -m 644 my-example-teste.dat '/usr/local/share/doc/teste'

/bin/mkdir -p '/usr/local/share/man/man1'
/usr/bin/install -c -m 644 teste.1 '/usr/local/share/man/man1'

/bin/mkdir -p '/usr/local/bin'
/usr/bin/install -c script-teste.sh '/usr/local/bin'
{% endhighlight %}

+ Se rodar o comando: `teste`(independente do diretório que você estiver) vai obter a saída da execução do programa: **Somente um teste para o Autotools**;
+ Se rodar o comando: `script-teste.sh`(independente do diretório que você estiver) vai obter a saída da execução do programa: **Only a teste**;
+ Se rodar o comando: `info teste` ou `man teste`(independente do diretório que você estiver) vai obter o manual;
+ Se quiser ver a documentação, execute: `cat /usr/local/share/doc/teste/README.md`;
+ Se quiser ver os exemplos, execute: `cat /usr/local/share/doc/teste/my-example-teste.dat`.

Para desinstalar precisará estar no diretório de `testes/` e rode o comando:
{% highlight bash %}
sudo make uninstall
{% endhighlight %}

Absolutamente TUDO será desinstalado, a saída será similar/igual:
{% highlight bash %}
marcos@gentoo ~/testes $ sudo make uninstall
Senha:
Making uninstall in src
make[1]: Entering directory '/home/marcos/testes/src'
 ( cd '/usr/local/bin' && rm -f teste )
make[1]: Leaving directory '/home/marcos/testes/src'
Making uninstall in doc
make[1]: Entering directory '/home/marcos/testes/doc'
 ( cd '/usr/local/share/doc/teste' && rm -f README.md )
make[1]: Leaving directory '/home/marcos/testes/doc'
Making uninstall in examples
make[1]: Entering directory '/home/marcos/testes/examples'
 ( cd '/usr/local/share/doc/teste' && rm -f my-example-teste.dat )
make[1]: Leaving directory '/home/marcos/testes/examples'
Making uninstall in man
make[1]: Entering directory '/home/marcos/testes/man'
 ( cd '/usr/local/share/man/man1' && rm -f teste.1 )
make[1]: Leaving directory '/home/marcos/testes/man'
Making uninstall in scripts
make[1]: Entering directory '/home/marcos/testes/scripts'
 ( cd '/usr/local/bin' && rm -f script-teste.sh )
make[1]: Leaving directory '/home/marcos/testes/scripts'
make[1]: Entering directory '/home/marcos/testes'
make[1]: Nothing to be done for 'uninstall-am'.
make[1]: Leaving directory '/home/marcos/testes'
marcos@gentoo ~/testes $
{% endhighlight %}

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

## 3º Parte: Preparando os arquivos ou Gerando tudo via Shell Script

Caso deseje ver funcionando tudo que fizemos aqui, use arquivos pré-prontos ou execute um script simples de Bash:
{% highlight bash %}
git clone https://github.com/terroo/gnu-autotools
cd gnu-autotools/
{% endhighlight %}

E use os arquivos de ambiente já pré-criados: `gnu-autotools/testes/` ou simplesmente rode o script que cria os arquivos do zero: `./gnu-autotools.sh`

Ou gere tudo inclusive os comandos do **Autotools** via script com o arquivo: `./gnu-autotools-full.sh`

---

## 4º Parte: Explicando os arquivos e comandos do Autotools

Em resumo o [GNU Autotools]() :
+ Checa a disponiblidade de bibliotecas necessárias;
+ Possivelmente ajusta algumas coisas (como alguns caminhos em scripts ou em documentação) em tempo de compilação;
+ Instalar tudo em seu lugar;
+ Tudo isso de forma padronizada e com tratamento de todos os possíveis erros que podem existir na construção e instalação de um software;
+ O comando `autoscan` tenta produzir uma arquivo `configure.ac` correto pela execução de analises simples nos arquivos do pacote;
+ O comando `autoconf` produz dois arquivos: `autom4te.cache` e o `configure`;
+ O diretório `autom4te.cache` é um diretório usado para acelerar o trabalho das ferramentas, e pode ser removido quando o pacote for liberado;
+ O arquivo `configure` é o script shell que é chamado pelos usuários finais. Nesse ponto, o  que o arquivo configure faz é somente checar por dependências como sugerido pelo *autoscan*, então nada muito conclusivo ainda;
+ Após já ter a parte de checagem do sistema, partimos para a compilação e instalação. Isso é feito pela cooperação entre o `automake` o `autoconf`. O `automake` gera alguns "modelos" que os scripts gerados pelo `autoconf` traduzirão nos Makefiles. Um arquivo makefile inicial é necessário na raiz do pacote: **./Makefile.am**;
+ A linha referente à **AUTOMAKE_OPTIONS = foreign** configura o modo que o `automake` assumirá. O modo "foreign" significa não GNU, e é comum ser usado;
+ A segunda linha mostra a lista de sub-diretórios onde se encontram os arquivos a serem trabalhados. O primeiro tem as coisas a serem compiladas, enquanto o resto apenas precisa ser instalado, mas nós não nos importamos com esse arquivo. Iremos preparar agora o arquivo `Makefile.am` para cada um desses diretórios. O `automake` irá passar por casa um deles para produzir o arquivo `Makefile.in` correspondente. Esses arquivos `*.in` serão usados pelos scripts do `autoconf` para produzir os arquivos `Makefile` finais.
+ Geralmente no arquivo `src/Makefile.am` definimos todos os arquivos que serão criados e compilados. Em geral, os sufixos em letras maiúsculas como "_PROGRAMS" são chamados **primary** e dizem parcialmente o que executar no seu argumento; os prefixos, em letras minúsculas (não tem um nome pré-fixado) dizem o diretório onde será instalado. Para informar diversos arquivos, usa-se assim mais ou menos:
{% highlight bash %}
# what flags you want to pass to the C compiler & linker
CFLAGS = --pedantic -Wall -std=c99 -O2
LDFLAGS =
# this lists the binaries to produce, the (non-PHONY, binary) targets in
# the previous manual Makefile
bin_PROGRAMS = targetbinary1 targetbinary2 [...] targetbinaryN
targetbinary1_SOURCES = targetbinary1.c myheader.h [...]
targetbinary2_SOURCES = targetbinary2.c
.
.
targetbinaryN_SOURCES = targetbinaryN.c
{% endhighlight %}
+ Os arquivos em `scripts/` geralmente possuem o Shell Script que irá chamar o executável, bem como modelos de autocomplete(compgen) de parâmetros. Utilizamos um conteúdo de exemplo, mas o certo mesmo seria assim (exemplo do script do Firefox):

{% highlight bash %}
#!/bin/sh
unset LD_PRELOAD
LD_LIBRARY_PATH="/usr/lib64/apulse:/opt/firefox/" \
GTK_PATH=/usr/lib64/gtk-3.0/ \
exec /opt/firefox/firefox "$@"
{% endhighlight %}
Ou seja, ele chamará o executável que foi compilado e instalado em `/opt` no seu devido diretório ;
+ O comando `aclocal` cria as ferramentas que geram cada script gera o arquivo `aclocal.m4` que contém **macros** para as coisas do `automake`;
+ O comando `automake` lê o `configure.ac` e o `Makefile.a`m, interpreta-os e, para cada `Makefile.am` produz um `Makefile.in`. O argumento `--add-missing` diz ao `automake` para fornecer scripts padrão para qualquer erro reportado, assim pode ser omitido nas próximas execuções;
+ O comando `autoreconf`(usado para regularizar a falta de `config.h.in`) compila todas as ferramentas relevantes na ordem correta e instala os arquivos ausentes. Os parâmetros `-f`(considera que tudo está obsoleto e força a reconfiguração) e `-i` (faz uma cópia de arquivos auxiliares presentes no sistema para seu projeto, chama o `autoheader`) . Ainda poderíamos unir ao parâmetro `-v` ficando `-vfi` para ver os detalhes dos procedimentos.

---

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

## Resumindo

`autotools` → `autoscan`(configure.scan) → `configure.ac` → `autoconf`(autom4te.cache e configure inicial) → `Makefile.am`(`*`) → `aclocal`(aclocal.m4) → `automake`(Makefile.in) → `autoreconf`(`config.h.in/header`) → autoconf(`./configure`) → `Makefile`(make && make install)

![Autotools](/assets/img/gnu/gnu-autotools-1.png)

---

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

## Referências
+ <https://www.gnu.org/software/autoconf/>
+ <https://www.gnu.org/software/automake/>
+ <https://www.gnu.org/software/libtool/>
+ <https://www.gnu.org/software/make/>
+ <https://www.gnu.org/software/gettext/>
+ <https://en.wikipedia.org/wiki/GNU_Autotools>
+ <https://klebermota.eti.br/2010/10/13/tutorial-para-criar-a-estrutura-de-arquivos-do-autoconf-automake-para-seu-projeto/>
+ <https://developer.gnome.org/anjuta-build-tutorial/stable/create-autotools.html.en>
+ <https://dwheeler.com/autotools/>  
