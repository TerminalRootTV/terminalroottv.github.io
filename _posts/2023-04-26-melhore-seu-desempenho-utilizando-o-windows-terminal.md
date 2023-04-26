---
layout: post
title: "Melhore seu Desempenho utilizando o Windows Terminal"
date: 2023-04-26 18:28:17
image: '/assets/img/windows/windows-terminal.jpg'
description: 'Reparta a tela estilo WM Tiling, tenha melhor experiência ao usar o Vim/Neovim e desfrute de um visual altamente customizável!'
icon: 'ion:terminal-sharp'
iconname: 'Windows Terminal'
tags:
- windows
- terminal
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**Windows Terminal** é um aplicativo de terminal moderno, rápido, eficiente, poderoso e produtivo para os usuários de ferramentas e shells de linha de comando, como prompt de comando, [PowerShell](https://terminalroot.com.br/tags#powershell) e [WSL](https://terminalroot.com.br/tags#windows). 

Seus principais recursos incluem várias guias, painéis, suporte a caracteres Unicode e UTF-8, um mecanismo de renderização de texto acelerado por GPU e temas, estilos e configurações personalizados.

# Benefícios de usar o Windows Terminal
+ Fácil de usar [Vim](https://terminalroot.com.br/vim) ou [Neovim](https://terminalroot.com.br/tags#neovim) pelo terminal, principalmente quando for usar `Shift + Ctrl + v` para colar, no [PowerShell](https://terminalroot.com.br/tags#powershell)(apesar de ter como configurar) e no CMD só funciona o comando: `" + p`, ou seja, pressionado esses três caracteres em sequência, caso você queira colar;
+ Repartir a tela estilo *Tiling*;
+ Configurações mais amigáveis;
+ Melhor renderização de caracteres Unicode;
+ Personalizações *Like a Pro*;
+ Múltiplas abas(de com contextos diferentes);
+ E muitos outros que na prática você detectará de forma rápida as praticidades.

---

# Instalação
Para instalar o Windows Terminal basta abrir a [Windows Store](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701?hl=pt-br&gl=br) e pesquisar a palavra *Windows Terminal* ou ir diretamente [nesse link](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701?hl=pt-br&gl=br) e em seguida clique em <a class="btn btn-primary">Obter aplicativo da Store</a> conforme imagem abaixo:

![Windows Terminal Store](/assets/img/windows/win-terminal-store.jpg) 
> E em seguida abra com a Windows Store.

---

# Utilização
Após instalado pesquise na **Barra de Iniciar do Windows** digitando o nome: **Windows Terminal**.

Alguns recursos e comandos interessantes:
+ `Ctrl + Shift + T` - Para abrir nova aba ou clique no sinal de **+** no topo da janela, é possível abrir nova aba com: PowerShell, CMD, Azure Cloud Shell e outros;
+ `Alt + Shift + D` - Reparte a janela na vertical conforme imagem abaixo:
![Windows Terminal](/assets/img/windows/win-terminal-cut-vert.jpg) 

Caso você tecle essa combinação novamente ele repartirá agora na horizontal e assim por diante:

![Windows Terminal](/assets/img/windows/win-terminal-cut-vert-hor.jpg) 

+ `Alt + Shift + -` - Reparte somente na vertical a "janela" que possui o foco;

+ `Alt + Shift + +` - Reparte somente em horizontal a "janela" que possui o foco;

+ `Ctrl + Shift + w` - Fecha a "janela" que possui o foco;

+ `Alt + tecla direcional`( ← ↑ → ↓ ) move o foco;
+ `Alt + Shift + tecla direcional`( ← ↑ → ↓ ) - Redimensiona a "janela" que possui o foco;

+ Segurando a tecla `Ctrl` e movendo a "roda" do mouse aumentará ou diminuirá o ZOOM;

+ Segurando a tecla `Ctrl + Shift` e movendo a "roda" do mouse, habilitará o desfoque gaussiano da janela;

---

# Personalizando Cores, Fontes e Aparência
Para abrir as configurações tecle `Ctrl + ,` ou clique na seta na parte superior e em seguida selecione: **Configurações**:

![Windows Terminal](/assets/img/windows/win-terminal-configuration.jpg) 

Após aberto o painel de configurações você pode editar Esquema de Cores, Fontes, Aparência do próprio painel e entre outros fique a vontade para testar cada uma das opções.

Escolhendo a opçao **Abrir o arquivo JSON** será aberto o arquivo com o bloco de notas. Note em uma das imagens abaixo que no elemento `profiles` eu alterei o tema para **One Half Dark** que pode ser encontrado em **Esquema de Cores** no painel de Configurações, aliás você mesmo pode criar de forma intuitiva seu próprio esquema de cores, atribuir um nome e defini-lo nesse arquivo `setting.JSON`:

![Windows Terminal](/assets/img/windows/win-terminal-painel-configuracoes.jpg) 
![Windows Terminal](/assets/img/windows/win-terminal-file-json.jpg) 
> Abra as imagens em uma nova guia para ver em um resolução maior os detalhes.

---

Para mais informações consulte os links abaixo:
+ Documentação oficial: <https://learn.microsoft.com/en-us/windows/terminal/>
+ Repositório no GitHub: <https://github.com/microsoft/terminal>
+ Página do Windows Terminal na Store: <https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701>

---

# Veja também
## Como Instalar o AstroNvim no Windows:
### <https://youtu.be/bs_xTQdgM5s>

<!--+ Customizações avançadas: <https://medium.com/@dorlugasigal/how-to-set-up-your-powershell-f004c90bbafb>-->

