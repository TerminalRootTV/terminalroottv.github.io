---
layout: post
title: "Os 17 Melhores Temas para seu Openbox"
date: 2021-11-25 13:46:18
image: '/assets/img/openbox/pelangi-min.jpg'
description: 'Além de ser minimalista e leve, o Openbox também é surpreendentemente personalizável e flexível.'
icon: 'ion:terminal-sharp'
iconname: 'Openbox'
tags:
- wm
- temas
---

![Os 17 Melhores Temas para seu Openbox](/assets/img/openbox/pelangi-min.jpg)

Além de ser minimalista e leve, o [Openbox](https://terminalroot.com.br/2020/01/arch-linux-openbox-tint2.html) também é surpreendentemente personalizável e flexível. Um usuário pode alterar facilmente várias configurações relacionadas ao tema, aparência, posicionamento da janela, encaixe e muito mais. 

Para quem deseja fugir do "*peso*" de um [Desktop Environment](https://terminalroot.com.br/tags#gnome), no entanto, ter um ambiente simples e com facilidades de fechar, expandir e minimizar janelas não há ainda nada melhor que o Openbox.

Nesse artigo vamos conhecer 17 temas minuciosamente selecionados por mim desse excelente [gerenciador de janelas](https://terminalroot.com.br/2020/08/os-25-melhores-tiling-window-manager-para-seu-linux.html) . 

---

# 01. Afterpiece
Esse talvez seja o mais simples dessa lista, ideal para quem gosta de um minimalismo, mas com o *lado negro da força*!

![Afterpiece](/assets/img/openbox/afterpiece-min.jpg)


<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# 02. Arc Darkest
Esse é usado por muitos não somente no Openbox, mas em outros gerenciadores de janelas e ambientes desktop.

![Arc Darkest](/assets/img/openbox/arc-darkest-min.jpg)

---

# 03. Blocks
Um tema moderno estilo light e com cores leves porém variadas.

![Blocks](/assets/img/openbox/blocks-min.jpg)

---

# 04. Box-Dark
Esse é o extremo do minimalismo.

![Box-Dark](/assets/img/openbox/box-dark-min.jpg)

---

# 05. Clair-Crimson
Outro modernão e com controles de janela diferenciado.

![Clair](/assets/img/openbox/clair-min.jpg)

---

# 06. Cosmic-Travel
Pra quem curte um estilo retrô, mas bem *remixado* .

![Cosmic Travel](/assets/img/openbox/cosmic-travel.jpg)

---

# 07. Dracula
Um dos mais amados!

![Dracula](/assets/img/openbox/Dracula-min.jpg)

---

# 08. Dracula-withoutBorder
O mesmo que o anterior, mas sem bordas.

![Dracula withoutBorder](/assets/img/openbox/Dracula-withoutBorder-min.jpg)

---

# 09. Joy
Ative esse ele pode desenhar os controles de uma forma diferente no seu sistema, é legalzão!

![Joy](/assets/img/openbox/joy-min.jpg)

---

# 10. Lovely
Mistura de Light + Moderno + Adorável!


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

![Lovely](/assets/img/openbox/lovely-min.jpg)

---

# 11. Nord-Openbox-theme
A versão do famoso Nord para Openbox.

![Nord](/assets/img/openbox/nord-openbox-min.jpg)

---

# 12. orwT
Esse nós instalamos no vídeo do Arch Linux com Openbox, caso queira assistir o vídeo: [clique aqui](https://youtu.be/rxN9jNXiy-c)

![orwT](https://terminalroot.com.br/assets/img/distros/archlinux-openbox.jpg)

---

# 13. Pelangi
Um gradiente colorido e sem controles de janelas.

![Pelangi](/assets/img/openbox/pelangi-min.jpg)

---

# 14. Prismatic-Night
Esse é para aqueles que gostam de *extravagância* .
![Prismatic](/assets/img/openbox/prismatic-night-min.jpg)

---

# 15. Raven-Crimson
Simila ao [Clair](#Clair-Crimson) , mas no estilo dark!

![Raven](/assets/img/openbox/raven-min.jpg)

---

# 16. Surreal_Gentoo
Esse é do [Gentoo](https://terminalroot.com.br/tags#gentoo), por incrível que pareça, no meio de tantos bacanas, esse é o que eu mais utilizo =) .

![Surreal_Gentoo](/assets/img/openbox/surreal-gentoo-min.jpg)

---

# 17. Yaru
Versão do Yaru, padrão do [GNOME](https://terminalroot.com.br/tags#gnome) no [Ubuntu](https://terminalroot.com.br/tags#ubuntu)

![Yaru](/assets/img/openbox/yaru-min.jpg)

---

# Como instalar os temas ?
Eu separei todos eles em um único repositório para facilitar, então você pode fazer assim:
> No repositório só não há o *Cosmic-Travel*

{% highlight sh %}
mkdir -p ~/.themes
git clone https://github.com/terroo/openbox-themes
cd openbox-themes
mv * ~/.themes
{% endhighlight %}

E para alterar o tema há duas formas. A primeira é como eu faço que é editar o arquivo: `~/.config/openbox/rc.xml` 

e Abaixo da tag `<theme>` entre as tags `<name>` informe o nome do tema de acordo com o nome da pasta do mesmo, exemplo:
> Use o mesmo nome que há aqui nesse artigo do título de cada um, respeitando os traços(`-`) e os underlines(`_`), sem espaços.

{% highlight html %}
<theme>
  <name>Surreal_Gentoo</name>
<!-- ... -->
{% endhighlight %}

E depois releia as configurações do Openbox:

{% highlight sh %}
openbox --reconfigure
{% endhighlight %}

A outra é ainda mais simples, basta instalar o **LX Appearance** e usá-lo é um programa gráfico e intuitivo.


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

Abaixo segue os link de onde selecionei os temas:
+ <http://openbox.org/download-themes.php>
+ <https://store.kde.org/p/1017696/>
+ <https://www.box-look.org/browse?cat=140&ord=latest>
+ <https://github.com/the-zero885/dracula-Openbox>
+ <https://github.com/owl4ce/yao>
+ <https://github.com/the-zero885/Nord-Openbox-theme>
+ <https://github.com/Alexdaz/Cosmic-Travel>
+ <https://github.com/zakuradev/openbox-themes>

Manda uma **✪** lá no GitHub! 😃 


