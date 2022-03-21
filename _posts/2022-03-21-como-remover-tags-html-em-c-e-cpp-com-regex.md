---
layout: post
title: "Como remover tags HTML em C e C++ com RegEx"
date: 2022-03-21 07:40:43
image: '/assets/img/cppdaily/cpp-c-regex.jpg'
description: 'As expressões regulares são uma ótima ferramenta para qualquer linguagem de programação.'
icon: 'ion:terminal-sharp'
iconname: 'C/C++'
tags:
- linguagemc
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Dia desse eu vi na internet um dúvida simples, mas interessante . Alguém postou querendo saber: *"Como remover tags HTML em C?"* .

Rapidamente veio em minha mente [RegEx](https://terminalroot.com.br/regex), mas com [C++](https://terminalroot.com.br/cpp) .

Se você entende de [Expressões Regulares](https://terminalroot.com.br/regex) com [C++](https://terminalroot.com.br/cpp) é realmente muito fácil, basta:
+ Incluir o cabeçalho `<regex>`;
+ Informar o padrão da expressão regular;
+ E por final usar a função `regex_replace()` para substituir pela string deseja.

Em resumo o código é esse:
{% highlight cpp %}
#include <iostream>
#include <regex>

int main(){
  std::string html = "<a href=\"https://terminalroot.com.br/\">Esse é um link</a>";
  std::regex tags("<[^>]*>");
  std::string remove{};
  std::cout << std::regex_replace(html, tags, remove) << '\n';
  return 0;
}
{% endhighlight %}
> Provável saída: `Esse é um link`

Mas, em [Linguagem C](https://terminalroot.com.br/tags#linguagemc) realmente as coisas não são tão fáceis assim.


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

# [Linguagem C](https://terminalroot.com.br/tags#linguagemc)
Você pode usar a `regex.h` em C, mas ela verificará padrões somente, mas a substituição vai ficar por sua conta.

Por exemplo, verificar se determinada *string* há tags nela, podemos usar assim:

{% highlight c %}
#include <stdio.h>
#include <regex.h>

int main(){
  regex_t regex;
  int check_regex = regcomp(&regex, "<[^>]*>", REG_EXTENDED);

  check_regex = regexec(&regex, "<p>Tag</p>", 0, NULL, 0);
  !check_regex ? printf("Tem tags!\n") : printf("Não tem tags.\n");

  regfree(&regex);
  return 0;
}
{% endhighlight %}
> Provável saída: `Tem tags!`

Para mais informações acesse a página de POSIX do manual pelo comando:

{% highlight sh %}
man regex.h
{% endhighlight %}

---

# Removendo TAGS HTML em C
Após você verificar se uma determinada *string* possui *tags*(economiza processamento) o próximo passo é você **remover as tags**.

Eu criei uma soluçao própria(e simples 💡 ) que pode ser contestada pelos *amantes do C*, mas ela funciona 😎 . O código em si é:

+ Incluir os cabeçalhos:
  - `stdio.h` para usar o `printf`;
  - `string.h` para usar o `strlen`;
  - e `stdbool.h` para usar o tipo `bool`
+ Definir uma constante `SIZE` para otimizar o desempenho
+ Criar uma função de retorn `char *` para redefinição . E essa função é o seguinte:
  - Inserí um loop `for` para percorrer a *string* de acordo com a quantidade de caracteres dela;
  - Ela verifica se o caractere de abertura de tag `<` foi identificado na *string*;
  - Se sim, ela torna a variável booleana `tag` como `true`
  - Em seguida concatena o caractere em uma saída temporária de mesmo tamanho: `out[SIZE];`
  - E para continuar adicionando alteramos para `false` somente após identificar o caractere `>` de fechamento de tags.

O código final é:

{% highlight c %}
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#define SIZE 4096

char * remove_tags(char string[]){
  bool tag = false;
  char out[SIZE];
  for(int i = 0; i < strlen(string); i++){
    if( string[i] == '<'){
      tag = true;
    } 
    if(!tag){
      strncat(out, &string[i], 1);
    }
    if(string[i] == '>'){
      tag = false;
    }
  }
  string = out;
  return string;
}

int main(){
  char string[SIZE] = "<a href=\"https://terminalroot.com.br/\">Esse é um link</a>";
  printf("%s\n", remove_tags(string));
  return 0;
}
{% endhighlight %}
> Provável saída: `Esse é um link`

O certo seria alocarmos espaço na heap, pois uma string que contém um documento [HTML](https://terminalroot.com.br/php) pode ser gigante. Mas para fins didáticos, e entender a lógica, tá de bom tamanho.

Até a próxima!


