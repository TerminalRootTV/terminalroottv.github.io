---
layout: post
title: "VSCodium - Um VS Code Open Source que NÃO te rastreia"
date: 2019-04-18 14:03:26
image: '/assets/img/editores/vscodium.png'
description: 'O VSCodium é um fork idêntico ao Visual Studio Code da Microsoft, somente com o ícone diferente.'
main-class: 'dica'
tags:
- vscodium
- vscode
- windows
- shellscript
- bash
---

![VSCodium - Um VS Code Open Source que NÃO te rasrtreia](/assets/img/editores/vscodium.png)

## Introdução

O [VSCodium](https://vscodium.com/) é um editor idêntico ao [Visual Studio Code](https://code.visualstudio.com/) da Microsoft, mas as únicas diferenças é que o ícone é diferente e o melhor de tudo, ele não possui *trackers* e nem telemetria para medir e saber o que você desenvolve.

Está disponível para [Windows](http://terminalroot.com.br/2019/04/como-acessar-o-windows-pelo-linux-com-metasploit.html), [macOS](http://terminalroot.com.br/2018/03/como-instalar-o-mac-os-x-em-virtualbox-no-linux.html) e [Linux](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=Linux). Ele vem com suporte embutido para [JavaScript](http://terminalroot.com.br/2018/01/rodando-javascript-via-terminal-e-shell-via-js.html), [TypeScript](https://www.typescriptlang.org/) e [Node.js](https://nodejs.org) e possui um rico ecossistema de extensões para outras linguagens (como C++, C#, Java, Python, PHP, Go) e tempos de execução (como .NET e Unity).

O VSCodium tem suporte nativo ao [Git](http://terminalroot.com.br/git) e é uma Software Livre de Código Aberto licenciado pela [MIT License](https://opensource.org/licenses/MIT) .

## Instalação

Você pode baixar e instalar o VSCodium diretamente da [página de downloads](https://github.com/VSCodium/vscodium) onde há diversas versões para diferentes arquiteturas e sistemas operacionais. Além do *tar.gz* para qualquer distribuição Linux , existe também o *.deb* para Debian, Ubuntu, Linux Mint e derivados. Ou você pode usar o próprio APT pra isso, com os seguintes comandos:

Adicone primeiro a chave pública
{% highlight bash  %}
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add -
{% endhighlight  %}

Insira o repositório no diretório *source.list.d/*
{% highlight bash  %}
echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list
{% endhighlight  %}

Atualize o APT e instale o VSCodium
{% highlight bash  %}
sudo apt update && sudo apt install vscodium
{% endhighlight  %}

E pronto! Basta procurar o VSCodium no dash do seu ambiente!

## Links Úteis

+ Página oficial do VSCodium: <https://vscodium.com/>
+ GitHub do VSCodium: <https://github.com/VSCodium/vscodium>


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
