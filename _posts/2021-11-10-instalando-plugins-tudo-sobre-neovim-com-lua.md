---
layout: post
title: "Instalando Plugins - Tudo sobre Neovim com Lua"
date: 2021-11-10 08:41:20
image: '/assets/img/neovim/plugins.jpg'
description: 'Vamos usar o packer.nvim para instalar plugins como Telescope e outros.'
icon: 'ion:terminal-sharp'
iconname: 'Neovim/Lua'
tags:
- lua
- neovim
---

![Instalando Plugins - Tudo sobre Neovim com Lua](/assets/img/neovim/plugins.jpg)

Esse é o terceiro episódio da série **Tudo sobre Neovim com Lua** se você não leu os anteriores, segue os links:

+ [Tudo sobre Neovim com Lua - Como Customizar do Zero]()
+ [Do init.vim para o init.lua - Tudo sobre Neovim com Lua]()

Antes de mais nada, vamos já organizar nossos arquivos e já definir todas as configurações(baseadas na minhas que uso diariamente).

O arquivo `lua/tools.lua` foi só de exemplo, então já podemos removê-lo e o arquivo `lua/settings.lua` vamos pôr dentro de um diretório de nome `configs/` que iremos criar para ficar mais organizado.

Limpe seu `init.lua` antes para não exibir erros:

```sh
cd ~/.config/nvim
cat /dev/null > init.lua
```

Agora vamos preparar o ambiente
```sh
rm lua/tools.lua
mkdir -p lua/configs
mv lua/settings.lua lua/configs/
```

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


Agora abra o `init.lua` e insira esse conteúdo:
```sh
require("configs.settings")
```
> Você também poderia usar assim: `require("configs/settings")`

Agora utilize meu `settings.lua` ou modifique do jeito que quiser:
> `nvim lua/configs/settings.lua`

```lua
vim.cmd([[ set encoding=utf8 ]])
vim.cmd([[ set nu! ]])
vim.cmd([[ set mouse=a ]])
vim.cmd([[ set wildmenu ]])
vim.cmd([[ set confirm ]])
vim.cmd([[ set incsearch ]])
vim.cmd([[ set title ]])
vim.cmd([[ set t_Co=256 ]])
vim.cmd([[ set shiftwidth=2 ]])
vim.cmd([[ set softtabstop=2 ]])
vim.cmd([[ set expandtab ]])
vim.cmd([[ set shiftwidth=2 ]])
vim.cmd([[ set softtabstop=2 ]])
vim.cmd([[ set expandtab ]])
vim.cmd([[ set guicursor= ]])
vim.cmd([[ set cursorline ]])
vim.cmd([[ syntax on ]])
```
> Observação: Você também pode usar um único `vim.cmd` para executar todas as configurações, mas isso não influencia no desempenho.

