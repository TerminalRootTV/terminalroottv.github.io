---
layout: post
title: "Como criar um colorscheme para o Gedit facilmente"
date: 2019-12-11 08:43:16
image: '/assets/img/gedit/color-scheme.jpg'
description: 'Você pode até adaptar à outros editores.'
tags:
- gedit
- colorscheme
- theme
- tema
---

![Como criar um colorscheme para o Gedit facilmente](/assets/img/gedit/color-scheme.jpg)

Se você quiser criar um `colorscheme` para o Gedit à sua maneira: cor de fundo, cor do texto, cor para caracteres de strings, booleanos, classes e outros. Há uma maneira *online* e bem simples de se fazer isso.

Basta acessar o site: [Scribes Theme Generator](http://scribes.sourceforge.net/themegenerator.php) definir as cores e tipos, o nome do seu tema, seu nome e uma descrição que deseja e após terminado basta clicar em **Generate** e o código em `xml` é salvo no seu computador.

E então é mover para o diretório styles do Gedit e ativá-lo em seguida como é mostrado nesse link: [Instale o Tema Dracula no seu Gedit](https://terminalroot.com.br/2019/12/instale-o-tema-dracula-no-seu-gedit.html).

Veja o exemplo abaixo do tema que eu criei:

![Como criar um colorscheme para o Gedit facilmente](/assets/img/gedit/terroo-xml.png)

Se quiser fazer o download do tema, [clique aqui](/downs/theme_terroo.zip) .

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

## Outra forma

Você também pode usar o [GtkSourceSchemer](https://github.com/jonocodes/GtkSourceSchemer) o uso dele é bem simples, veja a imagem abaixo que mostra a interface de uso:

![GtkSourceSchemer](/assets/img/gedit/GtkSourceSchemer.png)

## Ou usando um plugin no próprio Gedit

Instale o plugin [GeditSchemer](https://github.com/jonocodes/GeditSchemer) e fica ainda mais fácil!

## Convertendo temas

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Se você tiver um tema bem bacana do [Vim](https://terminalroot.com.br) e quiser adicioná-lo ao Gedit ou ao GVim , basta usar o **Vim2GtkSourceView2** que pode ser aquirido no endereço: <https://code.google.com/archive/p/vim2gtksourceview2/>, exemplo convertendo um tema:
{% highlight bash %}
 ./vim2gtksourceview.py < terroo-colors.vim > output.xml
{% endhighlight %}

### Dicas extra:

1. Falando de plugins, o Gedit tem um plugin bem legal para adicionar emojis nos seus textos, basta teclar **Ctrl + .**(control mais ponto):

![Gedit Emoji](/assets/img/gedit/gedit-emoji.png)

2. Vários colorschemes prontos para o Gedit: <https://wiki.gnome.org/Projects/GtkSourceView/StyleSchemes>

Valeu!


