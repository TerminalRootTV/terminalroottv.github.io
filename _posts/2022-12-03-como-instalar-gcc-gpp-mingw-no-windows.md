---
layout: post
title: "Como Instalar GCC/G++ MinGW no Windows"
date: 2022-12-03 15:28:10
image: '/assets/img/windows/mingw/mingw.jpg'
description: 'Para usar via PowerShell ou CMD com VS Code e/ou outros.'
icon: 'ion:terminal-sharp'
iconname: 'gcc/g++'
tags:
- gcc
- windows
- powershell
- cpp
- linguagemc
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

O compilador padrão do [Microsoft Windows](https://terminalroot.com.br/tags#windows) é o [MSVC](https://learn.microsoft.com/en-us/cpp/build/reference/compiler-options?view=msvc-170) e ele é instalado quando instalamos o [Visual Studio](). Apesar de ser um [IDE](https://terminalroot.com.br/2021/12/os-32-melhores-ides-editores-de-texto-para-cpp.html#23-visual-studio) poderosíssimo, eu mesmo recomendo para quase todas as situações, algumas biblioteca ficam mais práticas de trabalhar com um ambiente mais minimalista e isso pode ser alcançado usando o [GCC/G++](https://terminalroot.com.br/tags#gcc) no Windows.

O pacote desenvolvido pelo [GNU](https://terminalroot.com.br/tags#gnu) para que você consiga usar o [gcc/g++](https://terminalroot.com.br/tags#gcc) no Windows é o [MinGW](https://en.wikipedia.org/wiki/MinGW).

Nesse artigo vamos ver como instalar no **Windows 10** da forma mais básica e minimalista possível!

Vamos ao passo à passo!

---

# 1. Fazendo o download do MinGW
Acesse o endereço: <https://sourceforge.net/projects/mingw-w64/> na aba: **Files** e em **MinGW-W64 GCC-8.1.0**(se tiver uma versão posterior, escolha ela) e faça download do arquivo: 
[x86_64-posix-seh](https://sourceforge.net/projects/mingw-w64/files/Toolchains%20targetting%20Win64/Personal%20Builds/mingw-builds/8.1.0/threads-posix/seh/x86_64-8.1.0-release-posix-seh-rt_v6-rev0.7z) e após baixado: descompacte o arquivo:

![gcc/g++ MinGW Windows 1](/assets/img/windows/mingw/1.png)
![gcc/g++ MinGW Windows 2](/assets/img/windows/mingw/2.png)
![gcc/g++ MinGW Windows 3](/assets/img/windows/mingw/3.png)

# 2. Instalação
Mova a pasta descompactada para a unidade `C:\` e copie o endereço da subpasta `bin` o caminho completo é: `C:\mingw64\bin`
![gcc/g++ MinGW Windows 4](/assets/img/windows/mingw/4.png)


<!-- SQUARE - GAMES ROOT -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# 3. Crie variáveis de Ambiente 
Pesquise na **Barra de Início** a palavra **Variáveis de Ambiente** , clique na primeira opção e depois no botão: **Variáveis de Ambiente**, abrirá uma nova janela:
![gcc/g++ MinGW Windows 5](/assets/img/windows/mingw/5.png)

Na caixa de baixo(Variáveis do Sistema), selecione **Path** e clique no botão **Editar**, na janela que abriu clique no botão **Novo** e cole o endereço do caminho: `C:\mingw64\bin`:
![gcc/g++ MinGW Windows 6](/assets/img/windows/mingw/6.png)

# 4. Testando no [PowerShell](https://terminalroot.com.br/2021/12/como-instalar-powershell-no-ubuntu-e-primeiros-passos.html) e no `cmd`
Abra o PowerShell ou o CMD, entre na pasta onde houver um arquivo C/C++, compile e rode:
![gcc/g++ MinGW Windows 7](/assets/img/windows/mingw/7.png)
![gcc/g++ MinGW Windows 8](/assets/img/windows/mingw/8.png)

---

Caso deseje, você pode optar em seguir [esse tutorial](https://code.visualstudio.com/docs/cpp/config-mingw) para instalar com [MSYS2](https://www.mingw-w64.org/downloads/#msys2), no entanto, acho mais bagunçado, o MSYS2 cria um monte de atalhos.

# Aprenda C++ e crie Games, Interfaces Gráfica e outros de forma fácil e simples:
## <https://terminalroot.com.br/cpp>

---

