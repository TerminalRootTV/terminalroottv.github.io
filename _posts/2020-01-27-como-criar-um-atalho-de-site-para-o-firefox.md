---
layout: post
title: "Como Criar um ATALHO de Site para o Firefox"
date: 2020-01-27 18:00:12
image: '/assets/img/firefox/atalho-site-firefox.jpg'
description: 'Quer abrir um site só clicando em um ícone? Vem com nós!'
tags:
- firefox
- web
- desktop
---

[![Como Criar um ATALHO de Site para o Firefox](/assets/img/firefox/atalho-site-firefox.jpg "Como Criar um ATALHO de Site para o Firefox")](/assets/img/firefox/atalho-site-firefox.jpg)

Supondo que você quer criar um **atalho para o site** [Terminal Root](https://terminalroot.com.br) no [Firefox](https://www.mozilla.org/pt-BR/firefox/new/).

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

## 01. Primeiro passo, ter o subdiretório local de app
> Se existir esses diretórios, esse comando não vai fazer, mas se não existir irá criá-los nessa ordem.

{% highlight bash %}
mkdir -p ~/.local/share/applications
{% endhighlight %}

## 02. Crie o atalho
> Mude o nome do arquivo(`terminalroot.desktop`) de acordo com sua intenção, ex.: **seusite.desktop**

{% highlight bash %}
vim ~/.local/share/applications/terminalroot.desktop
{% endhighlight %}

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

> Verifique também o caminho do seu [Firefox](https://www.mozilla.org/pt-BR/firefox/new/) , no meu caso está em `/usr/bin/firefox` , descubra com o comando `which firefox`. E altere as linhas que contém o nome **Terminal Root** em `Name` para o nome que desejar, bem como a url do site(**https://terminalroot.com.br**) na última linha referente ao valor de **Exec**.

{% highlight ini %}
[Desktop Entry]
Name=Terminal Root
Type=Application
MimeType=text/html
Icon=firefox
Terminal=false
Exec=/usr/bin/firefox https://terminalroot.com.br
{% endhighlight %}

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

Se quiser , para evitar problemas dê permissão de execução `chmod +x ~/.local/share/applications/terminalroot.desktop` .

Perceba que a linha com valor **Icon** irá procurar uma imagem de nome `firefox`(png, jpg ou svg) em `/usr/share/pixmaps/` , se não tiver uma imagem com esse nome lá, o ícone não aparecerá. Mas você pode salvar uma lá com o nome que quiser e alterar o nome também no arquivo.

Depois disso é só procurar no **Dash/Launcher** .

Dúvidas ?! Manda aê nos comments!

Valeuuu!
