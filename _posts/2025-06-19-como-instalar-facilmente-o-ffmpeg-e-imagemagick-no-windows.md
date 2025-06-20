---
layout: post
title: "Como Instalar facilmente o FFmpeg e ImageMagick no Windows"
date: 2025-06-19 21:04:39
image: '/assets/img/windows/ffmpeg-imagemagick-windows.jpg'
description: "🚀 Além de muitos outros como: MySQL, PHP 8.2, NetBeans, DuckDB e muito mais!"
icon: 'ion:terminal-sharp'
iconname: 'Windows'
tags:
- windows
- ffmpeg
- imagemagick
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Possuir diversos utilitários via [linha de comando](https://terminalroot.com.br/tags#comandos) é interessante para o *workflow* do dia a dia.

Aplicativos via [linha de comando](https://terminalroot.com.br/tags#comandos) são rápidos e de fácil acesso.

Dois utilitários importantes de ter no seu sistema são o [FFmpeg](https://terminalroot.com.br/2021/09/15-exemplos-de-uso-diferente-do-ffmpeg.html) e o [ImageMagick](https://terminalroot.com.br/2023/08/como-editar-imagens-com-cpp-e-imagemagick.html).

O **FFmpeg** é um editor de vídeo que você pode fazer: Conversões de formato, extração de frames, Corte de vídeo,... e inúmeras coisas. Para mais informações [veja aqui](https://terminalroot.com.br/2025/06/como-utilizar-o-ffmpeg-com-cpp-windows-e-gnu.html) e [aqui também]().

O **ImageMagick** é um editor de imagem que você pode fazer: Conversões de formato, redimensionamento de imagem, Corte de imagem,... e inúmeras coisas. Para mais informações [veja aqui](https://terminalroot.com.br/2015/03/tratamento-de-imagens-com-imagemagick.html).

Para instalá-los basta usar o `WinGet`(se não possuir instalado, instale via [Microsoft Store](https://learn.microsoft.com/pt-br/windows/msix/app-installer/install-update-app-installer)) via [PowerShell](https://terminalroot.com.br/2025/05/personalize-seu-powershell-like-a-pro.html). Para isso rode os comandos:

+ Para instalar o [FFmpeg](https://winstall.app/apps/Gyan.FFmpeg)

{% highlight powershell %}
winget install --id=Gyan.FFmpeg  -e
{% endhighlight %}

Após instalado, feche e abra o [terminal](https://terminalroot.com.br/2023/04/melhore-seu-desempenho-utilizando-o-windows-terminal.html) e teste convertendo, por exemplo, um vídeo `.mp4` para `.wmv`:
{% highlight powershell %}
ffmpeg -i video.mp4 output.wmv
{% endhighlight %}

+ Para instalar o  [ImageMagick](https://winstall.app/apps/ImageMagick.ImageMagick)
{% highlight powershell %}
winget install --id=ImageMagick.ImageMagick  -e
{% endhighlight %}

Após instalado, feche e abra o [terminal](https://terminalroot.com.br/2023/04/melhore-seu-desempenho-utilizando-o-windows-terminal.html) e teste convertendo, por exemplo, um vídeo `.png` para `.jpg`:
{% highlight powershell %}
magick image.png output.jpg
{% endhighlight %}
> Em sistemas tipo [Unix](https://terminalroot.com.br/tags#unix) usa-se o comando `convert`, mas esse comando já existe no Windows. Geralmente usava-se `magick convert`, mas após mudanças usa-se somente o comando `magick` no Windows. Todo tutorial que você ver usando o comando `convert` no Windows substitua por `magick` somente, que é equivalente a `& 'C:\Program Files\ImageMagick-7.1.1-Q16-HDRI\magick.exe'`.


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

Quase tudo existe no `WinGet`, por exemplo para instalar os Aplicativos:

+ [NetBeans](https://winstall.app/apps/Apache.NetBeans)
{% highlight powershell %}
winget install --id=Apache.NetBeans  -e
{% endhighlight %}

+ [MySQL](https://winstall.app/apps/Oracle.MySQL)
{% highlight powershell %}
winget install --id=Oracle.MySQL  -e
{% endhighlight %}
> **OBSERVAÇÃO**: O MySQL precisa de algumas configurações que você pode encontrar [aqui](https://terminalroot.com.br/2023/05/como-instalar-o-apache-php-8-e-mysql-no-windows.html#mysql), inclusive o método descrito [aqui](https://terminalroot.com.br/2023/05/como-instalar-o-apache-php-8-e-mysql-no-windows.html#mysql) é mais interessante.

+ [PHP 8.2](https://winstall.app/apps/PHP.PHP.8.2)
{% highlight powershell %}
winget install --id=PHP.PHP.8.2  -e
{% endhighlight %}
> **OBSERVAÇÃO**: O PHP precisa de algumas configurações para funcionar no [Apache](https://terminalroot.com.br/2023/05/como-instalar-o-apache-php-8-e-mysql-no-windows.html#1º---instale-o-apache) que você pode encontrar [aqui](https://terminalroot.com.br/2023/05/como-instalar-o-apache-php-8-e-mysql-no-windows.html#php-8), inclusive o método descrito [aqui](https://terminalroot.com.br/2023/05/como-instalar-o-apache-php-8-e-mysql-no-windows.html#php-8) é mais interessante.

+ [DuckDB](https://winstall.app/apps/DuckDB.cli) basta rodar esse comando:
> Saiba mais sobre DuckDB [aqui](https://terminalroot.com.br/2025/03/conheca-um-duckdb-um-banco-de-dados-moderno.html).

{% highlight powershell %}
winget install --id=DuckDB.cli  -e
{% endhighlight %}

---

Aproveite o `WinGet` e esqueça aquela instalação tradicional de baixar executável e ficar clicando em vários *nexts*. Para encontrar um aplicativo para WinGet você pode usar o `search`, exemplo:

{% highlight powershell %}
winget search <nome>
{% endhighlight %}

Ou usar os sites:
+ <https://winstall.app/>
+ e <https://winget.run/>

