---
layout: post
title: "Instale o Tema Dracula no seu Gedit"
date: 2019-12-11 08:40:43
image: '/assets/img/gedit/gedit.png'
description: 'Disponível para diversos editores, IDEs, Shells e outros.'
tags:
- gedit
- tema
- temas
---

![Gedit Dracula](/assets/img/gedit/gedit.png)

[Dracula](https://draculatheme.com/gedit/) é um *colorscheme* disponível para diversos editores, IDEs, Shells e outros. Não existe segredo para instalá-lo e vamos mostrar nessa dica super rápida.

## 1. Baixe o tema:
{% highlight bash %}
wget https://raw.githubusercontent.com/dracula/gedit/master/dracula.xml
{% endhighlight %}

## 2. Depois mova pra o diretório *styles* do gedit no seu diretório pessoal:
{% highlight bash %}
mv dracula.xml $HOME/.local/share/gedit/styles/
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

## 3. Depois é só acessar

**Preferências** do Gedit(Aberto):

![Preferências](/assets/img/gedit/preferencias.png)

Ao abrir uma nova janela, selecione a aba: **Fontes & Cores**:

![Fontes & Cores](/assets/img/gedit/fontes-e-cores.png)

Selecione o o tema **Dracula**

![Dracula](/assets/img/gedit/dracula-theme.png)

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

E pronto, já estará com o tema Dracula funcionando!

Em alguns casos a opção preferências pode ser que esteja no ícone de hambúrguer no canto superior direito do Gedit, caso você queira que suas preferências passem a aparecer lá também, é só ver esse tutorial: [https://medium.com/@marcosoliveira_17900/display-the-gedit-preferences-menu-4570b0b3369](https://medium.com/@marcosoliveira_17900/display-the-gedit-preferences-menu-4570b0b3369)

![Preferências 2](/assets/img/gedit/preferencias-right.png)

> Observação: Ao mudar a localização das *Preferências* do Gedit, os ícones que aparecem na barra superior do GNOME não terão *destaque*.

## Dica bônus
Pra não ficar tão básica essa postagem, vamos lá a mais uma. Quando você pesquisa e substitui palavras pelo Gedit teclando **Ctrl + h** os termos, regexs e outros sempre ficam guardados no histórico, caso queira deletá-los, rode o comando abaixo:

+ Limpa pesquisas
{% highlight bash %}
gsettings set org.gnome.gedit.state.history-entry search-for-entry "['']"
{% endhighlight %}

+ Limpa substituições
{% highlight bash %}
gsettings set org.gnome.gedit.state.history-entry replace-with-entry "['']"
{% endhighlight %}


Uma dica rápida e útil. Lembrando que existem outros temas e você pode encontrar em diversos lugares na internet e também aqui: <https://www.gnome-look.org/browse/cat/279/>

Abraços!


