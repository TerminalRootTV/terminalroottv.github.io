---
layout: post
title: "Utilize o Compile Explorer com VS Code"
date: 2024-04-29 19:25:46
image: '/assets/img/vscode/ce-vscode.jpg'
description: 'Uma extensão útil para várias situações!'
icon: 'ion:terminal-sharp'
iconname: 'Compile Explorer'
tags:
- vscode
- cpp
- assembly
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

O [Compile Explorer](https://terminalroot.com.br/2021/07/alternativas-para-compilar-seu-codigo-cpp-online.html#01-compiler-explorer) é uma ferramenta online que permite aos desenvolvedores escrever código em várias linguagens de programação, principalmente para [C++](https://terminalroot.com.br/tags#cpp), e ver como esse código é traduzido para instruções de máquina pelos compiladores. 

Ele mostra o código [Assembly](https://terminalroot.com.br/2023/11/como-rodar-assembly-dentro-do-codigo-cpp.html) gerado para diferentes plataformas e otimizações, ajudando os desenvolvedores a entender melhor o funcionamento interno dos compiladores e otimizadores. 

Essa ferramenta é útil para experimentar e comparar diferentes trechos de código e para aprender sobre o processo de compilação.

Outra boa notícia é que você pode utilizá-la **dentro do [VS CODE](https://terminalroot.com.br/tags#vscode)** utilizando-o como extensão!


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

# Compiler Explorer for VSCode
A extensão [Compiler Explorer for VSCode](https://github.com/16bit-ykiko/vscode-compiler-explorer) integra o Compiler Explorer ao VSCode com base na API fornecida pelo Compiler Explorer, permitindo que os usuários utilizem diretamente os recursos do Compiler Explorer no VSCode.

Para instalá-la basta selecionar a guia "Extensões" na barra lateral esquerda do seu [VS Code](https://terminalroot.com.br/tags#vscode) e digitar: "Compiler Explorer for VSCode", selecione-a e instale.

![Compiler Explorer for VSCode](/assets/img/vscode/ce-vscode-1.jpg) 

---

# Utilizando
Com o(s) seu(s) arquivo(s) aberto(s), basta clicar no ícone do **Compiler Explorer for VSCode** na barra lateral esquerda, escolher o compilador e clicar no sinal **▶**(No topo da barra lateral) para compilar e escolher as opçoes entre: Console, ASM e Stdout na janela à direita que se abri-rá!

![Compiler Explorer for VSCode](/assets/img/vscode/ce-vscode-2.jpg) 

E você pode fazer todas as análises possível que é feita com a ferramenta online!

---

Para mais informações acesse o [repositório da extensão](https://github.com/16bit-ykiko/vscode-compiler-explorer) no GitHub!

