---
layout: post
title: "10 Dicas Fundamentais para seu Gentoo Linux"
date: 2020-03-17 13:12:32
image: '/assets/img//assets/img/gentoo/larry-gentoo.jpg'
description: 'Primeira parte dessa série.'
tags:
- gentoo
- portage
- cpp
---

![10 Dicas Fundamentais para seu Gentoo Linux](/assets/img/gentoo/larry-gentoo.jpg)

As pessoas me pedem diversos conteúdos sobre [Gentoo](https://www.gentoo.org/) e [Portage](https://wiki.gentoo.org/wiki/Portage) , mas esses mundos são muito gigaaaaaaaaantes!!! 😀️ .

Então vou postar séries de dicas de ambos aqui em lista de tópicos como esse, apesar de não haver essa informação no título dessa posatgem, essa é a **PRIMEIRA PARTE** dessa série. Acredito que para início essas dicas iniciais são fundamentais, vamos à lista!

---

# 1. Habilite o **IKCONFIG** no [Kernel](https://www.kernel.org/)
O suporte ao `.config` no Kernel, também conhecido como [IKCONFIG](https://wiki.gentoo.org/wiki/Kernel/IKCONFIG_Support), permite que os usuários construam uma cópia da configuração com a qual o kernel foi construído dentro do próprio kernel.

Isso permite que eles inspecionem a configuração do kernel enquanto estiver em execução, sem ter que se preocupar se eles mudaram ou limparam o diretório de origem após a compilação.
> Habilitando no kernel:
```sh
su
cd /usr/src/linux
make menuconfig
```

```txt
General Setup  --->
    <*/M> Kernel .config support
        [*] Enable access to .config through /proc/config.gz
```

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

E recompile:
```sh
su
make && make modules_install && make install
```
> Se possui o GRUB , rode também: `grub-mkconfig -o /boot/grub/grub.cfg`

---

# 2. Defina o a **ACCEPT_KEYWORDS** no seu arquivo `/etc/portage/make.conf`
Se seu sistema é **amd64**, por exemplo, alguns softwares exigem que você explicite isso, porque o pacote tem código para outras arquiteturas, e você não conseguirá instalá-lo se essa variável não estiver definida, [saiba mais aqui](https://wiki.gentoo.org/wiki/ACCEPT_KEYWORDS/pt-br). Exemplo: `ACCEPT_KEYWORDS="~amd64"`, ou somente rode:
```sh
echo 'ACCEPT_KEYWORDS="~amd64"' | sudo tee -a /etc/portage/make.conf
```

---

# 3. Saiba quando é melhor usar um [Overlay](https://overlays.gentoo.org/)
Se precisar compilar um software que não há na árvore do [Portage](https://wiki.gentoo.org/wiki/Portage), e quiser mais facilidade de instalação use um Overlay, veja aqui como instalar o [Layman](https://en.terminalroot.com.br/how-to-install-programs-via-layman-in-gentoo/).

---


# 4. Habilite parâmetros mais usados por padrão
Se você usa algum parâmetro do `emerge` com frequência, é interessante você adicionar ele à variável **EMERGE_DEFAULT_OPTS** ao seu `/etc/portage/make.conf` . Eu por exemplo, uso bastante o `-a` e meu processador só possui 2 núcleos, logo, sempre compilo com `--jobs 2` para não sobrecarregar meu notebook.
> A opção `--verbose` também é muito interessante!

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

---

# 5. Ganhe mais desempenho nas compilações
Faça uso frequente da opção `--quiet` ou somente `-q` , os *outputs* do compilador não somente deixam o prompt feio, elas deixam a compilação mais demorada, sério! Fiz o teste com pequenos e grandes softwares e os tempos aproximaram o ganho de 15% em média. Só não recomendo usar esse parâmetro na variável da dica anterior, pois as saídas do `--search` ficarão suprimidas e com menos detalhes, [saiba mais](https://wiki.gentoo.org/wiki/EMERGE_DEFAULT_OPTS).

---

# 6. Saiba com usar corretamente as FLAGS
Use o arquivo `/etc/portage/package.use/zz-autounmask` . Não defina **flags** diretamente usando a variável [USE](https://wiki.gentoo.org/wiki/USE_flag) no terminal, ex.: ~~`sudo USE="network mpd" emerge polybar`~~ , isso gera problema quando você atualizar o software, ele recompilará sem suporte à **network** e **mpd** , sem dizer que na maioria das vezes não é interessante adicionar **flags** universalmente à variável **USE** no `/etc/portage/make.conf` .

Somente quando são caso globais, ou seja, quando qualquer software depende dele, por exemplo: `USE="gnome -kde"`(se seu sistema tem o GNOME instalado e não tem o KDE), mas esse exemplo foi bem razoável, pois seu **profile**(veja `eselect profile list`) que você definiu na instalação do seu Gentoo e escolheu(`set`) para o GNOME, logo todas as **flags** para isso já estão definidas para o Portage, veja com `emerge info | grep ^USE`.

Logo a maneira mais correta é inserir a **flag** somente para o software que deseja no arquivo `/etc/portage/package.use/zz-autounmask`, lembre-se de adicionar com a versão do software, exemplo: `echo '>=x11-misc/polybar-3.4.2-r1 network mpd' | sudo tee -a /etc/portage/package.use/zz-autounmask` a opção `>=` no início da linha diz que o Portage deve incluir essa **flag** para qualquer versão igual ou superior à informada e separado por espaços informe as **flags**.

---

# 7. Explore o [Gentoolkit](https://wiki.gentoo.org/wiki/Gentoolkit)
- Antes de compilar/instalar qualquer pacote, use o comando `equery uses [categoria/nome-do-pacote]`(informe sempre com a categoria para evitar nomes ambíguos de pacotes), é necessário possuir o [Gentoolkit](https://wiki.gentoo.org/wiki/Gentoolkit) instalado(`emerge gentoolkit`) ex.: `equery uses x11-misc/polybar` , e veja quais flags já estão habilitadas para instalação e/ou também atualização e quais você gostaria de incluir no seu `package.use/zz-autounmask`.

<!-- LISTA MIN -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Existem várias opções para o comando `equery`(quais pacotes dependem de alguma flag; quais pacotes usam determinada flag; ...) , rode `equery --help` para mais detalhes e teste cada uma delas para entender melhor cada opção.

---

# 8. Atente-se às licenças!
Use também a variável `ACCEPT_LICENSE="*"` no seu `make.conf` , nesse caso ele aceita todos os tipos de licença e evita problema durante instalação de aplicativos.

---

# 9. Pacotes de idiomas
Defina também o idioma do seu sistema diretamente no seu `make.conf` usando a variável **L10N**, exemplo: `L10N="pt-BR"` para nesse caso se você instala softwares com o idioma em **Português Brasileiro**.

Para saber qual código/nome usar para seu país [veja aqui](https://en.wikipedia.org/wiki/Language_localisation), se seu sistema for **Inglês Estados Unidos** é dispensável essa informação e não esqueça de atualizar com a opção `--changed-use`, ex.: `emerge --update --changed-use @world`. Não use a variável **LINGUAS** ela [foi descontinuada](https://www.gentoo.org/support/news-items/2016-06-23-l10n-use_expand.html) , [veja](https://wiki.gentoo.org/wiki/Localization/Guide) também.

---

# 10. Fique mais veloz!
Deixe os downloads dos pacotes mais velozes definindo um `mirror` para o mesmo usando a variável **GENTOO_MIRRORS** no seu `make.conf` , exemplo para o mirror do Brazil da UFPR: `GENTOO_MIRRORS="https://gentoo.c3sl.ufpr.br/ http://gentoo.c3sl.ufpr.br/ rsync://gentoo.c3sl.ufpr.br/gentoo/"` , consulte a lista dos mirros [aqui](https://www.gentoo.org/downloads/mirrors/) .

<!-- RETANGULO LARGO -->
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

Se quiser mais facilidade para inserir, instale/use o comando [mirrorselect](https://wiki.gentoo.org/wiki/Mirrorselect).

---

Espero que seja útil essa primeira parte dessa série, caso tenha interesse em saber como está meu `make.conf`, aqui está:
```sh
# These settings were set by the catalyst build script that automatically
# built this stage.
# Please consult /usr/share/portage/config/make.conf.example for a more
# detailed example.
COMMON_FLAGS="-O2 -pipe"
CFLAGS="${COMMON_FLAGS}"
CXXFLAGS="${COMMON_FLAGS}"
FCFLAGS="${COMMON_FLAGS}"
FFLAGS="${COMMON_FLAGS}"

# NOTE: This stage was built with the bindist Use flag enabled
PORTDIR="/var/db/repos/gentoo"
DISTDIR="/var/cache/distfiles"
PKGDIR="/var/cache/binpkgs"

# This sets the language of build output to English.
# Please keep this setting intact when reporting bugs.
LC_MESSAGES=C
USE="-systemd"
VIDEO_CARDS="intel i965 virtualbox"
GRUB_PLATFORMS="efi-64"
L10N="pt-BR"
ACCEPT_LICENSE="*"
ACCEPT_KEYWORDS="~amd64"
EMERGE_DEFAULT_OPTS="--ask --jobs 2"
GENTOO_MIRRORS="https://gentoo.c3sl.ufpr.br/ http://gentoo.c3sl.ufpr.br/ rsync://gentoo.c3sl.ufpr.br/gentoo/"
source /var/lib/layman/make.conf
```

# Veja também:
## [Como Instalar o Gentoo](https://terminalroot.com.br/2017/05/como-instalar-o-gentoo.html)
## [O Que Fazer Após Instalar o Gentoo Linux](https://terminalroot.com.br/2017/07/o-que-fazer-apos-instalar-o-gentoo-linux.html)
## [Como Instalar o Gentoo Linux em Dual Boot com o Ubuntu](https://terminalroot.com.br/2019/02/como-instalar-o-gentoo-linux-em-dual-boot-com-o-ubuntu.html)
## [Como Instalar o Pentoo, um Gentoo para Pentest](https://terminalroot.com.br/2018/02/como-instalar-o-pentoo-um-gentoo-para-pentest.html)
## [Como Instalar o Sabayon Linux, um Gentoo Fácil](https://terminalroot.com.br/2018/02/como-instalar-o-sabayon-um-gentoo-facil.html)
## [Calculate Linux com Cinnamon - Um Gentoo Prático](https://terminalroot.com.br/2019/04/calculate-linux-com-cinnamon-um-gentoo-pratico.html)
## [Como Criar um Sistema de Desligamento para o i3 com Shell Script](https://terminalroot.com.br/2019/03/como-criar-um-sistema-de-desligamento-para-o-i3-com-shell-script.html)
## [Gentoo + i3 + Ly](https://terminalroot.com.br/2019/03/gentoo-i3-ly.html)
## [Redcore Linux - um Gentoo Simples de Instalar](https://terminalroot.com.br/2018/09/redcore-linux-um-gentoo-simples-de-instalar.html)
## [Como Instalar o Compiz no Gentoo GNU/Linux](https://terminalroot.com.br/2017/10/como-instalar-o-compiz-no-gentoo-gnu-linux.html)
