---
layout: post
title: "4 Formas de Ler Arquivos com C++"
date: 2023-01-16 07:28:55
image: '/assets/img/cpp/readfile-cpp.jpg'
description: 'Dentre os exemplos inclui as formas: moderna, clássica, gamefile e parser!'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Em programação C/C++ e qualquer outra linguagem de programação, em diversas situações precisamos ler arquivos externos. Seja para obter dados, fazer *parser* e entre outras funcionalidades.

Nesse artigo veremos **4 Formas de Ler Arquivo com C++** . Entre essas formas teremos:
+ **1**. Estilo [C](https://terminalroot.com.br/tags#linguagemc) - Uma forma clássica;
+ **2**. Estilo *gamefile* - Geralmente muito adotada por desenvolvedores de games, no [Windows](https://terminalroot.com.br/tags#windows) principalmente, geralmente para arquivos `.txt`;
+ **3**. Estilo *parser* - Muitas linguagens de programação possuem essa forma nos seus códigos fonte;
+ **4**. Estilo *POSIX* - Para situações em que *tokens* podem ser criados incluindo [caracteres acentuados](https://terminalroot.com.br/2021/08/converter-maiusculas-com-acentos-em-c-e-cpp.html).

Vou mostrar o código exemplo e fica à sua tarefa modificar conforme sua necessidade.

Vamos lá a lista!

---

# 1. Estilo [C](https://terminalroot.com.br/tags#linguagemc)
Como foi dito no início do artigo, esse é um estilo clássico, essa foi a forma que mais usei em minha vida. A primeira vez que eu postei esse código aqui no blog foi em um artigo publicado em [30 de Outubro de 2014](https://terminalroot.com.br/2014/10/exemplos-de-funcoes-fread-fwrite-remove.html), ou seja, faz tempo! :) Mas, como [C](https://terminalroot.com.br/tags#linguagemc) e [C++](https://terminalroot.com.br/tags#cpp) são linguagens estáveis, ela funciona tão bem como antigamente.

Ele irá ler todas as linhas e mostrar na tela. Essa forma geralmente é usada para fins gerais, por exemplo, um comando similar ao `cat`.

{% highlight cpp %}
#include <stdio.h>
#include <stdlib.h>

int main( int argc, char** argv ){
    if( argc > 1 ){
        FILE *pf;
        char conteudo[100];
        pf = fopen(argv[1], "rb");
        fread(&conteudo, sizeof(char), 100,pf);
        printf("\nO CONTEÚDO DO ARQUIVO É:\n %s \n", conteudo);
        fclose(pf);
    }else{
        printf("Informe o arquivo. Ex.: ./program arquivo.txt\n");
    }
    return(0);
}
{% endhighlight %}

O arquivo é definido em tempo de execução, passado como argumento: `argv[1]`.

---

# 2. Estilo *gamefile*
Nessa forma escolhi também usar Orientação à Objetos, pois fica mais próximo da forma real de como geralmente a usamos. Para esse exemplo, use um `arquivo.config` similar à esse abaixo:

{% highlight ini %}
The Sandbox Game
1920 1080
120
true
{% endhighlight %}

Ou seja, é um arquivo que há separado dados que serão inseridos em um [game](https://terminalroot.com.br/games) qualquer, exemplos: Título, Largura, Altura, Frames por segundo e uma checagem para algum tipo de validação.

Note que o código abaixo, lê cada dado separado por `membro` da nossa classe. Essa é a forma mais interessante quando o assunto são dados específicos externos.

Os dados também serão exibidos separadamente conforme suas funções-membro. O arquivo também é definido em tempo de execução, passado como argumento: `argv[1]`.
> Exemplo: `./a.out arquivo.config`

{% highlight cpp %}
#include <iostream>
#include <fstream>

class MyGame {

    std::string title;
    int width, height, fps;
    bool check;

  public:
    MyGame(){}

    void readfile(std::string str){
      std::ifstream file(str);
      if( file.is_open() ){
        std::getline(file, this->title);
        file >> this->width >> this->height;
        file >> this->fps;
        file >> this->check;
      }
    }

    void show(){
      std::cout << "Name: " << this->title << 
        "\nWidth: "  << this->width << 
        "\nHeight: " << this->height << 
        "\nFPS: "    << this->fps << 
        "\nCHECK: " << this->check;
      std::cout.put('\n');
    }
};

int main( int argc , char **argv ){
  if( argc > 1 ){
    MyGame game;
    game.readfile(argv[1]);
    game.show();
  }else{
    std::cerr << "Informe o arquivo.\n";
    return 1;
  }
  return 0;
}
{% endhighlight %}

---

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

# 3. Estilo *parser*
Geralmente linguagens de programação possuem esse estilo nos seus *códigos-fonte*. Nesse exemplo vamos *tokenizar* todos os caracteres de um arquivo exemplo [JavaScript](https://terminalroot.com.br/tags#javascript).

Algumas observações para esse código são:

+ Se seu compilador for [Clang/LLVM](https://terminalroot.com.br/2023/01/como-instalar-o-clang-binario-em-qualquer-distro-gnu-linux.html), você terá de alterar a linha que tem `content.data()`, há um bug no `clang++`, ou seja, só vai funcionar no [GCC/G++](https://terminalroot.com.br/tags#gcc).
+ O código só lê arquivos com extensão `.js` .

Aqui um exemplo de um código básico **JavaScript** que você pode usar:

{% highlight js %}
function myfunc(){
  console.log("Oi")
}
{% endhighlight %}

Código C++ que irá ler o arquivo `.js`:

{% highlight cpp %}
#include <iostream>

int main( int argc , char **argv ){

  if( argc > 1 ){
    const std::string filename {argv[1]};
    if( filename.substr( filename.length() - 2, 2 ) != "js" ){
      std::cerr << "Informe somente arquivos .js\n";
      return 1;
    }

    std::FILE * file = std::fopen( argv[1], "r" );
    if( !file ){
      std::cerr << "Erro ao ler arquivo.\n";
      return 1;
    }

    std::fseek(file, 0, SEEK_END);
    std::size_t fsize = ftell(file);
    std::fseek(file, 0, SEEK_SET);
    std::string content(fsize, ' ');
    std::fread(content.data(), 1, fsize, file);

    for( char ch : content ){
      std::cout << "TOKEN: " << ch << '\n';
    }

  }else{
    std::cerr << "Use: " << argv[0] << " filename.js" << '\n';
  }
  return 0;
}
{% endhighlight %}

---

# 4. Estilo *POSIX*
Esse estilo posso dizer que tem **100% de minha autoria**. Na verdade, estou usando ele para uma [linguagem de programação](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html) que estou criando, por enquanto ainda é segredo! 😎 

Foi a forma que encontrei de *tokenizar* também caracteres acentuados, diferentemente do outro exemplo logo acima. Ele não recebe argumento via linha de comando, mas você pode alterar.

Se quiser compilar e testar, crie um arquivo de nome `file.ter` e coloque esse exemplo(*spoiler*) dentro dele:

> `vim file.ter`
{% highlight lua %}
** Comentário
void: function(int: x){
  show: "Olá, Mundo!";
}
{% endhighlight %}

Esse é o código que eu criei, um detalhe que talvez você ache estranho é que a função `main` está de uma forma mais moderna, ou seja, algumas versões antigas do C++ podem não reconhecê-la, se esse for o caso, altere para o modo tradicional.
> Se você não criar o arquivo `file.ter`, nada será exibido!

{% highlight cpp %}
#include <iostream>
#include <locale>
#include <fstream>

auto main() -> int {
  std::locale::global(std::locale(""));
  std::wcout.imbue(std::locale());

  std::wstring line = L"";
  std::wifstream file("file.ter");

  while(std::getline(file, line)){
    for (size_t i {}; i < line.size(); ++i) {
      std::wcout << line[i] << '|'; 
    }
  }

  return EXIT_SUCCESS;
}
{% endhighlight %}

---

Por hoje é só, espero que tenham gostado e temos um compromisso marcado no próximo artigo!

Abraços!

---

