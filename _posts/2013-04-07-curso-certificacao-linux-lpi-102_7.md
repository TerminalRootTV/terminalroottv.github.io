---
layout: post
title: 'Curso Certificação Linux LPI-102: Acessibilidade no Linux'
date: '2013-04-07T16:43:00.000-07:00'
image: '/assets/img/lpi/accessibility-keyboard-blog.jpg'
description: "Com a popularização do GNU/Linux entre o público não-técnico, tem havido um interesse renovado por um suporte mais mainstream à acessibilidade."
tags:
- linux
- lpi
---

![Acessibilidade no Linux](/assets/img/lpi/accessibility-keyboard-blog.jpg "Acessibilidade no Linux")


O "leitor de tela básico em braille" foi adicionado recentemente ao [kernel do Linux](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=kernel linux) e, com ele, um subdiretório drivers/accessibility e a opção __CONFIG_ACCESSIBILITY__ correspondente. Vale destacar que as primeiras reações foram do tipo "que raios é essa tal de acessibilidade?". Isso mostra como a idéia é pouco conhecida entre os desenvolvedores.

E olha que a acessibilidade no [GNU/Linux](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=GNU Linux), ou seja, a usabilidade do GNU/Linux por portadores de deficiência (como cegos, por exemplo), obviamente não é nova. Já há trabalho nessa área faz tempo: a versão 0.07 do leitor de tela speakup foi lançada para o kernel 2.2.7 em 1999, e o leitor de tela em braille brltty foi iniciado em 1995. O leitor de tela básico em braille que acaba de ser adicionado ao kernel do Linux é apenas a parte visível desse trabalho que já está em andamento há anos.

> Com a popularização do GNU/Linux entre o público não-técnico, tem havido um interesse renovado por um suporte mais mainstream à acessibilidade: o desktop GNOME, o OpenOffice.org e o Firefox 3 agora podem ser renderizados por sintetizadores de voz e braille graças ao framework AT-SPI e ao leitor de tela Orca. Assim que essas tecnologias forem adaptadas ao D-BUS, o KDE também vai aderir. Além disso, começaram a aparecer menus de acessibilidade nas distribuições.

Uma das maiores preocupações dos portadores de deficiência costumava ser a falta de suporte ao Javascript nos navegadores em modo texto e a falta de suporte das suítes de escritório. Conforme mais e mais empresas e governos migram para o Linux, especialmente devido à exigência de alguns estados por acessibilidade nas ferramentas usadas pelo governo, um esforço renovado no desenvolvimento foi se tornando cada vez mais uma necessidade. Em Massachusetts, o povo chegou a fazer um abaixo-assinado contra a migração para o software livre porque, na época, ele não oferecia as ferramentas de acessibilidade necessárias!

## O que é acessibilidade?

 Acessibilidade, também abreviada como a11y, é fazer com que um software possa ser utilizado por pessoas portadoras de deficiência. Isso inclui os cegos, é claro, mas também pessoas com pouca visão, surdos, daltônicos, pessoas que só têm uma das mãos ou que só podem mover alguns dedos ou apenas os olhos. Pessoas com problemas cognitivos (ainda que leves) ou não familiarizadas com a linguagem também estão incluídas. Por último, mas não menos importantes, os idosos, que têm um pouco de todas essas deficiências. Sim, isso quer dizer que, um dia, todo mundo vai estar incluído nesse grupo. Isso implica em suporte a dispositivos especiais, mas também em precaução no desenvolvimento, evitando presumir que um alarme sonoro será ouvido, ou que uma breve mensagem será lida.
 
 
> Talvez uma das técnicas de acessibilidade mais óbvias sejam os sintetizadores de voz, que transformam texto em áudio que pode ser enviado aos alto-falantes e fones de ouvido. Já houve sintetizadores de voz baseados em hardware (suportados pelos drivers do speakup), mas a maioria deles vem sendo substituída pelos sintetizadores de voz baseados em software. Embora a qualidade do software comercial para sintetizar voz seja muito boa hoje em dia, a qualidade das alternativas livres varia bastante. 

Existem sintetizadores de voz livres muito bons para a língua inglesa, mas o suporte a outros idiomas varia. Por exemplo, os engines Festival e eSpeak suportam vários idiomas, mas o som é robótico demais. Há bibliotecas de fonemas melhores, como o mbrola, mas elas geralmente não são 100% livres. Para lidar de maneira mais eficiente com esses backends de sintetização de voz, o daemon de voz precisa escolher automaticamente a sintetização apropriada, de acordo com o idioma e o estilo desejados.


> Outro tipo de dispositivo muito popular é o terminal braille. Ele "exibe" o texto levantando e abaixando pequenos pinos que formam os padrões do braille. O terminal braile custa caro, e geralmente tem espaço para apenas 40 caracteres, ou mesmo por volta de 12 ou 20. Ele tem teclas para navegação pela tela, e com isso o usuário vai lendo em partes.

Comparado aos sintetizadores de voz, o terminal braille é muito mais preciso, mas nem todo mundo pode ler em braille, e o preço é muito alto (em torno de 5.000 dólares). O suporte aos vários dispositivos existentes é muito bom: dentre os leitores de tela, tanto o brltty quanto o suseblinux suportam uma ampla variedade de dispositivos.


Os cegos provavelmente usarão dispositivos em braille e sintetizadores de voz em conjunto. Os dispositivos para os outro tipos de deficiência variam bastante. Eles vão de joysticks (suportados nativamente pelo X.org) a sistemas que acompanham o movimento dos olhos (gerenciados pelo dasher), fazendo uso do apertar de botões (suportado pelo GOK, o teclado de tela do GNOME) ou da mera ampliação da tela (implementada pelo gnome-mag).


Fonte: 

www.hardware.com.br
 
Links: 

http://www.acessibilidadelegal.com/33-manual-orca.php

http://softwarelivre.org/acessibilidade-em-software-livre/acessibilidade-no-orca-e-gnulinux


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

