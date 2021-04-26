---
layout: post
title: "Converta imagens WEBP para JPG e GIF facilmente"
date: 2021-04-26 08:41:33
image: '/assets/img/dicas/webp2jpg-webp2gif.jpeg'
description: 'Uma mão na roda!'
icon: 'ion:terminal-sharp'
iconname: 'multimídia'
tags:
- dicas
- multimidia
- comandos
---

![Converta imagens WEBP para JPG e GIF facilmente](/assets/img/dicas/webp2jpg-webp2gif.jpeg)

Baixou aquela imagem maneira na internet e não consegue visualizá-la no seu PC ?

Seus problemas acabaram! Basta instalar o [ImageMagick](https://terminalroot.com.br/2015/03/tratamento-de-imagens-com-imagemagick.html) e o pacote [Webp](https://terminalroot.com.br/tags#multimidia) e converter facilmente!

Exemplo de instalação nas distros baseadas em APT:
{% highlight bash %}
sudo apt install webp imagemagick
{% endhighlight %}

Para converter uma única imagem de `webp` para `jpg`:
{% highlight bash %}
convert image.webp image.jpg
{% endhighlight %}

Para converter várias imagens `webp` para `jpg` com um único comando:
{% highlight bash %}
convert *.webp image.jpg
{% endhighlight %}

> As imagens serão criadas com os nomes: `image-1.jpg, image-2.jpg, ...`, para não ficar bagunçado é bom depois rodar um `rm *.webp` .

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


E como converter WEBP para GIF ? Molezinha!

Basta fazer o download de um script pronto:
{% highlight bash %}
wget https://git.io/webp2gif && chmod +x webp2gif
{% endhighlight %}

E depois converter:
{% highlight bash %}
./web2gif image.webp image.gif
{% endhighlight %}

Fácião, né?!

Fui!

