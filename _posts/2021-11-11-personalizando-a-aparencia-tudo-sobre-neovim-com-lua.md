---
layout: post
title: "Personalizando a Aparência - Tudo sobre Neovim com Lua"
date: 2021-11-11 13:48:28
image: '/assets/img/neovim/parte-3-neovim-lua.jpg'
description: 'Adicionamos Barra de Status, Linhas de Indentação, Exibição de Cores além de alguns plugins extras e configuramos do zero.'
icon: 'ion:terminal-sharp'
iconname: 'Neovim/Lua'
tags:
- neovim
- lua
---

![Personalizando a Aparência - Tudo sobre Neovim com Lua](/assets/img/neovim/parte-3-neovim-lua.jpg)

Nesse artigo vamos instalar 6 novos plugins incluindo:
+ Barra de status
+ Ícones
+ Linhas de indentação
+ Verificação de cores
+ Autopairs versão Neovim escrito em Lua que não cria par quando há caractere na frente.
+ Troca de caracteres

Se você não viu os epsisódios anteriores, segue os links:
+ [Tudo sobre Neovim com Lua - Como Customizar do Zero](https://terminalroot.com.br/2021/11/tudo-sobre-neovim-com-lua-como-customizar-do-zero.html)
+ [Do init.vim para o init.lua - Tudo sobre Neovim com Lua](https://terminalroot.com.br/2021/11/do-initvim-para-o-initlua-tudo-sobre-neovim-com-lua.html)
+ [Instalando Plugins - Tudo sobre Neovim com Lua](https://terminalroot.com.br/2021/11/instalando-plugins-tudo-sobre-neovim-com-lua.html)


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

# Instalando ícones
Antes de qualquer coisa certifique-se que você possui os ícones Terminal Root instalados, o endereço do repositório é: <https://github.com/terroo/fonts>, use a branch `fonts`.

Após possuir as fontes vamos instalar os ícones para usar quando instalarmos a Barra de status. Usaremos o [Nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons).

Para isso basta adicionar ao seu `lua/plugins/plugins.lua` a linha abaixo:
```lua
use 'kyazdani42/nvim-web-devicons'
```
> Em seguida basta rodar: `:PackerInstall`

Agora crie um arquivo dentro do diretório e nome: `~/.config/nvim/lua/plugins/utils.lua` e insira esse conteúdo:
```lua
-- Para nvim-web-devicons
require'nvim-web-devicons'.get_icons()
```

Ainda não veremos o efeito disso, somente quando instalar o plugin do próximo passo!

---

# Instalando Barra de status
A Barra de status que eu uso e acho muito bacana é a [staline.nvim](https://github.com/tamton-aquib/staline.nvim) ela é bem leve e escrita em Lua, além de possuir vários temas bacanas. Para instalar, já sabemos em `plugins.lua`:

```lua
use 'tamton-aquib/staline.nvim'
```
E em seguida: `:PackerInstall` .

Vamos utilizar aquele conceito de função que vimos, então adicione isso ao final do arquivo `settings.lua`:

```lua
vim.cmd([[ let extension = expand('%:e') ]])
```
> Eu uso essa variável para um código que eu criei para minha Barra de status.

Agora vamos novamente para o arquivo `utils.lua` e vamos adicionar esse código que é de acordo com o tema dela que eu uso:
> Note que estou usando `require("lfs")`, eu uso ela pois é mais fácil de verificar se um diretório existe, ela é o **L**ua **F**ile **S**ystem , um módulo que requer instalação se você não possuir, use o gerenciador de pacotes do seu sistema ou [LuaRocks](https://terminalroot.com.br/lua#luarocks) para instalá-la, mas antes tente, se não houver nenhuma crítica é porque já está instalada.

```lua
-- Para Barra de status
require("lfs")

local function dot_git_exists()
  local path = "./.git"
  if (lfs.attributes(path, "mode") == "directory") then
    return true
  end
  return false
end

if dot_git_exists() then
  branch = '-branch'
else 
  branch = '-📁'
  --branch = '-  '
end

local function get_var(my_var_name)
  return vim.api.nvim_get_var(my_var_name)
end

extension = get_var("extension")

if extension == "cpp" or extension == "hpp" or extension == "h" then
  this_lsp = '-lsp_name'
else
  this_lsp = '-file_size'
end


require('staline').setup{
  sections = {
    left = {
      ' ', 'right_sep_double', '-mode', 'left_sep_double', ' ',
      'right_sep', '-file_name', 'left_sep', ' ',
      'right_sep_double', branch, 'left_sep_double', ' ',
    },
    mid  = {'-lsp'},
    right= {
      'right_sep', '-cool_symbol', 'left_sep', ' ',
      'right_sep', '- ', this_lsp, '- ', 'left_sep',
      'right_sep_double', '-line_column', 'left_sep_double', ' ',
    }
  },

  defaults={
    fg = "#f7f7f7",
    cool_symbol = "  ",
    left_separator = "",
    right_separator = "",
    line_column = "%l:%c [%L]",
    true_colors = false,
    line_column = "[%l:%c] 並%p%% ",
    stab_start  = "",
    stab_end    = ""
    --font_active = "bold"
  },
  mode_colors = {
    n  = "#921F81",
    i  = "#006A6B",
    ic = "#E4BF7B",
    c  = "#2a6099",
    v  = "#D71B39"
  }
}
```
> As cores estão em `mode_colors`, altere paras as cores que você deseja(**n** para o modo **Normal**, **i** para **Inserção** e assim por diante).


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


Se quiser que apareça o ícone da sua distro, baixe [esse arquivo](https://github.com/terroo/dotfiles/blob/main/systems-icons.lua) rode ele com `lua systems-icons.lua` e veja se o ícone da sua distro/sistema aparece no terminal. Copie e substitua o ícone do Gentoo(`cool_symbol`) pelo o que você deseja!

Outra coisa é que eu só uso LSP para o [C++](https://terminalroot.com.br/cpp), no entanto mais à frente vamos detalhar LSP, daí você poderá alterar da forma que deseja, fique tranquilo!

O resultado da Barra de status deverá ser similar à esse:

[![staline.nvim](/assets/img/neovim/staline.png)](/assets/img/neovim/staline.png)

Se quiser um tema diferente veja o procedimento no [repositório](https://github.com/tamton-aquib/staline.nvim)

---

# Linha de Indentação
Um recurso muito legal em um IDE é o fato de possuir linhas que determinam onde iniciam e terminam a indentação de um código. E um plugin que faz isso de maneira extraordinária é o [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)

Adicionamos ao `plugins.lua` e instalamos:
```lua
use 'lukas-reineke/indent-blankline.nvim'
-- :PackerInstall
```

Após instalar e usar o `:PackerCompile`(que no nosso caso é automático, como fizemos) ele já funciona! Abra qualquer arquivo e note que já há as linhas de indentação .

Você pode criar arquivos novos para cada plugin com o mesmo nome do plugin(é assim que eu faço), mas aqui vamos adicionar as configurações ao `lua/plugins/utils.lua` para ficar centralizada as informações.

Caso você queira que as linhas indentadas sejam coloridas, adicione isso ao seu `utils.lua`
```lua
-- PARA AS LINHAS DE INDENTAÇÃO

vim.opt.listchars:append("space:⋅")
--vim.opt.listchars:append("eol:↴")
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.cmd([[
  hi! MatchParen cterm=NONE,bold gui=NONE,bold guibg=NONE guifg=#FFFFFF
  let g:indentLine_fileTypeExclude = ['dashboard']
]])


require("indent_blankline").setup {
    show_end_of_line = true,
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}
```

O resultado será isso:

![indent-blankline.nvim](/assets/img/neovim/indent-blankline.png)

Para mais informações consulte o [repositório](https://github.com/lukas-reineke/indent-blankline.nvim) .

---

# Exibindo as cores quando digitadas
Quando trabalhamos com cores é interessante digitar o nome ou código da cor hexadecimal ou RGB e já exibí-la para sabermos de qual cor se trata e como ela será exibida. Por exemplo:
<kbd color="#554477">#554477</kbd> .

Para isso usaremos o [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua) 

```lua
use 'nvim-colorizer.lua'
--PackerInstall
```

E no `utils.lua` basta importá-lo e chamar a função `setup` para carregá-lo:
> Adicione essa linha:
```lua
-- PARA O COLORIZER
require'colorizer'.setup()
```

Agora as cores digitados no seu Neovim aparecerão assim:

![nvim-colorizer.lua](/assets/img/neovim/nvim-colorizer.png)

---

# Plugins extras
Para terminarmos esse episódio recomendo dois plugins que falamos sobre eles [nesse vídeo](https://www.youtube.com/watch?v=PmKJT6SlN-Q) .

Que é o [Vim Surround](https://github.com/tpope/vim-surround), para criar ou substituir caracteres em torno de uma palavra, muito útil para quem escreve frequentemente em [Markdown](https://terminalroot.com.br/tags#markdown) e o [Nvim Autopairs](https://github.com/windwp/nvim-autopairs) , ele é superior ao *Vim Autopairs*, pois se houver caracterer na frente ele não adiciona. 

Basta instalá-los.
```lua
use 'tpope/vim-surround'
use 'windwp/nvim-autopairs'
-- PackerInstall
```

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



O Surround estrá automaticamente disponível após instalar, já o Nvim Autopairs precisa adicionar esse código ao seu `utils.lua`:
-- PARA O AUTOPAIRS
```lua
require('nvim-autopairs').setup({
  enable_check_bracket_line = false
})
```

Para mais informações a respeito desses plugins consulte o repositório dos mesmos.

---

Por hoje é só nos vemos no próximo artigo!


