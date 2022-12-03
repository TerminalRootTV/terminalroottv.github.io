---
layout: post
title: "Como Instalar o Vim e Neovim no Windows"
date: 2022-12-03 16:02:51
image: '/assets/img/windows/vim-neovim/vim-neovim-windows.jpg'
description: 'E configurá-lo para abrir no PowerShell ou CMD além de poder usá-lo graficamente.'
icon: 'ion:terminal-sharp'
iconname: 'Windows'
tags:
- vim
- neovim
- windows
- powershel
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

[Vim](https://terminalroot.com.br/vim) é um editor versátil e altamente customizável. Já o [Neovim](https://terminalroot.com.br/tags#neovim) é idêntico ao Vim, no entanto, possui caminhos de configurações de arquivos diferentes e suporte nativo para linguagem de programação [Lua](https://terminalroot.com.br/lua), que é o "idioma" utilizado 
nas suas configurações. Nós possuímos [diversos conteúdos aqui no blog](https://terminalroot.com.br/tags#vim) e também no [canal TerminalRootTV](https://www.youtube.com/TerminalRootTV?sub_confirmation=1), além de um [Curso Completo de Vim Moderno, Vimscript e Neovim com Lua](https://terminalroot.com.br/vim).

Nesse artigo veremos como instalar o Vim e o Neovim no [Windows 10](https://terminalroot.com.br/tags#windows) e usá-lo tanto de forma gráfica como via [comando](https://terminalroot.com.br/tags#comandos) no [PowerShell](https://terminalroot.com.br/tags#powershel) e 
também via `CMD` .

---

# Download e Instalação
Antes de mais nada precisamos baixar o Vim, para isso acesse o endereço: <https://www.vim.org/download.php#pc> e em **PC: MS-DOS and MS-Windows** clique em [gvim90.exe](https://ftp.nluug.nl/pub/vim/pc/gvim90.exe) .
> Observação: Na data de publicação desse artigo a versão que era mais recente era a 9.0(`gvim90`), logo, siga os passos ignorando a versão, pois a sua pode ser uma mais atual.

---

# Executar o arquivo baixado

### 1. Abra o Windows Explorer e dê um duplo clique no arquivo baixado: `gvim90.exe``:
![1.png](/assets/img/windows/vim-neovim/1.png)

### 2. Dê permissão de execução:
![2.png](/assets/img/windows/vim-neovim/2.png)

### 3. Escolha o Idioma, não há opção para Português, das opções abaixo, escolha o idioma desejado, exemplo: **English** e pressione **OK**.
![3.png](/assets/img/windows/vim-neovim/3.png)
![4.png](/assets/img/windows/vim-neovim/4.png)

### 4. É iniciado o **Setup de Instalação**, basta clicar em **Next**
![5.png](/assets/img/windows/vim-neovim/5.png)

### 5. Marque a opção: **[x] I accept the termsof License Agreement** para aceitar os termos de uso
![6.png](/assets/img/windows/vim-neovim/6.png)

### 6. Para uma instalação completa, selecione a opção **Full**
> A opção *Tipical* é para uma versão mais resumida, use caso não tenha muito espaço em disco.

![7.png](/assets/img/windows/vim-neovim/7.png)

### 7. Nesse menu mantenha as configuração do jeito que está, caso queira alterar depois, poderemos usar o próprio Vim para isso:
![8.png](/assets/img/windows/vim-neovim/8.png)

### 8. Escolha o local de instalação ou mantenha o local que aparece e inicie a instalação clicando em **Install**:
![9.png](/assets/img/windows/vim-neovim/9.png)

### 9. Aguarde os arquivos serem extraídos e instalados:
![10.png](/assets/img/windows/vim-neovim/10.png)

### 10. Após finalizada a instalação com sucesso aparecerá a janela exibida na imagem abaixo, se quiser desmarque a opção: **Show README after installation finished**, evitará de abrir o Bloco de Notas e mostrar um *Sobre o Vim* e a licença. 
![11.png](/assets/img/windows/vim-neovim/11.png)

### 11. Na Área de Trabalho agora haverá 3 atalhos para o Vim
![12.png](/assets/img/windows/vim-neovim/12.png)
> Se quiser delete os atalhos: `gVim Easy 9.0`(É um Vim mais fácil que não precisa entrar no modo de inserção) e o `gVim Read only 9.0`(É o Vim, mas no modo: *Somente Leitura*), é possível habilitar essas opções sem precisar desses atalhos.


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

# Habilitando o Vim para usar o comando `vim` no PowerShell e no CMD
Você já pde dar um clique duplo sobre o atalho, na sua Área de Trabalho, do Vim que é um Vim gráfico: **gVim 9.0** e utilizar, mas caso queira usar como [comando](https://terminalroot.com.br/tags#comandos) do PowerShell ou CMD será necessário adicionar **Variáveis de Ambiente**

### 12. Pesquise na Barra de Tarefas a palavra: **Variáveis de Ambiente** e clique sobre a primeira opção que aparecerá
![13.png](/assets/img/windows/vim-neovim/13.png)

### 13. Na janela que abrirá clique no botão: **Variáveis de Ambiente**
![14.png](/assets/img/windows/vim-neovim/14.png)

### 14. Será aberta uma nova janela, na caixa de baixo(**Variáveis do Sistema**) selecione **Path** e depois clique no botão **Editar**
![15.png](/assets/img/windows/vim-neovim/15.png)

### 15. Agora no Windows Explorer navegue até onde está o executável do Vim, se você instalou no local padrão, será o caminho: `C:\Program Files (x86)\Vim\vim90\`, copie o caminho, depois insira o caminho e salve as modificações(clicando nos "Ok" em todas as janelas):
![16.png](/assets/img/windows/vim-neovim/16.png)
![17.png](/assets/img/windows/vim-neovim/17.png)

Agora é só abrir o PowerShell ou o CMD e digitar `vim` para abrir o editor!

---

# Instalando o Neovim
O processo de instalação do Neovim é similar ao do Vim. Você pode acesssar a [página de realeases no repositório do Neovim no GitHub](https://github.com/neovim/neovim/releases) e em **Assets** 
fazer download do arquivo [nvim-win64.msi](https://github.com/neovim/neovim/releases/download/nightly/nvim-win64.msi) dar um duplo clique e prosseguir a instalação similar ao Vim.

No entanto, você também pode usar o PowerShell através do comando `winget search nvim` procurar o pacote e depois instalar, veja imagens abaixo:

A primeira vez que você usa o `winget` ele pede para você aceitar os termos, basta teclar **Y** e pressionar [ENTER]:
![neovim-winget-01.png](/assets/img/windows/vim-neovim/neovim-winget-01.png)

Depois instale com o comando `winget install Neovim.Neovim`:
![neovim-winget-02.png](/assets/img/windows/vim-neovim/neovim-winget-02.png)
![neovim-winget-03.png](/assets/img/windows/vim-neovim/neovim-winget-03.png)

Após instalado você pode navegar até a localização dos binários: `C:\Program Files\Neovim\bin` e criar um atalho para o arquivo `nvim-qt`:
![neovim-winget-04.png](/assets/img/windows/vim-neovim/neovim-winget-04.png)

---

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

![neovim-winget-05.png](/assets/img/windows/vim-neovim/neovim-winget-05.png)

Ou até mesmo também adicionar o caminho `C:\Program Files\Neovim\bin` à variável de ambiente `Path` similar ao processo que fizemos no Vim e depois é só abrir, seja o atalho ou via comando `nvim` no PowerShell ou CMD:
![neovim-winget-06.png](/assets/img/windows/vim-neovim/neovim-winget-06.png)

Lembrando que você pode também usar o `winget` para instalar o Vim, caso deseje, pesquise e instale:
![neovim-winget-07.png](/assets/img/windows/vim-neovim/neovim-winget-07.png)
{% highlight ps %}1
winget install vim.vim
{% endhighlight %}

# [Quer aprender a utilizar o Vim e o Neovim, adquira nosso curso no endereço](https://terminalroot.com.br/vim):
## <https://terminalroot.com.br/vim>

---

# Veja também:
## [Como Instalar GCC/G++ MinGW no Windows](https://terminalroot.com.br/2022/12/como-instalar-gcc-gpp-mingw-no-windows.html)
## [Crie Jogos para Windows, Linux e Web com Raylib C/C++](https://terminalroot.com.br/2022/11/crie-jogos-para-windows-linux-e-web-com-raylib-c-cpp.html)
## [Como instalar Lua no Windows 10](https://terminalroot.com.br/2022/07/lua-windows.html)
## [Como Implementar Dear ImGUi com SFML no Windows 10](https://terminalroot.com.br/2022/07/como-implementar-dear-imgui-com-sfml-no-windows-10.html)
## [Como Instalar o Qt Creator 6 com QtWebEngine no Windows e Linux](https://terminalroot.com.br/2022/06/como-instalar-o-qt-creator-6-com-qtwebengine-no-windows-e-linux.html)




