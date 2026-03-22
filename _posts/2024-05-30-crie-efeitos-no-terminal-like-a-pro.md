---
layout: post
title: "Crie Efeitos no Terminal LIKE A PRO"
date: 2024-05-30 00:47:29
image: '/assets/img/python/effects.jpg'
description: "🏆 Trata-se de um aplicativo escrito em Python."
icon: 'ion:terminal-sharp'
iconname: 'Python'
tags:
- python
- tui
- terminal
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Na postagem anterior: [Crie facilmente Letras estilosas para o Terminal](https://terminalroot.com.br/2024/05/crie-facilmente-letras-estilosas-para-o-terminal.html), nós mostramos como gerar nomes com fontes renderizadas no terminal.

Nesse artigo mostraremos como você pode combinar a informação anterior e criar animações no terminal.

Isso pode ser interessante para você adicionar a algum aplicativo [linha de comando](https://terminalroot.com.br/tags#comando) ou [TUI](https://terminalroot.com.br/tags#tui) que você pretende ou está desenvolvendo, para ser a introdução ou o help e até mesmo como menu de inicialização.

Veja os efeitos em um dos vídeos abaixo e logo após os vídeo há um tutorial explicando todo passo a passo de como você reproduzir na sua máquina!

---

# Shorts

<iframe width="436" height="775" src="https://www.youtube.com/embed/KboglemC4TA" title="Crie Efeitos no Terminal LIKE A PRO" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

---

# Tik Tok

<blockquote class="tiktok-embed" cite="https://www.tiktok.com/@terminalroot/video/7374635303966903558" data-video-id="7374635303966903558" style="max-width: 605px;min-width: 325px;" > <section> <a target="_blank" title="@terminalroot" href="https://www.tiktok.com/@terminalroot?refer=embed">@terminalroot</a> <p>Crie Efeitos no Terminal LIKE A PRO Para mais informações acesse o link na descrição: https:&#47;&#47;terminalroot.com.br&#47;2024&#47;05&#47;crie-efeitos-no-terminal-like-a-pro.html</p> <a target="_blank" title="♬ original sound  - terminalroot" href="https://www.tiktok.com/music/original-sound-terminalroot-7374636081911630597?refer=embed">♬ original sound  - terminalroot</a> </section> </blockquote> <script async src="https://www.tiktok.com/embed.js"></script>

---


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

Esses efeitos trata-se de um aplicativo escrito em [Python](https://terminalroot.com.br/tags#python) chamado: **TerminalTextEffects**, ou somente: **TTE**!

TerminalTextEffects (TTE) é um mecanismo de efeitos visuais de terminal. O TTE pode ser instalado como um aplicativo de sistema para produzir efeitos em seu terminal ou como uma biblioteca Python para ativar efeitos em seus scripts/aplicativos Python. 

O TTE inclui uma biblioteca crescente de efeitos integrados que mostram os recursos do mecanismo. Esses recursos incluem: 
+ Suporte a cores hexadecimais Xterm 256 / RGB 
+ Movimento complexo de personagens por meio de caminhos, pontos de referência e atenuação de movimento, com suporte para curvas Bézier quadráticas/cúbicas. 
+ Animações complexas por meio de cenas com alterações de símbolos/cor, camadas, atenuação e progressão sincronizada com caminho. 
+ Geração de gradiente de cores de parada/etapa variável. 
+ Manipulação de eventos para alterações de estado de caminho/cena com suporte de retorno de chamada personalizado e muitas ações predefinidas. 
+ Personalização de efeito exposta por meio de uma classe de dados de configuração de efeito digitada que é tratada automaticamente como argumentos CLI. 

Executa inline, preservando o estado do terminal e o fluxo de trabalho.

---

# Instalação
Para instalar basta usar o [Pip](https://pypi.org/project/pip/) com o seguinte comando:

{% highlight bash %}
pip install terminaltexteffects
{% endhighlight %}

Se seu sistema apresentar alguma crítica durante a instalação é porque provavelmente ele adota algumas políticas de segurança e você precisa instalar em um ambiente virtual.

Para isso rode os comandos abaixo na ordem:
{% highlight bash %}
mkdir -p ~/.local/bin/venv
python -m venv ~/.local/bin/venv
. ~/.local/bin/venv/bin/activate
{% endhighlight %}

Agora sim instale no ambiente virtual que foi iniciado:
{% highlight bash %}
pip install terminaltexteffects
{% endhighlight %}

Continue nesse terminal aberto se você ativou o `venv` nele para rodar os efeitos!


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

# Criando efeitos
Existem diversos efeitos, o **EFEITO 1** dos vídeos acima é o **Beams**. Para reproduzi-lo crie um arquivo Python, exemplo: `beams.py` e insira o conteúdo abaixo:

{% highlight py %}
from terminaltexteffects.effects.effect_beams import Beams

effect = Beams("YourTextHere")

with effect.terminal_output() as terminal:

    for frame in effect:

        terminal.print(frame)
{% endhighlight %}

Onde há a *string*: **YourTextHere** é onde você deve pôr o texto que você quer animar. Para rodar:
{% highlight bash %}
python beams.py
{% endhighlight %}

Se quiser usar arquivos com textos prontos e maiores, por exemplo, o arquivo que eu usei nos vídeos:

> `vim conteudo.txt`
{% highlight bash %}
┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐     ┌─┐ ┌─┐ ┌─┐ ┌─┐
│T│ │e│ │r│ │m│ │i│ │n│ │a│ │l│     │R│ │o│ │o│ │t│
└─┘ └─┘ └─┘ └─┘ └─┘ └─┘ └─┘ └─┘     └─┘ └─┘ └─┘ └─┘

───────────────────────────────────────────────────
          ┌───┬───┬───┬───┬───┬───┐                               
          │ ﭱ⠀│ ﭰ⠀│ ﳑ⠀│ ⠀│ ⠀│ ⠀│ 
          └───┴───┴───┴───┴───┴───┘
---------------------------------------------------
     GameDev │ GUI │ TUI │ Web │ Libraries

    Um pouco de muito sobre C++, Programação, 
         Desenvolvimento de Games e Web.
                Ⓣ Ⓔ Ⓡ Ⓡ ⓞ ⓞ 
       ───────────── ◆ ─────────────
  O site Terminal Root é voltado para o ensino de 
  programação e desenvolvimento de software. Ele 
  oferece tutoriais, artigos e dicas sobre várias 
  linguagens e tecnologias, como C++, JavaScript, 
  C, Java, Go, Python, Assembly, CMake além de 
  ferramentas para desenvolvimento de jogos: SFML, 
  Raylib, SDL2 e entre outros. Além disso, o site 
  cobre tópicos também de desenvolvimento web, e 
  apresenta recomendações de livros sobre diversas 
  áreas da programação. Terminal Root também 
  disponibiliza cursos online e mantém um blog com 
  atualizações frequentes sobre novas ferramentas 
  e técnicas no campo da programação.

┌────────────────────────────────────────────────────┐
│ ┌┬┐  ┌┐  ┌┐  ┌┐┐  ∙  ┌┐  ┌┐  ┐     ┌┐  ┌┐  ┌┐  ┌┬┐ │ 
│  │   ├   ││  │ │  │  ││  ├│  │     ││  ││  ││   │  │ 
│  │   ││  │┘  │ │  │  ││  ││  ││    │┘  ││  ││   │  │ 
│  ┘   └┘  ┘┘  ┘ ┘  ┘  ┘┘  ┘┘  └┘    ┘┘  └┘  └┘   ┘  │ 
└────────────────────────────────────────────────────┘
{% endhighlight %}

E altere o código do arquivo `beams.py` para que carregue esse arquivo dinamicamente, deixe-o assim:
{% highlight python %}
from terminaltexteffects.effects.effect_beams import Beams

with open('./conteudo.txt', 'r') as file:
    conteudo = file.read()

effect = Beams(conteudo)

with effect.terminal_output() as terminal:

    for frame in effect:

        terminal.print(frame)
{% endhighlight %}

Agora rode novamente e veja o **EFEITO 1** idêntico ao do vídeo!

---

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

Os outros 2 efeitos são: **BouncyBalls**(EFEITO 2) e **Binarypath**(EFEITO 3).

Existem muito mais efeitos no [endereço oficial do TTE](https://chrisbuilds.github.io/terminaltexteffects/).

---

Veja também:
## [Revelando os Segredos dos Hackers de Hollywood](https://terminalroot.com.br/2020/10/revelando-os-segredos-dos-hackers-de-hollywood.html)
## [Crie facilmente Tabelas no Terminal com C++](https://terminalroot.com.br/2022/04/crie-facilmente-tabelas-no-terminal-com-cpp.html)
## [Escute Músicas no Terminal com Spectrum](https://terminalroot.com.br/2023/04/escute-musicas-no-terminal-com-spectrum.html)
## [As 30 melhores bibliotecas e pacotes Python para Iniciantes](https://terminalroot.com.br/2019/12/as-30-melhores-bibliotecas-e-pacotes-python-para-iniciantes.html)


