---
layout: post
title: "Crie Facilmente Barras de Progresso em C"
date: 2026-05-09 18:50:27
image: '/assets/img/c/c-progress-bar.jpg'
description: "📊 Uma biblioteca simples de barras de progresso para C."
icon: 'ion:terminal-sharp'
iconname: 'C'
tags:
- linguagemc
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

`c_progress_bar` é uma biblioteca para [C](https://terminalroot.com.br/c) que ajuda a você criar:

+ Barra de progresso colorida
+ Estimativa de tempo restante
+ Rastreamento de tempo decorrido
+ Trabalha com [MSVC](https://terminalroot.com.br/2023/06/como-compilar-com-msvc-via-linha-de-comando.html), [Clang](https://terminalroot.com.br/tags#clang) e [GCC](https://terminalroot.com.br/tags#gcc)
+ Escrito em C99 com dependências mínimas


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

## Instalação
{% highlight bash %}
git clone https://github.com/c-modules/c_progress_bar
cd c_progress_bar/
cmake . -B build
cmake --build build/
sudo cmake install build
{% endhighlight %}

---

## Simples exemplo
{% highlight bash %}
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#include "c_progress_bar.h"

#define N 1000000000

int main(void)
{
    double sum = 0.0;

    // Setup progress bar
    CPB_Config config = cpb_get_default_config();
    config.description = "Processing";                // Default: ""
    config.min_refresh_time = 0.1;                    // Minimum refresh time in seconds. Default: 0.1.
    config.timer_remaining_time_recent_weight = 0.3;  // Weight for recent rate in remaining time estimation. Range: [0, 1]. Default: 0.3.

    // You don't need to modify anything for CPB_ProgressBar.
    // Just call cpb_init
    CPB_ProgressBar progress_bar;
    cpb_init(&progress_bar, 0, N, config);

    // Main loop
    cpb_start(&progress_bar);
    for (int64_t i = 0; i <= N; i++)
    {
        if (i % 1000 == 0)
        {
            cpb_update(&progress_bar, i);
        }

        sum += (i % 100) * 0.0001;
    }
    cpb_finish(&progress_bar);

    printf("Final result: %f\n", sum);

    return 0;
}
{% endhighlight %}

---

Para mais informações acesse o [repositório](https://github.com/c-modules/c_progress_bar)

## [Aprenda C](https://terminalroot.com.br/c)
### <https://terminalroot.com.br/c>


