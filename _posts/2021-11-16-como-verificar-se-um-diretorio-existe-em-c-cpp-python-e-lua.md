---
layout: post
title: "Como verificar se um diretório existe em: C, C++, Python e Lua"
date: 2021-11-16 08:49:52
image: '/assets/img/programacao/dir-exists.jpg'
description: 'E de bônus vamos ver o quão fácil é em outra linguagem de programação.'
icon: 'ion:terminal-sharp'
iconname: 'Programação'
tags:
- linguagemc
- cpp
- lua
- python
---

![Como verificar se um diretório existe em: C, C++, Python e Lua](/assets/img/programacao/dir-exists.jpg)

Vamos criar algumas postagens nesse sentido para notarmos e aprendermos sobre diferentes formas que cada [linguagem de programação](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html) usa para fazer a mesma coisa.

Para isso precisamos obter o diretório do usuário dinamicamente para que diversos usuários possam testar somente copiando e colando o código e rodando independente do local que estiver.

---

# [Lua](https://terminalroot.com.br/lua)
Em Lua vamos importar o **lfs** para tornar mais fácil essa verificação. Eis o código:
> `nvim dir-exists.lua`

{% highlight lua %}
require("lfs")
require("os")

function exists(path)
  if (lfs.attributes(path, "mode") == "directory") then
    return true
  end
  return false
end

home = os.getenv("HOME") .. "/"

if exists(home .. "Downloads") then
  print("Existe!")
else 
  print("Não existe.")
end
{% endhighlight %}


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

# [C++](https://terminalroot.com.br/cpp)
Em **C++** vamos utilizar a biblioteca **filesystem** e compilar com **C++17**, apesar de que ele já é padrão em todos os sistemas que estão atualizados.
> `nvim dir-exists.cpp`

{% highlight cpp %}
#include <iostream>
#include <filesystem>
#include <cstdlib>

bool exists( std::string path){
  return std::filesystem::exists( path );
}

int main(){
  std::string home = getenv("HOME");
  home = home + "/";
  std::cout << (exists(home + "Downloads") ? "Existe!" : "Não existe.") << '\n';
  return 0;
}
{% endhighlight %}

---

# [Linguagem C](https://terminalroot.com.br/tags#linguagemc)
No **C** do mesmo jeito que usamos [FILE * file](https://terminalroot.com.br/2014/12/linguagem-c-utilizando-as-funcoes-fopen.html) para manipularmos arquivos, existe o `DIR * dir` para diretórios, mas precisamos incluir a biblioteca `dirent.h` .

Outra coisa é que o tipo `bool` não é nativo do [C](https://terminalroot.com.br/tags#linguagemc), logo, precisamos também incluir `stdbool.h` e também:
+ `stdlib.h` - Que é a `cstdlib` usada pelo [C++](https://terminalroot.com.br/cpp) .
+ `string.h` - Para usarmos o `strcat` sem *warning* para concatenarmos *string* sem precisar alocar memória com `malloc`.

> Observação: Na função do tipo `bool` tive que fazer `if .. else` porque precisamos fechar o diretório: `closedir()` então só retornar não iria ser tão óbvio.
> 
> `nvim dir-exists.c`

{% highlight c %}
#include <stdio.h>
#include <dirent.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

bool exists( const char * home ){
  DIR * path = opendir( home ); 
  if( path ){
    closedir( path );
    return true;
  }else{
    return false;
  }
}

int main(){
  char * home = getenv("HOME");
  const char * dir = "/Downloads";
  strcat(home,dir);
  exists( home ) ? printf("Existe!\n") : printf("Não existe.\n");
  return 0;
}
{% endhighlight %}
> Compile: `gcc dir-exists.c && ./a.out`

---

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

# [Python](https://terminalroot.com.br/tags#python)
Em **Python** talvez seja a forma mais fácil, só perde para o [BASH](https://terminalroot.com.br/shell) .
> `nvim dir-exists.py`

{% highlight python %}
import os

def dir_exists(path):
  return os.path.isdir(path)

home = os.path.expanduser('~') + "/"

if dir_exists( home + "Downloads" ):
    print("Existe!")
else:
    print("Não existe.")
{% endhighlight %}
> `python dir-exists.py`

---

Simples, né?! E por falar em simplicidade, só por curiosidade em [Shell Script](https://terminalroot.com.br/shell) é assim:
> `nvim dir-exists.sh`

{% highlight bash %}
#!/bin/bash
[[ -d $HOME"/Downloads" ]] && \
  echo "Existe!" || echo "Não existe."
{% endhighlight %}

Moleza, né?!

Se inscrevam no [newsletter](https://terminalroot.com.br/newsletter), vamos ter mais artigos nesse sentido de "*comparativo*" que ficam mais fácil de ir pegando "*as manha*".

Falou!!!
