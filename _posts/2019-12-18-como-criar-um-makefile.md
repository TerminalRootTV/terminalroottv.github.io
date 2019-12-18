---
layout: post
title: "Como Criar um Makefile"
date: 2019-12-18 19:24:48
image: '/assets/img/gnu/makefile.jpg'
description: 'Na unha e de forma rápida 📁.'
tags:
- makefile
- make
- gnu
- cpp
- linguagemc
---

![Como Criar um Makefile](/assets/img/gnu/makefile.jpg "Como Criar um Makefile")

No artigo que nós criamos: [Tutorial Definitivo do GNU Autotools para Iniciantes](https://terminalroot.com.br/2019/12/tutorial-definitivo-do-gnu-autotools-para-iniciantes.html) , mostramos todo o passo à passo com exemplo para você gerar um `configure` de forma padronizada . E esse arquivo(`configure`) após executado irá gerar um **Makefile** para consequentemente construir um projeto e ser devidamente instalado/desinstalado no sistema, bem como seus exemplos, documentação e manual.

No entanto, se você acha que todo aquele procedimento não é necessário para seu projeto(que pode ser mais simples) , você pode criar diretamente um [Makefile](https://www.gnu.org/software/make/manual/html_node/Simple-Makefile.html) *na unha* de forma rápida e chegará ao mesmo resultado.

---

## Introdução

Um makefile é um arquivo (por padrão chamado de "Makefile") contendo um conjunto de diretivas usadas pela ferramenta de automação de compilação `make` para gerar um alvo/meta(instalar, desinstalar, remover alguns arquivos e outros).

Um *makefile* contém essencialmente atribuições de *variáveis*, *comentários* e *regras* (“targets”). Comentários são iniciados com o carácter “#”.

---

## Exemplo Básico

Você pode usar um editor de texto para escrever seu Makefile, no entanto, é necessário ficar atento aos detalhes, pois o Makefile gera erro até com espaços onde deveria ser TAB. Vejamos algumas linhas:

+ **TARGET** , essa linha vai dizer o nome final do arquivo pós compilado;
+ **CXX** , essa linha(nesse caso) irá dizer o nome do programa que irá compilar( eu criei esse nome variável CXX ): cc, gcc, c++, g++, clang, clang++,...;
+ **LD** , essa devria gerar o linker, quando você compila mais de um arquivo e deseja unir todos em 1 só, vamos mostrar no segundo exemplo;
+ **OBJS** , nesse exemplo deixei como `main.cpp`, mas o certo seria todos os binário para formar o linker;
+ **nomedoprograma:** veja que essa linha a variável **OBJS** , pois se usarmos somente o comando `make` , o arquivo já vai entender;
+ **install:** essa linha você insere o comando para copiar para um diretório do sistema que faz parte da variável **$PATH**, usando o comando `install`;
+ **clean:** e por fim removemos os arquivos binários que foram construídos para formar o linker.

{% highlight bash %}
TARGET=nomedoprograma
CXX=c++
LD=c++
OBJS=main.cpp
nomedoprograma:	$(OBJS)
	$(LD) -o $(TARGET) $(OBJS)
install:
	@install nomedoprograma /usr/local/bin/nomedoprograma
clean:
	rm -rf *.o
{% endhighlight %}

De início para meio estranho, mas esse Makefile se resume em: `c++ main.cpp -o nomedoprograma`. Os parametros `install` e `clean` são opcionais para a construção do programa. 

---

## Um exemplo um pouco menos básico

Você pode criar diversas variáveis para o produto final. Nesse exemplo abaixo, digamos que você quer os parametros:
- `-g`(debugar); 
- `-Wall`(para que o compilador informe os warnings por mais básicos que sejam, mas você quer seu programa totalmente padronizado com a ISOCPP);
- `-pthread` você vai compilar uma biblioteca gráfica e o linker precisa desse arquivo separadamente;
- `-export-dynamic` e por fim mais esse parametro , pois nesse caso digamos que você está compilando com a biblioteca *gtkmm*.

Logo, além das variáveis básicas que vimos no exemplo básico, o final ficaria assim:

> Perceba que dessa vez os *OBJS* informa os binários, e se você usar só o comando `make`, não vai funcionar, pois o **ALVO** mínimo para construção do programa é o parametro `all`. Os arquivos códigos estão dentro de um diretório: `src/`

{% highlight bash %}
TARGET=hello-world
CC=g++
DEBUG=-g
OPT=-O0
WARN=-Wall
PTHREAD=-pthread
CCFLAGS=$(DEBUG) $(OPT) $(WARN) $(PTHREAD) -pipe
LD=g++
LDFLAGS=$(PTHREAD) -export-dynamic
OBJS= main.o helloworld.o
all: $(OBJS)
	$(LD) -o $(TARGET) $(OBJS) $(LDFLAGS)
 
main.o: src/main.cpp
	$(CC) -c $(CCFLAGS) src/main.cpp -o main.o
 
helloworld.o: src/helloworld.cpp
	$(CC) -c $(CCFLAGS) src/helloworld.cpp  -o helloworld.o
 
clean:
	rm -f *.o
{% endhighlight %}

---

## Resumindo
Eu crio e uso Makefiles diariamente, criei até um comando em [Shell](https://terminalroot.com.br/shell), faça também, que gera um pra mim passando somente os arquivos como parametro . A verdade é que não há segredos, basta respeitar essas regras básicas. Os nomes de variáveis você pode até decidir e lembre-se de usar TAB abaixo dos **ALVOS** onde ficarão os comandos.

Se ainda não pegou, sugiro você dá uma olhada nos exemplos simples sugerido pelos caras do GNU, foi lá que eu aprendi: <https://www.gnu.org/software/make/manual/html_node/Simple-Makefile.html> . Os arquivos do exemplo aqui citados podem ser conseguidos no tutorial que eu fiz pra documentação do [Gentoo](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=Gentoo) nesse link: <https://wiki.gentoo.org/wiki/Basic_guide_to_write_Gentoo_Ebuilds> .

Abraços!
