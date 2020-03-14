---
layout: post
title: "qutebrowser - Um Navegador estilo Vim , Muito Veloz!"
date: 2019-06-27 17:50:39
image: '/assets/img/dicas/qutebrowser.jpg'
description: 'qutebrowser é um navegador da Web com associações de teclas no estilo vim baseadas no QtWebKit'
tags:
- qutebrowser
- firefox
- web
---

![qutebrowser - Um Navegador estilo Vim , Muito Veloz!](/assets/img/dicas/qutebrowser.jpg)

## Introdução

O [qutebrowser](https://qutebrowser.org/) é um navegador da Web com associações de teclas no estilo vim baseadas no QtWebKit (ou no QtWebEngine em sua última versão). É leve usando uma GUI mínima e é inspirado por softwares como o Vimperator e o dwb . Ele usa o DuckDuckGo como o mecanismo de pesquisa padrão.

O qutebrowser foi desenvolvido por Florian Bruhin, pelo qual recebeu o prêmio CH Open Source em 2016.

## Instalação

Para [Gentoo](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=Gentoo), [Funtoo](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=Funtoo), [Sabayon](https://terminalroot.com.br/2018/02/como-instalar-o-sabayon-um-gentoo-facil.html) e derivados:

{% highlight bash %}
emerge qutebrowser
{% endhighlight %}

Para [Ubuntu](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=Ubuntu), [Debian](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=Debian) , [Mint](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=Mint) e derivados:

{% highlight bash %}
sudo apt install qutebrowser
{% endhighlight %}

Para [Arch](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=Arch) e derivados:

{% highlight bash %}
pacman -S qutebrowser
{% endhighlight %}

Use a ferramenta de procura da sua distro para pesquisar.


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


## Utilização

Após teclas ESC e `:` você pode usar o *Tab* para concluir automaticamente um comando desejado.

### Comandos

0. Obter ajuda: `ESC :help`
1. Abrir uma URL:  `ESC :open terminalroot.com.br`
2. Limpar histórico: `ESC :history-clear` depois pressione `y` para Sim, quando perguntado numa janela na parte inferior do Navegador.
> Detalhe, para limpar os cookies e tudo que você vistou. Será necesário abrir o terminal e rodar o comando: `rm -rf ~/.local/share/qutebrowser`
3. Abrir a página atual numa nova aba: `ESC :tab-clone`
4. Fechar a aba atual: `ESC :tab-close`
5. Salvar a página atual nos Favoritos: `ESC :bookmark-add`
6. Abrir um favorito: `ESC :bookmark-load [URL]`
> Você pode navegar pelos favoritos teclando TAB
7. Deletar um favorito: `ESC :bookmark-del [URL]`
> Você pode navegar pelos favoritos teclando TAB
8. Abrir o arquivo de configuração (Seria tipo as prefrências do Firefox, numa breve comparação): `ESC :set`

E entre várias outras.


### Teclas rápidas (Hotkeys)

Assim como o Vim você pode usar teclas rápidas, veja o mapa de teclas oferecido pelo próprio qutebrowser, para ver o modo detalhado dos comandos e das hotkeys, rode o comando: `ESC :bind`

![Keybinds qutebrowser](https://raw.githubusercontent.com/qutebrowser/qutebrowser/master/doc/img/cheatsheet-big.png)

## Assista um vídeo sobre o qutebrowser

<iframe width="920" height="400" src="https://www.youtube.com/embed/K4e6V8FC39Y" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Links úteis

+ <https://www.qutebrowser.org/doc/quickstart.html>
+ <https://typehype.net/threads/a-basic-introduction-to-qutebrowser.450/>
+ <https://www.shortcutfoo.com/app/dojos/qutebrowser/cheatsheet>
+ <https://github.com/qutebrowser/qutebrowser/issues/3596> Bug insert mode to Google Translate.


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

