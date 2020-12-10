---
layout: post
title: "tldr - Uma manpages mais fácil"
date: 2020-12-10 13:09:51
image: '/assets/img/comandos/tldr.png'
description: 'Consulte páginas do manual via linha de comando.'
icon: 'ion:terminal-sharp'
iconname: 'tldr'
tags:
- comandos
- terminal
---


![tldr - Uma manpages mais fácil](/assets/img/comandos/tldr.png)

**tl;dr** (ou **tldr**) é uma expressão comum da internet, uma abreviação das expressões em inglês "**t**oo **l**ong" e "**d**idn't **r**ead". Em português significam *"longo demais" e "não li"*.

Quem nunca achou *chato* ler as páginas do manual: `man` ? Mas agora há um método mais legal para acabar de vez com a *preguicite*! 😃 

Trata-se do **tldr.sh**. Um utilitário via linha de comando que exibe o `stdout` de maneira mais simplificada e atraente.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Por exemplo, se você quiser obter informações rápidas e precisas de algum comando, (ex.: `install`), basta usar assim: `tldr install`
{% highlight bash %}
tldr install
install
Copy files and set attributes.
Copy files (often executable) to a system location like /usr/local/bin, give them the appropriate permissions/ownership.

Copy files to destination:
install path/to/source path/to/destination

Copy files to destination, setting their ownership:
install -o user path/to/source path/to/destination

Copy files to destination, setting their group ownership:
install -g user path/to/source path/to/destination

Copy files to destination, setting their mode:
install -m +x path/to/source path/to/destination

Copy files and apply access/modification times of source to destination:
install -p path/to/source path/to/destination
{% endhighlight %}

# Como instala ?
Há diversas maneiras de instalar utilizando os mais variados gerenciadores de pacotes de cada linguagem de programação, exs.: `npm`([js](https://terminalroot.com.br/tags#javascript)), `bpkg`([bash](https://terminalroot.com.br/bash/)), `cpan`([perl](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html)), `gem`([ruby](https://terminalroot.com.br/tags#ruby)), `go`, `cargo`, `stack`([haskell](https://terminalroot.com.br/tags#haskell)), `pip`([python](https://terminalroot.com.br/tags#python)) e entre outros, inclusive consultando online no endereço: <https://tldr.ostera.io/> .

Mais a maneira *universal* de funcionar, que foi como eu fiz, é clonar o repositório e mover para sua `${PATH}`:
> Precisa ter o [Git](https://terminalroot.com.br/git/) instalado.

{% highlight bash %}
git clone https://github.com/avih/tldr-fmt
sudo mv tldr-fmt/ttldr /usr/local/bin/tldr
{% endhighlight %}
Se tiver algum caminho local incluido na sua `PATH`, melhor ainda!

Depois é só rodar o comando:
> Na primeira vez, somente na primeira, ele vai fazer um *update* com [curl](https://terminalroot.com.br/tags#curl)

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Exemplo:
{% highlight bash %}
tldr bash
bash
Bourne-Again SHell.
sh-compatible command line interpreter.
More information: https://gnu.org/software/bash .

Start interactive shell:
bash

Execute a command:
bash -c "command"

Run commands from a file:
bash file.sh

Run commands from a file, logging all commands executed to the terminal:
bash -x file.sh

Run commands from a file, stopping at the first error:
bash -e file.sh

Run commands from stdin:
bash -s

Print the version information of bash (use echo $BASH_VERSION to show just the version without license information):
bash --version
{% endhighlight %}

Show esse guia rápido, né?!

Compartilhe esse artigo!

# Página oficial do tldr
## <https://tldr.sh/>

# Fui!


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
