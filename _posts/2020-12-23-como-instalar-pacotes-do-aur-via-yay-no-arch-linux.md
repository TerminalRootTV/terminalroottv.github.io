---
layout: post
title: "Como Instalar Pacotes do AUR via Yay no Arch Linux"
date: 2020-12-23 14:47:16
image: '/assets/img/distros/aur-yay-archlinux.jpg'
description: 'Instale facilmente pacotes que ainda não está no repositório oficial.'
icon: 'grommet-icons:archlinux'
iconname: 'archlinux'
tags:
- archlinux
---

![Como Instalar Pacotes do AUR via Yay no Arch Linux](/assets/img/distros/aur-yay-archlinux.jpg)

Existem diversos pacotes que ainda não estão no repositório oficial do [Arch Linux](https://terminalroot.com.br/2020/01/arch-linux-openbox-tint2.html) e um dos processos para um pacote ser oficial é primeiro fazer parte do **AUR**.

O Arch User Repository (AUR) ou, em português, Repositório de Usuário do Arch é um repositório dirigido pela comunidade para usuários do [Arch](https://terminalroot.com.br/tags#archlinux).

Os pacotes são *"formulados"* por um arquivo de nome [PKGBUILS](https://wiki.archlinux.org/index.php/PKGBUILD) e você compila com o comando [makepkg](https://wiki.archlinux.org/index.php/Makepkg).

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# Como instala o AUR ?
Antes de qualquer coisa você precisa possuir as ferramentas de contrução, e para isso instale o pacote `base-devel` se não tiver instalado:
{% highlight bash %}
sudo pacman -S --needed base-devel
{% endhighlight %}
> A opção `--needed` serve para ignorar pacotes que você já tem instalados, em vez de reinstalá-los.

Em seguida, basta 
+ clonar com [Git](https://terminalroot.com.br/git/) o repositório no [endereço dos pacotes AUR](https://aur.archlinux.org/), use o campo de pesquisa para encontrar o nome do pacote deseja.
+ Entrar no repositório e rodar o comando `makepkg -si`
> A opção `-s`, resolve automaticamente e instala quaisquer dependências com o pacman antes de compilar, ele usa o [pacman](https://wiki.archlinux.org/index.php/Pacman) para isso.
> 
> A opção `-i` instala o pacote se ele foi compilado com sucesso.

Exemplo de um **pacote fictício** `terminalroot`, pesquisei no campo *Package search* e cliquei e fui direcionado à [página do mesmo](https://aur.archlinux.org/packages/): <https://aur.archlinux.org/packages/terminalroot>
{% highlight bash %}
git clone https://aur.archlinux.org/terminalroot.git
cd terminalroot/
makepkg -si
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

# Economizando tempo com o [Yay](https://github.com/Jguer/yay)
Bom, ficar fazendo clone e compilando já dá pra pensar: Não era melhor automatizar esse processo ?!! Sim, é. E já pensaram nisso e criaram o [Yay](https://github.com/Jguer/yay).

Eu acho que o Yay já deveria fazer parte do repositório oficial e podermos instalar ele via `pacman`, mas ainda(pelo menos até a data de publicação desse artigo) não fizeram isso.

Então você precisa instalá-lo via AUR e então usá-lo para instalar qualquer outro pacote do AUR, estranho, mas é assim mesmo! Para instalar o Yay, rode:
{% highlight bash %}
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
{% endhighlight %}
> Lembrando que antes precisa do [base-devel](https://archlinux.org/groups/x86_64/base-devel/) como informado acima. Durante a instalação ele pedirá sua senha de `sudo` para copiar o binário para um caminho do sistema que está na variável `$PATH`.

Daí em diante é melzinho na chupeta!

Para instalar qualquer coisa é só rodar o comando `yay` com o parâmetro `-S` similar ao *pacman* e informar o nome do pacote.
> Lembrando que ele possui auto-complete, logo fica fácil identificar se o pacote existe só teclando TAB ao digitar as primiras letras do nome, diminuindo a necessidade de ir até o endereço do AUR. Show, né ?!

Exemplo de novo com o pacote fictício `terminalroot`
{% highlight bash %}
yay -S terminalroot
{% endhighlight %}
Só isso! Ah, não use `sudo`!!! Ele recusará, ele mesmo lhe pedirá a senha durante a instalação, lógico, é o processo do AUR! 😃 

Tranquilidade na nave ? Bom, por hoje é só. Caso queira se aprofundar ainda mais, sugiro os links abaixo:
+ <https://wiki.archlinux.org/index.php/Arch_User_Repository>
+ <https://wiki.archlinux.org/index.php/Arch_User_Repository_(Português)>
+ <https://github.com/Jguer/yay>

# Assista um vídeo sobre o Arch Linux

<iframe width="910" height="390" src="https://www.youtube.com/embed/rxN9jNXiy-c" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

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


# Fui!

