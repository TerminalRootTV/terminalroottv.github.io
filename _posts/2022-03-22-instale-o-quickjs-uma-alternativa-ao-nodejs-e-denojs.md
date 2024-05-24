---
layout: post
title: "Instale o QuickJS uma alternativa ao NodeJS e DenoJS"
date: 2022-03-22 14:04:20
image: '/assets/img/js/quickjs.jpg'
description: 'Um interpretador de JavaScript via linha de comando.'
icon: 'ion:terminal-sharp'
iconname: 'JavaScript'
tags:
- javascript
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**QuickJS** é uma engine JavaScript desenvolvida por Fabrice Bellard, o programador e matemático francês que fundou os projetos [QEMU](https://terminalroot.com.br/2021/02/como-instalar-o-qemu-kvm-no-linux-mint-ubuntu-e-outras-distros.html), [FFmpeg](https://terminalroot.com.br/2021/09/15-exemplos-de-uso-diferente-do-ffmpeg.html) e a fórmula mais rápida para calcular o número **Pi**, além de também desenvolver o formato de imagem BPG e entre outros .

QuickJS é compacto e projetado para ser incorporado a outros sistemas. O código do projeto é escrito em [C](https://terminalroot.com.br/tags#linguagemc) e distribuído sob a licença do MIT.

---

# Instalação
Você pode construir o QuickJS do zero, ou simplesmente fazer o download do binário e instalar. Para isso, proceda sa seguinte forma:

### Baixe a versão mais recente aqui: <https://bellard.org/quickjs/binary_releases/>

> Para Linux 64-bit utilizando [GNU wget](https://terminalroot.com.br/2019/05/aprenda-a-explorar-o-comando-wget.html)
{% highlight sh %}
wget https://bellard.org/quickjs/binary_releases/quickjs-linux-x86_64-2021-03-27.zip
{% endhighlight %}

> Para Windows 64-bit utilizando o [PowerShell](https://terminalroot.com.br/2021/12/como-instalar-powershell-no-ubuntu-e-primeiros-passos.html)
{% highlight sh %}
Invoke-WebRequest -Uri https://bellard.org/quickjs/binary_releases/quickjs-win-x86_64-2021-03-27.zip -OutFile quickjs.zip
{% endhighlight %}

Para 32-bit e outras versões [clique aqui](https://bellard.org/quickjs/binary_releases/)


<!-- SQUARE - GAMES ROOT -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

Após fazer o download, [descompacte](https://terminalroot.com.br/2019/10/como-extrair-varios-formatos-compactados-com-um-comando.html) o arquivo:
{% highlight sh %}
unzip quickjs-*
{% endhighlight %}

E instale no seu sistema:
{% highlight sh %}
sudo install -v qjs /usr/local/bin
{% endhighlight %}

E por fim, teste um arquivo de exemplo:
> `vim example.js`
{% highlight js %}
console.log("Olá, QuickJS!")
{% endhighlight %}

E execute com o comando `qjs`:
{% highlight sh %}
qjs example.js
{% endhighlight %}
> Possível saída: `Olá, QuickJS!`

Para mais informações acesse os links abaixo:
+ <https://bellard.org/quickjs/quickjs.html>
+ <https://github.com/bellard/quickjs>



