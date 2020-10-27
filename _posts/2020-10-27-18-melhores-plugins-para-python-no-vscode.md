---
layout: post
title: "18 Melhores Plugins para Python no VSCode"
date: 2020-10-27 12:28:04
image: '/assets/img/python/vscode-python.png'
description: 'Adeque seu VSCode à sua realidade.'
icon: 'vscode-icons:file-type-python'
iconname: 'python'
tags:
- python
- vscode
---

![18 Melhores Plugins para Python no VSCode](/assets/img/python/vscode-python.png)

VS Code é um ótimo editor de texto. Mas quando você o instala, sua funcionalidade é limitada. Você pode editar JavaScript e TypeScript, mas para outras linguagens de programação, será apenas um editor de texto. Você precisará adicionar alguns plugins para transformá-lo em um IDE adequado.

Felizmente, quando você abre um arquivo em uma nova linguagem, o VS Code sugere uma extensão que pode ajudá-lo. Com a extensão Python, você já pode fazer muito - você obtém realce de sintaxe, autocomplete de código e muitos outros recursos que transformam um editor de texto em um editor de código.

Mas existem muitos outros plugins. Alguns adicionam uma funcionalidade totalmente nova e outros oferecem apenas uma pequena melhoria aqui e ali. Vamos conhecê-los agora!

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python) e outros plugins específicos
![01](/assets/img/python/vscode/01.jpg)

Em primeiro lugar - o plugin Python para VS Code. Por padrão, não há suporte para Python no VS Code, mas quando você abre um arquivo Python, o VS Code sugere imediatamente este plugin. Ele adiciona todos os recursos necessários:

+ Destaque de sintaxe para arquivos Python
+ Intellisense (sugestões de preenchimento de código)
+ Capacidade de iniciar um depurador
+ Suporte para coleta e execução de testes (com diferentes estruturas de teste como pytest ou unittest)
+ Linters diferentes
+ E muitos outros pequenos recursos que transformam o VS Code em um editor Python adequado


---

# [Django](https://marketplace.visualstudio.com/items?itemName=batisteo.vscode-django) e outros plugins específicos 
![02](/assets/img/python/vscode/02.jpg)

Se você está trabalhando com frameworks, geralmente existe um plugin que tornará sua vida mais fácil, como Django ou Flask. Eles trazem algumas melhorias adicionais para uma determinada estrutura, como:

