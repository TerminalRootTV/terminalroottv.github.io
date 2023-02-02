---
layout: post
title: "3 Dicas C++ que você provavelmente não sabia"
date: 2023-02-02 13:44:33
image: '/assets/img/shorts/dicas-cpp.jpg'
description: 'Disponível também no #shorts e Tik Tok!'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Salve, rapaziada! Eu crie um vídeo de 1 minuto para o [Youtube #Shorts](https://www.youtube.com/@TerminalRootTV/shorts) e [Tik Tok](https://www.tiktok.com/@terminalroot/) .

E decidi postar aqui também no blog de forma escrita para facilitar ainda mais o acesso ao conteúdo.

Vamos conhecer **3 Dicas de C++ que você provavelmente não sabia**!

---

# 1. Você pode escrever a `main` de forma mais moderna!

A partir do C++11 foi implementada a declaração `auto` que remete ao fato de uma variável obter o tipo de forma automática desde que seja imediatamente inicializada.

E você pode usar isso também em funções bem como na função `main()` em conjunto com a sintaxe traço sinal de maior `->` e informar o tipo.

Sua função main pode ser escrita assim: `auto main() -> int {}`:

{% highlight cpp %}
#include <iostream>

auto main() -> int {
  auto num = 42;
  auto str = "Oi";
  const auto pi = 3.14; 
  return 0;
}
{% endhighlight %}

Agora que você já sabe, acho que vale à pena usar essa sintaxe para seu código ficar com cara de mais modernindade! :)

---

# 2. Os nomes do argumentos da `main` são de sua escolha!
Os argumentos da função main devem ser um do tipo `int` e o outro um ponteiro de ponteiro do tipo `char`.

E sempre que usamos escolhemos os nomes `argc` para o tipo int e o nome `argv` para o array.

Mas isso não é uma regra, você pode escolher os nomes que bem entender. Caso você queira sair do convencional, fique à vontade para usar seus próprios nomes!

{% highlight cpp %}
#include <iostream>

int main( int qtd , char ** params ){
  if( qtd > 1 ){
    for (size_t i {}; i < qtd; ++i) {
     std::cout << "Argumento: " << params[i] << '\n'; 
    }
  }else{
    std::cout << "Informe ao mínimo um parâmetro!\n";
  }
  return 0;
}
{% endhighlight %}

---

# 3. Você não precisa incluir nada para usar o `printf()`
Sempre que você quiser imprimir algo na tela precisa usar o tralha(`#`) e a palavra-chave `include` logo em seguida para incluir bibliotecas como: `<stdio.h>`, `<iostream>` para poder usar o `printf`, correto? Não, errado.

Você pode usar o `printf` sem incluir nada, basta criar uma função com o mesmo nome `printf` dentro de um `extern "C"` que receba um `const char *` como parâmetro e também o parâmetro três pontos `...` e seu código irá imprimir tranquilamente sua string, legal né?  

{% highlight cpp %}
extern "C" {
  int printf(const char *format, ...);
}
  
int main(){
  printf( "Hello World" );
  return 0;
}
{% endhighlight %}

---

Até a próxima!

<!--
E se quiser customizações pode criar MACROS:
{% highlight cpp %}
#include <iostream>
#define show(s) std::cout<<s

int main (int argc, char **argv){
  show("Oi\n"); 
  return 0;
}
{% endhighlight %}
-->

