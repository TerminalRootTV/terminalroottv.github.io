---
layout: post
title: "Escute Músicas no Terminal com Spectrum"
date: 2023-04-25 19:26:00
image: '/assets/img/tui/spectrum.jpg'
description: 'Feito por um brasileiro e escrito com C++ e a biblioteca FTXUI.'
icon: 'ion:terminal-sharp'
iconname: 'Música/TUI'
tags:
- ftxui
- cpp
- cppdaily
- tui
- multimidia
- musica
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**Spectrum** é um reprodutor de música baseado em console escrito em [C++](https://terminalroot.com.br/tags#cpp) e com a biblioteca [FTXUI](https://terminalroot.com.br/2022/11/crie-programas-graficos-no-terminal-com-ftxui.html), ou seja, você terá um ambiente [TUI](https://terminalroot.com.br/tags#tui) inclusive para visualizar gráficamente a frequência de cada parte da sua música.

---

# Instalação
Antes de qualquer coisa você precisará das seguintes dependências, exemplo para [Ubuntu](https://terminalroot.com.br/tags#ubuntu):

{% highlight bash %}
sudo apt install build-essential libasound2-dev libavcodec-dev \
     libavfilter-dev libavformat-dev libfftw3-dev libswresample-dev
{% endhighlight %}

Após isso basta clonar o repositório e compilar:

{% highlight bash %}
git clone https://github.com/v1nns/spectrum.git
cd spectrum
cmake -S . -B build
{% endhighlight %}

Após compilado você já pode testar sem instalar rodando o comando: `./build/src/spectrum`, mas para instalar no seu sistema, rode:
{% highlight bash %}
sudo cmake --install build
{% endhighlight %}
> Após instalado você já pode remover o diretório clonado: `rm -rf spectrum/`

---

# Utilização
Para abrir o Spectrum basta rodar o comando:
{% highlight bash %}
spectrum
{% endhighlight %}

+ Navegue utilizando as setas direcionais no Box/Caixa no lado esquerdo da tela para escolhe e tocar a música com [ENTER];
+ Use também o *mouse*(caso queira) para clicar nas opções tais como: o equalizador, play, stop, adiantar o retroceder o tempo da música e entre outros;
+ Para sair tecle `q`.

---

# Capturas de Tela
[![Spectrum Play](/assets/img/tui/spectrum-play.png)](/assets/img/tui/spectrum-play.png)
> Clique na imagem para visualizá-la em uma maior resolução


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

[![Spectrum Equalizer](/assets/img/tui/spectrum-equalizer.png)](/assets/img/tui/spectrum-equalizer.png)
> Clique na imagem para visualizá-la em uma maior resolução

---

Nós fizemos um vídeo sobre a biblioteca [FTXUI](https://youtu.be/OWJhDj-qgDk) que pode ser visto no endereço abaixo:
## <https://youtu.be/OWJhDj-qgDk>

Para mais informações sobre o Spectrum acesse o [repositório no GitHub](https://github.com/v1nns/spectrum).



