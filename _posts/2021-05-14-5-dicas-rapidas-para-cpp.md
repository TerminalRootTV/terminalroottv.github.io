---
layout: post
title: "5 Dicas rápidas para C++"
date: 2021-05-14 14:32:39
image: '/assets/img/cpp/cpp-five-tips.jpg'
description: 'Mini guia de consulta rápida!'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cppdaily
---

![5 Dicas rápidas para C++](/assets/img/cpp/cpp-five-tips.jpg)

No [cpp::daily](https://terminalroot.com.br/tags#cppdaily) de hoje vamos falar de assuntos corriqueiros que nos tomam tempo pesquisando na internet e muitas vezes encontramos soluções não tão boas para o que desejamos!

São 5 dicas, mas provavelmente teremos outras partes!

---

# 01. Imprimir o tipo de variável
Para saber qual o tipo de variável basta incluir o cabeçalho `#include <typeinfo>` usar o `tydeid( var ).name()`, exemplo:

{% highlight cpp %}
#include <iostream>
#include <typeinfo>

int main(){
  auto a = 12;
  auto b = true;
  auto c = 'M';
  auto d = 3.14;
  std::cout << "Inteiro: " << typeid(a).name() << '\n';
  std::cout << "Bool: " << typeid(b).name() << '\n';
  std::cout << "Char: " << typeid(c).name() << '\n';
  std::cout << "Double: " << typeid(d).name() << '\n';
  return 0;
}
{% endhighlight %}
> Lembrando que a saída será a inicial do nome do tipo, para esse exemplo ficará: `i` de **i**nt, `d` de **d**ouble e assim por diante . Para alguns outros tipos você precisará filtrar a informação de saída. 

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

# 02. Obter a resolução da sua tela
Sabemos obter isso via linha de comando, mas para usar 100% [C++](https://terminalroot.com.br/cpp) basta incluir a lib `#include <X11/Xlib.h>`, nesse exemplo para [X.org](https://x.org)

{% highlight cpp %}
#include <iostream>
#include <X11/Xlib.h>

int main(){
  Display * d = XOpenDisplay(NULL);
  Screen *  s = DefaultScreenOfDisplay(d);
  std::cout << "Altura/Height da resolução: " << s->height << '\n';
  std::cout << "Largura/Width da resolução: " << s->width << '\n';
  return 0;
}
{% endhighlight %}
> Para compilar: `g++ resolucao.cpp -lX11`

---

# 03. Converter string para char
Se você pesquisar isso no [Google](https://google.com/) vai ver muita solução complexa que vale aquele meme do [Khaby Lame](https://twitter.com/KhabyLame/header_photo) .

Mas isso pode ser feito de uma maneira bem simples:

{% highlight cpp %}
std::string str = {"Lorem Ipsum"};
char * chr = &str[0];
std::cout << "A string str agora é char: " << chr << '\n';
{% endhighlight %}

---

# 04. Convertendo string para inteiros
Falando em converter, para converter tipos inteiros para string basta usar a própria STL, isso é muito útil quando estamos desenvolvendo aplicativos gráficos. Exemplos:

{% highlight cpp %}
#include <iostream>

int main() {
  std::string str = {"30"};
  std::cout << "Para int: " << std::stoi( str ) + 6 << '\n';
  std::cout << "Para float: " << std::stof( str ) + 1.4f << '\n';
  std::cout << "Para double: " << std::stod( str ) + 1.89 << '\n';
  std::cout << "Para long int: " << std::stol( str ) * 273 << '\n';
  std::cout << "Para long long: " << std::stoll( str ) * 3500 << '\n';
  std::cout << "Para long double: " << std::stold( str ) * 189.53254 << '\n';
  return 0;
}
{% endhighlight %}


---

# 05. Removendo espaços em branco de uma string
A gente sabe quem muitas [linguagens de programação](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html) possuem as funções `ltrim()`(remove espaços em branco da esquerda/início), `rtrim()`(remove espaços em branco da direita/fim) e `trim()`(remove espaços em branco da esquerda/início e da direita/fim) .

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


Se nós usarmos aquela solução *default* do `algorithm` , provavelmente iremos remover não somente da esquerda e da direita como entre as letras/caracteres também, exemplo:

{% highlight cpp %}
#include <iostream>
#include <algorithm>

int main(){
  std::string str = " texto com espaços em branco ";
  str.erase(remove(str.begin(), str.end(), ' '), str.end());
  std::cout << "'" << str << "'" << '\n';
  return 0;
}
{% endhighlight %}
> A saída será: `'textocomespaçosembranco'`

Então para remover estilo `trim()` seria:

{% highlight cpp %}
#include <iostream>
#include <algorithm>

int main() {
    std::string str = " texto com espaços em branco ";
    str.erase(str.begin()); // remove no início(esquerda)
    str.erase(str.end() -  1); // remove no fim(direita)
    std::cout << "'" << str << "'" << '\n';
    return 0;
}
{% endhighlight %}
> A saída será: `'texto com espaços em branco'`

Bem, melhor, né?!

---

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

# Links Úteis
+ <https://stackoverflow.com/questions/81870/is-it-possible-to-print-a-variables-type-in-standard-c>
+ <https://stackoverflow.com/questions/25849045/screen-resolution-in-c-for-linux>
+ <https://stackoverflow.com/questions/5590381/easiest-way-to-convert-int-to-string-in-c>
+ <https://pt.stackoverflow.com/questions/90623/retirar-espa%c3%a7os-em-branco-de-uma-string?atw=1>
+ <https://stackoverflow.com/questions/5590381/easiest-way-to-convert-int-to-string-in-c>


