---
layout: post
title: "Como Extrair Vários Formatos Compactados com um Único COMANDO"
date: 2019-10-16 10:25:26
image: '/assets/img/terminal/extract.jpg'
description: 'Evita de você ficar memorizando comandos e opções.'
tags:
- extract
- dicas
- unix
---

[![Como Extrair Vários Formatos Compactados com um Único COMANDO](/assets/img/terminal/extract.jpg)](/assets/img/terminal/extract.jpg)

Dia desse eu estava meio *estressado* com diversos tipos de formatos que eu havia pra descompactar e eu lembrei de um software que eu havia criado para o pacote [terminalutils](https://terminalroot.com.br/2017/11/como-instalar-e-utilizar-o-pacote-terminalutils.html)(**descontinuado**) e resolvi reescrever o software com mais opções e otimizações.

## Introdução
O comando [extract](https://github.com/terroo/extract) reconhece e extrai automaticamente vários tipos de formatos MIME de arquivos compactados se estiver instalado, caso contrário, ele diz 'comando não encontrado' e você precisará instalar o software apropriado posteriormente.

## Instalação
Para instalá-lo é bem simples, basta clonar o repositório , entrar no mesmo e usar o comando [make](https://ftp.gnu.org/old-gnu/Manuals/make-3.80/html_chapter/make_5.html):
{% highlight bash %}
git clone https://github.com/terroo/extract
cd extract
sudo make install
{% endhighlight %}

## Utilização
### Exibe uma ajuda rápida:
{% highlight bash %}
extract --help
{% endhighlight %}
> Ou somente: `extract -h`

### Exibe o manual:
{% highlight bash %}
man extract
{% endhighlight %}
[![Manual extract](/assets/img/terminal/man-extract.jpg)](/assets/img/terminal/man-extract.jpg)

### Extrai um arquivo compactado:
> Exemplo, se o formato for *tbz2*
{% highlight bash %}
extract file.tbz2
{% endhighlight %}

### Extrai um arquivo compactado no modo VERBOSE (*detalhamento na saída*):
> Exemplo, se o formato for *lzma*
{% highlight bash %}
extract --verbose file.tbz2
{% endhighlight %}
> Ou somente: `extract -v file.tbz2`

- Lista uma tabela tutorial para compactar e descompactar diretamente:
{% highlight bash %}
extract --list
{% endhighlight %}
> Ou somente: `extract -l`
[![List extract](/assets/img/terminal/list-extract.jpg)](/assets/img/terminal/list-extract.jpg)

## Resolvendo problemas
Se você encontrar algum tipo de problema, por gentileza, relate o mesmo no endereço: <https://github.com/terroo/extract/issues>

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

## Se quiser desinstalar
Se ainda tiver com o repositório na sua máquina, basta entrar no mesmo e rodar o comando: `sudo make uninstall` , se não tiver mais o diretório/repositório , clone ele novamente.

Espero que ajude, abraços!
    
