---
layout: post
title: "Como Funciona o Auto Complete no Shell GNU/Linux"
date: 2019-09-26 12:38:38
image: '/assets/img/gnu/tabkey-shell-linux.jpg'
description: 'Dicas para concluir automaticamente os parâmetros'
tags:
- bash
- gnu
- shellscript
---

![Como Funciona o Auto Complete no Shell GNU/Linux](/assets/img/gnu/tabkey-shell-linux.jpg)

Por padrão, depois de instalar o [Gentoo Linux](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=Gentoo) ou outra distribuição, o preenchimento automático no Shell (neste caso, falaremos sobre o [BASH](https://terminalroot.com.br/bash/), no entanto, daremos dicas para os outros shells) não está instalado. Geralmente você o encontra no caminho:

{% highlight bash %}
/etc/bash_completion
bash_completion.d/*
/etc/bash_completion.d/gentoo-style-init
{% endhighlight %}

Ou seja, se você usar [git](https://terminalroot.com.br/git), [man](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=man) , … Você notará que os próximos parâmetros de comando não serão preenchidos automaticamente com a tecla [TAB].

Se você quiser usá-lo no momento, pode usar o comando complete com os argumentos 'c' e 'f'. Exemplo para concluir automaticamente os parâmetros com o comando complete:

{% highlight bash %}
man -cf complete
{% endhighlight %}

Depois de executar este comando, você notará que se você usar o comando `man` e um parâmetro: `man [command]` , exibido agora. Embora com esta solução apareçam algumas observações:

- Ele pode concluir automaticamente vários comandos que nem possuem manual;
- Em outros comandos, pode haver um número excessivo de possibilidades que nem sempre estão vinculadas ao comando que você deseja.

Ao fechar o terminal, você notará que a configuração será perdida (mas, neste caso, você poderá adicioná-la ao seu `~/.bashrc`, por exemplo, `echo 'complete -cf [comando]' >> ~/.bashrc` .

Se você notou alguma "bagunça" no seu Shell, pode "remover" com a opção "r" desta configuração com o comando abaixo:

{% highlight bash %}
man -r complete
{% endhighlight %}

No entanto, a solução mais correta é instalar um aplicativo para o [Shell](https://terminalroot.com.br/bash/) .

Para instalá-lo (No caso do Bash), use:

> No [Gentoo](https://gentoo.org/) , use o *search* da sua distro para saber qual o nome do pacote.	

{% highlight bash %}
emerge --ask app-shells / conclusão do bash
{% endhighlight %}

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

Após a instalação, verifique se os comandos git, man,… estão completando automaticamente os parâmetros com a tecla [TAB] ! Se você deseja ver o arquivo, execute o comando

{% highlight bash %}
cat /etc/bash_completion.d/gentoo-style-init
{% endhighlight %}

Para outros Shells e aplicações, existem as opções abaixo:

{% highlight bash %}
app-shells / zsh-completations
app-shells / tmux-bash-complete
app-shells / mpv-bash-complete
app-shells / gentoo-zsh-completations
{% endhighlight %}

Para mais informações, execute os comandos de pesquisa do Portage:

{% highlight bash %}
emerge --search completion
emerge --searchdesc bash-completion
{% endhighlight %}

## Links úteis

+ <https://www.gnu.org/software/bash/manual/html_node/Programmable-Completion.html>
+ <http://tldp.org/LDP/abs/html/tabexpansion.html>
+ <https://wiki.gentoo.org/wiki/Bash>
+ <https://wiki.gentoo.org/wiki/Bash/Installing_completion_files>
+ <https://wiki.archlinux.org/index.php/Bash>
+ <https://github.com/git/git/blob/master/contrib/completion/git-completion.bash>
+ <https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion>
+ <https://www.vivaolinux.com.br/dica/Habilitando-autocomplete-para-o-sudo-e-man>
+ <https://medium.com/marcos-oliveira/how-auto-complete-works-in-shell-linux-fe3c37b47361>
    
