---
layout: post
title: "Gere Frases motivadoras automáticas no Terminal"
date: 2019-10-12 18:17:51
image: '/assets/img/dicas/agostinho.jpg'
description: 'Seria o coaching do Linux ? Nem tanto, tem o modo ofensivo também! 😁️'
tags:
- fortune
- comandos
- terminal
---

[![Gere Frases motivadoras automáticas no Terminal](/assets/img/dicas/agostinho.jpg)](/assets/img/dicas/agostinho.jpg)

> Seria o coaching do Linux ? Nem tanto, tem o modo ofensivo também! 😁️


## Introdução

[fortune](www.redellipse.net/code/fortune) é um programa simples que exibe frases aleatórias, pungentes, inspiradoras, tolas ou maliciosas de um banco de dados de citações. O utilitário de linha de comando fortune faz parte do pacote [games-misc/fortune-mod](https://packages.gentoo.org/packages/games-misc/fortune-mod).

## Instalação

O fortune está disponível no repositório de todas as distribuições [Linux](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=Linux) e todos os [BSD](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=BSD) . Então para instalar use o mesmo:

{% highlight bash %}
emerge fortune-mod # Gentoo, Funtoo, ...
sudo apt install fortune # Debian, Ubuntu, Mint, ...
sudo pacman -S fortune-mod # Arch, Manjaro,...
sudo yum install fortune # Red Hat, CentOS, ...
sudo dnf install fortune # Fedora
{% endhighlight %}

Nos BSDs ele já está instalado por padrão! :)

## Utilização

Para gerar uma frase basta rodar o comando:
{% highlight bash %}
fortune
{% endhighlight %}

