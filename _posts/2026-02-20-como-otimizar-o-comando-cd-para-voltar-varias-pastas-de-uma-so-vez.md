---
layout: post
title: "Como otimizar o comando cd para voltar várias pastas de uma só vez"
date: 2026-02-20 13:13:49
image: '/assets/img/bash/cd-menos.jpg'
description: "Perca menos tempo contando quantas pasta vc precisa voltar com esse hack. 😃"
icon: 'ion:terminal-sharp'
iconname: 'GNU Bash'
tags:
- gnu
- bash
- shell
- terminal
- comandos
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Todos do [mundo UNIX/GNU](https://terminalroot.com.br/tags#gnu) usam constantemente o [comando cd](https://terminalroot.com.br/2014/09/alguns-comandos-gnulinux-por-categorias.html) para entrar em pastas pelo terminal.

O comando `cd`, também conhecido por `chdir`, é um comando implementado em interfaces de linha de comandos de diversos sistemas operacionais ([Unix](https://terminalroot.com.br/tags#unix) ou qualquer um do [tipo Unix](https://terminalroot.com.br/tags#bsd), DOS, [Windows](https://terminalroot.com.br/tags#windows), OS/2 e AmigaOS). 

Nos sistemas [GNU](https://terminalroot.com.br/tags#gnu)(usado pela maioria das distros Linux) ele é um *shell builtin*, ou seja, é um pouco mais complicado de fazer um [patch](https://terminalroot.com.br/2021/06/como-criar-aplicar-e-usar-o-comando-patch.html).

O comando `cd` é muito útil, no entanto, uma das coisas mais *chatas* é quando você entra em muitas pastas e deseja voltar somente um quantidade exata e precisa rodar comando exemplo isso:


{% highlight bash %}
cd ../../../../../../
# Ou
cd ..
cd ..
cd ..
cd ..
cd ..
cd ..
{% endhighlight %}

Em ambos os casos acima, é necessário voltar *6 vezes*.

Mas, podemos criar um [função Bash](https://terminalroot.com.br/tags#bash) que diminue essa quantidade de escrita para facilitar ir de forma mais rápida e *like a boss* para a 6º pasta atrás sem muita dificuldade, assim: `cd -6`, basta adicionar essa função abaixo ao final do seu `~/.bashrc`:

{% highlight bash %}
cd() {
    if [[ "$1" =~ ^-[0-9]+$ ]]; then
        local n=${1#-}
        local path=""
        for ((i=0; i<n; i++)); do
            path+="../"
        done
        builtin cd "$path"
    else
        builtin cd "$@"
    fi
}
{% endhighlight %}

Depois releia o seu `~/.bashrc` com o comando: `exec $BASH` ou `source ~/.bashrc` e depois é só testar:

{% highlight bash %}
cd -6
{% endhighlight %}

Ou seja, use `-`(traço/menos) o número de pastas atrás que deseja, exemplos: `cd -8`, `cd- 7`, `cd -11`,...
> Lembrando que para ir para a pasta pessoal basta rodar: `cd`(sem argumentos) e para retornar onde estava, use: `cd -` sem definir nenhum número!

Simples e prático, né?!


<!-- SQUARE - GAMES ROOT -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

