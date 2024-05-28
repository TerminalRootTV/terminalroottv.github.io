---
layout: post
title: "Crie Jogos com Python e Raylib"
date: 2024-05-28 11:16:31
image: '/assets/img/python/raylib-py.jpg'
description: "🗞️ Simples, rápido e com todos os recursos necessários."
icon: 'ion:terminal-sharp'
iconname: 'Python/Raylib'
tags:
- raylib
- python
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

No mundo do [desenvolvimento de jogos](https://terminalroot.com.br/tags#gamedev), encontrar as ferramentas certas pode ser um verdadeiro diferencial para transformar suas ideias em realidade. 

[Python](https://terminalroot.com.br/tags#python), com sua sintaxe simples e poderosa, é uma escolha popular entre desenvolvedores de todos os níveis de experiência. 

Quando combinado com a versatilidade da [Raylib](https://terminalroot.com.br/tags#raylib), uma biblioteca de desenvolvimento de jogos leve e amigável, o potencial para criar jogos incríveis torna-se ainda maior. 

Neste artigo, vamos explorar como **Python e Raylib** podem ser utilizados juntos para criar jogos envolventes, oferecendo uma visão prática desde a configuração do ambiente de desenvolvimento até a criação do seu primeiro projeto. 


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

## Instalação e Configuração do Ambiente
Para instalar basta usar o [Pip](https://pypi.org/project/pip/) com o seguinte comando:

{% highlight bash %}
pip install raylib-py
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
pip install raylib-py
{% endhighlight %}

---

## Primeiro projeto básico
Ainda no seu ambiente virtual, caso tenha sido necessário, crie um arquivo de nome qualquer, por exemplo, `main.py` e insira o conteúdo abaixo:

{% highlight python %}
from raylibpy import *


def main():

    init_window(800, 450, "raylib [core] example - basic window")

    set_target_fps(60)

    while not window_should_close():

        begin_drawing()
        clear_background(RAYWHITE)
        draw_text("Congrats! You created your first window!", 190, 200, 20, BLACK)
        end_drawing()

    close_window()


if __name__ == '__main__':
    main()
{% endhighlight %}

E rode:
{% highlight bash %}
python main.py
{% endhighlight %}

Se aparecer a janela similar a da imagem abaixo é porque está tudo certo!

![Raylib-Py rodando](/assets/img/python/raylib-py-running.png) 

Se estiver em um ambiente virtual, para sair rode:
{% highlight bash %}
deactivate
{% endhighlight %}
> As libs que você instalar nesse ambiente só funcionam nesse ambiente! Entre nele sempre que for desenvolver.

Se quiser aprender mais sobre como usar a Raylib veja um vídeo que fizemos:
## [Crie Jogos para Windows, Linux e Web com Raylib](https://terminalroot.com.br/2022/11/crie-jogos-para-windows-linux-e-web-com-raylib-c-cpp.html)

Para mais informações acesse o [repositório da Raylib-Py](https://github.com/overdev/raylib-py).



