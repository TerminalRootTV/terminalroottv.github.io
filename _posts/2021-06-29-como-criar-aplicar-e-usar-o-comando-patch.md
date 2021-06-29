---
layout: post
title: "Como Criar, Aplicar e Usar o comando patch"
date: 2021-06-29 00:05:15
image: '/assets/img/comandos/patch.jpg'
description: 'Uma maneira fácil de adicionar recursos adicionais.'
icon: 'ion:terminal-sharp'
iconname: 'Comandos'
tags:
- comandos
---

![Como Criar, Aplicar e Usar o comando patch](/assets/img/comandos/patch.jpg)

# Conceito
> [Segundo a wikipedia](https://en.wikipedia.org/wiki/Patch_(computing)):
Um patch (termo da língua inglesa que significa, literalmente, "remendo") é um programa de computador criado para atualizar ou corrigir um software de forma a melhorar sua usabilidade ou performance. Quando patches corrigem bugs ou vulnerabilidades de segurança, se dá o nome de bugfix.

Esta técnica pode ser utilizada como uma das formas de distribuir uma liberação de software. É muito utilizada em jogos para computadores de forma a atualizar o conteúdo disponível.

> O comando `patch` [UNIX](https://en.wikipedia.org/wiki/Patch_(Unix)):
Uma patch (Unix) é um programa de computador do sistema operacional UNIX que aplica as diferenças textuais entre dois programas e, mais freqüentemente, a arquivos de computador contendo essas diferenças, ou arquivos diff.

> De acordo com o [manual](https://man7.org/linux/man-pages/man1/patch.1.html):
patch pega um arquivo de "patch": `patchfile` contendo uma diferença lista produzida pelo programa diff e aplica aqueles diferenças em um ou mais arquivos originais, produzindo versões.

Normalmente, as versões corrigidas são colocadas no lugar do original. 

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

# Sintaxe
{% highlight bash %}
patch [arquivo que você deseja aplicar o patch] [o patch]
{% endhighlight %}

# Exemplo prático
Suponhamos que você tenha o seguinte arquivo em [C++](https://terminalroot.com.br/cpp):

> `vim hello.cpp`
{% highlight cpp %}
#include <iostream>

int main( int argc , char **argv ){
  std::cout << "Olá, Mundo!" << '\n';
  return 0;
}
{% endhighlight %}

E então, você cria um novo baseado nele e altera algumas coisas:
{% highlight bash %}
cp hello.cpp new_hello.cpp
{% endhighlight %}

> `vim new_hello.cpp`
{% highlight cpp %}
#include <iostream>

int main( int argc , char **argv ){
  std::cout << "Olá, Mundo!" << '\n';
  std::cout << "Êta mundo bom de acabar ..." << '\n';
  return 0;
}
{% endhighlight %}

Quando você rodar o comando [diff](https://terminalroot.com.br/2020/09/conheca-o-meld-um-diff-mais-facil-de-visualizar.html) com a parâmetro `-u` você e gera o um arquivo de patch: `file.patch`:

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


{% highlight bash %}
diff -u hello.cpp new_hello.cpp > file.patch
{% endhighlight %}

E então o conteúdo de `file.patch` terá o seguinte código:

{% highlight patch %}
--- hello.cpp	2021-06-29 00:01:27.329937847 -0300
+++ new_hello.cpp	2021-06-29 00:02:08.281947880 -0300
@@ -2,6 +2,7 @@
 
 int main( int argc , char **argv ){
   std::cout << "Olá, Mundo!" << '\n';
+  std::cout << "Êta mundo bom de acabar ..." << '\n';
   return 0;
 }
{% endhighlight %}

Apesar desse exemplo ser básico e poder alterar a linha manulamente, na maioria dos casos em projetos maiores, seria muito trabalho.

Logo, para aplicar o patch, como vimos na **Sintaxe** dele acima, basta rodar o comando `patch`:

{% highlight bash %}
patch hello.cpp file.patch
{% endhighlight %}

E se você for ver o conteúdo de `hello.cpp` agora perceberá que está idêntico ao do `new_hello.cpp`.

Fácil, né? Lógico que ainda há muitaaaas opções e vale à pela dar uma olhada no manual e no help:
{% highlight bash %}
patch --help
man patch
{% endhighlight %}

### Veja também
#### [Comando cp com Barra de Progresso](https://terminalroot.com.br/2021/04/comando-cp-com-barra-de-progresso.html)
> Só aplicando um **patch**.



