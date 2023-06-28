---
layout: post
title: "Como Compilar com MSVC via linha de comando"
date: 2023-06-28 17:13:01
image: '/assets/img/msvc/msvc.jpg'
description: 'Nem sempre é necessário usar o depurador do Visual Studio no Windows.'
icon: 'ion:terminal-sharp'
iconname: 'MSVC'
tags:
- windows
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Utilizar a [linha de comando](https://terminalroot.com.br/tags#comandos) antigamente parecia ser coisa de nerd, mas com o tempo notou-se que é bem mais prático e fácil que o modo gráfico, além de ter um ganho de desempenho enorme!

Nesse artigo veremos que você pode usar o comando `cl` do compilador [MSVC](https://learn.microsoft.com/en-us/cpp/build/reference/compiler-options?view=msvc-170) da Microsoft para compilar seus programas!

---

## 01. Abra o Developer PowerShell
Antes de mais nada certifique se possuir instalado o [Visual Studio](https://visualstudio.microsoft.com/pt-br/).

Após criado seu projeto, que não precisa necessariamente ter sido criado no Visual Studio, pode ser no [VS Code](https://terminalroot.com.br/tags#vscode), [Vim](https://terminalroot.com.br/vim), Code::Blocks e entre outros.

Para compilar basta pesquisar a palavra *Developer PowerShell* na Barra de Iniciar do [Windows](https://terminalroot.com.br/tags#windows) e escolher a opção: **Developer PowerShell for VS 2019**, lembrando que nesse caso é referente a versão 2019 do Visual Studio, mas se você tiver a outra versão aparecerá o ano/número da sua versão. E clique em *Abrir*.

![MSVC](/assets/img/windows/msvc/MSVC-01-01.jpg) 

---

## 02. Navegue até seu arquivo C/C++
Na imagem há o uso dos comando `cd`, `ls` e `cat` pelo [PowerShell](https://terminalroot.com.br/tags#powershell), mas use o Developer PowerShell.

![MSVC](/assets/img/windows/msvc/MSVC-01-02.jpg) 


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

## 03. Compile seu(s) arquivo(s) C/C++
Para compilar basta usar o comando `cl`, conforme exemplos abaixo:

{% highlight bash %}
cl main.cpp
{% endhighlight %}

E em seguida para executar rode o nome do arquivo com ponto barra invertida:
{% highlight bash %}
.\main.exe
{% endhighlight %}

![MSVC](/assets/img/windows/msvc/MSVC-01-03.jpg) 

---

## 04. Utilizando parâmetros para o MSVC
Você também pode criar o nome de binário que desejar similar ao [GCC](https://terminalroot.com.br/tags#gcc) e [Clang](https://terminalroot.com.br/tags#clang):

{% highlight bash %}
cl main.cpp -o program
.\program.exe
{% endhighlight %}
![MSVC](/assets/img/windows/msvc/MSVC-01-04.jpg) 

Também a outros parâmetros, no entanto, o modelo utilizado pelo MSCV não é sempre o uso de traço`-` e sim barra, exemplo para `Wall`, `O2` e outros:
{% highlight bash %}
cl /Wall /O2 main.cpp -o output
.\output.exe
{% endhighlight %}
![MSVC](/assets/img/windows/msvc/MSVC-01-05.jpg) 

Para mais parâmetros rode o comando:
{% highlight bash %}
cl -help
{% endhighlight %}
![MSVC](/assets/img/windows/msvc/MSVC-01-06.jpg) 

---

## Alternativa dentro do Visual Studio
Você também pode abrir o **Developer PowerShell** ou até mesmo o `CMD` através do Visual Studio, poupando o uso demorado do Depurador Gráfico.

Para isso basta clicar em: `Ferramentas` > `Linha de Comando` > `PowerShell do Desenvolvedor` ou  `Prompt de Comando do Desenvolvedor`:
![MSVC](/assets/img/windows/msvc/MSVC-01-07.jpg) 

E utilizar os mesmos procedimentos listados acima:
![MSVC](/assets/img/windows/msvc/MSVC-01-08.jpg) 

---

Para mais informações acesse o: [endereço do MSVC](https://learn.microsoft.com/en-us/cpp/build/reference/compiler-options?view=msvc-170).



