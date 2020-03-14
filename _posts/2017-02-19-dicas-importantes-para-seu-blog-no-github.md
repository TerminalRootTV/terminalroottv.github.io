---
layout: post
title: "Dicas Importantes para seu Blog no GitHub"
date: 2017-02-19 20:31:50
image: '/assets/img/gitgithub/dicasgithub.jpg'
description: "Não digitar toda hora git add, commit e push...entre outras dias valiosíssimas"
tags:
- github
---

![Dicas Importantes para seu Blog no GitHub](/assets/img/gitgithub/dicasgithub.jpg "Dicas Importantes para seu Blog no GitHub")


# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=sOSWfN6iGno)


## Dicas passadas no Vídeo

* __Não__ digitar toda hora __git add__, __commit__ e __push__
* __Não__ pôr __login__ e __senha__ ao dar um __push__
* __App__ pra criar um __post__ pré-pronto
* Como ver seu blog antes de carregar pro GitHub
* Como usar o __Jekyll__
* Dicas pro seu Temas

## ~/.netrc
{% highlight bash %}
machine github.com login SEU_USUARIO password SUA_SENHA
{% endhighlight %}

## ~/postar
> echo "alias=~/postar" >> ~/.bashrc

conteúdo do __postar__

{% highlight bash %}
#!/bin/bash
git add -A
git commit -m "new post"
git push origin master
{% endhighlight %}

## Rode esse comando antes de visualizar no *localhost*
{% highlight bash %}
jekyll build
{% endhighlight %}

## Rode esse comando e depois do __server runing__ acesse o endereço [http://0.0.0.0:4000](http://0.0.0.0:4000)
{% highlight bash %}
jekyll serve --watch
{% endhighlight %}

## Dowload do initpost.sh
{% highlight bash %}
wget https://raw.githubusercontent.com/terminalrootsh/terminalrootsh.github.io/master/initpost.sh
{% endhighlight %}

### Faltando alguma coisa, avise-nos!

# Comente!

![Blog Linux Dicas GitHub](/assets/img/gitgithub/dicashub.jpg "Blog Linux Dicas GitHub")

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

