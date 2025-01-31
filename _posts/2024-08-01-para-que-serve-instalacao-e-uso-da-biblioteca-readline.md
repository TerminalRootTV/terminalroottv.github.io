---
layout: post
title: "Para que serve, instalação e uso da biblioteca readline"
date: 2024-08-01 10:51:48
image: '/assets/img/c/readline.jpg'
description: ">_ Para deixar seu REPL like a boss!"
icon: 'ion:terminal-sharp'
iconname: 'C/C++'
tags:
- linguagemc
- cpp
- repl
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

A biblioteca `readline` é uma ferramenta poderosa que facilita a leitura e edição de entradas de usuário em programas de linha de comando. 

Desenvolvida originalmente para o [GNU Project](https://terminalroot.com.br/tags#gnu), ela oferece uma série de funcionalidades que melhoram a experiência do usuário ao interagir com aplicações de terminal. 

A `readline` é usada em várias ferramentas populares de linha de comando, incluindo o [shell Bash](https://terminalroot.com.br/tags#bash), o [Python REPL](https://terminalroot.com.br/tags#python) e muitos outros.

## Para que serve a biblioteca `readline`?
A principal finalidade da biblioteca `readline` é melhorar a experiência de entrada de texto em terminais. Suas funcionalidades incluem:

1.  **Edição de linha:** Permite que os usuários editem as linhas de entrada usando combinações de teclas conhecidas, como mover o cursor para a esquerda/direita, deletar caracteres, etc.
2.  **Histórico de comandos:** A `readline` mantém um histórico dos comandos inseridos, permitindo que os usuários naveguem e reutilizem comandos anteriores.
3.  **Compleção automática:** Suporta a autocompletar de comandos e argumentos, aumentando a eficiência e reduzindo erros.
4.  **Edição e formatação:** Permite a personalização de prompt, coloração de texto, e outras opções de formatação.


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

## Instalação
Para instalar a biblioteca `readline` você pode **usar o gerenciador de pacotes do seu sistema operacional**. Exemplo no [Ubuntu](https://terminalroot.com.br/tags#ubuntu) usando o *APT*:

{% highlight bash %}
sudo apt install libreadline-dev
{% endhighlight %}

Você também pode compilar e instalar a `readline` diretamente, clique no botão abaixo, descompacte e siga as instruções dentro da pasta descompactada para compilar e instalar:

<a href="ftp://ftp.cwru.edu/pub/bash/readline-8.2.tar.gz" class="btn btn-danger btn-lg">Clique aqui para fazer o download da readline</a>  

---

## Exemplos de Uso da Biblioteca `readline`
Vamos explorar alguns exemplos práticos para ilustrar como a biblioteca `readline` pode ser utilizada.

### Exemplo 1: Leitura Básica de Linha
Um exemplo básico de como utilizar `readline` para ler uma linha de entrada do usuário.
> Neste exemplo, a função `readline` é utilizada para ler uma linha de entrada do usuário com o prompt "Digite algo: ". A entrada é então impressa no terminal.

**[Linguagem C](https://terminalroot.com.br/c)**
{% highlight c %}
#include <stdio.h>
#include <stdlib.h>
#include <readline/readline.h>

int main() {
  char *input;
  input = readline("Digite algo: ");
  if (input) {
    printf("Você digitou: %s\n", input);
    free(input);
  }
  return 0;
}
{% endhighlight %}
> Compile usando a *flag* `-lreadline`, ex.: `gcc main.c -lreadline`.

**[C++](https://terminalroot.com.br/tags#cpp)**
{% highlight cpp %}
#include <iostream>
#include <readline/readline.h>

int main() {
  std::string input  = readline("Digite algo: ");
  if(input.c_str()){
    std::cout << "Você digitou: " << input << '\n';
  }
  return EXIT_SUCCESS;
}
{% endhighlight %}
> Compile usando a *flag* `-lreadline`, ex.: `g++ main.cpp -lreadline`.


### Exemplo 2: Utilizando Histórico de Comandos
A `readline` também permite que você armazene e reutilize comandos anteriores. Veja um exemplo simples:

**[Linguagem C](https://terminalroot.com.br/c)**
{% highlight c %}
#include <stdio.h>
#include <stdlib.h>
#include <readline/readline.h>
#include <readline/history.h>

int main() {
  char *input;

  while((input = readline(">>> ")) != NULL) {
    if (*input) {
      add_history(input);
    }

    printf("Você digitou: %s\n", input);
    if(strcmp(input, "exit") == 0){
      free(input);
      break;
    }
    free(input);
  }

  return 0;
}
{% endhighlight %}

**[C++](https://terminalroot.com.br/cpp)**
{% highlight cpp %}
#include <iostream>
#include <readline/readline.h>
#include <readline/history.h>

int main(){
  char* input;
  std::string line {};
  for (;;){
    input = readline(">>> ");
    line = input;
    if(input){
      add_history(input);
    }
    if (line == "exit"){
      free(input);
      break;
    }
    free(input);
  }
  return EXIT_SUCCESS;
}
{% endhighlight %}

Neste exemplo, o comando digitado pelo usuário é adicionado ao histórico se não estiver vazio, permitindo que ele seja reutilizado apenas pressionando a tecla direcional para cima: `↑`, caso não tivesse adicionado o `add_history(input)`, ao teclar o evento iria exibir de forma literal: `^[[A^`.

---

Para mais informações, acesse: <https://tiswww.case.edu/php/chet/readline/rltop.html>


