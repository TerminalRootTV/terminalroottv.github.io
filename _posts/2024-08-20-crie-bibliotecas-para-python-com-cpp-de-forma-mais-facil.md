---
layout: post
title: "Crie bibliotecas para Python com C++ de forma mais fácil"
date: 2024-08-20 12:04:13
image: '/assets/img/python/pybind11.jpg'
description: "🚀 Nesse vídeo vamos mostrar uma forma mais fácil de criar bibliotecas para Python com C++."
icon: 'ion:terminal-sharp'
iconname: 'C++/Python'
tags:
- cpp
- python
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Nesse vídeo vamos mostrar uma forma mais fácil de criar bibliotecas para [Python](https://terminalroot.com.br/tags#python) com [C++](https://terminalroot.com.br/cpp). No [outro vídeo](https://terminalroot.com.br/2023/10/aprenda-a-criar-bibliotecas-pra-python-com-c-cpp.html) nós vimos o processo e notamos que, de alguma forma, precisamos escrever muita coisa para criar o básico para rodar no **Python**.

Hoje veremos como usar o wrapper: `pybind11` que torna mais fácil, em relação a código, criar bibliotecas para *Python*.

O endereço do repositório da pybind11 é: <https://github.com/pybind/pybind11>. 

E nesse repositório há o link para a documentação oficial: <https://pybind11.readthedocs.io/en/stable/>.

---

## Assista ao vídeo


<!-- SQUARE - GAMES ROOT -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

<iframe width="1253" height="705" src="https://www.youtube.com/embed/2uSiSCmqdXc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

## Códigos úteis
Criar e ativar o `venv`:
{% highlight bash %}
mkdir -p ~/.local/bin/venv
python -m venv ~/.local/bin/venv
. ~/.local/bin/venv/bin/activate
pip install pybind11 pytest
{% endhighlight %}

Clonar, compilar e instalar:
{% highlight bash %}
cmake -B build .
cmake --build build
sudo cmake --install build
{% endhighlight %}
> Agora vc já pode sair e deletar o repositório clonado: `cd && rm -rf pybind11`

Código exemplo: `main.cpp`
{% highlight cpp %}
#include <pybind11/pybind11.h>

int add(int i, int j) {
    return i + j;
}

PYBIND11_MODULE(example, m) {
    m.doc() = "pybind11 example plugin"; // optional module docstring

    m.def("add", &add, "A function that adds two numbers");
}
{% endhighlight %}

---

<!-- RECTANGLE LARGE -->
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

---

Como compilar:
{% highlight bash %}
g++ -Wall -shared -std=c++11 -fPIC $(python3.11 -m pybind11 --includes) main.cpp -o example.so
{% endhighlight %}

Testar com arquivo [Python](https://terminalroot.com.br/tags#python): `script.py`:
{% highlight py %}
import example

result = example.add(36, 90)

print(result)
{% endhighlight %}
> Rodar: `python script.py`, possível e provável saída: `126`.

Para sair do `venv` digite: `deactivate`.

Para mais informações consulte esse outro vídeo: [Aprenda a Criar Bibliotecas pra Python com C/C++](https://terminalroot.com.br/2023/10/aprenda-a-criar-bibliotecas-pra-python-com-c-cpp.html).


