---
layout: post
title: "Conheça o Inferno"
date: 2020-09-17 12:54:14
image: '/assets/img/os/inferno.png'
description: 'Não é a casa do capiroto! 😈 Trata-se de um sistema operacional.'
icon: 'logos:inferno'
iconname: 'inferno'
tags:
- unix
- opensource
---

![Screenshot of Inferno 4th Edition running on Windows Vista.](/assets/img/os/inferno.png)

Sei que a maioria pensou que era o inferno do capeta 😈 ! Mas não é não, trata-se de um sistema operacional.

---

O **Inferno** é um sistema operacional para criação e suporte a serviços distribuídos. O nome do sistema operacional e dos programas associados, bem como o da companhia [Vita Nuova](http://www.vitanuova.com/)(em português significa VIDA NOVA, vai entender 😃 ) que o produziu, são inspirados pelo trabalho literário de **Dante Alighieri**, particularmente a [Divina Comédia](https://pt.wikipedia.org/wiki/Divina_Comédia).

O Inferno roda no modo hospedeiro sobre vários sistemas operacionais diferentes, ou nativamente em uma variedade de arquiteturas de hardware. Em cada configuração o sistema operacional apresenta as mesmas interfaces padrões para suas aplicações. Um protocolo chamado Styx é aplicado uniformemente para acessar os recursos tanto os locais como os remotos. A partir da quarta edição do Inferno, Styx é idêntico à mais nova versão do hallmark 9P protocol, 9P2000 do Plan 9.

As aplicações são escritas na linguagem de programação chamada [Limbo](https://pt.wikipedia.org/wiki/Limbo_(linguagem_de_programação)), em que a representação binária é idêntica em todas as plataformas, e é executada usando a técnica de compilação just-in-time em uma máquina virtual. 

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

O Inferno é um sistema operacional distribuído baseado em três princípios básicos:
+ Recursos como arquivos: todos os recursos são representados como arquivos em um sistema de arquivos hierárquico.
+ Namespaces: a visão da aplicação da rede é única, um namespace coerente que aparece como um sistema de arquivos hierárquico mas pode representar recursos separados (locais ou remotos) fisicamente.
+ Protocolo padrão de Comunicação: um protocolo padrão, chamado Styx (9P2000), é usado para acessar todos os recursos, tanto locais quanto remotos.

![Games do Inferno](/assets/img/os/games-do-inferno.jpg)

O Inferno e o Plan 9 compartilham um ancestral comum, um sistema operacional de aproximadamente 1996. A existência do novo sistema "vazou" de Dennis Ritchie no começo de 1996, pouco menos de um ano depois do desenvolvimento do sistema, e mais tarde naquele ano foi apresentado publicamente como um competidor ao [Java](https://terminalroot.com.br/tags#java). Ao mesmo tempo, a [AT&T](https://terminalroot.com.br/tags#unix) (empresa pai da Bell Labs) licenciou "secretamente" tecnologia Java da Sun Microsystems. Eles compartilham os mesmos princípios de design, embora haja diferenças:

+ O userland do Plan 9 roda código nativo, na maior parte em linguagem C com uma pequena quantidade de código em linguagem assembly, enquanto o userland do Inferno roda através de um interpretador de bytecode ou compilador just-in-time chamado Dis, na maior parte escrito em Limbo.
+ O núcleo do Plan 9 é um núcleo híbrido, enquanto o núcleo do Inferno é um núcleo antigo do Plan 9 com os excessos desnecessários removidos e incluindo uma máquina virtual.
+ O núcleo Plan 9 chaveia entre o modo usuário (userland) e o modo supervisor (núcleo), enquanto o Inferno nunca deixa o modo supervisor (núcleo), mas fornece proteção através do uso de uma máquina virtual.

Inferno é um tanto similar a Java Virtual Machine.

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

![Ferramentas do Inferno](/assets/img/os/tools.jpg)

O Inferno roda diretamente em hardware nativo e também como uma aplicação, provendo um sistema operacional virtual que roda em outras plataformas. Aplicações podem ser desenvolvidas e rodadas em todas as plataformas Inferno sem modificações ou recompilação.

Portes nativos incluem: x86, MIPS, XScale, ARM, PowerPC, SPARC.

Hosted or Virtual OS ports include: [Microsoft Windows](https://terminalroot.com.br/tags#windows), [Linux](https://terminalroot.com.br/linux/), [FreeBSD](https://terminalroot.com.br/tags#freebsd), Plan 9, [Mac OS X](https://terminalroot.com.br/tags#macos), Solaris, IRIX, UnixWare.

O Inferno pode também ser hospedado por um plugin para o Internet Explorer. De acordo com a Vita Nuova plugins para outros navegadores estão a caminho.

![Plug-in do Inferno](/assets/img/os/plugin.jpg)

A quarta edição do Inferno 4th foi distribuída no princípio de 2005 como [Software Livre](https://terminalroot.com.br/tags/#freesoftware) sob uma mistura de licenças [Open Source](https://terminalroot.com.br/tags/#opensource) ([GNU GPL](https://www.gnu.org/licenses/gpl-3.0.html), GNU LGPL, Lucent Public ou MIT License, dependendo do componente). Vita Nuova também oferece uma licença comercial convencional não copyleft para aqueles que não desejam licenciar suas modificações sobre o esquema padrão Free Software.

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

# [Página Oficial do Inferno](http://www.vitanuova.com/inferno/)
# Referências
+ <http://www.vitanuova.com/inferno/>
+ <https://pt.wikipedia.org/wiki/Inferno_(sistema_operacional)>



