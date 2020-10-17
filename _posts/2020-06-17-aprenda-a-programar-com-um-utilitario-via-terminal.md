---
layout: post
title: "Aprenda a Programar com um Utilitário via Terminal"
date: 2020-06-17 13:48:07
image: '/assets/img/terminal/cheat-sh.png'
description: 'Um Cheat Sheet via linha de comando.'
icon: 'ion:terminal-sharp'
iconname: 'terminal'
tags:
- terminal
- desenvolvimento
- programacao
- comandos
---

![Aprenda a Programar com um Utilitário via Terminal](/assets/img/terminal/cheat-sh.png)


O [cheat.sh](http://cheat.sh/) é um utilitário via linha de comando baseado em um repositório de documentação concisa dedicada ao aprendizado de linguagens de programação do zero. Você tem acesso a folhas de dicas(Cheat Sheet) para 58 linguagens de programação, cobrindo todas as linguagens populares e muito mais.

<!-- LISTA MIN -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# Instalação
Para utilizá-lo é bem simples, você precisará ter o [curl](https://youtu.be/HxezVt5IEHQ) instalado e depois basta rodar o comando abaixo:
{% highlight bash %}
curl cheat.sh
{% endhighlight %}

Na "paǵina inicial" você já obtém um guia rápido de utilização. E para utilizar a ajuda rápida, basta rodar:
{% highlight bash %}
curl cht.sh/:help
{% endhighlight %}

# Utilizando
Bom, a utilização é tão intuitiva quanto a página inicial, mas vamos à exemplos. Supondo que você está estudando a linguagens de programação [Lua](https://terminalroot.com.br/2016/11/blog-linux-lua.html), para isso basta rodar o comando:
{% highlight bash %}
curl cht.sh/lua
{% endhighlight %}

Antes disso você precisa possuir as dependências instaladas, são elas: [xsel](http://www.vergenet.net/~conrad/software/xsel) e [rlwrap](http://utopia.knoware.nl/~hlub/uck/rlwrap/) , utilize o gerenciador de pacotes da sua distro(*apt*, *dnf*, *pacman*, ...) . Como eu utilizo o [Gentoo](https://www.youtube.com/watch?v=pv4pc0yfe44), o [Portage]() me permite pesquisar ambas dependências em uma linha e instalá-las:

![Gentoo Portage cheat.sh](/assets/img/terminal/gentoo-portage-cheat-sh.png)

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

E depois basta instalá-las:
{% highlight bash %}
sudo emerge xsel rlwrap
{% endhighlight %}

> **DICA GENTOO** Se você também utiliza [Gentoo](https://terminalroot.com.br/2020/03/10-dicas-fundamentais-para-seu-gentoo-linux.html) e no momento está compilando algum outro software, não espere ele terminar, o [Portage](https://wiki.gentoo.org/wiki/Portage) não usa *travas* `.lock` tipo o [APT](https://github.com/terroo/apt) que só permitem uma única instancia, você pode compilar/instalar vários programas paralelos.

Lógico que isso será somente o uma breve introdução. Mas para ir mais longe, recomendo você obter o utilitário no seu sistema, para isso: faça o download e instale globalmente com o comandos:
{% highlight bash %}
mkdir -p ~/.local/bin
curl https://cht.sh/:cht.sh > ~/.local/bin/cht.sh
chmod +x ~/.local/bin/cht.sh
echo 'export PATH="${PATH}:${HOME}/.local/bin"' | tee -a ~/.bashrc
source ~/.bashrc
{% endhighlight %}
> Esse procedimento é para [BASH](https://terminalroot.com.br/bash) se você utiliza [ZSH](https://terminalroot.com.br/2018/02/como-instalar-e-usar-o-shell-zsh-e-o-oh-my-zsh.html), [FISH](https://terminalroot.com.br/2018/01/fish-shell-mais-produtividade-no-seu-shell-script.html) ou qualquer outro Shell altere o arquivo de configuração `~/.bashrc` pelo arquivo correspondente do seu [Shell](https://terminalroot.com.br/shell), exemplo para o ZSH: `~/.zshrc`

# Utilização via Linha de Comando
Continuando com nosso exemplo da linguagens de programação [Lua](http://www.lua.org/). Você pode entrar numa [subshell](https://www.tldp.org/LDP/abs/html/subshells.html) diretamente pelo prompt, exemplo, iniciando o shell dentro do diretório da linguagem:
{% highlight bash %}
cht.sh --shell
cd lua
{% endhighlight %}

A saída será similar à essa imagem:

![cht.sh shell cd lua](/assets/img/terminal/cht-sh-cd-lua.png)

Dentro da **subshell** você pode pesquisar qualquer conteúdo que você deseja obter informação, exemplo, pesquisar sobre listas reversas em `Lua`:
> Exemplo:

{% highlight bash %}
cht.sh/lua> reverse list
--[[
   [ iterator - How to iterate Lua table from end?
   [ 
   [ Thank you, @Piglet, for useful link.
   ]]

local function reversedipairsiter(t, i)
    i = i - 1
    if i ~= 0 then
        return i, t[i]
    end
end
function reversedipairs(t)
    return reversedipairsiter, t, #t + 1
end

-- Actually, I figured out an easier way may be to

local mytable = {'a', 'b', 'c'}
for i = #mytable, 1, -1 do
    value = mytable[i]
    print(i .. ": " .. value)
end
cht.sh/lua> 
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

Para sair basta digitar: `exit`.

Bacana, né?!

# Conclusão
Eu particularmente uso bastante esse utilitário e queria compartilhar isso com vocês, porque acredito que os leitores desse blog são bem parecidos comigo e estão estudando diversas coisas atualmente! :)

Lembrando que há diversos assuntos e linguagens no `cht.sh` para mais detalhes acesse o site: [cheat.sh](http://cheat.sh/) e o [GitHub](https://github.com/chubin/cheat.sh) deles.

Abraço e até a próxima!

# Veja também:
+ [Olá Mundo em 25 Linguagens de Programação: Proposta, Docs e Links.](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html)
+ [Coleção de Shell Script Bash Para Seu Linux](https://youtu.be/Nm1OPSCDBpI)




