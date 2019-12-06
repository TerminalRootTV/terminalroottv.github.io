---
layout: post
title: "Conheça o Clear Linux a Distro da Intel®"
date: 2019-12-06 11:31:07
image: '/assets/img//assets/img/distros/Screenshot from 2019-12-04 22-48-09.jpg'
description: 'É uma distribuição Linux rolling release de código aberto.'
tags:
- clear
- distros
- linux
- intel
---

[![Conheça o Clear Linux a Distro da Intel®️ ](/assets/img/distros/Screenshot from 2019-12-04 22-48-09.jpg)](/assets/img/distros/Screenshot from 2019-12-04 22-48-09.jpg)

O [Clear Linux OS](https://clearlinux.org/) é uma distribuição Linux *rolling release* , desenvolvida pela [Intel Corporation ®️ ](https://www.intel.com/) de código aberto e otimizada para desempenho e segurança, projetada para personalização e capacidade de gerenciamento.

## Melhorias

Segundo esse próprio vídeo abaixo(ative as legendas) , ela possui otimizações diretamente no Kernel Linux com construções independentes de módulos que separa a execução de atividades, deixando o desempenho melhor, principalmente se tratando de hardwares que possuem uma CPU da família Intel: Celeron, i3 , i5, i9 e demais.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

<iframe width="920" height="400" src="https://www.youtube.com/embed/VxA-vim715w" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Instalação

> Antes de instalar, veja os [requerimentos míninmos](https://docs.01.org/clearlinux/latest/get-started/compatibility-check.html), o Clear Linux só instala com no mínimo 4GB de RAM.

A instalação é bem simples, se você está acostumado com instalação de distribuições como Ubuntu e Mint, o processo de instalação do Clear Linux é bem similar . 

No entanto, é recomendado você instalar primeiramente o Clear Linux em uma partição com setor de inicialização em GPT (lembre-se ~~MBR~~ é um passado grotesco! ) , pois se quiser instalar posteriormente, vai precisar definir os *names*: **CLR_BOOT**, **CLR_SWAP** e **CLR_ROOT** pra conseguir fazer um dual boot existindo sistema. 

E mesmo assim, poderá não conseguir, digo isso, pois o instalador , no meu caso, nem conseguiu identificar o disco .

E você pode fazer o download no link: <https://clearlinux.org/downloads> . Há três versões disponíveis:
+ **Clear Linux OS Desktop** - Para usuários finais;
+ **Clear Linux* OS Server** - Para servidores;
+ e o **Containers** - Para rodar via [Docker](https://terminalroot.com.br/2019/08/tutorial-definitivo-de-docker-para-iniciantes-ubuntu.html).

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

## Uso

+ O Clear Linux é baseado no [Fedora](https://terminalroot.com.br/2019/09/ambiente-de-desenvolvimento-fedora-30.html) e possui o `dnf` para gerenciar pacotes do sistema; 
+ Vem por padrão com o [GNOME](https://terminalroot.com.br/2018/02/como-customizar-a-aparencia-do-gnome.html) com algumas modificações básicas e por sua vez também a *Central de Software* para quem quiser fazer instalações em modo gráfico;
+ O [Tema de ícones](https://terminalroot.com.br/2019/12/os-8-melhores-temas-de-icones-para-linux.html) padrão é o [Papirus](https://terminalroot.com.br/2019/12/os-8-melhores-temas-de-icones-para-linux.html);
+ Já vem com centenas de aplicativos pré-instalados, incluindo: [Git](https://terminalroot.com.br/git) e [Neofetch](https://terminalroot.com.br/2019/01/como-criar-um-fetch-estilo-screenfetch-e-neofetch-em-shell-script.html);
+ Possui algumas alternativas de Interface, como: GNOME com Wayland(padrão pós install), GNOME com Xorg(padrão Live), GNOME Flashback(estino GNOME2 com modificações) e uma opção simples com Interface, mas que só abre o Terminal. 

## Conclusão

Eu particularmente gostei do [Clear Linux](https://clearlinux.org/) , é um bom pedido para quem possui um processador da Intel e quer melhor desempenho, principalmente para que usa GNOME .

Lembando que o *Clear Linux OS* não deve ser confundido com [ClearOS](https://www.clearos.com/) que é outros sistema, muitos se confundem!

Espero que vocês também tenham gostado, e se quiserem testar sem instalar, o mesmo funciona em modo Live, e bem rápido por sinal.

Abraços!
