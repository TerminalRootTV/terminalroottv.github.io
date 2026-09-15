---
layout: post
title: "Mousiki: Um Reprodutor de Áudio para o Terminal"
date: 2026-09-15 10:37:14
image: '/assets/img/cpp/mousiki.jpg'
description: "🔳 Feito com C++"
icon: 'ion:terminal-sharp'
iconname: 'TUI/C++'
tags:
- cpp
- tui
- multimidia
- terminal
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**Mousiki** é um **player de música baseado em [TUI (Terminal User Interface)](https://terminalroot.com.br/tags#tui)**, ou seja, em vez de abrir uma interface gráfica tradicional, toda a experiência acontece diretamente dentro do terminal.

Ele foi desenvolvido em [C++](https://terminalroot.com.br/tags#cpp) e utiliza uma arquitetura relativamente enxuta. O projeto usa [CMake](https://terminalroot.com.br/tags#cmake) para a compilação e C++17 como padrão da linguagem.


Entre os recursos disponíveis estão:

* Reprodução de músicas armazenadas localmente;
* Pesquisa e streaming de músicas online;
* Letras sincronizadas;
* Destaque da palavra que está sendo cantada;
* Visualizador de espectro FFT;
* Forma de onda;
* Animação de disco;
* Fila de reprodução;
* Shuffle;
* Repetição;
* Busca e filtragem;
* Controle de volume;
* Download de streams;
* Cores personalizáveis;
* Atalhos de teclado configuráveis.


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

O Mousiki atualmente não funciona como aqueles programas tradicionais em que você baixa um `.exe`, `.dmg` ou `.deb` e simplesmente clica em "Instalar".

A instalação é baseada principalmente na **compilação do código-fonte**.

Os requisitos principais indicados pelo projeto são:

* [Git](https://terminalroot.com.br/tags#git);
* [CMake](https://terminalroot.com.br/tags#cmake);
* [Compilador compatível com C++17](https://terminalroot.com.br/tags#gcc);
* [FFmpeg](https://terminalroot.com.br/tags#ffmpeg);
* yt-dlp;
* [Python 3](https://terminalroot.com.br/python);
* pacote Python `syncedlyrics`.

---

## [GNU/Linux](https://terminalroot.com.br/tags#gnulinux)

{% highlight bash %}
sudo apt update
sudo apt install git cmake build-essential ffmpeg yt-dlp python3 python3-pip
{% endhighlight %}

Depois instale o pacote utilizado para buscar letras sincronizadas:

{% highlight bash %}
python3 -m pip install syncedlyrics
{% endhighlight %}

O próprio `setup.sh` do Mousiki faz essencialmente esse processo de instalação de dependências e depois compila o programa.

Agora clone o repositório:

{% highlight bash %}
git clone https://github.com/itzender5820/mousiki.git
{% endhighlight %}

Entre na pasta:

{% highlight bash %}
cd mousiki
{% endhighlight %}

Em sistemas Debian/Ubuntu, existe um script de configuração:

{% highlight bash %}
bash setup.sh
{% endhighlight %}

Depois disso, o executável deverá estar em:

{% highlight text %}
build/mousiki
{% endhighlight %}

Para iniciar:

{% highlight bash %}
./build/mousiki
{% endhighlight %}

Você também pode instalar o executável em um diretório do sistema, usando `install, cmake --install, mv, ...` exemplo:
{% highlight bash %}
sudo mv ./build/mousiki /usr/bin/
{% endhighlight %}

---

## Utilização
> Controles básicos

A configuração padrão atual define vários atalhos importantes:

| Tecla     | Função                         |
| --------- | ------------------------------ |
| `↑` / `↓` | Navegar pela lista             |
| `Enter`   | Reproduzir                     |
| `p`       | Play/Pause                     |
| `n`       | Próxima música                 |
| `b`       | Música anterior                |
| `←` / `→` | Retroceder/avançar             |
| `1`       | Aumentar volume                |
| `2`       | Diminuir volume                |
| `r`       | Repetição                      |
| `m`       | Shuffle                        |
| `/`       | Pesquisa                       |
| `a`       | Adicionar à fila               |
| `d`       | Remover da fila                |
| `Tab`     | Alternar entre cartões/painéis |
| `f`       | Filtrar por pasta              |
| `c`       | Limpar filtro                  |
| `q`       | Sair                           |
| `y`       | Baixar stream                  |

Esses atalhos vêm do arquivo de configuração padrão e podem ser modificados. 


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

Para mais informações acesse o [repositório](https://github.com/itzender5820/mousiki).