+ Melhor destaque de sintaxe para arquivos específicos da estrutura (por exemplo, arquivos de modelo em Django que combinam HTML com tags Django)
+ Trechos adicionais - especialmente úteis para os sistemas de modelos. Ser capaz de inserir loops e if-s com um atalho de duas letras sem abrir e fechar todas as tags {% é uma bênção!
+ Suporte aprimorado para diferentes funções. Por exemplo, o plugin Django adiciona a capacidade de “Ir para a definição” a partir dos modelos.

---

# [IntelliCode](https://marketplace.visualstudio.com/items?itemName=VisualStudioExptTeam.vscodeintellicode)
![03](/assets/img/python/vscode/03.gif)

Intellicode torna o preenchimento automático um pouco mais inteligente. Ele tenta prever qual termo você provavelmente usará em uma determinada situação e coloca esse termo no topo da lista (marcado com um símbolo ☆).

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

Funciona surpreendentemente bem!

---

# [Emmet](https://docs.emmet.io/)
![04](/assets/img/python/vscode/04.gif)

Tecnicamente, Emmet não é uma extensão porque já está integrado ao VS Code por padrão (devido à sua enorme popularidade). Mas ainda merece menção, caso haja alguém que nunca ouviu falar nisso.

Emmet será seu melhor amigo se você estiver escrevendo muito HTML e CSS. Ele permite que você expanda abreviações simples em HTML completo, adiciona prefixos CSS e um monte de outras funções úteis (renomear uma tag, dentro/fora, ir para o par correspondente, etc.)

Na verdade eu conheci esse plugin utilizando o [Vim](https://terminalroot.com.br/vim/), aliás foi lá que começou sua popularidade. Se você digitar:
```html
ul>li.list-item*3
```
E depois pressionar ENTER, resultará em:
```html
<ul>
  <li class="list-item"></li>
  <li class="list-item"></li>
  <li class="list-item"></li>
</ul>
```

---

# [Autodocstring](https://marketplace.visualstudio.com/items?itemName=njpwerner.autodocstring)
![05](/assets/img/python/vscode/05.gif)

Este plug-in acelera a escrita da documentação do Python, gerando alguns dos padrões para você.

Escreva uma assinatura de função, digite `"""` para iniciar a docstring, pressione Enter e este plug-in faz o resto. Ele se encarregará de copiar os argumentos da assinatura da função para os documentos. E se você adicionar tipos aos seus argumentos, irá reconhecê-los e colocá-los no lugar correto na documentação.

---

# [Bookmarks](https://marketplace.visualstudio.com/items?itemName=alefragnani.Bookmarks)
![06](/assets/img/python/vscode/06.jpg)

Essa extensão permite que você marque locais em seu código, liste facilmente todos os seus favoritos em uma barra lateral e se mova entre eles com atalhos de teclado.

É incrivelmente útil.

---

# [Dash](https://marketplace.visualstudio.com/items?itemName=deerawan.vscode-dash)
![07](/assets/img/python/vscode/07.gif)

Com a extensão Dash, você pode acessar a documentação offline para basicamente qualquer linguagem de programação ou framework.

Requer a instalação de uma das ferramentas adicionais para fornecer a documentação:

<!-- RETANGULO LARGO 2 -->
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

+ Dash para macOS
+ Zelo para Linux ou Windows
+ Velocity para Windows

Depois de baixar a documentação, você pode acessá-la offline.


---

# [Error Lens](https://marketplace.visualstudio.com/items?itemName=usernamehw.errorlens)
![08](/assets/img/python/vscode/08.jpg)

Às vezes, as marcas de erros no VS Code são difíceis de detectar (especialmente as dicas de “informações”). Se você não quebrar as linhas, é ainda pior - o erro pode estar na parte do código não visível na tela.

Por isso é interessante usar o Error Lens. Isso lhe permite modificar como os erros devem ser exibidos. Ele pode exibir a mensagem de erro ao lado da linha onde ocorre e ícones de erro no estilo Sublime (ao lado do número da linha).

---

# [File Utils](https://marketplace.visualstudio.com/items?itemName=sleistner.vscode-fileutils)
![09](/assets/img/python/vscode/09.jpg)

Este pequeno plugin adiciona alguns comandos relacionados a arquivos à Paleta de Comandos (normalmente você pode executá-los clicando com o botão direito na barra lateral):

+ Renomear
+ Mover
+ Duplicar
+ Copiar o caminho ou nome do arquivo

Ele também adiciona uma opção “Mover/Duplicar Arquivo” ao menu de contexto.

---

# [GitLens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)

<!-- RETANGULO LARGO -->
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

![10](/assets/img/python/vscode/10.gif)

Plugin massivo - adiciona integração do [Git](https://terminalroot.com.br/git/) ao VS Code:

+ Pode mostrar anotações por linha, por arquivo, na barra de status ou ao passar o mouse.
+ Fornece links de contexto para mostrar mudanças, mostrar diferenças, copiar ID de confirmação.
+ Traz uma barra lateral com provavelmente todas as informações possíveis sobre o repositório git, histórico de arquivos e linhas, menus de comparação e pesquisa, etc.

É muito mais poderoso do que o painel de "controle de origem" padrão do VS Code. 

---

# [indent-rainbow](https://marketplace.visualstudio.com/items?itemName=oderwat.indent-rainbow)
![11](/assets/img/python/vscode/11.jpg)

Plugin muito útil para trabalhar com linguagens como Python, onde a indentação é importante. Cada nível de recuo recebe uma cor ligeiramente diferente, por isso é mais fácil ver rapidamente onde termina um determinado bloco de código.

---

# [jumpy](https://marketplace.visualstudio.com/items?itemName=wmaurer.vscode-jumpy) (ou [MetaGo](https://marketplace.visualstudio.com/items?itemName=metaseed.metago))

jumpy é um plugin muito peculiar que leva algum tempo para se acostumar. Basicamente, ele deve ajudá-lo a mover seu código mais rápido.

Se você pressionar um atalho de teclado, jumpy exibirá um código de 2 letras ao lado de cada palavra na tela. Se você digitar essas duas letras, o cursor saltará para esse local. Semelhante ao que você pode fazer com o [Vim](https://terminalroot.com.br/vim/) no modo “normal” .

---

# [Paste and Indent](https://marketplace.visualstudio.com/items?itemName=Rubymaniac.vscode-paste-and-indent)
![13](/assets/img/python/vscode/13.jpg)

Se você achar que o VS Code não está fazendo um bom trabalho ao colar o código, tente esta extensão. Ele permitirá que você atribua uma ação “Colar e recuar” a qualquer atalho de tecla. Este comando fará o possível para recuar o código corretamente depois de colá-lo (para corresponder ao código ao redor). Use o atalho “`Command + Shift + V`” para isso.

---

# [Project Manager](https://marketplace.visualstudio.com/items?itemName=alefragnani.project-manager)
![14](/assets/img/python/vscode/14.jpg)

O VS Code suporta o conceito de áreas de trabalho - você pode agrupar alguns arquivos e pastas e alternar facilmente entre eles. Mas você ainda precisa salvar a configuração do espaço de trabalho e, às vezes, ela pode se perder.

O Project Manager acaba com esse aborrecimento. Você pode salvar projetos e abri-los, não importa onde eles estejam localizados (e você não precisa se preocupar em armazenar os arquivos de preferência do espaço de trabalho). Além disso, adiciona uma barra lateral para navegar por todos os seus projetos.

---

# [Quick and Simple Text Selection](https://marketplace.visualstudio.com/items?itemName=dbankier.vscode-quick-select)
![15](/assets/img/python/vscode/15.jpg)

Por padrão, o VS Code tem o comando para “Expandir/Reduzir seleção” que funciona bem, mas esse plugi funciona de uma maneira muito melhor.

Ele adiciona alguns novos atalhos para selecionar texto em:

+ aspas simples/duplas
+ parênteses
+ colchetes/chaves
+ Tags

Tente mapeá-los para alguns atalhos intuitivos e eles funcionam perfeitamente:

+ `Super + ‘` - seleciona o texto entre aspas simples
+ `Super + ⇧ + ‘` - seleciona o texto entre aspas duplas
+ `Super + ⇧ + 9` - seleciona o texto entre parênteses
+ `Super + ⇧ +,` - seleciona o texto na tag
+ `Super + ,` - seleciona o texto entre colchetes

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

---

# [Settings Sync](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync)
![16](/assets/img/python/vscode/16.jpg)

Não está realmente relacionado ao Python, mas é um plugin muito importante.

A sincronização de configurações permite que você salve as configurações do VS Code em um gist particular do GitHub, para que você possa restaurá-las facilmente se mudar para um computador diferente (ou se perdeu/ destruiu o atual).

Em uma das próximas versões do VS Code, a sincronização das configurações se tornará integrada.

---

# [TODO Highlight](https://marketplace.visualstudio.com/items?itemName=wayou.vscode-todo-highlight)
![17](/assets/img/python/vscode/17.jpg)

Destaca todos TODO/FIXME/NOTE no código, para que você possa identificá-los facilmente. Você pode personalizá-lo facilmente adicionando novas palavras e alterando o estilo de destaque.

---

# [Spell Right](https://marketplace.visualstudio.com/items?itemName=ban.spellright)
![18](/assets/img/python/vscode/18.jpg)

É estranho, mas o VS Code não tem um corretor ortográfico integrado. Portanto, você deve instalar um como uma extensão.

---

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Esse artigo foi criado por [Sebastian](https://switowski.com/blog/18-plugins-for-python-in-vscode) e traduzido por [Marcos Oliveira](https://www.linkedin.com/in/marcos-oliveira-049327166/).



