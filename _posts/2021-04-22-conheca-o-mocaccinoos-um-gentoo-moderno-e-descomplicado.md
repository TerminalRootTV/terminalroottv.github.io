---
layout: post
title: "Conheça o MocaccinoOS - Um Gentoo Moderno e descomplicado"
date: 2021-04-22 12:10:12
image: '/assets/img/distros/MocaccinoOS.jpg'
description: 'O novo Sabayon!'
icon: 'ion:terminal-sharp'
iconname: 'Gentoo'
tags:
- gentoo
- distros
---

![Conheça o MocaccinoOS - Um Gentoo Moderno e descomplicado](/assets/img/distros/MocaccinoOS.jpg)

Em linhas gerais podemos utilizar o próprio slogan deles:
> "MocaccinoOS é uma meta-distribuição Linux mínima para o século 21!"

Mas em linhas gerais trata-se do novo nome do [Sabayon](https://www.youtube.com/watch?v=mkAa6lH0vHY) .

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


# Além do [Gentoo](https://terminalroot.com.br/tags#gentoo).

O MocaccinoOS usa Luet como gerenciador de pacotes, que é completamente estático e totalmente baseado em contêineres, e vem com duas variantes:
+ **Mocaccino Micro**: feito com [Linux From Scratch](http://www.linuxfromscratch.org/) baseado em [Musl](https://terminalroot.com.br/2019/12/alpine-linux-com-awesomewm-nao-recomendado-para-usuarios-nutella.html) usando apenas **Luet**. Adequado para nuvem e contêineres, mas também pode ser usado como Desktop.
+ **Mocaccino Desktop**: baseado em [Gentoo](https://terminalroot.com.br/tags#gentoo) (antigo [Sabayon](https://www.youtube.com/watch?v=mkAa6lH0vHY)) adequado para ambientes de desktop.

# Características
O MocaccinoOS Desktop usa uma abordagem em camadas. Os pacotes do sistema e ambientes de desktop (DE) mais comuns são empacotados como camadas instaláveis únicas, junto com bibliotecas.

O conjunto do sistema é composto apenas por 2 camadas principais i. MocaccinoOS Micro é um LFS Musl OS, não baseado em camadas, mas com um pequeno conjunto de pacotes básicos, adequado para nuvem e ambiente embarcado e com pacotes fáceis de construir.

# Download e instalação
Para baixar e instalar o [MocaccinoOS](https://get.mocaccino.org/minio/mocaccino-iso) basta acessa o endereço: <https://get.mocaccino.org/minio/mocaccino-iso>, selecionar a **iso** e seguir os passos da [documentação](https://www.mocaccino.org/docs/), que por sinal é bem simples e concisa.

Também é possível utilizar gerenciadores de pacotes conhecidos pelos usuários [Linux](https://terminalroot.com.br/tags#linux), como: [AppImage](https://www.mocaccino.org/docs/desktop/appimage/) e [Flatpak](https://www.mocaccino.org/docs/desktop/flatpak/), exemplo:
{% highlight bash %}
luet install apps/flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install org.mozilla.firefox
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



Para mais informações acesso o endereço oficial do sistema: <https://www.mocaccino.org/>



