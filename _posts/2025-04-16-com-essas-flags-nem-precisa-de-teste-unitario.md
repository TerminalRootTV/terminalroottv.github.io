---
layout: post
title: "Com Essas Flags nem precisa de Teste Unitário"
date: 2025-04-16 13:13:47
image: '/assets/img/terlang/debug.jpg'
description: "🚀 A chance de seu software ter algum tipo de problema é quase zero."
icon: 'ion:terminal-sharp'
iconname: 'C/C++'
tags:
- cpp
- cppdaily
- linguagemc
- gcc
- clang
- compiladores
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Nós já [publicamos uma vez sobre flags para GCC/Clang](https://terminalroot.com.br/2023/08/10-dicas-de-flags-e-parametros-para-gnu-gcc.html) que fala sobre as flags fundamentais para construção de software que são:
{% highlight bash %}
g -Wpedantic -Wall -Werror -Wextra -fsanitize=address
{% endhighlight %}

No entanto, apesar delas já ajudarem bastante, você ainda pode melhorar seu código com [Analisadores Estáticos](https://terminalroot.com.br/2023/04/como-fazer-analise-estatica-de-c-cpp-com-cppcheck.html) e também flags para verificar conversões e entre outros posíveis bugs.

Um compilador ideal para isso é o [clang++](https://terminalroot.com.br/tags#clang), pois exibe mais *warnings* que o [g++](https://terminalroot.com.br/tags#gcc).

Que são elas:
### Recomendadas para debug:
{% highlight bash %}
-g -O0                         # Debug info + sem otimizações (mais legível)
-fno-omit-frame-pointer        # Melhor para stack traces e debuggers
{% endhighlight %}

### Warnings úteis:
{% highlight bash %}
-Wconversion                   # Converte implícitos perigosos (int → float, etc)
-Wsign-conversion              # Converte entre signed/unsigned
-Wnull-dereference             # Detecta uso de ponteiros nulos
-Wdouble-promotion             # Detecta promoções implícitas para double
-Wformat=2                     # Verifica printf/scanf com mais rigor
-Wcast-align                   # Avisa casts com possível problema de alinhamento
{% endhighlight %}

Além de:
### Sanitizers complementares:
{% highlight bash %}
-fsanitize=undefined           # UB: overflows, null deref, shift inválido, etc
-fsanitize=leak                # Detecta memory leaks
{% endhighlight %}

Além também da `-Wshadow` e da `-Wfloat-conversion`.

**Obs:** Use `-O1` se quiser um pouco de otimização sem perder muito a clareza no debug.


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

Eu as utilizei em conjunto para debug a [Terlang](https://github.com/terroo/terlang) e após compilar com essas flags obtive diversos `Warnings` que foram transformados em erros, abaixo a imagem no momento da compilação:

![alt text](/assets/img/terlang/err-ter-1.png) 

Eu use o arquivo [debug.ter](https://github.com/terroo/terlang/blob/main/debug.ter) e resolvi todos esses erros/Warnings de acordo com [esse commit](https://github.com/terroo/terlang/commit/e55176696164ada480a36024500c7735440badd3), mas nesse commit também há outras modificação e implementações adicionais.

Em resumo em criei um arqivo `debug.ter` com todas flags, ex.:

{% highlight cpp %}
/*
  TER/TERLANG
  By: Marcos Oliveira
*/

// Defs
auto compiler = "clang++ -stdlib=libc++ -O0 -fno-omit-frame-pointer -Wfloat-conversion"
auto add_flags = "-Wsign-conversion -Wnull-dereference -Wdouble-promotion -Wformat=2 -Wcast-align -Wconversion"
auto sanitize = " -fsanitize=address -fsanitize=undefined -fsanitize=leak"
auto flags = "-g -Wall -Werror -Wextra -Wshadow -Wpedantic"
auto build = compiler + " " + add_flags + " " + sanitize + " " + " " + flags + " ./src/*.cpp"

// Display full command
output(build)
exec(build)
{% endhighlight %}

Então, quando estiver em *modo desenvolvimento* recomendo compilar com todas essa flags, no entanto, quando for para *release* o ideal é retirar todas, pois elas comprometem o desempenho e aumentam significamente o tamanho do binário.



