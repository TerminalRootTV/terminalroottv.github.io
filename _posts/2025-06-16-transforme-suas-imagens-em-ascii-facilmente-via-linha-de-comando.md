---
layout: post
title: "Transforme suas Imagens em ASCII facilmente via linha de comando"
date: 2025-06-16 12:40:39
image: '/assets/img/cppdaily/pixcii.jpg'
description: "🚀 Pixcii é um utilitário escrito em C++ de fácil utilização"
icon: 'ion:terminal-sharp'
iconname: 'CLI/C++'
tags:
- cli
- terminal
- comando
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

O **Pixcii** é um editor de pixel art simples feito para rodar diretamente no [terminal](https://terminalroot.com.br/tags#terminal) ([CLI](https://terminalroot.com.br/tags#cli)). Ideal para quem curte arte em ASCII ou precisa de uma ferramenta leve para criar sprites minimalistas.

🧰 **Principais recursos:**

* Interface interativa no terminal
* Edição em tempo real com teclas de atalho
* Exportação para `.txt`
* Cores suportadas via ANSI escape codes

🛠️ **Feito em:** [C++](https://terminalroot.com.br/tags#cpp)


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

## 🚀 Instalação rápida:
Precisa de um [compilador C++](https://terminalroot.com.br/tags#compiladores) e também do [CMake](https://terminalroot.com.br/tags#cmake) instalado no seu sistema.

{% highlight bash %}
git clone https://github.com/ashish0kumar/pixcii
cd pixcii
cmake . -B build
cmake --build build
mkdir -p ~/.local/bin
mv build/pixcii ~/.local/bin
echo 'PATH="${HOME}/.local/bin:${PATH}" >> ~/.bashrc
exec $SHELL
{% endhighlight %}

---

## 📢 Uso
Exemplo usando essa imagem:
> O ideal é usar imagens de largura `40x40`, apesar do `pixcii` possuir o argumento `--scale` para redimensionar.

![C++ logo png](/assets/img/cppdaily/cpp-logo.png) 

{% highlight bash %}
pixcii --color -i cpp-logo.png -o saida.txt
cat saida.txt
{% endhighlight %}
> Se não tiver cor de fundo fica legal, mas imagens `JPG` com fundo preto também terá os fundos ignorados.

💡 Útil para quem quer prototipar arte retrô, [criar apps](https://terminalroot.com.br/2022/11/startfetch-um-fetch-que-mostra-as-constelacoes-do-zodiaco.html), estudar manipulação de terminal ou criar assets simples para jogos em estilo ASCII.

---

Para mais informações use o `help`:
{% highlight bash %}
pixcii --help
{% endhighlight %}

E acesse o [repositório oficial](https://github.com/ashish0kumar/pixcii).



