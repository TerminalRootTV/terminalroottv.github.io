---
layout: post
title: "Desenhe fórmulas matemáticas em ASCII via linha de comando"
date: 2022-04-21 10:47:43
image: '/assets/img/cppdaily/diagon.jpg'
description: 'Criado com C++ e WebAssembly para Web.'
icon: 'ion:terminal-sharp'
iconname: 'Comandos'
tags:
- cpp
- cppdaily
- terminal
- comandos
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**Diagon** é um interpretador interativo. Ele transforma a expressão do estilo markdown em uma representação de arte ascii.

Foi escrito em [C++](https://terminalroot.com.br/tags#cpp) e usa WebAssembly, [HTML](https://terminalroot.com.br/tags#html) e [CSS](https://terminalroot.com.br/tags#css) para fazer uma aplicação Web, além de poder utiliza-lo via linha de comando.

---

# Instalação
Utilize o [Git](https://terminalroot.com.br/tags#git), [CMake](https://terminalroot.com.br/tags#cmake), [GNU Make](https://terminalroot.com.br/tags#make) e lógico o [GCC](https://terminalroot.com.br/tags#gcc) ou o [clang](https://terminalroot.com.br/tags#clang) para construir:

{% highlight sh %}
git clone https://github.com/ArthurSonzogni/Diagon
cd Diagon
mkdir build && cd build
cmake ..
make

{% endhighlight %}

Teste o binário antes de instalar:
{% highlight sh %}
echo "1+1/2 + sum(i,0,10) = 112/2" | ./diagon-1.0.127 Math
{% endhighlight %}

Provável saída:
{% highlight sh %}
        10         
        ___        
    1   ╲       112
1 + ─ + ╱   i = ───
    2   ‾‾‾      2 
         0         
{% endhighlight %}


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

Finalmente, instale:
{% highlight sh %}
sudo make install
{% endhighlight %}

Será instalado nos caminhos:
{% highlight sh %}
-- Install configuration: "Release"
-- Installing: /usr/local/bin/diagon-1.0.127
-- Installing: /usr/local/bin/diagon
{% endhighlight %}

Você também pode instalar via: **snap**:
{% highlight sh %}
sudo snap install diagon
{% endhighlight %}

Use o `--help` para mais informações e rode os exemplos.

O exemplo web abrirá em <http:localhost:8888> . Tomando como referência se você ainda estiver dentro de `build/`.

> Abrirá em seu navegador padrão!
{% highlight sh %}
cd ../src
./run_diagon.sh
{% endhighlight %}

Para mais informações visite o [repositório](https://github.com/ArthurSonzogni/Diagon) .



