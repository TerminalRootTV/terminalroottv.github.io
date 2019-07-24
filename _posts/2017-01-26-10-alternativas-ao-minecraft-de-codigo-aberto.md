---
layout: post
title: "10 Alternativas ao Minecraft de Código Aberto"
date: 2017-01-26 18:36:28
image: '/assets/img/games/minecraft.jpg'
description: "Com uma comunidade enorme, existem inúmeros Gamers de Minecraft que adoraria ser capaz de alterar o código e apresentar coisas diferentes."
main-class: 'games'
color: '#141b63'
tags:
- games
categories:
twitter_text: "10 Alternativas ao Minecraft de Código Aberto"
introduction: "Com uma comunidade enorme, existem inúmeros Gamers de Minecraft que adoraria ser capaz de alterar o código e apresentar coisas diferentes."
---

![Minecraft](/assets/img/games/minecraft.jpg)

Não há como negar que [Minecraft](https://minecraft.net) é um jogo favorito para milhões. E sendo escrito em Java permite que ele seja executado em uma variedade de plataformas, incluindo Linux. Com uma comunidade enorme, existem inúmeros Gamers de Minecraft que adoraria ser capaz de alterar o código e apresentar coisas diferentes, infelizmente, o fonte não está disponível para o público em geral.

Mas há boas notícias. A popularidade do Minecraft levou a muitas tentativas de recriar o jogo, e outros de tentar conseguir fazer com que o código dele fosse aberto, apesar de não conseguirem existem alguns clones que estão bem próximos do Minecraft. E esses projetos sofreram tantas evoluções que alguns são até incapazes de diferenciar o Minecraft de um dos seus clones, abaixo segue a lista.

# Minetest

O primeiro jogo em nossa lista é [Minetest](http://www.minetest.net/). __Minetest__ é talvez a alternativa mais completa para Minecraft. Ele suporta jogos multiplayer, apresenta uma série de geradores de terreno e um número de diferentes padrões . Ele também possui uma [API](http://dev.minetest.net/Intro) muito fácil de usar para criar mods em Lua.

Minetest é de código aberto sob a LGPL, e é escrito principalmente em C++ por isso é bastante rápido em comparação com alguns outros escritos em linguagens de script. Minetest é executado em Windows, OS X, Linux, Android, FreeBSD e, possivelmente, outros sistemas operacionais também. [Confira o código-fonte no GitHub](https://github.com/minetest).

![Minetest](/assets/img/games/minetest50.jpg)

# Terasology

[Terasology](http://terasology.org/) possui sombras ameaçadoras e espetaculares. O que começou como uma experiência em geração de terreno processual transformou-se em um jogo cheio de recursos, com multiplayer e uma série de módulos addon instalados por padrão para permitir que você experimente diferentes mecanismos de jogo.

![Terasology](/assets/img/games/terasology.jpg)

# Voxel.js

O estranho desta lista é [Voxel.js] http://voxeljs.com/ . Ao contrário dos outros, não é um jogo em tudo e não pretende ser! Em vez disso, o Voxel.js é uma biblioteca de JavaScript que permite que você crie seus próprios jogos, renderizações ou outros widgets interativos do estilo Minecraft em JavaScript e HTML, permitindo a incorporação fácil em qualquer página da Web sem plugins especiais necessários para qualquer navegador que suporte WebGL .

![Voxel.js](/assets/img/games/voxeljs.jpg)

# TrueCraft

[TrueCraft](https://github.com/SirCmpwn/TrueCraft) é escrito para ser muito perto do jogo original, e é descrito como uma "implementação" do Minecraft, ao contrário de um clone, e é compatível com os lançamentos oficiais do servidor Minecraft. O autor de TrueCraft procura implementar a versão beta 1.7.3 do jogo original, e busca paridade de recursos com o Minecraft.

![TrueCraft](/assets/img/games/truecraft.jpg)

# Craft

[Craft](https://github.com/fogleman/Craft) é outro motor open source voxel no estilo de Minecraft. Sua simplicidade pode atrair se você está interessado em construir um jogo semelhante ao Minecraft, mas não tem certeza por onde começar . O mecanismo do jogo reside em apenas algumas mil linhas de código C e usa OpenGL para renderização. Ele usa algoritmos simples para geração de terreno e outras tarefas, e tudo é armazenado em um banco de dados sqlite3. Há também um servidor multiplayer baseado em Python que vale a pena tentar. Craft é disponibilizado sob uma licença do MIT.

![Craft](/assets/img/games/craft.jpg)


# Outras ótimas opções


[TechCraft](https://techcraft.codeplex.com/) é outro mecanismo de estilo Minecraft escrito em C# usando XNA-4.0, e é de código aberto sob Microsoft Public License. Foi escrito para apoiar um jogo chamado [Xenogalaxies](http://www.xenogalaxies.com/index.html), mas é usado por outros projetos também.
[Manic Digger](http://manicdigger.github.io/) é outra versão do motor de jogo voxel, escrita em linguagens de programação C# e Ć, e é lançada sob [Unlicense](http://unlicense.org/). Manic Digger suporta inúmeros modos de jogo incluem uma implementação shooter em primeira pessoa.
[Freeminer](http://freeminer.org/) é outro jogo sandbox inspirado por Minecraft, e é um fork do Minetest.
Os dois últimos são alternativas de código aberto para o servidor Minecraft, [OpenCraft](http://opencraft.sourceforge.net/) e [Glowstone](https://www.glowstone.net/). O OpenCraft busca primariamente adicionar recursos de scripting e prevenção de griefing ao servidor padrão do Minecraft, enquanto o foco do Glowstone é ser leve e manter uma API madura. Há muitas outras opções para você considerar além destes também, uma lista parcial de que está [disponível aqui](http://minecraft.gamepedia.com/Custom_servers).
    
Meu filho instalou o Minetest no Ubuntu 16.10 dele e gostou, no entanto, me informou diversos recursos que o Minetest possui que o Minecraft não possui e vice-versa , além de algumas poucas diferenças que só ele nota, mas eu não consegui ver diferença, e pra ser sincero achei, talez pelo quantidade de mods que eu instalei pra ele, que pareceu melhor do que o próprio Minecraft !!!
    
Se você quiser instalar o Minetest no Linux, tente encontrá-lo nos repositórios da sua distribuição, no Ubuntu eu consegui com o seguinte comando, pois asssim ele instalou : mods, plugins, ...
{% highlight bash %}
sudo apt-get install minetest*
{% endhighlight %}

Mas caso você deseje instalar os pacotes separados, veja os disponíveis e retire os que você não deseja
{% highlight bash %}
sudo apt-get install minetest minetest-mod-advspawning minetest-mod-mobf minetest-mod-moreores minetest-mod-pipeworks minetest-mod-worldedit minetest-data minetest-mod-mesecons minetest-mod-moreblocks minetest-mod-nether minetest-mod-torches minetest-server
{% endhighlight %}

No final apereceram dois ícones no Dash, sendo que um foi em Português e o outro em Inglês

# Espero que tenha gostado e ajudado em alguma coisa! Deixe seus comentários pra sabermos também sobre sua visão!

Via: OpenSource.com

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

