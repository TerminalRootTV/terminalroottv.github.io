---
layout: post
title: "Conheça e Instale o Oh My Bash!"
date: 2019-05-22 15:37:56
image: '/assets/img/bash/oh-my-bash-min.jpg'
description: 'Deixe seu Terminal mais atraente para aumentar e melhorar sua vontade de sempre utilizá-lo.'
main-class: 'bash'
tags:
- bash
- shellscript
- shell
- linux
---

![Conheça e Instale o Oh My Bash!](/assets/img/bash/oh-my-bash-min.jpg "Conheça e Instale o Oh My Bash!")

## Introdução
O Oh-My-Bash é um conjunto de estilização para seu terminal e de código aberto para gerenciar suas configurações no BASH. Ele vem com uma tonelada de funções úteis, ajuda, plugins, temas e entre outras coisitas! Se você ouviu falar sobre [Oh-My-Zsh](https://terminalroot.com.br/2018/02/como-instalar-e-usar-o-shell-zsh-e-o-oh-my-zsh.html) antes, este projeto é um *fork* dele, mas em [Bourne Again Shell](https://terminalroot.com.br/shell).

## Instalação

Para fazer a instalação o **Oh My Bash**, você pode escolher entre [cURL](https://curl.haxx.se/) ou [GNU wget](https://www.gnu.org/software/wget/), veja abaixo os comandos:

> Se não possuir o cURL instalado, utilize o gerenciador de pacotes da sua distribuição, ex.: `sudo emerge curl # Para Gentoo e similares`

Via cURL:

{% highlight bash  %}
sh -c "$(curl -fsSL https://raw.github.com/ohmybash/oh-my-bash/master/tools/install.sh)"
{% endhighlight  %}

Via wget:

{% highlight bash  %}
sh -c "$(wget https://raw.github.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)"
{% endhighlight  %}

Veja abaixo a saída do comando quando você instala:
> Perceba que durante a instalação, ele pode perguntar se você deseja checar por atualização, nesse caso você teclar **Y** para aceitar, ou **N** para não atualizar.
{% highlight bash  %}
marcos@gentoo ~ $ sh -c "$(curl -fsSL https://raw.github.com/ohmybash/oh-my-bash/master/tools/install.sh)"
Cloning Oh My Bash...
Cloning into '/home/marcos/.oh-my-bash'...
remote: Enumerating objects: 257, done.
remote: Counting objects: 100% (257/257), done.
remote: Compressing objects: 100% (174/174), done.
remote: Total 257 (delta 17), reused 223 (delta 17), pack-reused 0
Receiving objects: 100% (257/257), 355.64 KiB | 170.00 KiB/s, done.
Resolving deltas: 100% (17/17), done.
Looking for an existing bash config...
Found ~/.bashrc. Backing up to ~/.bashrc.pre-oh-my-bash
Using the Oh My Bash template file and adding it to ~/.bashrc
         __                          __               __  
  ____  / /_     ____ ___  __  __   / /_  ____ ______/ /_ 
 / __ \/ __ \   / __ `__ \/ / / /  / __ \/ __ `/ ___/ __ \
/ /_/ / / / /  / / / / / / /_/ /  / /_/ / /_/ (__  ) / / /
\____/_/ /_/  /_/ /_/ /_/\__, /  /_.___/\__,_/____/_/ /_/ 
                        /____/                            .... is now installed!
Please look over the ~/.bashrc file to select plugins, themes, and options
To keep up on the latest news and updates, follow us on GitHub: https://github.com/ohmybash/oh-my-bash
[Oh My Bash] Would you like to check for updates? [Y/n]: \c
y

{% endhighlight  %}


Ele automaticamente modifica sua variável **PS1** com o tema padrão dele e entra no diretório padrão do Oh-My-Bash. Aconselho você sair do terminal e reabrir para ver se está tudo certo.

## Feature

> Observação: Se após você sair com o comando `exit` e/ou fechar e abrir o terminal, pode ser que apareça esse erro:
{% highlight bash  %}
bash: eval: linha 6: erro de sintaxe próximo ao token inesperado `newline'
bash: eval: linha 6: `Usage: lesspipe <file>'
{% endhighlight  %}

Para solucionar use o seguinte comando, abra o arquivo correspondente com seu [editor de texto preferido](https://terminalroot.com.br/vim) e escape o caminho: `usr/bin/lesspipe` que fica na sexta linha, com aspas duplas, deixando assim: `"usr/bin/lesspipe"` , deixando a linha completa assim:

{% highlight bash  %}
[[ -x "usr/bin/lesspipe" ]] && eval "$(SHELL=/bin/sh lesspipe)"
{% endhighlight  %}

Salve, feche e saia do terminal e reabra.

## Alterando o tema

Existe vários temas disponíveis para o Oh-my-bash , para ver a lista completa use o link:

### <https://github.com/ohmybash/oh-my-bash/tree/master/themes>
### Ou no diretório: `ls ~/.oh-my-bash/themes/`

Para alterar para o tema que você deseja, funciona assim. Supondo que você deseja alterar para o tema **font** (esse é o nome do tema). Abra o arquivo `.bashrc`, procure a linha que começa com a palavra: **OSH_THEME** , geralmente fica na sexta linha e altere para o nome que deseja, exemplo, alterando para o tema *font*

{% highlight bash  %}
OSH_THEME="agnoster"
{% endhighlight  %}

Salve e releia o `.bashrc`

{% highlight bash  %}
source ~/.bashrc
{% endhighlight  %}

> Detalhe: Os temas salvos ficam no diretório: `~/.oh-my-bash/themes/` , alguns temas foram importados do Oh-My-Zsh e do oh-my-fish , logo os nomes podem estar diferentes. Exemplo: o tema **agnoster** mesmo, o Bash irá procurar pelo arquivo: `~/agnoster.theme.sh` , no diretório ele está com o nome: `agnoster-bash.theme.sh`

Para solucionar esse problema, você precisa renomear o tema para o nome correto, assim:

{% highlight bash  %}
cd ~/.oh-my-bash/themes/agnoster/
cp agnoster.base.sh agnoster.theme.sh
{% endhighlight  %}

## Plugins para Linguagens de Desenvolvimento e Frameworks

Para instalar e utilizar os plugins que deseja: git, Django, PHP, Node,... consulte o link dos plugins:

### <https://github.com/ohmybash/oh-my-bash/wiki/Plugins>

Ficou alguma dúvida ou algo que você deseja acrescentar ? Comente!

Não deixe de conhecer nossos cursos de Shell Script, Terminal e outros em:

## <https://terminalroot.com.br/cursos>

## Endereço Oficial do Oh-MyBash!
### <https://ohmybash.github.io/>

Abraços!