A maioria dessas configurações para quem utiliza [Vim](https://terminalroot.com.br/vim) já sabem do que se trata, se você não souber [veja esse vídeo](https://www.youtube.com/watch?v=XXGk3n1uzPg) . Depois feche e abra novamente seu Neovim para ver as alterações, vamos alterar só mais 3 linhas desse arquivo quando instalarmos um tema de cores!

---

# Instalando o packer.nvim
O [packer.nvim](https://github.com/wbthomason/packer.nvim/) é um plugin que instala plugins! Ele é similar a plugins como o [vim-plug](https://github.com/junegunn/vim-plug) e o [Vundle](https://github.com/VundleVim/Vundle.vim) que são usados no Vim.

O diferencial dele é que foi totalmente escrito em [Lua](https://terminalroot.com.br/lua) além de utilizar recursos do [LuaJIT](https://terminalroot.com.br/lua/#luajit) para compilar e possui recursos de atualização de plugins, remoção, interfaces UI mais precisas e bem detalhadas. Para todos os recursos dele veja o [repositório](https://github.com/wbthomason/packer.nvim/) .

Ele instala plugins escritos tanto em Lua quanto em VimScript e roda normalmente!

Para instalarmos, basta rodar esse comando:
> Observação: Você precisa ter o [Git](https://terminalroot.com.br/git) instalado.

Para sistemas [Unix](https://terminalroot.com.br/tags#unix) e [GNU/Linux](https://terminalroot.com.br/linux)
```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
> Copie e cole no seu terminal e pressione [ENTER]

Após clonar agora vamos criar um novo diretório dentro de `lua/` e vamos criar dois novos arquivos com os conteúdos que iremos indicar.

Criar o sub diretório:
```sh
mkdir -p lua/plugins
```

Criar e abrir o arquivo que ficará as instalações do `packer`:
```sh
nvim lua/plugins/plugins.lua
```

E insira esse conteúdo dentro:
```lua
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'terroo/vim-simple-emoji'
  use 'navarasu/onedark.nvim'
end)
```

A função `use` determina qual plugins serão usados/manipulados .

Note que o **packer.nvim** manipula a ele mesmo e aproveitamos já para iniciá-lo instalando dois novos plugins: 

+ [vim-simple-emoji](https://github.com/terroo/vim-simple-emoji)(plugin criado por mim mesmo usando VimScript, futuramente pretendo criar a versão com Lua);
+ [onedark.nvim](https://github.com/navarasu/onedark.nvim) o tema de cores,escrito em Lua, mas você pode instalar um do seu gosto.

O **packer.nvim** possui os seguintes comandos:
+ `:PackerCompile` - Gera o arquivo compilado em: `~/.config/nvim/plugins/packer_compiled.lua`(Note que é um diretório *plugins* na raíz do `nvim` e não é o dentro do diretório `lua/`)
+ `PackerClean` - Remove todos os plugins desativados ou não usados
+ `PackerInstall` - Instala ou Limpa os plugins ausentes
+ `PackerUpdate` - Limpa, atualiza e instala os plugins
+ `PackerSync` - Mesmo que rodar `PackerUpdate` e, em seguida` PackerCompile`
+ `PackerLoad` - Carrega o plugin `opt` imediatamente
> Alguns plugins podem ser instalados na pasta `opt` em `~/.local/share/nvim/site/pack/packer/opt` em vez de `start` no mesmo caminho. Para isso precisa informar a **tabela** `{ source = opt }` para a função `use`.


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


Agora basta abrir seu `init.lua` na raíz do diretório de configuração do seu Neovim e adicionar essa linha:

```lua
require("configs.settings")
require("plugins.plugins") -- Para ler o packer.nvim
```

Agora feche e abra o `init.lua` novamente e rode o comando:
```viml
:PackerInstall
```
> Ele grava os arquivos no diretório: `~/.local/share/nvim` e os plugins ficam no subdiretório: `site/pack/packer/start` .

E assim que terminar rode: `:PackerCompile`. Você pode automatizar o `:PackerCompile` para toda vez que houver novas instalações, se quiser adicione essa linha ao seu `settings.lua`:
```lua
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
```

Ele irá instalar os plugins e já podemos utilizá-los! Para ativar o tema de cores abra o arquivo: `nvim lua/configs/settings.lua` e adicione essas 3 linhas ao final:

```lua
vim.cmd([[ set bg=dark ]])
vim.cmd([[ set termguicolors ]])
vim.cmd([[ colorscheme onedark ]])
```
> Ao fechar abra qualquer arquivo(Ex.: `nvim main.cpp`) e note um visual mais agradável! 😃 

Se quiser um fundo ainda mais escuro altere a linha em `settings.lua` que tem esse conteúdo: `vim.cmd([[ colorscheme onedark ]])` por esse:

```lua
vim.cmd([[
  let g:onedark_style = 'darker'
  colorscheme onedark
]])
```
> Para mais dicas de "sub-temas" do **onedark.nvim**(além do **darker**) consulte o [repositório](https://github.com/navarasu/onedark.nvim).

Para usar o **vim-simple-emoji** veja as dicas no [repositório](https://github.com/terroo/vim-simple-emoji).

---

# Instalando o Telescope.nvim
O **Telescope.nvim** é o que há de mais moderno, ele é uma melhor alternativa ao [fzf](https://github.com/junegunn/fzf).

Possui uma interface moderna e serve para: Localizar, filtrar, visualizar, selecionar e abrir arquivos de forma simples e rápida. Também foi escrito totalmente em [Lua](https://terminalroot.com.br/lua).

Para instalá-lo, adicione essa linha ao arquivo: `plugins/plugins.lua`
```lua
use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
}
```
> Note que o `nvim-telescope` possui uma dependência que é o `nvim-plenary` por isso usamos as próprias configurações do `packer.nvim` para isso!

As novas configurações do `plugins.lua` ficarão assim:
```lua
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'terroo/vim-simple-emoji'
  use 'navarasu/onedark.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
end)
```

Feche e abra o Neovim e rode o comando: `:PackerInstall`. Após fechar e abrir novamente rode o comando:
```viml
:Telescope
```
Será aberta uma "*janela*" no combo de baixo você pode digitar o nome do arquivo de deseja manipular, para mais detalhes veja o [repositório](https://github.com/nvim-telescope/telescope.nvim) .

Veja abaixo a saída do Telescope:

[![Telescope.nvim](./telescope.jpg)](./telescope.jpg)


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

---

# Mapeamentos
Para finalizar esse episódio vou deixar o arquivo de mapeamentos que eu utilizo no dia-a-dia. Crie uma arquivo:
```sh
vim lua/configs/mappings.lua
```

E insira esse conteúdo dentro:
```lua
-- Sair com 'q' , se usar gravação de macros altere para <C-q> → Ctrl + q
vim.cmd([[ map q :q<CR> ]])

-- Para Salvar com 'Ctrl + S' nos modos: Normal, Inserção e Visual
-- Precisa adicionar a linha: stty -ixon , ao seu ~/.bashrc
vim.cmd([[ nnoremap <C-s> :w<CR> ]])
vim.cmd([[ inoremap <C-s> <Esc>:w<CR>l ]])
vim.cmd([[ vnoremap <C-s> <Esc>:w<CR> ]])

-- Selecionar tudo com 'Ctrl + A'
vim.cmd([[ map <C-a> ggVG ]])

-- BASH - Auto preenche arquivos .sh que não existirem com a SheBang
vim.cmd([[ autocmd BufNewFile *.sh :call append(0, '#!/usr/bin/env bash') ]])

-- Se não existir o arquivo C++ de extensão .cpp ele preenche da forma abaixo
-- altere para sua(s) linguagens preferidas
vim.cmd([[
	function! AutoCpp()
	  call append(0, '#include <iostream>')
	  call append(1, '')
	  call append(2, 'int main( int argc , char **argv ){')
	  call append(3, "  std::cout << \"Olá, Mundo!\" << '\\n';")
	  call append(4, '  return 0;')
	  call append(5, '}')
	  call cursor(4, 17)
	endfunction
	autocmd BufNewFile *.cpp :call AutoCpp()
]])
```
Leia os comentários e altere da forma que desejar e em seguida não esqueça de chamá-lo no seu `init.lua`
```lua
require("configs.mappings")
```

---

Até o próximo episódio!


