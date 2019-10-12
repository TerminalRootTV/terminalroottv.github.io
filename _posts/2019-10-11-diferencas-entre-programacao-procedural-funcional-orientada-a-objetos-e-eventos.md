---
layout: post
title: "Diferenças entre Programação: Procedural, Funcional e OOP"
date: 2019-10-11 20:21:43
image: '/assets/img/dev/paradigma.jpg'
description: 'Vamos ver alguns conceitos.'
tags:
- linguagem
- desenvolvimento
- programacao
---

[![Diferenças entre Programação: Procedural, Funcional, Orientada a Objetos e Eventos](/assets/img/dev/paradigma.jpg)](/assets/img/dev/paradigma.jpg)


Vamos ver alguns conceitos de programação para que haja uma maior compreensão, pelo menos teórica, em desenvolvimento.

## Introdução

Este artigo tenta definir as várias semelhanças e diferenças entre os vários **paradigmas de programação** como um resumo sobre essas semelhanças e diferenças .

## Programação Procedural

Também conhecida como **Programação Estruturada** , ela especifica as etapas que um programa deve executar para atingir o estado desejado. Veja um exemplo em [Shell Script](https://terminalroot.com.br/shell) abaixo:

{% highlight bash %}
#!/bin/sh
# Exemplo Funcional

function insert_the_name()
echo "Insira seu Nome"
read -n1 RESPOSTA
mkdir $REPLY
cd $REPLY
find $HOME -type f -iname "*.cc" -exec mv {} . \;

function enter_lastname(){
    echo "Insira seu Sobrenome"
    read -n1 SOBRENOME
    mkdir $SOBRENOME
    cd $SOBRENOME
}

function loop_for(){
    for i in $(grep -o 'http.*' ${CONFIG_PROTECT} | sed 's/\".*//g');
    do
        wget -q "$i"; echo "Release $(basename $i)";
    done
}

function sum(){
    echo "$1" + "$2" | bc
}

insert_the_name
enter_lastname
loop_for
sum

{% endhighlight %}

## Programação Funcional

Trata os programas como avaliando funções matemáticas e evita dados de estado e mutáveis .

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

## Programação Orientada a Objetos

Conhecida também pela sigla **POO** ou **OOP**(em inglês, *Object-Oriented Programming*) . Organiza programas como objetos : estruturas de dados que consistem em campos de dados e métodos, juntamente com suas interações. Exemplo em [C++](https://isocpp.org/):

{% highlight cpp %}
#include <iostream>
#include <string>
/*
 * Exemplo Orientado a Objetos
 * */
class Cpp{
	public:
		int sum( int * x, int * y){
			return *x + *y;
		}

		bool verify( int *n){
			if(*n > 2){
				return true;
			}else{
				std::cout << "N° de argumentos inválido." << "\n";
				return false;
			}
		}
};

int main( int argc, char** argv ){
	Cpp cpp;

	if( cpp.verify( &argc ) ){
		int a {std::stoi(argv[1])};
		int b {std::stoi(argv[2])};
		std::cout << cpp.sum(&a, &b) << "\n";
	}

	return 0;
}
{% endhighlight %}

## Outros Paradigmas de Programação

+ **Programação Orientada a Eventos** - o fluxo de controle do programa é determinado por eventos , como entradas do sensor ou ações do usuário (cliques do mouse , pressionamentos de tecla) ou mensagens de outros programas ou threads .
+ **Programação Baseada em Autômatos** - um programa, ou parte, é tratado como um modelo de uma máquina de estados finitos ou qualquer outro autômato formal.
+ **Programação Reativa** -  é um paradigma de programação declarativa relacionado aos fluxos de dados e à propagação da mudança.
+ **Programação Imperativa** - concentra-se em como executar, define o fluxo de controle como instruções que alteram o estado de um programa.
+ **Programação declarativa** - enfoca o que executar, define a lógica do programa, mas não o fluxo de controle detalhado. 

Ou seja, são informações técnicas, mas que possuem um cunho também organizacional e deve ser aplicada cada um dos paradigmas dependendo do programa , do objetivo do programa e também aos recursos oferecidos pela [Linguagem de Programação](https://terminalroot.com.br/2016/10/blog-linux-ola-mundo-9-linguagens.html) , [saiba mais aqui](https://en.m.wikipedia.org/wiki/Comparison_of_programming_paradigms).

Não esqueça de comentar sua visão ou algo que você acredite que é fundamental e relevante informar também para que possamos acrescentar.

Abraços!
    
