---
layout: post
title: "Wikit - Obtenha resumos da Wikipedia via Linha de Comando"
date: 2021-03-26 13:49:58
image: '/assets/img/comandos/wikit-wikipedia.jpg'
description: 'Conceitos rápidos sem muito esforço!'
icon: 'ion:terminal-sharp'
iconname: 'linha de comando'
tags:
- comando
- terminal
---

![Wikit - Obtenha resumos da Wikipedia via Linha de Comando](/assets/img/comandos/wikit-wikipedia.jpg)

Todos nós sabemos que o [Wikipédia](https://wikipedia.org/) é uma das maiores invenções da [Web](https://terminalroot.com.br/2020/01/desenvolvimento-web.html) . No entanto, muitas vezes a pessoa já está no terminal e queria somente obter um conceito rápido sobre algo que ela leu , então ela pensa: — Não seria legal existir um utilitário via [linha de comando](https://terminalroot.com.br/tags#comandos) só pra saber do que se trata isso na Wikipédia !?

Sim, existe! É o [Wikit](https://www.npmjs.com/package/wikit), um programa de linha de comando para obter resumos da Wikipedia facilmente.

# Instalação
Bom, antes de mais nada você precisará do [npm](https://terminalroot.com.br/2019/11/como-instalar-nodejs-no-linux-e-primeiros-passos.html) instalado no seu sistema, pois o Wikit é escrito em [JavaScript](https://terminalroot.com.br/2020/03/customize-suas-notificacoes-javascript.html).
{% highlight bash %}
emerge npm # Gentoo, Funtoo, ...
sudo apt install npm # Debian, Ubuntu, Mint, ...
sudo pacman -S npm # Arch, Manjaro, ...
sudo dnf install npm # Red Hat, CentOS, Fedora, ...
{% endhighlight %}

Após isso basta rodar o comando abaixo:
{% highlight bash %}
sudo npm install wikit -g
{% endhighlight %}

E então rode o comando abaixo para ver a versão e saber se está tudo certo:
{% highlight bash %}
wikit --version
{% endhighlight %}

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# Utilização
Antes de mais nada é sempre bom utilizar o `wikit --help` pra ter uma noção geral do programa, a saída será similar ao conteúdo abaixo:
{% highlight bash %}
Usage: $ wikit <query> [-flags]

Quotes are not required for multi-word queries.

  Flags:

    --lang <LANG>        Specify language;
    -l <LANG>            LANG is an HTML ISO language code

    --all                Print all sections of the article
    -a                   Recommended to pipe into a reader e.g. less

    -b                   Open Wikipedia article in default browser

    --browser <BROWSER>  Open article in specific BROWSER

    -d                   Open disambiguation CLI menu

    -D                   Open disambiguation page in browser

    --line <NUM>         Set line wrap length to NUM (minimum 15)

    --link               Print a link to the full article after the summary

    --version / -v       Print installed version number

    --name / -n          Print the CLI name: wikit

  Examples:

    $ wikit nodejs

    $ wikit empire state building --link

    $ wikit linux -b

    $ wikit jugo --lang es
{% endhighlight %}

# Exemplos
Vamos pesquisar a palavra [Linux](https://terminalroot.com.br/tags#linux), o comando seria:
{% highlight bash %}
wikit linux
{% endhighlight %}
> E a saída:

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

![Wikit Linux](/assets/img/comandos/wikit-linux.png)

Ahhh, mas a saída foi em inglês, teria como alterar a saída para português ? Sim, sem problemas, basta usar o parâmetro `--lang` ou somente `-l` seguido do idioma, exemplo:
{% highlight bash %}
wikit --lang pt linux
{% endhighlight %}
> Saída:

![Wikit Linux pt](/assets/img/comandos/wikit-linux-pt.png)

É possível abrir a url diretamente no browser com o parâmetro `-b`:
{% highlight bash %}
wikit --lang pt linux -b
{% endhighlight %}
> Será aberto no seu navegador padrão.

Vocês podem perceber que a saída são em poucas colunas, se quiser que as colunas sejam maiores, basta definir o tamanho com `--line`, exemplo:
{% highlight bash %}
wikit --lang pt linux --line 180
{% endhighlight %}

E entre outras opções que vimos no `wikit --help` . 

Espero que tenha gostado e seja útil!

Abraços!

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


