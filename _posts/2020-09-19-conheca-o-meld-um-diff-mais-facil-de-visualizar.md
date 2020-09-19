---
layout: post
title: "Conheça o Meld, um diff mais fácil de visualizar"
date: 2020-09-19 13:20:42
image: '/assets/img/comandos/meld.jpg'
description: 'Acha difícil reconhecer mudanças com o diff ? Isso pode lhe ajudar! 😃'
icon: 'ion:terminal-sharp'
iconname: 'terminalroot'
tags:
---

![Conheça o Meld, um diff mais fácil de visualizar](/assets/img/comandos/meld.png)

[Meld](https://meldmerge.org/) é uma ferramenta visual de comparação e fusão voltada para desenvolvedores. Meld ajuda a comparar arquivos, diretórios e projetos controlados por versão.

# Instalação
Utilize o repositório da sua distro, exemplos:
{% highlight bash %}
emerge meld # Gentoo, Funtoo, ...
sudo apt install meld # Debian, Ubuntu, Mint, ...
sudo pacman -S meld # Arch, Manjaro, ...
sudo dnf install meld # Red Hat, CentOS, Fedora, ...
{% endhighlight %}

# Utilização
Basicamente é o mesmo conceito do `diff` só que o comando é `meld`, exemplo:
{% highlight bash %}
meld arquivo1.txt arquivo2.txt
{% endhighlight %}

Para um exemplo mais detalhado, criei 2 arquivos [Shell Script](https://terminalroot.com.br/shell/):
+ `cat tchau.sh`
{% highlight bash %}
#!/usr/bin/env bash

function tchau(){
  [[ ! -z $1 ]] && t="$1" || t=$(basename ${HOME})
  printf "%s\n" "Tchau, ${t^}!"
}

tchau $1
{% endhighlight %}
+ `cat oi.sh`
{% highlight bash %}
#!/bin/sh

function oi(){
  [[ ! -z $1 ]] && t="$1" || t=$(basename ${HOME})
  printf "%s\n" "Oi, ${t^}!"
}

oi $1
{% endhighlight %}

Se usarmos o `diff tchau.sh oi.sh` a saída fica assim:
{% highlight bash %}
1c1
< #!/usr/bin/env bash
---
> #!/bin/sh
3c3
< function tchau(){
---
> function oi(){
5c5
<   printf "%s\n" "Tchau, ${t^}!"
---
>   printf "%s\n" "Oi, ${t^}!"
8c8
< tchau $1
---
> oi $1
{% endhighlight %}
Um pouco difícil de visualizar, né ?!

Já com o `meld tchau.sh oi.sh`

![Meld area](/assets/img/comandos/meld-area.jpg)

Existem algumas opções do programa, como por exemplo se formos em: **Arquivo** → **Formatar como patch ...** , salva somente o patch(as mudanças), veja imagem abaixo:

![Meld](/assets/img/comandos/meld-sh.png)

# Referências
+ <https://meldmerge.org/>
+ [opensource](https://opensource.com/article/20/3/meld)


