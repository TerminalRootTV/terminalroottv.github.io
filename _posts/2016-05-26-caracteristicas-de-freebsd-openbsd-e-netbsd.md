---
layout: post
title: "Características de: FreeBSD, OpenBSD e NetBSD"
date: '2016-05-26T18:56:00.000-07:00'
image: '/assets/img/bsd/caracteristicas_de_freebsd_openbsd_e_netbsd.jpg'
description: "O objetivo deste artigo é mostrar as características dos sistemas operacionais FreeBSD, OpenBSD e NetBSD"
tags:
- bsd
---

![Características de: FreeBSD, OpenBSD e NetBSD](/assets/img/bsd/caracteristicas_de_freebsd_openbsd_e_netbsd.jpg "Características de: FreeBSD, OpenBSD e NetBSD")

## Introdução

O objetivo deste artigo é mostrar as características dos sistemas operacionais [FreeBSD](https://www.freebsd.org/), [OpenBSD](https://www.openbsd.org/) e [NetBSD](https://www.netbsd.org/), de forma que seja possível saber a diferença entre eles e qual o mais indicado para determinadas aplicações. Esta é uma dúvida muito comum aos que desejam utilizar um sistema operacional [BSD](https://pt.wikipedia.org/wiki/Berkeley_Software_Distribution), mas não sabem qual escolher. É muito importante que se saiba o que é e como surgiu o BSD. Por isso, este tópico será visto primeiro. Em seguida, serão mostradas as características de cada sistema [BSD](https://pt.wikipedia.org/wiki/Berkeley_Software_Distribution) e no que estes diferem.

## O que é BSD e como surgiu

[BSD](https://pt.wikipedia.org/wiki/Berkeley_Software_Distribution) é a sigla para __Berkeley Software Distribution__. Trata-se de uma criação feita por estudantes na Universidade da Berkeley, da Califórnia, para aprimorar e acrescentar algumas funcionalidades ao sistema operacional [Unix](http://www.unix.org/). A idéia inicial foi sofrendo mudanças rapidamente. Tantas que chegou a um ponto onde o BSD virou, praticamente, um novo sistema operacional. Para se ter uma idéia, em livros e artigos sobre BSD é comum citarem o fato de que houve um período em que apenas 6 arquivos do [Unix](http://www.unix.org/) eram usados. Estes, rapidamente foram substituídos e inevitavelmente o BSD virou um sistema operacional independente.

Talvez, o que os criadores do [BSD](https://pt.wikipedia.org/wiki/Berkeley_Software_Distribution) não sabiam, é que este sistema, por muitos considerado uma filosofia, fosse ter tanta importância para o mundo da computação. Até mesmo o ~~Windows~~ incorporou algumas funcionalidades do BSD. O sistema operacional __MacOS X__, da __Apple__, tem como base o __BSD__ e é um dos sistemas operacionais mais elegantes e funcionais existentes atualmente (mas somente roda em plataforma Apple).
Quando o assunto é segurança, os sistemas operacionais __BSDs__ se mostram imbatíveis. Toda a estrutura do [BSD](https://pt.wikipedia.org/wiki/Berkeley_Software_Distribution) foi e é desenvolvida considerando os aspectos de estabilidade, integridade, segurança e confiabilidade. Como conseqüência, é um sistema robusto, eficiente e excelente para aplicações de missão crítica. Prova disso é que a própria Internet é relacionada ao [BSD](https://pt.wikipedia.org/wiki/Berkeley_Software_Distribution), já que utiliza algumas de suas funcionalidades de redes e conexão.

## Licença de uso do BSD

No mundo do software livre, o tipo de licenciamento mais conhecido é a [GPL (GNU Public License)](https://www.gnu.org/licenses/licenses.pt-br.html), usada principalmente pelo [Linux](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=linux). O [BSD](https://pt.wikipedia.org/wiki/Berkeley_Software_Distribution), no entanto, possui uma licença própria. Por meio desta licença, qualquer pessoa/empresa pode fazer o que quiser do código, inclusive, alterá-lo para a criação de produtos fechados (como fazem a ~~Microsoft~~ e notoriamente a ~~Apple~~). Na licença __GPL__, isso seria extremamente complicado, para não dizer impossível. Qualquer sistema [BSD](https://pt.wikipedia.org/wiki/Berkeley_Software_Distribution) que utiliza esta sigla, como os citados abaixo, só pode ser considerado como tal se utilizar esse tipo de licenciamento. A seguir, conheça os __3 sistemas operacionais BSDs mais conhecidos__ e que seguem este padrão de licença.

## FreeBSD

![FreeBSD](/assets/img/bsd/logo-full.jpg "FreeBSD")

O sistema operacional [FreeBSD](https://www.freebsd.org/) é um dos mais usados no mundo do software livre. Possui uma verdadeira legião de adeptos e desenvolvedores. Inclusive, o Yahoo é um grande colaborador deste BSD. Consequentemente, é o que possui maior número de aplicativos, sendo fácil encontrar materiais de suporte sobre ele na Internet. Quando o assunto é documentação, ele também se destaca: existe um documento chamado __FreeBSD Handbook__ que é excelente para quem precisa tirar dúvidas sobre o sistema. Desenvolvido também na __Universidade de Berkeley__, sua primeira versão surgiu em 1990.

> Uma das características do [FreeBSD](https://www.freebsd.org/) que mais atraem novos usuários, é a instalação descomplicada. Nesse processo, há poucas chances de falhas e a compatibilidade com hardware é grande. Acredite, é possível até mesmo instalá-lo diretamente pela Internet. Assim como acontece com as distribuições Linux, é possível encontrar o [FreeBSD](https://www.freebsd.org/) em revistas ou em sites de venda de produtos de informática. No entanto, é importante ressaltar que essa "facilidade de instalação" é relativa. Se você já é acostumado a instalar distribuições __Linux__, principalmente pelo modo texto, pouco provavelmente terá problemas. Mas se você for um usuário com pouca experiência, é recomendável procurar algum material que lhe auxilie na instalação.

O __FreeBSD__ "falha" quando o assunto é arquitetura. Roda apenas em plataforma __Intel 32 bits__ (que inclui processadores __AMD__), DEC Alpha, __Sparc64__ e __PowerPC__, além de ser compatível com a arquitetura de __64 bits desenvolvida pela AMD__. O destaque do __FreeBSD__ é sua excelente performance em aplicações para __servidores Web__ e de banco de dados. É recomendável usá-lo se você quiser ser um novo usuário de sistemas BSDs, principalmente pela gama de aplicativos que este sistema oferece.

Site oficial: <http://www.freebsd.org>

## OpenBSD

![OpenBSD](/assets/img/bsd/OpenBSD.gif "OpenBSD")

Sistema [OpenBSD](https://www.openbsd.org/) foi idealizado para ser extretamente eficiente no quesito segurança. Essa filosofia é visível já no processo de instalação, onde ele desativa alguns recursos que podem ser usados para fins perigosos. Em seu processo de desenvolvimento, o código é avaliado e reavaliado constantemente. Quando um erro é detectado, imediatamente uma solução é desenvolvida e aplicada. A questão é tão levada a sério, que outros sistemas BSDs baseiam suas políticas de segurança no [OpenBSD](https://www.openbsd.org/).

No caso da instalação, o [OpenBSD](https://www.openbsd.org/) não é tão simples como o FreeBSD. O usuário precisa de uma certa experiência, justamente pela questão da segurança. É preciso conhecer esta área para saber configurar o sistema. Assim como ococrre com o __FreeBSD__, o __OpenBSD__ também pode ser instalado diretamente pela Internet, porém é mais comum encontrá-lo em CDs. A compatibilidade do __OpenBSD__ com as arquiteturas é algo a se destacar. Além das plataformas citadas no caso do __FreeBSD__, o [OpenBSD](https://www.openbsd.org/) suporta até mesmo computadores __Mac e Sun__.

> Uma característica muito importante do [OpenBSD](https://www.openbsd.org/) é que a partir dele foi criado o o projeto __OpenSSH__ (como não poderia deixar de ser, um projeto que enfatiza a segurança). Este projeto tem como objetivo aplicar funcionalidades mais eficientes no protocolo SSH (Secure Shell). Seu uso tem crescimento constante.

O __OpenBSD__ não é muito apropriado para quem está começando a trabalhar com __BSD__. É necessário uma certa experiência, principalmente com questões de segurança. Esse sistema é muito utilizado em computadores que servem de __roteador__, __firewall__, __backup__ e __monitoramento__.

Site oficial: <http://www.openbsd.org>

## NetBSD

![NetBSD](/assets/img/bsd/NetBSD-tb.jpg "NetBSD")

Lançado em 1993, o [NetBSD](https://www.netbsd.org/) é uma sistema que se destaca por ser compatível com uma quantidade enorme de plataformas. Acredite, ele já foi implementado até mesmo no console de videogame __Dreamcast__, da __Sega__. É certamente, o sistema mais abrangente que existe na questão de arquitetura. Por esta razão, existem muitos usuários deste sistema que preferiram usá-lo a ter que jogar seus computadores antigos no lixo (antigos computadores ~~Apple~~, por exemplo).

> A questão da segurança também é forte no [NetBSD](https://www.netbsd.org/). Mas o foco é mesmo permitir ao sistema ser multi-plataforma. O __NetBSD__ consegue fazer isso tão bem que os outros sistemas __BSDs__ usam parte de seu código para tratar do assunto.
A instalação do [NetBSD](https://www.netbsd.org/) não é complicada, mas não chega a ser tão eficiente quanto a instalação do __FreeBSD__. É possível baixá-lo pela Internet, por __FTP__, no entanto, é comum encontrá-lo em CD.

Muitos estudantes de computação preferem utilizar o [NetBSD](https://www.netbsd.org/) para pesquisar sua capacidade de ser compatível com várias plataformas. No entanto, como já foi dito, muitos o utilizam para "dar vida nova" a antigos computadores, especialmente máquinas da __Apple e da Sun Microsystems__. A tão famosa plataforma Amiga também é compatível. Visite o site oficial para encontrar a lista de compatibilidade. Se você quiser utilizar um sistema __BSD__, o __NetBSD__ é uma boa opção.

Site oficial: <http://www.netbsd.org>

## Finalizando

Os sistemas em __BSD__ abordados neste artigo tendem a ter um número cada vez maior de usuários. Isso se deve ao fato de que os __BSDs__ são completos, já incluem o __kernel__, aplicativos e configuração pré-definida. Além disso, cada um tem um foco, o que permite a escolha de um sistema de acordo com a necessidade.

> Quem deseja ser usuário de um sistema __BSD__, não vai ter tantas dificuldades, pois o número de sites, fóruns, listas de discussão e documentação é cada vez maior. Caso já esteja decidido, resta analisar qual __BSD__ é melhor para você ou para sua aplicação.

FONTE: INFOWESTER

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



