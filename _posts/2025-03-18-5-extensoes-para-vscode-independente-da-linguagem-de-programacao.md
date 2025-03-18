---
layout: post
title: "5 Extensões para VSCode independente da Linguagem de Programação"
date: 2025-03-18 13:46:47
image: '/assets/img/vscode/5-vscode-ext.jpg'
description: "🚀 E mais dicas para alterar a fonte e o cursor."
icon: 'ion:terminal-sharp'
iconname: 'VSCode'
tags:
- vscode
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Sabe quando você instala o [VSCode](https://terminalroot.com.br/tags#vscode) e precisa configurá-lo à sua maneira? Você já começa a pensar nas extensões de acordo com a sua linguagem de programação, no entanto, antes delas é necessário deixá-lo funcional e agradável para qualquer situação.

Apesar de eu usar pouco o VSCode, uso mais o [Vim](https://terminalroot.com.br/vim)/[Neovim](https://terminalroot.com.br/tags#neovim), quando preciso desenvolver algo para Web, geralmente eu uso o VSCode.

E abaixo há **5 extensões que eu sempre instalo quando preciso configurar o VSCode** em qualquer novo PC ou quando formato o meu.


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

## 01. [All Autocomplete](https://marketplace.visualstudio.com/items?itemName=Atishay-Jain.All-Autocomplete)
**All Autocomplete** é uma extensão que expande a funcionalidade de autocompletar do VSCode, sugerindo palavras de todos os arquivos abertos, não apenas do arquivo atual. Útil para manter consistência em [projetos grandes](https://terminalroot.com.br/mylang).

![All](https://cdn.rawgit.com/atishay/vscode-allautocomplete/1ea2b07b/images/All-Autocomplete.gif) 

---

## 02. [One Dark Pro](https://marketplace.visualstudio.com/items?itemName=zhuangtongfa.Material-theme)
Apesar de eu usar o [Sobrio](https://terminalroot.com.br/2024/06/top-8-melhores-temas-de-cores-para-seu-vim-neovim.html#01-sobrio) no Vim e Neovim, no VSCode eu prefiro o **One Dark Pro**. É um [Tema visual](https://terminalroot.com.br/2020/04/775-temas-para-seu-vs-code.html) inspirado no *One Dark* do [Atom](https://terminalroot.com.br/2023/03/conheca-o-pulsar-o-retorno-de-jedi-do-atom.html), oferecendo um esquema de cores escuro e bem contrastado, ideal para quem prefere interfaces elegantes e confortáveis para os olhos.

![One Dark](https://cdn.jsdelivr.net/gh/binaryify/onedark-pro/screenshots/editor1.png) 

---

## 03. [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)
**Markdown All in One** é uma extensão completa para edição de [Markdown](https://terminalroot.com.br/tags#markdown), fornecendo atalhos, pré-visualização, geração de tabelas e suporte a *to-do lists*, tornando a escrita mais eficiente.

![Markdown](https://github.com/yzhang-gh/vscode-markdown/raw/master/images/gifs/section-numbers.gif) 

---

## 04. [VSCodeVim](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim)
Nós já fizemos um [vídeo sobre VSCodeVim](https://terminalroot.com.br/2023/06/como-utilizar-o-vim-junto-com-o-vscode.html), é uma extensão que adiciona suporte ao modo Vim dentro do VSCode, permitindo comandos, navegação e atalhos do Vim para usuários acostumados com essa experiência de edição.

[![Como Utilizar o VIM junto com o VS CODE](https://terminalroot.com.br/assets/img/vscode/vscode-exts/06.jpg)](https://youtu.be/6HAFJu_O7Gk)

---
## 05. [IntelliCode](https://marketplace.visualstudio.com/items?itemName=VisualStudioExptTeam.vscodeintellicode)
E por fim, **IntelliCode** é uma extensão da Microsoft que aprimora a sugestão de código usando [inteligência artificial](https://terminalroot.com.br/tags#ia), oferecendo recomendações inteligentes baseadas em padrões de código populares.

![IntelliCode](https://aka.ms/IntelliCodeUsageExamplesv2) 

---

Além dessas extensões eu também configuro a fonte:

+ Obtenho o nome da fonte que desejo, geralmente escolho a [JetBrains Mono Medium Nerd Font](http://github.com/terroo/fonts), exemplos:
No Windows com PowerShell:
{% highlight powershell %}
Get-ConsoleFontInfo
{% endhighlight %}

Em sistemas GNU/Linux ou macOS:
{% highlight bash %}
fc-list | grep "JetBrains"
{% endhighlight %}

+ Altero a configuração da fonte  
Em`settings.json` (`Ctrl+Shift+P` → "Preferences: Open Settings (JSON)") e defina:  

{% highlight json %}
"editor.fontFamily": "'JetBrainsMono Nerd Font', 'JetBrains Modo Medium Nerd Font', monospace"
{% endhighlight %}

Depois é só reiniciar o VSCode para que as mudanças sejam aplicadas. Eu também altero o cursor tanto do editor quanto do terminal para [I-Beam](https://terminalroot.com.br/2024/05/leia-arquivos-com-esse-app-cli-feito-com-cpp.html)/Barra vertical.

Veja também abaixo alguns artigos que podem ser interessantes para você:

+ [Como Utilizar o VIM junto com o VS CODE](https://terminalroot.com.br/2023/06/como-utilizar-o-vim-junto-com-o-vscode.html)
+ [Top 8 Melhores Extensões para seu VSCode](https://terminalroot.com.br/2023/09/top-8-melhores-extensoes-para-seu-vscode.html)
+ [Utilize o Compile Explorer com VS Code](https://terminalroot.com.br/2024/04/utilize-o-compile-explorer-com-vs-code.html)
+ [As 10 Melhores Extensões do VSCode para C/C++](https://terminalroot.com.br/2023/11/as-10-melhores-extensoes-do-vscode-para-c-cpp.html)
+ [18 Melhores Plugins para Python no VSCode](https://terminalroot.com.br/2020/10/18-melhores-plugins-para-python-no-vscode.html)
+ [20 Extensões Essenciais para Desenvolvimento Laravel e PHP no VSCode](https://terminalroot.com.br/2023/11/20-extensoes-essenciais-para-desenvolvimento-laravel-e-php-no-vscode.html)
+ [Instale essa extensão do VS Code para comentar blocos em ASCII](https://terminalroot.com.br/2020/01/instale-essa-extensao-do-vs-code-para-comentar-blocos-em-ascii.html)
+ [775 Temas para seu VS Code](https://terminalroot.com.br/2020/04/775-temas-para-seu-vs-code.html)
+ [VSCodium - Um VS Code Open Source que NÃO te rastreia](https://terminalroot.com.br/2019/04/vscodium-um-vs-code-open-source-que-nao-te-rasrtreia.html)


<!--
+ <https://marketplace.visualstudio.com/vscode>
+ <https://x-team.com/blog/best-vscode-extensions>
+ <https://www.freecodecamp.org/news/best-vscode-extensions/>
+ <https://www.syncfusion.com/blogs/post/top-vs-code-extensions>
+ <https://www.google.com/search?q=how+to+create+vscode+extension>
+ <https://code.visualstudio.com/api/get-started/your-first-extension>
-->


