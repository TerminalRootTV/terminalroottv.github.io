---
layout: post
title: "Porque eu não uso: 'using namespace std;'"
date: 2021-04-21 06:56:36
image: '/assets/img/cppdaily/using-namespace-std.png'
description: 'Não uso e não recomendo usar.'
icon: 'ion:terminal-sharp'
iconname: 'cpp::daily'
tags:
- cppdaily
- cpp
---

![Porque eu não uso: 'using namespace std;'](/assets/img/cppdaily/using-namespace-std.png)

Algumas pessoas gostam sempre de usar e me perguntam porque eu não uso.

Antes de mais nada, utilizar o `using namespace std` é sim uma boa prática, mas não deve ser usada sempre e para tudo .

Eu evito usar por 2 motivos básicos:

## 1º. Gosto de saber de qual biblioteca aquela declaração/função faz parte.
Ás vezes você está utilizando uma biblioteca que tem nome de funções iguais. Por exemplo, suponhamos que você tem esse código com esse namespace:
```cpp
#include <iostream>

using namespace std;
namespace terroo {

  typedef const char * string;

  int abs( const int &num1, const int &num2  ){
    return num1 + num2;
  }

  void print( const string &text ){
    cout << text << '\n';
  }

}

int main(){
  string teste = "Nada";
  terroo::print( teste );
  return 0;
}
```

Nesse exemplo percebemos uma: `string`, `abs`(da `cstdlib`) e `print`, `além do uso de: using namespace std;`, olha que bagunça infeliz!!! 😞  

Quando eu tentar compilar terei um belo erro de:
```sh
error: invalid initialization of reference of type ‘const char const&’ from expression of type ‘std::string’ {aka ‘std::__cxx11::basic_string<char>’}
  void print( const string &text ){
...
```

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


Isso porque o meu *tipo string* é diferente do tipo `string` da resolução de escopo `std` eu usei: `using namespace std;`. Separar por declaração, acho melhor do que usar no geral, ex.: `using std::cout;` , mas mesmo assim, fica um pouco bagunçado!

Se removermos o `using namespace std;` e declarar cada um no seu quadrado, o código compila sem problemas:
```cpp
#include <iostream>

using namespace std;
namespace terroo {

  typedef const char * string;

  int abs( const int &num1, const int &num2  ){
    return num1 + num2;
  }

  void print( const string &text ){
    cout << text << '\n';
  }

}

int main(){
  terroo::string teste = "Nada";
  terroo::print( teste );
  return 0;
}
```
> Mas se `std::string` no lugar de `terroo::string` você nota que há um melhor trabalho do compilador em lhe ajudar.

Ahh!!! Mas quem vai criar nome de funções, classes, structs, ... com nomes que já existem na STL ? Isso é o que mais há.

Nas bibliptecas da [Unreal Engine](https://www.unrealengine.com/en-US/), existe até `vector`, e não é o vector da std .

Sem dizer o exemplo alí do `abs`, já vi muita gente usando nomes de funções que já existem na STL e isso pode dar muita dor de cabeça se o cara sempre usar namespace sem resolução de escopo .

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


## 2º. Eu não sei de onde veio aquilo

Por exemplo, dia desse tava criando um código com [OpenCV](https://opencv.org/) e tem um tipo/classe que é `VideoCapture` e na documentação deles eles utilizam `using namespace cv;`, demorou, mas descobri que o *VideoCapture* na verdade é `cv::VideoCapture` e isso já me aconteceu várias vezes principalmente com a própria `std::` .


Por isso eu não gosto de usar e não recomendo, assim como muitos prograadores que conheço, mas vale ressaltar que isso é uma questão de gosto, ok?!

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



