---
layout: post
title: "Como Converter para Maiúsculas as letras com acentos em C e C++"
date: 2021-08-31 08:54:49
image: '/assets/img/c/c-cpp-toupper-accents.jpg'
description: "Melhor do que conversões que só dão 'falha de segmentação' na cabeça dos iniciantes."
icon: 'ion:terminal-sharp'
iconname: 'C/C++'
tags:
- linguagemc
- cpp
---

![Como Converter para Maiúsculas as letras com acentos em C e C++](/assets/img/c/c-cpp-toupper-accents.jpg)

Alguns programadores [C](https://terminalroot.com.br/tags#linguagemc) e [C++](https://terminalroot.com.br/cpp) vivem um *drama* quando o assunto é ler e imprimir letras acentuadas e principalmente quando precisam converter de minúsculas para MAIÚSCULAS ou vice-versa.

Isso porque as letras acentuadas não fazem parte da tabela [ASCII](https://pt.wikipedia.org/wiki/ASCII) e sim são como um [UNICODE](https://en.wikipedia.org/wiki/Unicode), ou seja, apesar de haver acentos na tabela ASCII , um letra acentuada são 2 endereços e não somente 1, algumas até 4, e é aí que entra o problema.

# Linguagem [C](https://terminalroot.com.br/tags#linguagemc)
Suponhamos que você tem esse código em **C** , um mini programinha que lê os dados informados pelo usuário, converte em MAIÚSCULAS e imprime na tela:


<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


{% highlight c %}
#include <stdio.h>
#include <ctype.h>
#include <string.h>
#define TAM 35

int main (int argc, char ** argv){
  // declara a variável que armazenará o nome
  char nome[TAM];

  // Interage com o usuário
  printf("Informe o nome: ");
  
  // limpa a entrada e lê a entrada dos dados digitados
  fflush(stdin);
  fgets(nome, TAM, stdin);

  for (size_t i = 0; i < strlen(nome); ++i) {
    // Convertemos cada caractere para maiúsculo
    nome[i] = toupper( nome[i] );

    // e imprimimos na tela
    printf("%c", nome[i]);
  }

  return 0;
}
{% endhighlight %}

Até aí tudo bem, mas tente inserir um nome com acento, vai aparecer assim, ex.: *JOSé SILVA*, a letra **é** possui acento e não ficou em MAIÚSCULA! 😞 

![Saída dos dados](/assets/img/c/saida-c-char.png)

Mas podemos resolver isso. Primeiro, lembre-se desses detalhes antes de iniciar um projeto. Se você sabe que seu programa terá dados inseridos pelo usuário e eles podem ser de qualquer lugar do mundo, logo, você deve utilizar as ferramentas corretas.

Para isso vamos incluir os cabeçalhos:
+ `#include <wchar.h>` para usarmos o tipo `wchar_t`(substitui o `char`), `fgetws`(substitui o `´fgets`), `wcslen`(substitui `strlen`) e `wint_t`(substitui o `int`);
+ `#include <locale.h>` para usarmos a função: `setlocale`, o locale pode ser vazio, mas se você quiser especificar, use: `pt_BR.UTF-8`, mas isso limita seu código;
+ `#include <wctype.h>`  para `towupper` substitui o `toupper` da `ctype.h`.

Logo, nosso código final ficaria:

{% highlight c %}
#include <stdio.h>
#include <wchar.h>
#include <locale.h>
#include <wctype.h>
#define TAM 100

int main( int argc , char **argv ){
  // usamos o setlocale LC_ALL vazio(para todos)
  setlocale(LC_ALL, "");

  wchar_t nome[TAM];
  printf("Informe o nome: ");
  fflush(stdin);
  fgetws(nome, TAM, stdin);

  for (size_t i = 0; i < wcslen(nome); i++) {
    nome[i] = towupper(nome[i]);
    printf("%lc", (wint_t)nome[i]);
  }

  return 0;
}
{% endhighlight %}

Após compilar e testar o resultado é que agora conseguimos converter para MAIÚSCULAS as letras acentudas:

![Saída dos dados](/assets/img/c/saida-c-wchar-t.png)

Show, né?! Tudo é uma questão de planejamento! 😃 


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

---

# E no [C++](https://terminalroot.com.br/cpp) ?
Bom, nós sabemos que basta você copiar o arquivo de extensão `.c` para `.cpp` ou qualquer outra extensão [C++](https://terminalroot.com.br/cpp) já funciona, exemplo:
{% highlight bash %}
cp main.c main.cpp
{% endhighlight %}
> Nesse caso específico nem renomear precisaria, lembrando que o inverso nem sempre pode ser verdadeiro! 😎

Mas escrever um arquivo C++ no estilo C é DESELEGANTE!!!

Logo, poderíamos portar nosso código para o C++ e ficaria assim:
> Perceba que eu usei `std::wcout` em vez de ~~`std::cout`~~ apesar de ser só uma linha de interação com o usuário, ela também é FUNDAMENTAL!!!

{% highlight cpp %}
#include <iostream> // std::wcout
#include <cwchar>   // wchar_t, fgetws, wcslen, wint_t
#include <clocale>  // setlocale
#include <cwctype>  // towupper

int main( int argc , char **argv ){
  unsigned const int tam {100};
  setlocale(LC_ALL, "");
  wchar_t nome[tam];

  std::wcout << "Informe o texto: ";
  fflush(stdin);
  fgetws(nome, tam, stdin);

  for (size_t i = 0; i < wcslen(nome); ++i) {
    nome[i] = towupper(nome[i]);
    std::wcout << nome[i];
  }

  return 0;
}
{% endhighlight %}

![Saída dos dados](/assets/img/c/saida-cpp-wchar-t.png)

Apesar disso ser funcional nós sabemos que [C++](https://terminalroot.com.br/cpp) é um *superset*(super conjunto) do C, mas possui suas próprias soluções e essas não funcionam no C.

Logo, poderíamos utilizar as seguintes ferramentas do C++:
+ `std::locale::global`
+ `std::wcout.imbue()`
+ `std::use_facet<std::ctype<wchar_t>>(std::locale())`
+ `std::wstring`
+ `std::wcin`

Nosso código com soluções nativas do C++ ficaria assim:

{% highlight cpp %}
#include <iostream>
#include <locale>

int main(){
  std::locale::global(std::locale(""));
  std::wcout.imbue(std::locale());
  auto& f = std::use_facet<std::ctype<wchar_t>>(std::locale());

  std::wstring frase;
  std::wcout << "Informe o texto: ";
  std::getline(std::wcin, frase);

  f.toupper(&frase[0], &frase[0] + frase.size());
  std::wcout << frase << '\n';

  return 0;
}
{% endhighlight %}

![Saída dos dados](/assets/img/c/cpp-toupper.png)


Muito mais **Like a BOSS!**, né não?! 😃 

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
Referências:
+ <https://stackoverflow.com/questions/17991431/convert-a-unicode-string-in-c-to-upper-case>
+ <https://stackoverflow.com/questions/735204/convert-a-string-in-c-to-upper-case>
+ <https://stackoverflow.com/questions/41522381/special-characters-wcin-and-getline-strange-behaviour>
