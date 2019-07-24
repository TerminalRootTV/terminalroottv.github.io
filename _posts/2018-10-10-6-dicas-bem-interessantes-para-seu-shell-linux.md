---
layout: post
title: "6 Dicas Bem Interessantes para seu Shell Linux"
date: 2018-10-10 19:49:25
image: '/assets/img/shellpro/6-dicas-shell-linux.jpg'
description: 'Esse vídeo é o 2º Episódio da série Como Criar Shell Script Profissional.'
main-class: 'bash'
tags:
- shellpro
- bash
- shellscript
- terminal
---

![6 Dicas Bem Interessantes para Seu Shell Linux](/assets/img/shellpro/6-dicas-shell-linux.jpg "6 Dicas Bem Interessantes para Seu Shell Linux")

Esse vídeo é o 2º Episódio da série Como Criar Shell Script Profissional baseado no [Curso Extremamente Avançado de Shell Script](http://terminalroot.com.br/shell) , adquira para poder acompanhar de maneira mais fácil os vídeos da série . Antes mesmo de continuarmos a criação do nosso mini-aplicativo, é uma boa ideia mostrar essas dicas para caso vcs vejam algo que eu fiz, entenda o que é, então, vamos às **6 Dicas Interessantes para o Shell Linux**.

# 1 - Saída do comando `cat` Colorido

```sh
wget https://github.com/jingweno/ccat/releases/download/v1.1.0/linux-amd64-1.1.0.tar.gz
tar xfz linux-amd64-1.1.0.tar.gz
cp linux-amd64-1.1.0/ccat /usr/local/bin/
echo "alias cat='/usr/local/bin/ccat'" >> ~/.bashrc
source ~/.bashrc
ccat --html /etc/fstab > ccat.html
```

Saiba mais: <https://github.com/jingweno/ccat>


***

# 2 - Customizando o `history` do Shell

- Por padrão o comando `history` exibe somente o número da ordem do comando e o comando utilizado
- Para executar um comando do `history`, bastar usar um '*sinal de exclamação*' **!** e o número do comando, exemplo: `!480`, o shell irá executar o comando de número correspondente.

```sh
echo 'export HISTTIMEFORMAT="%d/%m/%y %T "' >> ~/.bashrc
help history
man 3 strftime
man history
history -c # limpa tudo
```

***

# 3 - Customizando a aparência do seu prompt de comando (Variável `PS1`)

- A primeira coisa que você vê quando abre o terminal é o prompt de comando, para entender melhor ele, podemos dizer que é uma "*barra indicadora*" da sua posição no Shell.
- A aparência dele depende diretamente da variável PS1 , que pode ser configurada nos arquivos: `~/.bashrc`, `.profile` ou qualquer arquivo que faça parte da árvore recursiva .

```sh
export PS1="\e[32;1m\u \e[33;1m→ \e[36;1m\h \e[37;0m\w\n \e[35;1m⚡\e[m"
```

***

# 4 - Colorindo o `man` e tornando a leitura mais amigável

- O manual do sistema é uma das partes mais acessados pelo Shell, e muita gente não gosta muito de utilizá-lo, pois acha ele técnico demais dizendo que não consegue entender bem.
- Copie o comando abaixo e cole no final do seu `.bashrc` e depois abra o manual e veja a diferença

```sh
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
```


***

# 5 -   Procure bugs no seu Código Shell com `shellcheck`

O ShellCheck é uma ferramenta de análise estática para shell scripts.

+ `man shellcheck`
+ **-a** - Procura bugs também em arquivos relacionados, ex.: "source, ./, ..."
+ **disable=NUMERO** - Desabilita um número de erro, insira o conteúdo como comentário, ex.: # shellcheck disable=2155
+ ShellCheck Online: <http://www.shellcheck.net/>

Saiba mais: <http://terminalroot.com.br/2017/04/procure-bugs-no-seu-codigo-shell-com-shellcheck.html>


***

# 6 - Obtenha Explicações dos Comandos do Shell

Quer saber o que tal comando faz ? Então copie a LINHA do comando e cole no campo de pesquisa no site <https://explainshell.com/> e obtenha detalhes sobre tal comando(s).

Saiba mais: <http://terminalroot.com.br/2017/04/obtenha-explicacoes-dos-comandos-do-shell.html>

# [Clique Aqui Para Assistir ao Vídeo](https://youtu.be/2IaQQ9MFYn0)

## Comente sobre o que gostaria de ver na série!

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

