---
layout: post
title: "Como Instalar e Usar o Shell ZSH e o Oh My Zsh!"
date: 2018-02-23 15:32:47
image: '/assets/img/shell-script/zsh-oh-my-zsh.jpg'
description: 'Zsh é um shell de login interativo que também pode ser usado como um poderoso intérprete de linguagem de script. É semelhante ao bash e ao Korn shell, mas oferece uma grande capacidade de configuração.'
main-class: 'artigos'
tags:
- shellscript
---

[Zsh](http://www.zsh.org/) é um [shell](http://terminalroot.com.br/shell) de login interativo que também pode ser usado como um poderoso intérprete de linguagem de script. É semelhante ao [bash](http://terminalroot.com.br/tags/#bash) e ao Korn shell, mas oferece uma grande capacidade de configuração.

## Instalação

Se você não souber o comando para instalação do ZSH através do gerenciador de pacotes da sua distribuição, tente usar a ferramenta de pesquisa, ex.: (apt-cache serch [pacote], yum search [pacote],...)

No [Gentoo](http://terminalroot.com.br/tags/#gentoo) a instalação consiste em

+ __zsh-completions__ - para autocompletar as palavras
+ __gentoo-zsh-completions__ - para autocompletar os argumentos do Portage

{% highlight bash %}
emerge -a zsh zsh-completions gentoo-zsh-completions
{% endhighlight %}

Após instalação, basta rodar o comando: <kbd>zsh</kbd>

Automaticamente ele nos irá pedir para configurar a criação do arquivo __~/.zshrc__ , mas como vamos instalar o __Oh My Zsh !__ , vamos ignorar apertando __-q__ (sair e não criar esse arquivo) para todos, pois será criado automaticamente pelo OhMyZsh!

Agora vamos instalar o __Oh My Zsh !__ Que é um framework para o Zsh . O endereço dele é o
<https://github.com/robbyrussell/oh-my-zsh>, rode esse comando para baixar e instalá-lo

{% highlight bash %}
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
{% endhighlight %}

Agora veja que o arquivo __~/.zshrc__ foi criado e já configurado, só rodar um
{% highlight bash %}
source ~/.zshrc
{% endhighlight %}

Perceba que um tema default já foi automaticamente configurado, vamos analisar o arquivo precriado e configurado pelo OMZSH:

{% highlight bash %}
vim ~/.zshrc
{% endhighlight %}

Na linha correspondente a __THEMES__ você pode alterar o tema de acordo com esse link <https://github.com/robbyrussell/oh-my-zsh/wiki/themes> , onde há diversos temas, todos os temas já estão presentes, basta você utilizá-lo, vamos ver três temas preferidos por mim: <em>bira</em>, <em>funky</em> e o <em>gnzh</em>!

Para alterar do bash para o zsh basta rodar o comando <kbd>chsh -s /bin/zsh</kbd> ao encerrar a sessão e entrar novamente, o shell já estará mudado.

Para mais informações, consulte o manual: <kbd>man zsh</kbd>

# Assista ao Vídeo

# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=dn0usA-mI4A)


Comente!


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

