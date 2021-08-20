---
layout: post
title: "Um fetch escrito em Perl para seu rice"
date: 2021-08-20 08:05:10
image: '/assets/img/outros/fm6000/astronaut.jpg'
description: 'Com opções de várias imagens ASCII diferentes.'
icon: 'ion:terminal-sharp'
iconname: 'Perl'
tags:
- perl
- terminal
---

![Um fetch escrito em Perl para seu rice](/assets/img/outros/fm6000/astronaut.jpg)

**Fetch-master 6000** é o [fetch](https://terminalroot.com.br/2019/01/como-criar-um-fetch-estilo-screenfetch-e-neofetch-em-shell-script.html) moderno com diversas opções de cores, imagens ASCII e entre outros.

Foi escrito na [linguagem de programação](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html) Perl, logo, funciona sem dependências adicionais tanto no [Linux](http://www.terminalroot.com.br/tags#linux) quanto no [BSD](https://terminalroot.com.br/tags#bsd) .

# Instalação
Para instalar há duas formas, se você tiver o [wget](https://terminalroot.com.br/2019/05/aprenda-a-explorar-o-comando-wget.html):
{% highlight bash %}
wget https://raw.githubusercontent.com/anhsirk0/fetch-master-6000/master/fm6000.pl -O fm6000
{% endhighlight %}

Ou pelo [curl](https://terminalroot.com.br/2019/10/12-dicas-para-voce-usar-o-comando-curl-como-um-ninja.html):
{% highlight bash %}
curl https://raw.githubusercontent.com/anhsirk0/fetch-master-6000/master/fm6000.pl --output fm6000
{% endhighlight %}


<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Após baixado, dê permissão de execução:
{% highlight bash %}
chmod +x fm6000
{% endhighlight %}

Caso tenha erro na linha sobre `dpkg-query`, rode esse comando para resolver:
{% highlight bash %}
sed -i '/dpkg/s/^/#/g' fm6000
{% endhighlight %}

Ou via script [Bash](https://terminalroot.com.br/bash):
{% highlight bash %}
bash -c "$(curl https://raw.githubusercontent.com/anhsirk0/fetch-master-6000/master/install.sh)"
{% endhighlight %}

# Utilização
Para exibir basta rodar o script:
{% highlight bash %}
./fm6000
{% endhighlight %}

![fm6000](/assets/img/outros/fm6000/all1.png)

Se quiser opções de imagens ASCII alternativas, use o `--help` para todas opções.

Para usar artes ASCII alternativas, faça o download do `txt` [nesse diretório](https://github.com/anhsirk0/fetch-master-6000/tree/master/ascii_arts) e informe o txt via linha de comando, exemplo:

{% highlight bash %}
./fm6000 -f wolf.txt
{% endhighlight %}

![fm6000 wolf](/assets/img/outros/fm6000/wolf.png)

Se quiser instalar no seu sistema:
{% highlight bash %}
sudo install -v fm6000 /usr/local/bin/
{% endhighlight %}
> Ou use um diretório local que esteja na sua `$PATH`


<!-- RETANGULO LARGO 2 -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:block; text-align:center;"
data-ad-layout="in-article"
data-ad-format="fluid"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="8549252987"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

![fm6000 distro](/assets/img/outros/fm6000/arch_logo.png)

Visite o repositório do fm6000: <https://github.com/anhsirk0/fetch-master-6000>

