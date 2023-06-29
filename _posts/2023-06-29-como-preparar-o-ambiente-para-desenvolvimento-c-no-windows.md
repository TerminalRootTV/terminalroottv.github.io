---
layout: post
title: "Como Preparar o Ambiente para Desenvolvimento C# no Windows"
date: 2023-06-29 11:59:12
image: '/assets/img/csharp/csharp-env/csharp-env.jpg'
description: 'Utilize o CSharp tanto com o Visual Studio ou via Linha de Comando com VS Code e outros pelo Terminal!'
icon: 'ion:terminal-sharp'
iconname: 'C#'
tags:
- csharp
- windows
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Nesse artigo veremos como preparar o ambiente de desenvolvimento no [Windows](https://terminalroot.com.br/tags#windows) para programar em [CSharp](https://terminalroot.com.br/tags#csharp).

Nós já mostramos como fazer isso, mas foi no [Ubuntu](https://terminalroot.com.br/tags#ubuntu) e/ou em qualquer outra distribuição [GNU](https://terminalroot.com.br/tags#gnu)/[Linux](https://terminalroot.com.br/tags#linux):

+ [Como Instalar o C# em Qualquer Distro GNU/Linux](https://terminalroot.com.br/2022/12/como-instalar-o-csharp-em-qualquer-distro-gnu-linux.html)

---

[C#](https://learn.microsoft.com/en-us/dotnet/csharp/tour-of-csharp/) é uma linguagem de programação, multiparadigma, de tipagem forte, desenvolvida pela Microsoft como parte da plataforma [.NET](https://en.wikipedia.org/wiki/C_Sharp_(programming_language)). 

A sua sintaxe orientada a objetos foi baseada no [C++](https://terminalroot.com.br/tags#cpp) mas inclui muitas influências de outras linguagens de programação, como Object Pascal e, principalmente, [Java](https://terminalroot.com.br/tags#java). 

O código fonte é compilado para **Common Intermediate Language (CIL)** que é interpretado pela máquina virtual **Common Language Runtime (CLR)**. 

**C#** é uma das linguagens projetadas para funcionar na **Common Language Infrastructure** da plataforma **.NET Framework**.

Vamos ao passo à passo!

---

# Instalação
Antes de mais nada você precisa baixar e instalar o [Visual Studio](https://visualstudio.microsoft.com/). Se você já o tem instalado e deseja adicionar o suporte ao C#, basta clicar na **Barra de Iniciar do Windows** e digitar: **Visual Studio Installer**, como na imagem abaixo.

![Visual Studio Installer](/assets/img/csharp/csharp-env/CSHARP-01.jpg) 

Abrirá o mesmo setup como se você estivesse instalando pela primeira vez, a diferença é que alguns recursos já estarão *ticados* se você já possui no seu Windows. Se esse for o caso clique em `Modificar`:

![Modificar Instalação do Visual Studio já pré-instalado](/assets/img/csharp/csharp-env/CSHARP-02.jpg) 

Note na imagem abaixo que além da opção que eu já tinha instalado, na seção: *Área de Trabalho e Dispositivos Móveis*, o *Desenvolvimento para desktop C++** eu marquei também a opção: **Desenvolvimento para desktop com .NET** que é para o C# . Caso queira mais recursos marque também outras opções disponíveis tais como: *Desenvolvimento mobile com .NET*.

![Desenvolvimento para desktop com .NET](/assets/img/csharp/csharp-env/CSHARP-03.jpg) 

Agora é só aguardar o download e instalação dos pacotes:
![Download e Instalação do C#](/assets/img/csharp/csharp-env/CSHARP-04.jpg) 

Você também pode mudar o instalador para o tema dark, mas note abaixo que a instalação foi concluída:
![Instalação concluída](/assets/img/csharp/csharp-env/CSHARP-05.jpg) 
> Basta fechar o instalador!

---

# Criando um Projeto com Visual Studio
Na imagem anterior havia a possibilidade de você já iniciar o Visual Studio após terminada a instalação, mas se você fechou, basta abrí-lo e clicar em: **Criar um projeto**
![Criar um projeto C#](/assets/img/csharp/csharp-env/CSHARP-06.jpg) 

Escolha a linguagem de programação C# conforme na imagem abaixo e depois clique em `Próximo`:
![Escolher C#](/assets/img/csharp/csharp-env/CSHARP-07.jpg) 

Na próxima tela escolha: **Aplicativo de Console** e novamente clique em `Próximo`:
![Aplicativo de Console](/assets/img/csharp/csharp-env/CSHARP-08.jpg) 

Escolha um nome para seu projeto, nesse caso eu nomeei de *ProjectCSahrp*, além de escolhe o local onde o projeto será criado:
![Projeto C#](/assets/img/csharp/csharp-env/CSHARP-09.jpg) 

Escolha a versão mais recente que aparece para você e clique em `Criar`!
![Criar Projeto .NET CSharp](/assets/img/csharp/csharp-env/CSHARP-10.jpg) 

Aguarde a criação que pode demorar um pouco:
![Aguardando a criação do projeto](/assets/img/csharp/csharp-env/CSHARP-11.jpg) 

Após criado, o Visual Studio criará um código básico C# e para testar se está tudo certo, basta clicar no botão <b style="color: green;">▶︎</b> que tem o nome do seu projeto na barra de ferramentas do Visual Studio:
![Rodar o Código Básico C# pré criado pelo Visual Studio](/assets/img/csharp/csharp-env/CSHARP-12.jpg) 

Aparecerá o `console` com a palavra: `Hello, World!`, basta fechar após a exibição:
![Hello, World! CSharp no Console](/assets/img/csharp/csharp-env/CSHARP-13.jpg) 

---

# Utilizando o CSharp via linha de comando
Você também pode: compilar, rodar o código e entre outras tarefas via linha de comando pelo próprio Visual Studio, indo em: `Ferramentas` > `Linha de Comando` > `PowerShell do Desenvolvedor` ou `Prompt de Comando do Desenvolvedor`:
![C# via Linha de Comando pelo Visual Studio](/assets/img/csharp/csharp-env/CSHARP-14.jpg)

Use o comando `dotnet --help` para mais detalhes de uso, ou seja, são os mesmo procedimentos que nós fizemos no [artigo do CSharp em distribuições GNU/Linux](https://terminalroot.com.br/2022/12/como-instalar-o-csharp-em-qualquer-distro-gnu-linux.html):
![Comando dotnet pelo console](/assets/img/csharp/csharp-env/CSHARP-15.jpg) 

Se não quiser usar o Visual Studio você pode optar pelo seu [editor de códigos](https://terminalroot.com.br/tags#editores) preferido como: [VS Code](https://terminalroot.com.br/tags#vscode), [Vim](https://terminalroot.com.br/vim), [Neovim](https://terminalroot.com.br/tags#neovim) e entre outros.

E compilar pelo [terminal](https://terminalroot.com.br/tags#terminal): tanto o [Windows Terminal](https://terminalroot.com.br/2023/04/melhore-seu-desempenho-utilizando-o-windows-terminal.html), [PowerShell](https://terminalroot.com.br/tags#powershell) ou `CMD`:

![Windows Terminal dotnet](/assets/img/csharp/csharp-env/CSHARP-17.jpg) 

O gerenciador de pacotes do [NuGet](https://learn.microsoft.com/en-us/nuget/quickstart/install-and-use-a-package-in-visual-studio) do Visual Studio também está disponível para o C# assim como no [C++](https://terminalroot.com.br/tags#cpp):
![NuGet](/assets/img/csharp/csharp-env/CSHARP-16.jpg) 

---

Simples e fácil, né?!

Teremos mais conteído sobre C# por aqui, mas se quiser mais clique na tag: [#CSharp](https://terminalroot.com.br/tags#csharp)!

---

# Veja também
+ [5 Livros de C# que vale à pena você ler](https://terminalroot.com.br/2023/01/5-livros-de-csharp-que-vale-a-pena-voce-ler.html)

