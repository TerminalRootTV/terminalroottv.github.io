---
layout: post
title: "Como Instalar o Clang no Windows com um único comando"
date: 2024-07-23 17:29:02
image: '/assets/img/windows/clang/clang-windows.jpg'
description: "🐉 Mais uma opção para compilar seus programas via linha de comando no Windows."
icon: 'ion:terminal-sharp'
iconname: 'Windows/LLVM'
tags:
- windows
- clang
- llvm
- cpp
- linguagemc
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Nós já [mostramos](https://terminalroot.com.br/2023/01/como-instalar-o-clang-binario-em-qualquer-distro-gnu-linux.html) que você pode instalar o [Clang](https://terminalroot.com.br/tags#clang) em distros [GNU/Linux](https://terminalroot.com.br/tags#gnulinux) sem precisar do seu gerenciador de pacotes, pois muitas vezes novas versões aparece com recursos habilitados que você não gostaria.

Já vi pessoas relatarem, por exemplo, que o LSP dele que usa o `clangd` emite uns *warnings* para *não uso de cabeçalho*. Lógico que isso pode ser desabilitado, mas as pessoas gostam de ter tudo pronto.

Nesse artigo veremos que vc pode instalar o **Clang/Clang++** no [Windows](https://terminalroot.com.br/tags#windows) com um único comando.

Além de ter todas as ferramentas também disponíveis, tais como:
+ REPL do clang;
+ `clangd`;
+ LLVM;
+ E todas as outras!


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

Primeiramente certifique-se que não tem o `clang` instalado. Abra o PowerShell e rode o comando:
{% highlight bash %}
clang --version
{% endhighlight %}

Se a saída for similar a imagem abaixo é porque você ainda não tem instalado, então, vamos ao comando para instalar.

![clang no install](/assets/img/windows/clang/noclang.jpg) 

---

## O comando mágico
O comando abaixo deve ser utilizado no [PowerShell](https://terminalroot.com.br/tags#powershell). 

### 01. copie e cole no seu PowerShell devidamente aberto:

{% highlight bash %}
powershell -Exec ByPass -NoProfile -c "(New-Object Net.WebClient).DownloadString('https://tinyurl.com/llvm-mingw') | IEX"
{% endhighlight %}
> Quando você colar, o PowerShell emitirá uma pergunta se você realmente deseja colar, responda sim!

Abrirá um menu suspenso informando o andamento do download e todo processo de instalação, basta aguardar:

![clang install](/assets/img/windows/clang/clang-install.jpg) 

### 02. Copie o caminho da instalação até a pasta `\bin`
O local de instalação será similar ao caminho abaixo, mas no seu caso onde tem `[SEU USUÁRIO]` deve ser o nome do seu usuário no Windows:
{% highlight bash %}
C:\Users\[SEU USUÁRIO]\.utils\llvm-mingw\bin
{% endhighlight %}

Clique na barra de endereço e copie esse caminho.


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

### 03. Crie variáveis de ambiente
Após isso, feche o PowerShell, ou [Windows Terminal](https://terminalroot.com.br/2023/04/melhore-seu-desempenho-utilizando-o-windows-terminal.html), ou até mesmo o [VSCode](https://terminalroot.com.br/tags#vscode) que usa um terminal embutido.

+ Agora digite: **Variáveis de Ambiente**;
+ Selecione a primeira opção, depois clique no botão **Variáveis de Ambiente** da janela que abriu;
+ Depois na opção de baixo: **Variáveis do Sistema** selecione a linha **PATH**;
+ E clique em **Editar**. Na nova janela que abrirá, clque em **Novo** e cole o caminho que você copiou.

Similar a imagem abaixo:

![Editar Path](/assets/img/windows/clang/path-edit.jpg) 
> Abra imagem em uma nova guia para uma maior resolução.

---

Agora é só abrir novamente o PowerShell e note que o comando `clang --version` já haverá saída indicando a versão:

![Clang version](/assets/img/windows/clang/close-all.jpg) 

Depois é só fazer um teste e compilar com `clang` para [Linguagem C](https://terminalroot.com.br/c) ou [Clang++](https://terminalroot.com.br/cpp) para [C++](https://terminalroot.com.br/tags#cpp):

![Teste clang++](/assets/img/windows/clang/run-clang.jpg) 

---

## **OBSERVAÇÃO**
Dentro da pasta `\bin` do caminho que você copiou haverá um executável de nome `g++`, lógico que não é o [gcc/g++](https://terminalroot.com.br/tags#gcc), mas sim o `clang++` renomeado para `g++`, o mesmo ocorre com o `gcc`.

Se você tem o [MinGW](https://terminalroot.com.br/2022/12/como-instalar-gcc-gpp-mingw-no-windows.html) instalado no seu sistema, ainda funcionará, pois o Windows dará prioridade para esse binário, acho que pode ser a ordem que foi adicionado às variáveis do sistema.

Mas, por via das dúvidas é bom testar!


