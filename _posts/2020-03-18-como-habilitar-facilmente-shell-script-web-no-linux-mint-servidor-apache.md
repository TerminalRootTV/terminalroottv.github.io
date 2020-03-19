---
layout: post
title: "Como Habilitar Facilmente Shell Script Web no Linux Mint - Servidor Apache"
date: 2020-03-18 20:19:35
image: '/assets/img/shellpro/shellscript-web.jpg'
description: 'Uma opção CGI para seu Desenvolvimento Web.'
tags:
- shellscript
- desenvolvimentoweb
- linuxmint
- apache
---

![Como Habilitar Facilmente Shell Script Web no Linux Mint - Servidor Apache](/assets/img/shellpro/shellscript-web.jpg)

Uma das facilidades de você utilizar [Shell Script](https://terminalroot.com.br/shell) para seus aplicativos web é que a implementação de diversas funcionalidades(Acesso Banco de Dados, bibliotecas, e principalmente, disponibilidade de todos os comandos UNIX) é bem fácil!

Para muita gente, configurar o servidor Apache para isso pode ser complicado, então para resolver esse impasse, desenvolvemos um script que automaticamente habilita o [Shell Scrip](https://terminalroot.com.br/bash) no Apache de maneira simples e sem perda de tempo!

## Procedimento
Primeiramente baixe o script
{% highlight bash %}
wget terminalroot.com.br/sh/enable-cgi.sh
{% endhighlight %}

Dê permissão de execução
{% highlight bash %}
chmod +x enable-cgi.sh
{% endhighlight %}

E rode: `./enable-cgi.sh` ele vai lhe mostrar um *mini help*:
{% highlight bash %}
usage: enable-cgi.sh [flags]
flags:
     --custom  - For change directory to /var/www/html/sh/ (RECOMMENDED)
     --alias   - For sh alias to cgi-bin
     --default - The file test need to make manually: bit.ly/indexsh
[*]  Don't use 'sudo' and 'root'.
[**] Use this script only systems APT-based.
{% endhighlight %}

Então use-o com o parâmetro `--custom` como **RECOMENDADO**:
{% highlight bash %}
./enable-cgi.sh --custom
{% endhighlight %}

E aguarde o término da execução do script e aguarde que ele abrirá automaticamente o navegador e exibirá uma página exemplo!
# Assista ao Vídeo
<iframe width="920" height="400" src="https://www.youtube.com/embed/JTmYcQpIISU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Veja também:
<iframe width="920" height="400" src="https://www.youtube.com/embed/5hQyfXIMviM" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
