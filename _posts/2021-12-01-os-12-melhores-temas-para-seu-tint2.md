---
layout: post
title: "Os 12 Melhores Temas para seu Tint2"
date: 2021-12-01 11:23:35
image: '/assets/img/openbox/tint2/lithium.jpg'
description: 'tint2 é um painel/barra de tarefas leve feito especificamente para Openbox, mas também pode funcionar com outros gerenciadores de janelas.'
icon: 'ion:terminal-sharp'
iconname: 'Tint2'
tags:
- wm
- themes
---

![Os 12 Melhores Temas para seu Tint2](/assets/img/openbox/tint2/lithium.jpg) 

[tint2](https://gitlab.com/o9000/tint2) é um **painel/barra de tarefas** leve feito especificamente para [Openbox](https://terminalroot.com.br/2021/11/os-17-melhores-temas-para-seu-openbox.html) , mas também pode funcionar com outros [gerenciadores de janela](https://terminalroot.com.br/tags#wm) .

Nós publicamos [Os 17 Melhores Temas para seu Openbox](https://terminalroot.com.br/2021/11/os-17-melhores-temas-para-seu-openbox.html) e agora para deixar seu *perfil* ainda mais completo vamos conhecer **12 Temas para seu Tint2** selecionados e modificados por mim.
> A fonte de onde eu *recolhi* está ao final desse artigo.

---

# 01. Carina
Esse é um tema leve com cores frias e legal para não *cansar às vistas*. 

![Carina](/assets/img/openbox/tint2/carina.jpg) 

---

# 02. Launchy
O launchy é estilo dark e com ícones em contraste.

![launchy](/assets/img/openbox/tint2/launchy.jpg)


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

# 03. Liness
Lines é minimalista, os ícones não está inclusos, mas você pode editar facilmente.
![liness](/assets/img/openbox/tint2/liness.jpg)

---

# 04. Lithium
Pelo nome já dá para saber qual a origem dele, o [BunsenLabs](https://www.bunsenlabs.org/).

![lithium](/assets/img/openbox/tint2/lithium.jpg)

---

# 05. Livia
O Livia é simples e com ícones que também podem ser modificados ao seu gosto.

![livia](/assets/img/openbox/tint2/livia.jpg)

---

# 06. Neon
Esse também é minimalista e *confortável*

![neon](/assets/img/openbox/tint2/neon.jpg)

---

# 07. Popside
Similar ao Neon, mas com tons mais fortes.

![popside](/assets/img/openbox/tint2/popside.jpg)

---

# 08. Repentance
Outro estilo dark simplista.

![repentance](/assets/img/openbox/tint2/repentance.jpg)

---

# 09. Starty
Esse é um estiilo light e pouco *extravagante*.

![starty](/assets/img/openbox/tint2/starty.jpg)

---

# 10. Uncreative
Esse é ideal para quem gosta de Magenta.


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

![uncreative](/assets/img/openbox/tint2/uncreative.jpg)

---

# 11. Zug
O Zug já possui um player para ser usado com [MPD](https://terminalroot.com.br/2019/07/instale-e-configurar-o-ncmpcpp-e-mpd-no-seu-linux.html).

![zug](/assets/img/openbox/tint2/zug.jpg)

---

# 12. Tintoo
O nome desse eu inventei, pois retirei ele da [documentação do Gentoo](https://wiki.gentoo.org/wiki/Tint2).

![Tintoo](/assets/img/openbox/tint2/tintoo.jpg) 

---

# Como instalar os temas
Logicamente você precisará possuir o **Tint2** instalado, use o gerenciador de pacotes da da sua [distro](https://terminalroot.com.br/tags#distro), exemplo para sistemas que utilizam [APT](https://terminalroot.com.br/2012/12/curso-certificacao-linux-lpi-1.html):

{% highlight sh %}
sudo apt install tint2
{% endhighlight %}

Em seguida crie um diretório dentro de `~/.config` na sua pasta pessoal:

{% highlight sh %}
mkdir -p ~/.config/tint2
{% endhighlight %}

Depois é só clonar o repositório, que separei todos previamente, e mover para `~/.config/tint2/`:
{% highlight sh %}
git clone https://github.com/terroo/tint2-themes
cd tint2-themes
mv * ~/.config/tint2/
{% endhighlight %}

Para testar use o comando `tint2` com o parâmetro `-c` e o caminho do arquivo de configuração do Tint2(tint2rc), exemplo:
{% highlight sh %}
tint2 -c ~/.config/tint2/livia/livia.tint2rc
{% endhighlight %}

Se quiser habilitar(facilita sua vida!) para sempre que iniciar a sessão no Openbox, adicione ao seu `~/.config/openbox/autostart` a linha:
{% highlight sh %}
tint2 -c ~/.config/tint2/livia/livia.tint2rc &
{% endhighlight %}

---

# Fontes dos temas:
+ <https://github.com/addy-dclxvi/tint2-theme-collections>
+ <https://forums.bunsenlabs.org/viewtopic.php?pid=85781#p85781>
+ <https://wiki.gentoo.org/wiki/Tint2>


