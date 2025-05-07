---
layout: post
title: "Como Criar Facilmente Extensões para o VSCode"
date: 2025-05-07 19:50:09
image: '/assets/img/vscode/vscode-ext.jpg'
description: "🚀 Nesse vídeo criamos uma extensão para o VSCode que é um Syntax Highlight para a linguagem de programação Mylang."
icon: 'ion:terminal-sharp'
iconname: 'VSCode'
tags:
- vscode
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

☕ Nesse vídeo criamos uma extensão para o [VSCode](https://terminalroot.com.br/tags#vscode) que é um *Syntax Highlight* para a [linguagem de programação Mylang](https://terminalroot.com.br/mylang) que foi desenvolvida no [Curso de Criação de Linguagem de Programação](https://terminalroot.com.br/mylang) com [C++](https://terminalroot.com.br/tags#cpp).

### Instale o NPM
Via <https://nodejs.org/> ou:

Via [WinGet](https://winstall.app/apps/OpenJS.NodeJS) no [Windows](https://terminalroot.com.br/tags#windows) com [PowerShell](https://terminalroot.com.br/tags#powershell):

{% highlight powershell %}
winget install --id=OpenJS.NodeJS  -e
{% endhighlight %}

Ou com o gerenciador de pacotes do seu sistema operacional, exemplo no [Ubuntu](https://terminalroot.com.br/tags#ubuntu):
{% highlight bash %}
sudo apt install npm
{% endhighlight %}

### Crie uma conta no MARKETPLACE da MICROSOFT nesse endereço:
<https://marketplace.visualstudio.com/vscode>

### Instale os pacotes necessários via `npm`
> No caso do Windows não precisa usar o sudo

{% highlight bash %}
sudo npm install -g yo generator-code vsce
{% endhighlight %}

### Inicie os arquivos para a criação da extensão
Rode:

{% highlight bash %}
yo code
{% endhighlight %}

Depois responda o Wizard conforme vimos no [vídeo](https://youtu.be/iKyZXNtwq2A):

{% highlight bash %}

     _-----_     ╭──────────────────────────╮
    |       |    │   Welcome to the Visual  │
    |--(o)--|    │   Studio Code Extension  │
   `---------´   │        generator!        │
    ( _´U`_ )    ╰──────────────────────────╯
    /___A___\   /
     |  ~  |     
   __'.___.'__   
 ´   `  |° ´ Y ` 
...
{% endhighlight %}

### Edite e crie arquivos
+ `README.md` copie e modifique de [ter-vscode](https://github.com/terroo/ter-vscode/blob/main/README.md) e revise!
+ `package.json` , também copie de [ter-vscode](https://github.com/terroo/ter-vscode/blob/main/package.json), mas adicione "icon": "images/icon.png", logo após version e use o nome do seu usuário da conta que vc criou!

Crie o arquivo: `syntaxes/mylang.tmLanguage.json`
{% highlight bash %}
mkdir syntaxes
code syntaxes/mylang.tmLanguage.json
{% endhighlight %}
Copie daqui e modifique conforme necessário: <https://github.com/terroo/ter-vscode/blob/main/syntaxes/terlang.tmLanguage.json>


### Crie o arquivo `.vsix` para publicar
{% highlight bash %}
vsce package
{% endhighlight %}

## Publique!
No [site do MARKETPLACE](https://marketplace.visualstudio.com/)  ou via comando:

{% highlight bash %}
vsce login <seu-publisher:[ID]>
vsce publish
{% endhighlight %}
> Mas, precisa ter um **token** gerado no Azure pelo endereço: <https://dev.azure.com/>. O legal de publicar via linha de comando é que você pode criar novas versões, editar e até excluir extensões!

> Você também pode instalar localmente com o comando: `code --install-extension mylang-0.0.1.vsix`

Mas, pesquise após publicar no Marketplace: <https://marketplace.visualstudio.com/> e também no próprio [VSCode](https://terminalroot.com.br/tags#code)

---

## Assista ao vídeo

<iframe width="1280" height="720" src="https://www.youtube.com/embed/iKyZXNtwq2A" title="Como Criar Facilmente Extensões para o VSCode" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

## Veja também: 
+ [👑 Aprenda a criar sua própria linguagem de programação](https://terminalroot.com.br/mylang)
+ [✅ Aprenda Criação de Games com C++ e SFML](https://terminalroot.com.br/games)
+ [✅ Pacote Promocional C++](https://terminalroot.com.br/promo)
+ [✅ Aprenda C++ e Qt](https://terminalroot.com.br/cpp)
+ [✅ Conheça nossos Cursos](https://bit.ly/CursosTerminalRoot)
+ [🎁 Todos os Cursos na Udemy](https://bit.ly/UdemyTerminalRoot )


