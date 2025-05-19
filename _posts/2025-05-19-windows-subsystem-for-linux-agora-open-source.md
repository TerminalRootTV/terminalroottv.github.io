---
layout: post
title: "Windows Subsystem for Linux agora é open source!"
date: 2025-05-19 17:25:13
image: '/assets/img/windows/WSLOpenSourceBlogImage.jpg'
description: "🐧 Revelada qual a linguagem de programação que o WSL foi escrito..."
icon: 'ion:terminal-sharp'
iconname: 'Windows'
tags:
- windows
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

A Microsoft acabou de anunciar o lançamento de código aberto do [Windows](https://terminalroot.com.br/tags#windows) Subsystem para Linux.

Isso significa que o código que alimenta o WSL agora está disponível no GitHub e open source para a comunidade! Você pode baixar o **WSL** e construí-lo a partir do código-fonte, adicionar novas correções e recursos e participar do desenvolvimento ativo do *WSLilits*.


<!-- SQUARE - GAMES ROOT -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

## Visão geral do componente WSL
WSL é feito de um conjunto de componentes de distribuição. Alguns são executados no [Windows](https://terminalroot.com.br/tags#windows) e alguns são executados dentro da máquina virtual **WSL 2**. Aqui está uma visão geral da arquitetura WSL

![Arquitetura do WSL](/assets/img/windows/wsl-architecture.png) 

O código WSLilits pode ser dividido nessas áreas principais:

+ Executáveis de linha de comando que são os pontos de entrada para interagir com o WSL
+ `wsl.exe`, `wslconfig.exe` e `wslg.exe`
+ O serviço WSL que inicia a VM WSL, inicia distros, monta compartilhamentos de acesso a arquivos e muito mais
  - `wslservice.exe`
+ Processos `init` e `daemon` do Kernel Linux, binários que são executados no Linux para fornecer funcionalidade WSL
+ E entre outros componentes!
Acesse: <https://wsl.dev> para saber mais sobre cada componente.


<!-- RECTANGLE 2 - OnParagragraph -->
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

## Por que o código aberto agora? Um pouco de história...
A WSL foi anunciada pela primeira vez na BUILD em 2016 e foi lançada pela primeira vez com a atualização do **[Windows](https://terminalroot.com.br/tags#windows) 10 Anniversary**.

Naquela época, o WSL era baseado em um provedor de processos **pico**, o `lxcore.sys`, que permitia que o [Windows](https://terminalroot.com.br/tags#windows) executasse executáveis **ELF** nativamente e implementasse *syscalls* do Kernel Linux dentro do kernel do [Windows](https://terminalroot.com.br/tags#windows). Isso acabou se tornando o que hoje conhecemos como "WSL 1", que a WSL ainda suporta.

Com o tempo, ficou claro que a melhor maneira de fornecer compatibilidade ideal com o *Kernel Linux* nativo, então, A WSL 2 nasceu e foi anunciada pela primeira vez em 2019.

À medida que a comunidade por trás da WSL cresceu, a WSL ganhou mais recursos, como suporte a GPU, suporte a aplicativos gráficos (via wslg) e suporte a *systemd*.

Eventualmente, ficou claro que, para acompanhar as crescentes solicitações de comunidade e recursos, a WSL teve que se mover mais rápido e enviar separadamente do [Windows](https://terminalroot.com.br/tags#windows). Isso explica por que, em 2021, separaram o WSL da base de código do [Windows](https://terminalroot.com.br/tags#windows) e o moveram para sua própria base de código. 

Esta nova WSL foi lançada pela primeira vez como *versão 0.47.1* para a Microsoft Store, em julho de 2021. Na época, apenas o [Windows](https://terminalroot.com.br/tags#windows) 11 era suportado e o pacote era marcado como visualização, recomendado apenas para usuários que queriam experimentar o mais recente e melhor da WSL.

Continuou a desenvolver este novo pacote "WSL" até estar pronto para disponibilidade geral. Isso aconteceu em novembro de 2022, com o *WSL 1.0.0*, que adicionou suporte para o [Windows](https://terminalroot.com.br/tags#windows) 10 e foi a primeira versão "stable" desta nova WSL.

A partir daí, continuaram a melhorar a WSL, com o objetivo de fazer a transição completa de todos os usuários para este novo pacote WSL e longe do componente WSL fornecido com o [Windows](https://terminalroot.com.br/tags#windows).

À medida que continuaram melhorando a WSL, acabaram atingindo outro marco: *WSL 2.0.0* (Quais são os três problemas mais difíceis em ciência da computação? Fora por um erro e nomeando coisas!).

> O WSL 2.0.0 introduziu grandes melhorias, como rede espelhada, tunelamento de DNS, suporte a sessão 0, suporte a proxy, suporte a firewall e muito mais.


<!-- RECTANGLE LARGE -->
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

---

## Qual linguagem de programação o WSL foi escrito?
O WSL ([Windows](https://terminalroot.com.br/tags#windows) Subsystem for Linux) foi escrito principalmente em [**C++**](https://terminalroot.com.br/tags#cpp)! 

Além de muitas partes também em [Linguagem C](https://terminalroot.com.br/c), e pequenos scripts em outras linguagens.

![WSL foi escrito em sua maioria em C++](/assets/img/windows/linguagens.png) 

Acesse o repositório oficial: <https://github.com/microsoft/WSL/>.

---

Base para esse artigo: *https://blogs.windows.com/windowsdeveloper/2025/05/19/the-windows-subsystem-for-linux-is-now-open-source/*

