---
layout: post
title: "Conheça 8 flags para melhorar drasticamente a velocidade do seu software"
date: 2025-03-12 12:12:41
image: '/assets/img/cppdaily/fast.jpg'
description: "🚀 Para softwares criados em C, C++ e até outras linguagens de programação."
icon: 'ion:terminal-sharp'
iconname: 'Compiladores'
tags:
- linguagemc
- cpp
- cppdaily
- gcc
- clang
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Nós já fizemos um [vídeo sobre flags](https://terminalroot.com.br/2023/08/10-dicas-de-flags-e-parametros-para-gnu-gcc.html) que servem tanto para o [GCC](https://terminalroot.com.br/tags#gcc) quanto para o [Clang](https://terminalroot.com.br/tags#clang), no entanto, aquelas dicas tem instruções gerais para compilação.

Nesse artigo vamos especificar mais o objetivo em "tempo de compilação" que influenciam diretamente do desempenho do *binário* tornando a **velocidade** em "tempo de execução", melhor!


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

## 01. O básico
A flag `-fsanitize=address` e todas as outras do [sanitize](https://github.com/google/sanitizers)(`libasan`), do Google, que foi implementada nativamente pelo [Projeto GNU](https://terminalroot.com.br/tags#gnu) serve para verificar *memory leaks*, *violação de memória* e entre outras falhas relacionadas. 

Mas, ela deve ser usada somente durante o desenvolvimento, quando você for disponibilizar para produção, ou seja, a versão *release* o ideal é criar o [Makefile](https://terminalroot.com.br/tags#make), ou [CMake](https://terminalroot.com.br/tags#cmake) ou qualquer outra ferramenta de compilação sem essa flag, aliás, é bom remover qualquer outra flag de *debug*, inclusive: `-g`, `-Wall`, `-Werror`, `-pedantic`, `-Wpedantic`,... 

Pois, elas, principalmente a `-fsanitize=address` deixam a execução do binário muito lenta. Você pode substituir pelo otimizador, por exemplo, `-O1`, `-O2` ou `-O3`:

+ `-O1` **(Otimização básica)** - Ativa otimizações que melhoram a performance sem aumentar significativamente o tempo de compilação. Exemplos: eliminação de código morto, propagação de constantes, inlining limitado.

+ `-O2` **(Otimização moderada)** - Inclui todas as otimizações de `-O1` e adiciona mais agressivas que ainda mantêm a confiabilidade do código. Exemplos: desdobramento de loops (loop unrolling), eliminação de subexpressões comuns, melhor agendamento de instruções.

+ `-O3` `(Otimização agressiva)` - Inclui todas as otimizações de `-O2` e adiciona novas ainda mais agressivas, como maior *inlining* e *vetorização de loops*. Pode aumentar o tamanho do código e, em alguns casos, reduzir a performance por over-otimização.

E ainda, existe também a `-Ofast`, apesar dela ser a mais agressiva de todas e *quase equivalente* a `-O3`, ela pode otimizar completamente o código o deixando ainda mais veloz, pois ela ainda inclui a flag `-ffast-math`, isso pode ser bom, mas o ideal é fazer testes, pois alguns cálculos de precisão, principalmente para os tipos `double` e `float` podem ter resultado inesperados, pois ela pode diminuir a quantidade de dígitos significativos, além de poder *quebrar* com os padrões [C](https://terminalroot.com.br/tags#linguagemc) e [C++](https://terminalroot.com.br/tags#cpp).

No entanto, na maioria dos casos, ela é indicada para o *release*, exemplo:
{% highlight bash %}
g++ -Ofast main.cpp
{% endhighlight %}
> Se quiser uma fusão menos conflitante, use junto com `-ffp-contract=fast`: Permite fusão de operações de ponto flutuante, como FMA (*Fused Multiply-Add*).

Resumindo:
#### Use `-Ofast` se precisão numérica exata não for crítica e quiser extrair o máximo de desempenho.

---

## 02. Ajuste específico para a arquitetura do processador
A flag `-march=native` permite que o compilador gere código otimizado para a arquitetura da sua CPU:
{% highlight bash %}
g++ -Ofast -march=native main.cpp
{% endhighlight %}
> Usar em combinação com `-Ofast` pode ser uma ótima ideia para o desempenho.

Isso permite que o compilador use instruções avançadas do seu processador, como **SSE**, **AVX**, etc.

Se precisar distribuir o binário para outras máquinas, escolha um valor específico em vez de native, como `-march=haswell`, `-march=znver3`, etc.


Resumindo:
#### A flag `-march=native`, use, caso queira, para permitir que o compilador gere código otimizado para a arquitetura da sua CPU.

---

## 03. Paralelismo com OpenMP
Se o código for paralelizável, adicione suporte ao OpenMP para aproveitar múltiplos núcleos da CPU:

{% highlight bash %}
g++ -Ofast -march=native -fopenmp main.cpp
{% endhighlight %}
> Também com combinação com as flags citadas acima.

Isso permite que loops e outras partes do código rodem em paralelo.

O OpenMP (do inglês *Open Multi-Processing*, ou *Multi-processamento aberto*) é uma interface de programação de aplicativo(API) para a programação multi-processo de memória compartilhada em múltiplas plataformas. Permite acrescentar simultaneidade aos programas escritos em [C](https://terminalroot.com.br/tags#linguagemc), [C++](https://terminalroot.com.br/tags#cpp) e [Fortran](https://terminalroot.com.br/tags#fortran) sobre a base do modelo de execução *fork-join*.

---

## 04. Melhorar uso do cache da CPU
As flags `-funroll-loops` e `-fprefetch-loop-arrays` ajudam a melhorar a execução de loops:

{% highlight bash %}
g++ -Ofast -march=native -funroll-loops -fprefetch-loop-arrays main.cpp
{% endhighlight %}
> Também com combinação com as flags citadas acima.

Se usássemos elas no [vídeo sobre Ranking das Linguagens de Programação](https://terminalroot.com.br/2021/03/testei-o-desempenho-de-10-linguagens-de-programacao-com-ranking.html), C++ e C deixaria as que ficaram atrás delas, ainda mais distantes! 😃 

Lembrando, que um utilitário ainda melhor que essas flags é o `ccache` que publicamos no artigo: [Utilize o Ccache e compile muito mais rápido](https://terminalroot.com.br/2024/05/utilize-o-ccache-e-compile-muito-mais-rapido.html), no entanto, o foco dele é diminuir o "tempo de compilação" e não somente o desempenho do binário.


<!-- RECTANGLE 2 - OnParagragraph -->
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

## 05. Linkagem otimizada
A flag `-flto`(*Link-Time Optimization*) serve para permitir que o otimizador veja o código como um todo:

{% highlight bash %}
g++ -Ofast -march=native -flto main.cpp
{% endhighlight %}
> É bom usá-la em conjunto com as duas primeiras flas citadas.

---

## 06. Evite exceções e RTTI se não forem necessários
Use a flag `-fno-rtti` se o código não usa exceções nem RTTI(*Runtime Type Information*), desative-os para ganhar desempenho:

{% highlight cpp %}
g++ -Ofast -march=native -fno-exceptions -fno-rtti main.cpp
{% endhighlight %}

RTTI(*Run-time Type Information*) é uma técnica que armazena informações sobre o tipo de dado de um objeto durante a execução de um programa. RTTI está disponível em algumas linguagens de programação, como *Delphi* e [C++](https://terminalroot.com.br/cpp).

---

## 07. Use perfis de execução com Profile-Guided Optimization (PGO)
Se puder rodar o programa antes da compilação final(E FAÇA ISSO!!!), use PGO com a flag `-fprofile-generate` para otimizar baseado em dados reais de execução:
> Não confunda ele com o tal: *verificador de empréstimos*!

Compile com instrumentação:
{% highlight bash %}
g++ -Ofast -march=native -fprofile-generate main.cpp
{% endhighlight %}
> É bom usá-la em conjunto com as duas primeiras flas citadas.

Execute o programa normalmente para gerar dados de perfil e depois recompile usando os perfis gerados:
{% highlight bash %}
g++ -Ofast -march=native -fprofile-use main.cpp
{% endhighlight %}

A *otimização guiada por perfil*(**PGO**), também conhecida como <u>feedback direcionado por perfil</u>(PDF) ou <u>otimização direcionada por feedback</u>(FDO), é a técnica de otimização do compilador que usa análises anteriores de artefatos ou comportamentos de software(" criação de perfil ") para melhorar o desempenho esperado do tempo de execução do programa.

---

## 08. Melhore o "ajuste"
Além de `-march=native`, você pode usar `-mtune` para ajustar a geração de código para melhor desempenho sem perder compatibilidade:

{% highlight bash %}
g++ -Ofast -march=native -mtune=native main.cpp
{% endhighlight %}
> É bom usá-la em conjunto com as duas primeiras flas citadas.

Se precisar rodar em várias arquiteturas, use algo mais genérico, como `-mtune=generic`.


---

Se quiser usar todas as flags que citamos em conjunto, fique à vontade:

{% highlight bash %}
g++ -Ofast -march=native -flto -funroll-loops -fprefetch-loop-arrays \
    -fno-exceptions -fno-rtti -fopenmp main.cpp
{% endhighlight %}

Para mais informações consulte os links abaixo:

+ <https://en.wikipedia.org/wiki/OpenMP>
+ <https://en.wikipedia.org/wiki/Run-time_type_information>
+ <https://en.wikipedia.org/wiki/Profile-guided_optimization>



