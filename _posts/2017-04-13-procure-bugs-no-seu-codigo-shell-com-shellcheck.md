---
layout: post
title: "Procure bugs no seu Código Shell com ShellCheck"
date: 2017-04-13 08:53:00
image: '/assets/img/shell-script/shellcheck.jpg'
description: "Ferramenta online que faz análise no seu código."
main-class: 'bash'
tags:
- shell-script
- bash
---

![Procure bugs no seu Código Shell com ShellCheck](/assets/img/shell-script/shellcheck.jpg "Procure bugs no seu Código Shell com ShellCheck")

[ShellCheck](http://www.shellcheck.net/) é uma ferramenta que faz __análise no seu código__ procurando erros e lhe retornando um feedback de bugs ou boa práticas de como escrever um código limpo em Shell Script.

### Análises

* Esclarece problemas de __sintaxe__
* Evita problemas com __semântica__
* Adverte sobre __possíveis problemas__

Também há uma [galeria de erros](https://github.com/koalaman/shellcheck/blob/master/README.md#user-content-gallery-of-bad-code) mais comuns em [Shell Script](http://www.terminalroot.com.br/shell/), para você se *nortear*.

### Como Utilizar

Para usar basta você copiar seu código e colar no [endereço da ferramenta online](http://www.shellcheck.net/) que ele automaticamente lhe retorna com o resultado da análise do seu código. No entanto, você também pode utilizar acoplado com o __Editor de Texto__ [Vim](http://www.vim.org/). Você também pode usar no seu próprio __Terminal__, usando o comando:

{% highlight bash %}
shellcheck seu-script.sh
{% endhighlight %}


Para instalar você pode usar o __apt-get, pacman, emerge, yum, zypper__,... correspondente da sua distribuição, exemplo no __Debian__
{% highlight bash %}
apt-get install shellcheck
{% endhighlight %}

## Acesse o endereço da Ferramenta
<http://www.shellcheck.net/>

## GitHub do Projeto
<https://github.com/koalaman/shellcheck>

## Quer aprender Shell Script ou melhorar seus conhecimentos em Bash ?
# Faça o Curso de Shell Script do Iniciante ao Avançado e adquira o conteúdo adicional nesse link
<http://www.terminalroot.com.br/shell/>

# Valeu!
