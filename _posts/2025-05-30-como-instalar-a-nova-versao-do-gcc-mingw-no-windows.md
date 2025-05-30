---
layout: post
title: "Como Instalar a Nova Versão do GCC MinGW no Windows"
date: 2025-05-30 13:34:47
image: '/assets/img/windows/gcc-windows.jpg'
description: "🦬 GCC 15 com procedimento muito mais fácil!"
icon: 'ion:terminal-sharp'
iconname: 'Terminal Root'
tags:
- gcc
- windows
- linguagemc
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Nós já fizemos essa postagem sobre instalar [GCC MinGW no Windows](), mas se tornou obsoleta, é a versão antiga: ~~8.1.0~~. 

Nesse rápido artigo veremos como atualizar ou instalar, caso você ainda não tenha, e fazer isso facilmente.


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

## Instalação
### Se você chegou a instalar a versão do outro artigo
Antes de mais nada remova(ou renomei) a pasta:
> Abra o [PowerShell](https://terminalroot.com.br/tags#powershell) com privilégios de administrador.

Renomear:
{% highlight powershell %}
Rename-Item -Path "C:\mingw64" -NewName "mingw64-old"
{% endhighlight %}

Ou remova a instalção:
{% highlight powershell %}
Remove-Item -Path "C:\mingw64" -Recurse -Force
{% endhighlight %}

### Agora basta fazer o download do arquivo compactado no endereço:
+ <https://sourceforge.net/projects/winlibs-mingw/>

Ou o download direto:
<https://sourceforge.net/projects/winlibs-mingw/files/latest/download>

### Descompacte o arquivo
Se após você descompactar não criou a pasta: `mingw32` é porque dentro da pasta: `winlibs-i686-mcf-dwarf-gcc-15.1.0-mingw-w64ucrt-12.0.0-r1/` vai estar a pasta `mingw32/`.

Mova ela para a unidade `C:\`:
{% highlight powershell %}
Move-Item -Path "mingw32" -Destination "C:\"
{% endhighlight %}

Renomei ela para `mingw64`:
{% highlight powershell %}
Rename-Item -Path "C:\mingw32" -NewName "mingw64"
{% endhighlight %}

### Adicione à variável do sistema `PATH`
Faça isso se é a sua primeira instalação, se você está atualizando, ou seja, havia feito o procedimento do artigo anterior, não precisa.

> Abra o [terminal](https://terminalroot.com.br/2025/05/personalize-seu-powershell-like-a-pro.html) com privilégios de administrador e rode o comando abaixo:

{% highlight powershell %}
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\mingw64", "Machine")
{% endhighlight %}

Agora é só ver a versão, rode:
> Se for sua primeira instalação é necessário fechar e abrir o [terminal](https://terminalroot.com.br/2025/05/personalize-seu-powershell-like-a-pro.html) novamente!

{% highlight powershell %}
g++ --version
{% endhighlight %}
> `15.1.0`

A saída completa será:
{% highlight powershell %}
g++.exe (MinGW-W64 i686-ucrt-mcf-dwarf, built by Brecht Sanders, r1) 15.1.0
Copyright (C) 2025 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
{% endhighlight %}

Essa versão está disponível em [https://winlibs.com](https://winlibs.com) e a mesma indica esse link do *sourceforge*, mas há outras versões lá para outros procedimentos.

Se quiser usar o comando `make`, lembre-se de renomeá-lo: de `C:\mingw64\bin\mingw32-make` para `C:\mingw64\bin\make`.

{% highlight powershell %}
Rename-Item -Path "C:\mingw64\bin\mingw32-make" -NewName "make"
{% endhighlight %}

