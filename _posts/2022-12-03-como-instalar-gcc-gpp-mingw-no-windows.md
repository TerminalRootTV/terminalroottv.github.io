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

O compilador padrão do [Microsoft Windows](https://terminalroot.com.br/tags#windows) é o [MSVC](https://learn.microsoft.com/en-us/cpp/build/reference/compiler-options?view=msvc-170) e ele é instalado quando instalamos o [Visual Studio](). Apesar de ser um [IDE](https://terminalroot.com.br/2021/12/os-32-melhores-ides-editores-de-texto-para-cpp.html#23-visual-studio) poderosíssimo, eu mesmo recomendo para quase todas as situações, algumas bibliotecas ficam mais práticas de trabalhar com um ambiente mais minimalista e isso pode ser alcançado usando o [GCC/G++](https://terminalroot.com.br/tags#gcc) no Windows.

O pacote desenvolvido pelo [GNU](https://terminalroot.com.br/tags#gnu) para que você consiga usar o [gcc/g++](https://terminalroot.com.br/tags#gcc) no Windows é o [MinGW](https://en.wikipedia.org/wiki/MinGW).

Nesse artigo vamos ver como instalar no **Windows 10** da forma mais básica e minimalista possível!

Vamos ao passo à passo!

---

## 01. Fazendo o download do MinGW
Acesse o endereço: <https://sourceforge.net/projects/mingw-w64/> na aba: **Files** e em **MinGW-W64 GCC-8.1.0**(se tiver uma versão posterior, escolha ela) e faça download do arquivo: 
[x86_64-posix-seh](https://sourceforge.net/projects/mingw-w64/files/Toolchains%20targetting%20Win64/Personal%20Builds/mingw-builds/8.1.0/threads-posix/seh/x86_64-8.1.0-release-posix-seh-rt_v6-rev0.7z) e após baixado: descompacte o arquivo:

> Se não conseguir encontrar o arquivo de nome: `x86_64-8.1.0-release-posix-seh-rt_v6-rev0.7z` clique no botão abaixo que será direcionado automaticamente para o download:

<a href="" class="btn btn-danger btn-lg">Fazer download do arquivo: <code>x86_64-8.1.0-release-posix-seh-rt_v6-rev0.7z</code></a>

> Lembre-se possuir um descompactador para esse arquivo `.7z`, caso tenha dificuldade, baixe esse programa nesse endereço: <https://www.7-zip.org/>, instale e use-o para descompactar o outro arquivo que você baixou.

![gcc/g++ MinGW Windows 1](/assets/img/windows/mingw/1.png)
![gcc/g++ MinGW Windows 2](/assets/img/windows/mingw/2.png)
![gcc/g++ MinGW Windows 3](/assets/img/windows/mingw/3.png)

## 02. Instalação
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

## 03. Crie Variáveis de Ambiente 
Pesquise na **Barra de Início** a palavra **Variáveis de Ambiente** , clique na primeira opção e depois no botão: **Variáveis de Ambiente**, abrirá uma nova janela:
![gcc/g++ MinGW Windows 5](/assets/img/windows/mingw/5.png)

Na caixa de baixo(Variáveis do Sistema), selecione **Path** e clique no botão **Editar**, na janela que abriu clique no botão **Novo** e cole o endereço do caminho: `C:\mingw64\bin`:
![gcc/g++ MinGW Windows 6](/assets/img/windows/mingw/6.png)


---

## 04. Testando no [PowerShell](https://terminalroot.com.br/2021/12/como-instalar-powershell-no-ubuntu-e-primeiros-passos.html) e no `cmd`
Abra o PowerShell ou o CMD, entre na pasta onde houver um arquivo C/C++, compile e rode:
![gcc/g++ MinGW Windows 7](/assets/img/windows/mingw/7.png)
![gcc/g++ MinGW Windows 8](/assets/img/windows/mingw/8.png)

No [VS Code](https://terminalroot.com.br/tags#code) fica mais fácil de usar:
![VS Code](/assets/img/windows/mingw/9.png)
> Para facilitar a abertura do PowerShell no VS Code você pode instalar [essa extensão](https://learn.microsoft.com/pt-br/powershell/scripting/dev-cross-plat/vscode/using-vscode?view=powershell-7.3#install-vs-code-and-the-powershell-extension).

Em alguns casos, quando não consegue encontrar esses comandos, talvez seja necessário fechar e abrir novamente o `CMD` ou PowerShell(dependendo de qual você está usando) e talvez, em outros casos, até reiniciar o Windows.

---

## 05. Dica adicional e IMPORTANTE!
Existe um arquivo `.exe` de nome: `mingw32-make` no caminho: `C:\mingw64\bin\mingw32-make`(`mingw32-make.exe`) RENOMEI-O para `make`(`make.exe`) somente, basta clicar nele e pressionar `F2`, habilitará a opção de escrver o novo nome.

Escolher esse nome `make` para esse arquivo, facilitará rodar de forma automática muitos scripts que já procuram ele no seu sistema. Além de diversos tutoriais que na sequência de comandos, pedem que você rode `make` e talvez você não lembre do nome antigo!


---

Caso deseje, você pode optar em seguir [esse tutorial](https://code.visualstudio.com/docs/cpp/config-mingw) para instalar com [MSYS2](https://www.mingw-w64.org/downloads/#msys2), no entanto, acho mais bagunçado, o MSYS2 cria um monte de atalhos.

# Aprenda C++ e crie Games, Interfaces Gráfica e outros de forma fácil e simples:
## <https://terminalroot.com.br/cpp>

---

# Veja também:
## [Como Instalar o Vim e Neovim no Windows](https://terminalroot.com.br/2022/12/como-instalar-o-vim-e-neovim-no-windows.html)
## [Crie Jogos para Windows, Linux e Web com Raylib C/C++](https://terminalroot.com.br/2022/11/crie-jogos-para-windows-linux-e-web-com-raylib-c-cpp.html)
## [Como instalar Lua no Windows 10](https://terminalroot.com.br/2022/07/lua-windows.html)
## [Como Implementar Dear ImGUi com SFML no Windows 10](https://terminalroot.com.br/2022/07/como-implementar-dear-imgui-com-sfml-no-windows-10.html)
## [Como Instalar o Qt Creator 6 com QtWebEngine no Windows e Linux](https://terminalroot.com.br/2022/06/como-instalar-o-qt-creator-6-com-qtwebengine-no-windows-e-linux.html)



