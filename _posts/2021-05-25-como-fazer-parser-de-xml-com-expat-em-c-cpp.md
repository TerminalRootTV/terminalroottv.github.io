---
layout: post
title: "Como fazer parser de XML com Expat em C/C++"
date: 2021-05-25 09:28:00
image: '/assets/img/cppdaily/expat.jpg'
description: 'A mais utilizada do mundo, tais como: CMake, Godot, Firefox, LibreOffice e outros.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cppdaily
- cpp
---

![Como fazer parser de XML com Expat em C/C++](/assets/img/cppdaily/expat.jpg)

Nesse [cpp::daily](https://terminalroot.com.br/tags#cppdaily) de hoje vamos falar uma das bibliotecas mais utilizadas do mundo.

Existem várias bibliotecas para fazer parser de XML e já já vamos postar uma lista das melhores. Cada uma com seus prós e contra, mas a [Expat](https://libexpat.github.io/) tem bastante diferenciais, começando pelo fato de ser indicada pela [W3C](https://www.w3c.br/).

De todas com certeza, a Expat é a mais difícil de implementar, mas a garantia do resultado é de 100% . Além de ser a mais utilizada de todas, projetos como: AbiWord, Android Studio, Apache OpenOffice, Audacity, aria2, [CMake](https://terminalroot.com.br/2019/12/como-compilar-seus-programas-com-cmake.html), D-Bus, Electron, Elinks, [Firefox](https://terminalroot.com.br/2021/05/finalizando-o-app-com-cpp-e-gtkmm-importando-senhas-do-firefox.html), [Git](https://terminalroot.com.br/git), Godot, LibreOffice e [muitos outros](https://libexpat.github.io/doc/users/) a utilizam.

A Expat pode ser implementada por diversas [linguagens de programação](https://terminalroot.com.br/2021/03/testei-o-desempenho-de-10-linguagens-de-programacao-com-ranking.html), tais como: [Python](https://terminalroot.com.br/tags#python), [PHP](https://terminalroot.com.br/php/), Perl e entre outras.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


Ela foi escrita em [C](https://terminalroot.com.br/tags#linguagemc) e pode ser intimidante devido aos vários tipos de manipuladores e opções que você pode definir. Mas você só precisa aprender quatro funções para fazer 80% do que deseja fazer com elas:

+ `XML_ParserCreate` - Para criar um novo objeto analisador.
+ `XML_SetElementHandler` - Para definir manipuladores para tags de início e fim.
+ `XML_SetCharacterDataHandler` - Para definir o manipulador para texto.
+ `XML_Parse` - Para passar um buffer cheio de documentos para o analisador

Antes de qualquer coisa você precisa possuí-la instalada no seu `include`. Ela está em todos os repositórios de distro, então basta usar o gerenciador de pacotes da sua [distro](https://terminalroot.com.br/tags#distros), exemplos:

{% highlight bash %}
emerge expat # Gentoo, Funtoo, ...
sudo apt install expat # Debian, Ubuntu, Mint, ...
sudo pacman -S expat # Arch, Manjaro, ...
sudo dnf install expat # Red Hat, Fedora, ...
{% endhighlight %}

Para entendermos, vamos mostrar um exemplo de um código e para mais detalhes, sugiro a leitura da [documentação](https://libexpat.github.io/doc/) que é bem concisa, pois a única coisa que eu senti falta na documentação foi de um exemplo simples para entendimento em linhas gerais.

Então, eu criei esse exemplo básico, mas já funcional. Para fins didáticos o código não é orientada a objetos para que você possa usar tanto em [C](https://terminalroot.com.br/tags#linguagemc) como em [C++](https://terminalroot.com.br/cpp) .

Para isso vamos usar esse exemplo de XML: `vim programmers.xml`

{% highlight xml %}
<?xml version="1.0" encoding="UTF-8"?>
<data>
  <programmer>
    <name>Bjarne Stroustroup</name>
    <language>C++</language>
    <birth>December 30, 1950</birth>
    <country>Denmark</country>
    <profession>Computer Scientist</profession>
    <website>https://www.stroustrup.com/</website>
  </programmer>
  <programmer>
    <name>Dennis Ritchie</name>
    <language>C</language>
    <birth>September 9, 1941</birth>
    <country>USA</country>
    <profession>Physicist, Mathematical and BCS</profession>
    <website>https://web.archive.org/</website>
  </programmer>
  <programmer>
    <name>Brian Kernighan</name>
    <language>AWK</language>
    <birth>January 1, 1942</birth>
    <country>Canada</country>
    <profession>Computer Scientist, Engineer and Professor</profession>
    <website>https://www.cs.princeton.edu/~bwk/</website>
  </programmer>
</data>
{% endhighlight %}

E para ler esse XML vamos usar esse código: `vim main.cpp`

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


{% highlight cpp %}
#include <iostream>
#include <expat.h>
#include <cstring> // strlen
 
void start(void *userData, const char *name, const char *args[]){
   std::cout << name << ": ";
}
 
void value(void *userData, const char *val, int len){
   int I;
   char cpy[128] = {};
   
   for(I = 0; I < len; I++){
      cpy[I] = val[I];
   }

   cpy[I] = 0;
   
   std::cout << cpy;
}
 
void end(void *userData, const char *name){}
 
int main(){
   XML_Parser parser = XML_ParserCreate(NULL);
 
   XML_SetElementHandler(parser, start, end);
   
   XML_SetCharacterDataHandler(parser, value);
   
   char val[1024] = {};
   FILE *fh = fopen("programmers.xml", "r");

   fread(&val, sizeof(char), 1024, fh);
   fclose( fh );

   XML_Parse(parser, val, strlen( val ), XML_TRUE);
   XML_ParserFree(parser);
   
   return 0;
}

{% endhighlight %}

Para compilar rode o comando:
{% highlight bash %}
g++ main.cpp -lexpat -o parser
{% endhighlight %}

Agora é só rodar o `./parser` e notar que as tags são exibidas pela função `start(void *userData, const char *name, const char *args[])` mais precisamente pela variável `name`.

E o conteúdo das tags pela `value(void *userData, const char *val, int len)` mais precisamente pela variável `cpy`. A função end não possui conteúdo, pois ela servirá para usarmos no `XML_SetElementHandler`, como dito acima.

Tente modificar, exibir em tabelas e outros como prática de exercício, ok?!

---

Por hoje é só, são pequenas doses diárias que farão sempre nos manter antenado com o [C++](https://terminalroot.com.br/cpp/) !

## Acompanhe o [cpp::daily](https://terminalroot.com.br/tags#cppdaily)

# Deseja aprender [C++](https://terminalroot.com.br/cpp/) e criar seus programas Gráficos e para Terminal com portabilidade para Linux e Windows?
Então se inscreva nos nossos [Cursos de C++ Moderno](https://terminalroot.com.br/cpp/) . Você aprender criar:
- [Games](https://terminalroot.com.br/tags#games)
- [Ncurses](https://terminalroot.com.br/2021/02/crie-programas-graficos-no-terminal-com-cpp-e-ncurses.html)
- Interface Gráfica: [GTK+](https://terminalroot.com.br/2020/08/anjuta-o-melhor-ide-para-c-com-gtkmm.html) e [Qt](https://terminalroot.com.br/2021/02/gerencie-suas-contas-financeiras-pessoais-com-terminal-finances.html)
- Acesso à Banco de Dados([MySQL](https://terminalroot.com.br/mysql/) e SQLite) via [C++](https://terminalroot.com.br/cpp/)
- Padronização
- E muito mais!

Acesse o endereço:
# <https://terminalroot.com.br/cpp/> e saiba mais!

---

### Links Úteis
+ <https://www.xml.com/pub/1999/09/expat/index.html>
+ <https://libexpat.github.io/doc/expat-internals-a-simple-parse/>
+ <https://www.xml.com/pub/a/1999/11/cplus/index.html>
+ <https://techybook.in/c-cpp-xml-parsing-using-expat/>
+ <https://stackoverflow.com/questions/27672815/parsing-xml-file-with-expat-library-in-c>


