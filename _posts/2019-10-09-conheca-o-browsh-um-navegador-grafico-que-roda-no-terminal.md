---
layout: post
title: "Conheça o Browsh - Um Navegador Gráfico que roda no Terminal"
date: 2019-10-09 10:27:00
image: '/assets/img/terminal/youtube.png'
description: 'Um navegador baseado em texto totalmente interativo, em tempo real e moderno.'
tags:
- browsh
- navegador
- firefox
---

![Conheça o Browsh - Um Navegador Gráfico que roda no Terminal](/assets/img/terminal/youtube.png)

Já faz tempo que eu conheci esse navegador, mas somente hoje resolvi compartilhar ele com vocês.

## Introdução

o [Browsh](https://www.brow.sh/) é um navegador que roda em modo texto e é escrito em [Go](https://golang.org/) . Ele utiliza uma instância do [Firefox](https://terminalroot.com.br/2014/09/complementos-uteis-para-firefox.html) e roda no terminal .

## Por que usar o Browsh?

Boa pergunta . Mas segundo as palavras do pŕoprio desenvolvedor do Browsh, seriam justificativas:

+ Pra quem tem uma internet lenta;
+ Melhor do que [VNC](https://terminalroot.com.br/2016/11/blog-linux-ssh.html);
+ Pra quem possui um Raspberry Pi ou similares;
+ Menos consumo de tudo, principalmente de eletricidade.

Eu, sinceramente, gostei das justificativas! :)

## Instalação

Você pode tanto baixar o arquivo binário e executar:

> Versão para qualquer Linux amd64

{% highlight bash %}
wget https://github.com/browsh-org/browsh/releases/download/v1.6.4/browsh_1.6.4_linux_amd64 -O browsh
chmod +x browsh
{% endhighlight %}

Para outras arquiteturas, veja a página de [releases](https://github.com/browsh-org/browsh/releases) e inclusive o código fonte tá lá.

> É necessário possuir o Firefox instlado, se não tive ou o arquivo para PATH estiver com outro nome, crie um link simbólico, que foi o meu caso. Meu Firefox é `firefox-bin` , logo precisei rodar esse comando pra funfar: `sudo ln -s /usr/bin/firefox-bin /usr/local/bin/firefox`

Depois é só movê-lo(instalá-lo) para um diretório do sistema, exemplo:

{% highlight bash %}
install -D -v browsh -t /usr/local/bin/browsh
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

## Utilizando

Assim que você rodar `./browsh` ou executar pós instalado:

{% highlight bash %}
browsh
{% endhighlight %}

Ele vai abrir por padrão a página inicial do projeto: <https://www.brow.sh/>

![Browsh](/assets/img/terminal/browsh.png)

Se quiser navegar em outro site, tecle: **`Ctrl + q`** e digite o site que deseja:

![Terminal Root](/assets/img/terminal/terminalroot.com.br.png)

O legal é que até os efeitos [Javascript](https://terminalroot.com.br/2016/12/alguns-codigos-simples-de-javascript-2.html) funcionam nele huahuahauhau!

Outros comando de navegação e utilização:

+ **F1** - Abre a documentação
+ **Setas direcionais do teclado → ← ↑ ↓** - Rolagem da paǵina
+ **CTRL + l** - Cria um focu na barra de URL para que você digite o site que deseja
+ **CTRL + r** - Recarregar a página
+ **CTRL + t** - Abre uma nova aba
+ **CTRL + w** - Fecha uma aba
+ **BACKSPACE** - Retorna a paǵina anterior do history do navegador
+ **CTRL + q** - Sai do programa

Para mais informações acesse a documentção: <https://www.brow.sh/docs/introduction/>
    
