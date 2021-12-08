---
layout: post
title: "Crie Deepfakes facilmente com essa ferramenta"
date: 2021-12-08 10:54:24
image: '/assets/img/ai/deepfake.jpg'
description: 'Escrita em Python e funciona em Linux, Windows e macOS.'
icon: 'ion:terminal-sharp'
iconname: 'Python'
tags:
- python
- windows
- macos
- linux
---

![Crie Deepfakes facilmente com essa ferramenta](/assets/img/ai/deepfake.jpg)

---

Se você deseja criar umas **deepfakes** legais e espalhar pela internet, esse com certeza é um software para você.

Faceswap é o software que criar Deepfakes de vídeos e imagens, é multiplataforma e de código aberto.

# Instalação
É possível instalá-lo no [Linux](https://terminalroot.com.br/tags#linux), [Windows](https://terminalroot.com.br/tags#windows) e [macOS](https://terminalroot.com.br/tags#macos).

Mas antes você precisará de alguns pré-requisitos, como:

+ Sua máquina precisa ter uma boa CPU e quantidade de memória, o básico seria um **Intel i5** com **8GB** de memória RAM.
+ Você precisará instalar o [Anaconda](https://www.anaconda.com/download/);
+ E também o [Git](https://terminalroot.com.br/tags#git)

Se você estiver no Windows, reinicie seu computador antes de abrir o Anaconda.

Após isso, abra o Anaconda e proceda da seguinte maneira:

+ Abra o Anaconda Navigator
+ Selecione "Ambientes" no lado esquerdo
+ Selecione "Criar" na parte inferior
+ No pop-up:
  - Dê a ele o nome: troca de rosto
  - IMPORTANTE: Selecione python versão 3.8
  - Clique em "Criar" ( isso pode demorar um pouco, pois será necessário fazer o download do Python)


<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

![Anaconda Installer](https://camo.githubusercontent.com/f5fbd98f6a62f3109357571595cc1cc7047652c74e7e3622e9d9e7132bd63cb8/68747470733a2f2f692e696d6775722e636f6d2f434c49444466612e706e67) 
Para entrar no ambiente virtual:
+ Abra o Anaconda Navigator
+ Selecione "Ambientes" no lado esquerdo
+ Clique na seta ">" ao lado do ambiente de troca de rosto e selecione "Abrir Terminal"

![Anaconda Virtual](https://camo.githubusercontent.com/40cc838558b8980f58a1c97cec4eb21f94530e08457b6f050c16932e852aae82/68747470733a2f2f692e696d6775722e636f6d2f724b53713250642e706e67) 

Após isso, basta clonar, rodar o instalador do Faceswap:

{% highlight sh %}
git clone --depth 1 https://github.com/deepfakes/faceswap.git
cd faceswap
python setup.py
{% endhighlight %}

# Utilização
Após instalado, basta abrir o Faceswap com interface gráfica:

{% highlight sh %}
python faceswap.py gui
{% endhighlight %}


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

![Faceswap](/assets/img/faceswap.jpg) 

O programa é bem intuitivo, mas aconselho você ler [essas instruções](https://github.com/deepfakes/faceswap/blob/master/USAGE.md) para se familiarizar melhor com o Faceswap.