**Observação** → O Fortune gera frases em inglês, mas no [Ubuntu](https://terminalroot.com.br/2019/10/remaster-ubuntu-buntuwm-linux.html) há um pacote em **português** , para instalar, rode esse comando:
{% highlight bash %}
sudo apt install fortunes-br
# Ou
sudo apt install fortune-br
{% endhighlight %}

Em outras distribuições você pode jogar a saída para o [trans](https://terminalroot.com.br/2019/10/traduza-rapidamente-textos-via-linha-de-comando.html) ([Clique aqui para saber como instalá-lo](https://terminalroot.com.br/2019/10/traduza-rapidamente-textos-via-linha-de-comando.html)) , e rode: `fortune | trans -b` (** pode ser que fique lento)

Algumas opções:
+ `fortune -a` - gera todo tipo de frase: longas, curtas, ofensivas;
+ `fortune -o` - só gera frases ofensivas, pra quem gosta! 😚️ (Observação, no Gentoo e Funtoo, você precisa compilar com a flag `USE="offensive"` para as ofensivas aparecerem);
+ `fortune -l` - só frases longas;
+ `fortune -c` - só frases curtas;
+ `fortune -m` - só frases que contenham pelo menos uma palavra que *casa* com a [regex](https://terminalroot.com.br/regex) que você passar;
Para mais opções use o manual: `man fortune`

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

## Mais opções

+ 1 - Se quiser que toda vez que você abra um terminal, apareça uma frase, basta adicionar ao seu `echo 'fortune' >> ~/.bashrc` ou o arquivo de configuração do [Shell](https://terminalroot.com.br/shell) que você utiliza.
+ 2 - Se quiser que surja uma janela toda vez que você logar. Exemplo se for no [GNOME]:
+ Crie um `frase.desktop` e use, por exemplo o [Yad](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=Yad) e crie um script com `yad --title="Frase do dia" --text="<big>$(fortune)</big>"` que vai ser chamado pelo *frase.desktop* e adicione ele pra iniciar na opção **Aplicativos de Inicialização** .
+ 3 - Instale outros *mods* que exibem frases: [Star, Wars](http://www.splitbrain.org/projects/fortunes/starwars), [South Park](http://eol.init1.nl/content/view/44/54/), [Simpsons](http://www.splitbrain.org/projects/fortunes/simpsons), [Kernel Linux](http://fortune-mod-fvl.sourceforge.net/) e outros!

Veja a lista completa:

+ [fortune-mod-at-linux](http://fortune-mod-fvl.sourceforge.net/)
+ [fortune-mod-bofh-excuses](http://www.stlim.net/staticpages/index.php?page=20020814005536450)
+ [fortune-mod-calvin](http://www.netmeister.org/misc.html)
+ [fortune-mod-chucknorris](https://www.k-lug.org/~kessler/projects.html)
+ [fortune-mod-cs](http://ftp.fi.muni.cz/pub/linux/people/zdenek_pytela/)
+ [fortune-mod-debilneho](http://megac.info)
+ [fortune-mod-discworld](http://www.splitbrain.org/projects/fortunes/discworld)
+ [fortune-mod-dubya](http://dubya.seiler.us/)
+ [fortune-mod-dune](http://dune.s31.pl/)
+ [fortune-mod-familyguy](http://jon.oberheide.org/familyguy/)
+ [fortune-mod-firefly](http://www.daughtersoftiresias.org/progs/firefly/)
+ [fortune-mod-flashrider](http://downloads.nanolx.org/index.php?dir=fortunes-flashrider)
+ [fortune-mod-futurama](http://www.netmeister.org/misc.html)
+ [fortune-mod-fvl](http://fortune-mod-fvl.sourceforge.net/)
+ [fortune-mod-gentoo-dev](https://www.gentoo.org/)
+ [fortune-mod-gentoo-forums](https://forums.gentoo.org/)
+ [fortune-mod-hitchhiker](http://www.splitbrain.org/projects/fortunes/hg2g)
+ [fortune-mod-homer](http://www.cs.indiana.edu/~crcarter/homer/homer.html)
+ [fortune-mod-humorixfortunes](http://i-want-a-website.com/about-linux/downloads.shtml)
+ [fortune-mod-it](http://www.fortune-it.net/)
+ [fortune-mod-kernelcookies](http://www.schwarzvogel.de/software-misc.shtml)
+ [fortune-mod-mormon](http://scriptures.nephi.org/)
+ [fortune-mod-norbert-tretkowski](http://fortune-mod-fvl.sourceforge.net/)
+ [fortune-mod-osfortune](http://www.dibona.com/opensources/index.shtml)
+ [fortune-mod-powerpuff](http://eol.init1.nl/content/view/43/54/)
+ [fortune-mod-pqf](http://www.lspace.org/)
+ [fortune-mod-rss](http://fortune-mod-fvl.sourceforge.net/)
+ [fortune-mod-scriptures](http://scriptures.nephi.org/)
+ [fortune-mod-simpsons-chalkboard](http://www.splitbrain.org/projects/fortunes/simpsons)
+ [fortune-mod-slackware](http://fauxascii.com/linux/mod_quotes.html)
+ [fortune-mod-smac](http://progsoc.org/~curious/)
+ [fortune-mod-sp-fortunes](http://eol.init1.nl/content/view/44/54/)
+ [fortune-mod-starwars](http://www.splitbrain.org/projects/fortunes/starwars)
+ [fortune-mod-strangelove](http://seiler.us/wiki/index.php/Strangelove)
+ [fortune-mod-tao](http://fortunes.quotationsbook.com/fortunes/collection/67/TAO)
+ [fortune-mod-taow](http://www.de-brauwer.be/wiki/wikka.php?wakka=TheArtOfWar)
+ [fortune-mod-thomas-ogrisegg](http://fortune-mod-fvl.sourceforge.net/)
+ [fortune-mod-woody-allen-it](http://somemixedstuff.blogspot.com/2007/04/set-of-fortunes-of-woody-allen-quotes.html)
+ [fortune-mod-zx-error](http://korpus.juls.savba.sk/~garabik/software/fortunes-zx-error.html)

Abraços! 😀️
    
