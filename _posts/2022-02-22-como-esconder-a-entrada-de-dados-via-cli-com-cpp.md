---
layout: post
title: "Como esconder a entrada de dados via CLI com C++"
date: 2022-02-22 09:42:01
image: '/assets/img/cppdaily/cli-cpp.jpg'
description: 'Tanto exibindo vazio quanto exibindo asteriscos durante a digitação do usuário.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

<b style="font-size:24px;">M</b>uitas vezes estamos desenvolvendo uma aplicação que interage com usuário solicitando a senha e se ele estiver fazendo isso com a presença de alguém ou gravando um vídeo, a senha irá aparecer.

Na maioria dos sistemas tipo [UNIX](https://terminalroot.com.br/tags#unix) isso já é escondido por padrão. Então vamos ver como fazer isso com [C++](https://terminalroot.com.br/cpp) .

---

# Escondendo a senha
Para isso vamos precisar incluir os seguintes cabeçalhos:
{% highlight cpp %}
#include <iostream> // Para usar 'std::cout' e 'std::cin'
#include <termios.h> // Para usar 'termios' e 'tcsetattr'
#include <unistd.h> // Para usar 'STDIN_FILENO'
{% endhighlight %}

A `iostream` já é conhecida e comumente utilizada por nós. 

Já a `termios.h` é uma biblioteca que contém as definições usadas pelas interfaces de E/S do [terminal](https://terminalroot.com.br/tags#terminal) , será com ela que iremos esconder o digitado.

E o `unistd.h` é uma biblioteca que fornece acesso à API do sistema operacional POSIX e torna compatível com qualquer [sistema operacional](https://terminalroot.com.br/tags#so) e [compilador](https://terminalroot.com.br/tags#gcc).

Após adicionar os cabeçalhos, basta:
+ Instanciar o `termios`
+ Obter os dados do terminal e guardar em uma variável com a função `tcgetattr()`
+ Criar uma nova instância do `termios`, mas dessa vez para replicarmos os dados da instância anterior para podermos alterar
+ Esconder os dados digitados e passando para a nova instância com a função `tcsetattr()` após estabelecer a regra: `newt.c_lflag &= ~ECHO;`
+ Interagir e obter os dados digitados pelo usuário com `std::cout`, `getline()` e `std::cin`, armazenando em uma variável pré declarada
+ E por final retornar a exibição dos dados após finalizar o programa também com `tcsetattr`, mas para devolvermos à instância inicial.
> Além disso no código adicionamos a exibição dos dados(na mesma linha com `\r`) digitados só por questões didáticas.


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

O código em resumo fica assim

> `vim hidden.cpp`
{% highlight cpp %}
#include <iostream>
#include <termios.h>
#include <unistd.h>

int main(int argc, char ** argv){
    termios oldt;
    tcgetattr(STDIN_FILENO, &oldt);
    termios newt = oldt;
    newt.c_lflag &= ~ECHO;
    tcsetattr(STDIN_FILENO, TCSANOW, &newt); // esconde

    std::string s;
    std::cout << "Informe sua senha: ";
    getline(std::cin, s);

    std::cout << "\rSua senha é: " << s << '\n';
    tcsetattr(STDIN_FILENO, TCSANOW, &oldt); // retorna à exibir
    return EXIT_SUCCESS;
}
{% endhighlight %}
> Compile e rode: `g++ hidden.cpp && ./a.out`

Exemplo:
> Esconde input, mostra senha.

<img src="/assets/img/cppdaily/webp/1-vazio-mostra-pt-br.webp" loading="lazy" alt="Esconde input, mostra senha">

---

Se durante o `std::cout` opcional você ainda quiser trocar a `std::string` por asteriscos(`*`), adicione esse trecho ao seu código:
{% highlight cpp %}
std::string n{};
for (int i{}; i < s.length(); ++i){
  n += "*";
}
std::cout << "\rSua senha é: " << n << '\n'; // exiba agora 'n' em vez de 's'
{% endhighlight %}
> Aparecerá: `Sua senha é: ************` .

Exemplo:
> Esconde input, mostra asteriscos.

<img src="/assets/img/cppdaily/webp/2-vazio-aster-pt-br.webp" loading="lazy" alt="Esconde input, mostra asteriscos">

---

Podemos notar que o comando no terminal `stty -echo`(para esconder os dados digitados no terminal) e `stty echo` para retornar a exibição faz a mesma coisa. Nota-se que o programa/comando `stty` faz uso da biblioteca `termios.h`.

---

# Exibindo asteriscos em vez de vazio ou letras
Eu vejo muita gente fazendo essa pergunta no [StackOverflow](https://stackoverflow.com/) e sinceramente nunca vi uma solução eficaz que realmente resolva do jeito que a pessoa deseja, nem usando a biblioteca `curses.h`(Observação, `curses.h`, compila também com: `-lcurses -ltinfo`, não é [NCURSES](https://terminalroot.com.br/ncurses)) .

Então, eu criei uma forma que resolve isso de maneira simples, utilizando `do while`, excluindo o `getline()` e utilizando `getchar()` no lugar:
> Só que a mágica está na linha: `newt.c_lflag &= 'a';`, eu troquei o `~ECHO` por qualquer letra/caractere, nesse o `'a'`.

{% highlight cpp %}
#include <iostream>
#include <termios.h>
#include <unistd.h>

int main(int argc, char ** argv){
    termios oldt;
    tcgetattr(STDIN_FILENO, &oldt);
    termios newt = oldt;
    newt.c_lflag &= 'a'; // removi o ~ECHO
    tcsetattr(STDIN_FILENO, TCSANOW, &newt); // esconde

    std::string s{}, current{};
    char c{};
    std::cout << "Informe sua senha: ";
    do {
      std::cout << current;
      s += c;
      current = "*";
    }while((c = getchar()) != '\n' && c != EOF);

    std::cout << "\rSua senha é: " << s << 
    "                                     " << '\n';
    tcsetattr(STDIN_FILENO, TCSANOW, &oldt); // retorna à exibir
    return EXIT_SUCCESS;
}
{% endhighlight %}
> Aparecerá: `Informe sua senha: ************`, ou seja, asteriscos em vez de vazio.

Exemplo:
> Input asteriscos, mostra senha.

<img src="/assets/img/cppdaily/webp/3-asterisco-pt-br.webp" loading="lazy" alt="Input, mostra senha">

---

## Aprenda [C++](https://terminalroot.com.br/cpp): 
# <https://terminalroot.com.br/cpp>

---

# Links úteis
+ <https://pubs.opengroup.org/onlinepubs/7908799/xsh/termios.h.html>
+ <https://en.wikipedia.org/wiki/Unistd.h>
+ <https://pubs.opengroup.org/onlinepubs/7908799/xsh/unistd.h.html>
+ <https://en.wikipedia.org/wiki/POSIX_terminal_interface>

