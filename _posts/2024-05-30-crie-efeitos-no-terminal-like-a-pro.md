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

Na postagem anterior: [Crie facilmente Letras estilosas para o Terminal], nós mostramos como gerar nomes com fontes renderizadas no terminal.

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

# Reel

<blockquote class="instagram-media" data-instgrm-captioned data-instgrm-permalink="https://www.instagram.com/reel/C7k-XkmgelI/?utm_source=ig_embed&amp;utm_campaign=loading" data-instgrm-version="14" style=" background:#FFF; border:0; border-radius:3px; box-shadow:0 0 1px 0 rgba(0,0,0,0.5),0 1px 10px 0 rgba(0,0,0,0.15); margin: 1px; max-width:540px; min-width:326px; padding:0; width:99.375%; width:-webkit-calc(100% - 2px); width:calc(100% - 2px);"><div style="padding:16px;"> <a href="https://www.instagram.com/reel/C7k-XkmgelI/?utm_source=ig_embed&amp;utm_campaign=loading" style=" background:#FFFFFF; line-height:0; padding:0 0; text-align:center; text-decoration:none; width:100%;" target="_blank"> <div style=" display: flex; flex-direction: row; align-items: center;"> <div style="background-color: #F4F4F4; border-radius: 50%; flex-grow: 0; height: 40px; margin-right: 14px; width: 40px;"></div> <div style="display: flex; flex-direction: column; flex-grow: 1; justify-content: center;"> <div style=" background-color: #F4F4F4; border-radius: 4px; flex-grow: 0; height: 14px; margin-bottom: 6px; width: 100px;"></div> <div style=" background-color: #F4F4F4; border-radius: 4px; flex-grow: 0; height: 14px; width: 60px;"></div></div></div><div style="padding: 19% 0;"></div> <div style="display:block; height:50px; margin:0 auto 12px; width:50px;"><svg width="50px" height="50px" viewBox="0 0 60 60" version="1.1" xmlns="https://www.w3.org/2000/svg" xmlns:xlink="https://www.w3.org/1999/xlink"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><g transform="translate(-511.000000, -20.000000)" fill="#000000"><g><path d="M556.869,30.41 C554.814,30.41 553.148,32.076 553.148,34.131 C553.148,36.186 554.814,37.852 556.869,37.852 C558.924,37.852 560.59,36.186 560.59,34.131 C560.59,32.076 558.924,30.41 556.869,30.41 M541,60.657 C535.114,60.657 530.342,55.887 530.342,50 C530.342,44.114 535.114,39.342 541,39.342 C546.887,39.342 551.658,44.114 551.658,50 C551.658,55.887 546.887,60.657 541,60.657 M541,33.886 C532.1,33.886 524.886,41.1 524.886,50 C524.886,58.899 532.1,66.113 541,66.113 C549.9,66.113 557.115,58.899 557.115,50 C557.115,41.1 549.9,33.886 541,33.886 M565.378,62.101 C565.244,65.022 564.756,66.606 564.346,67.663 C563.803,69.06 563.154,70.057 562.106,71.106 C561.058,72.155 560.06,72.803 558.662,73.347 C557.607,73.757 556.021,74.244 553.102,74.378 C549.944,74.521 548.997,74.552 541,74.552 C533.003,74.552 532.056,74.521 528.898,74.378 C525.979,74.244 524.393,73.757 523.338,73.347 C521.94,72.803 520.942,72.155 519.894,71.106 C518.846,70.057 518.197,69.06 517.654,67.663 C517.244,66.606 516.755,65.022 516.623,62.101 C516.479,58.943 516.448,57.996 516.448,50 C516.448,42.003 516.479,41.056 516.623,37.899 C516.755,34.978 517.244,33.391 517.654,32.338 C518.197,30.938 518.846,29.942 519.894,28.894 C520.942,27.846 521.94,27.196 523.338,26.654 C524.393,26.244 525.979,25.756 528.898,25.623 C532.057,25.479 533.004,25.448 541,25.448 C548.997,25.448 549.943,25.479 553.102,25.623 C556.021,25.756 557.607,26.244 558.662,26.654 C560.06,27.196 561.058,27.846 562.106,28.894 C563.154,29.942 563.803,30.938 564.346,32.338 C564.756,33.391 565.244,34.978 565.378,37.899 C565.522,41.056 565.552,42.003 565.552,50 C565.552,57.996 565.522,58.943 565.378,62.101 M570.82,37.631 C570.674,34.438 570.167,32.258 569.425,30.349 C568.659,28.377 567.633,26.702 565.965,25.035 C564.297,23.368 562.623,22.342 560.652,21.575 C558.743,20.834 556.562,20.326 553.369,20.18 C550.169,20.033 549.148,20 541,20 C532.853,20 531.831,20.033 528.631,20.18 C525.438,20.326 523.257,20.834 521.349,21.575 C519.376,22.342 517.703,23.368 516.035,25.035 C514.368,26.702 513.342,28.377 512.574,30.349 C511.834,32.258 511.326,34.438 511.181,37.631 C511.035,40.831 511,41.851 511,50 C511,58.147 511.035,59.17 511.181,62.369 C511.326,65.562 511.834,67.743 512.574,69.651 C513.342,71.625 514.368,73.296 516.035,74.965 C517.703,76.634 519.376,77.658 521.349,78.425 C523.257,79.167 525.438,79.673 528.631,79.82 C531.831,79.965 532.853,80.001 541,80.001 C549.148,80.001 550.169,79.965 553.369,79.82 C556.562,79.673 558.743,79.167 560.652,78.425 C562.623,77.658 564.297,76.634 565.965,74.965 C567.633,73.296 568.659,71.625 569.425,69.651 C570.167,67.743 570.674,65.562 570.82,62.369 C570.966,59.17 571,58.147 571,50 C571,41.851 570.966,40.831 570.82,37.631"></path></g></g></g></svg></div><div style="padding-top: 8px;"> <div style=" color:#3897f0; font-family:Arial,sans-serif; font-size:14px; font-style:normal; font-weight:550; line-height:18px;">Ver essa foto no Instagram</div></div><div style="padding: 12.5% 0;"></div> <div style="display: flex; flex-direction: row; margin-bottom: 14px; align-items: center;"><div> <div style="background-color: #F4F4F4; border-radius: 50%; height: 12.5px; width: 12.5px; transform: translateX(0px) translateY(7px);"></div> <div style="background-color: #F4F4F4; height: 12.5px; transform: rotate(-45deg) translateX(3px) translateY(1px); width: 12.5px; flex-grow: 0; margin-right: 14px; margin-left: 2px;"></div> <div style="background-color: #F4F4F4; border-radius: 50%; height: 12.5px; width: 12.5px; transform: translateX(9px) translateY(-18px);"></div></div><div style="margin-left: 8px;"> <div style=" background-color: #F4F4F4; border-radius: 50%; flex-grow: 0; height: 20px; width: 20px;"></div> <div style=" width: 0; height: 0; border-top: 2px solid transparent; border-left: 6px solid #f4f4f4; border-bottom: 2px solid transparent; transform: translateX(16px) translateY(-4px) rotate(30deg)"></div></div><div style="margin-left: auto;"> <div style=" width: 0px; border-top: 8px solid #F4F4F4; border-right: 8px solid transparent; transform: translateY(16px);"></div> <div style=" background-color: #F4F4F4; flex-grow: 0; height: 12px; width: 16px; transform: translateY(-4px);"></div> <div style=" width: 0; height: 0; border-top: 8px solid #F4F4F4; border-left: 8px solid transparent; transform: translateY(-4px) translateX(8px);"></div></div></div> <div style="display: flex; flex-direction: column; flex-grow: 1; justify-content: center; margin-bottom: 24px;"> <div style=" background-color: #F4F4F4; border-radius: 4px; flex-grow: 0; height: 14px; margin-bottom: 6px; width: 224px;"></div> <div style=" background-color: #F4F4F4; border-radius: 4px; flex-grow: 0; height: 14px; width: 144px;"></div></div></a><p style=" color:#c9c8cd; font-family:Arial,sans-serif; font-size:14px; line-height:17px; margin-bottom:0; margin-top:8px; overflow:hidden; padding:8px 0 7px; text-align:center; text-overflow:ellipsis; white-space:nowrap;"><a href="https://www.instagram.com/reel/C7k-XkmgelI/?utm_source=ig_embed&amp;utm_campaign=loading" style=" color:#c9c8cd; font-family:Arial,sans-serif; font-size:14px; font-style:normal; font-weight:normal; line-height:17px; text-decoration:none;" target="_blank">Uma publicação compartilhada por Marcos Oliveira (@terminalroot)</a></p></div></blockquote> <script async src="//www.instagram.com/embed.js"></script>

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


