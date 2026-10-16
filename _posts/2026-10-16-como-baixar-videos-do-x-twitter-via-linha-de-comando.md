---
layout: post
title: "Como Baixar Vídeos do X-Twitter via Linha de Comando"
date: 2026-10-16 10:35:13
image: '/assets/img/cli/xwitter-cli.jpg'
description: "🔳 A melhor alternativa e que funciona de verdade!"
icon: 'ion:terminal-sharp'
iconname: 'CLI'
tags:
- cli
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Eu costumo salvar muitos vídeos de ideias de [criação de games](https://terminalroot.com.br/tags#gamedev) nos meus **Itens Salvos**(que agora se chama: **História**) no X(antigo Twitter).

E geralmente uso o <https://ssstwitter.com/pt> pra salvar. O problema é que eram muitos e daria muito trabalho salvar um a um, então precisava usar algum aplicativo [CLI](https://terminalroot.com.br/tags#cli) para automatizar os downloads.

Pesquisei na internet e inclusive consultei IAs, mas todas as alternativas ou não funcionava ou tinha algum problema no resultado. As alternativas foram:

+ gallery-dl 
+ yt-dlp
+ aria2
+ [curl](https://terminalroot.com.br/tags#curl) ou [wget](https://terminalroot.com.br/tags#wget)

Mas, como havia dito, não resolveu! Então, lembrei que já havia usado um há um tempo atrás que era escrito em [TypeScript](https://terminalroot.com.br/tags#typescript), foi difícil de reencontrá-lo, mas consegui. Trata-se do: **twitter-cli**.


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
Como o **twitter-cli** é escrito em TypeScript, logo, você precisará do [npm](https://terminalroot.com.br/tags#npm) instalado, exemplos em sistemas que usam APT:

{% highlight bash %}
sudo apt install npm
{% endhighlight %}

E depois usar o `npm` pra instalar o Twitter/X CLI:

{% highlight bash %}
sudo npm i twt-dl-cli
{% endhighlight %}
> usei `sudo`, pois ele gravará o executável em: `/usr/local/bin/twt-dl-cli`(no meu caso), mas você pode tentar sem `sudo` ou com o gerenciador de pacotes do seu sistema, exemplo: `winget`, `pacman`, `brew`,...

---

## Utilização
Para utilizá-lo é muito simples, basta rodar o comando e passar a URL do vídeo como argumento, exemplo simples:

{% highlight bash %}
twt-dl-cli https://x.com/dantemendes/status/2110853234411876675
{% endhighlight %}

Ou protejando a URL com "aspas duplas":

{% highlight bash %}
twt-dl-cli "https://x.com/dantemendes/status/2110853234411876675"
{% endhighlight %}

Para muitos arquivos, salve um `txt` com os links, por exemplo:

> Exemplo do arquivo: `links.txt`
{% highlight txt %}
https://x.com/dantemendes/status/2110853234411876675
https://x.com/RedBusRetro/status/2110899778011926592
https://x.com/retrobrave/status/2110740416580723050
https://x.com/oz_shiron/status/2110950109743603769
{% endhighlight %}
> Ou mais links

E faça um loop via linha de comando, exemplo com: [GNU Bash](https://terminalroot.com.br/tags#bash):

> **NOTE** que o `loop` vai de 1 a 4(`{1..4}`) que é a quantidade de linhas do arquivo, altere conforme a quantidade de linhas/URLs que psosui seu arquivo!
{% highlight bash %}
for i in {1..4}; do n=$(sed -n "$i p" links.txt); twt-dl-cli "${n}"; done
{% endhighlight %}

E serve para todos os tipos de vídeos, mesmo os protegidos!

Para mais informações acesse o [repositório](https://github.com/jellydn/twt-dl-cli).


