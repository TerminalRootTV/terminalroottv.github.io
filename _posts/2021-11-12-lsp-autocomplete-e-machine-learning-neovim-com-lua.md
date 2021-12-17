---
layout: post
title: "LSP, Autocomplete e Machine Learning - Neovim com Lua"
date: 2021-11-12 08:34:12
image: '/assets/img/neovim/lsp-tabnine-sig.jpg'
description: 'Instalamos LSP do Neovim, assinatura de função, snippets e entre outros e deixamos muito mais confortável!'
icon: 'ion:terminal-sharp'
iconname: 'Lua/Neovim'
tags:
- neovim
- tabnine
---

![LSP, Autocomplete e Machine Learning - Neovim com Lua](/assets/img/neovim/lsp-tabnine-sig.jpg)

Hoje vamos finalizar nossa série aqui no blog, mas ainda teremos um vídeo(somente para instalarmos alguns plugins adicionais e revisar conceitos) para completar essa série e o vídeo postarei aqui e no primeiro artigo dessa série assim que ficar pronto.

Se você não viu os capítulos anteriores, segue os links:
+ [Como Customizar do Zero](https://terminalroot.com.br/2021/11/tudo-sobre-neovim-com-lua-como-customizar-do-zero.html)
+ [Do init.vim para o init.lua](https://terminalroot.com.br/2021/11/do-initvim-para-o-initlua-tudo-sobre-neovim-com-lua.html)
+ [Instalando Plugins](https://terminalroot.com.br/2021/11/instalando-plugins-tudo-sobre-neovim-com-lua.html)
+ [Personalizando a Aparência](https://terminalroot.com.br/2021/11/personalizando-a-aparencia-tudo-sobre-neovim-com-lua.html)

E nesse artigo vamos instalar e configurar:

+ [nvim-lsp](https://github.com/neovim/nvim-lspconfig) - Um servidor de linguagem(LSP, serve para completar palavras reservadas da linguagem que estiver escrevendo) criado pelo próprio time do Neovim;
+ [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Um autocomplete para exibir as opções do servidor de linguagem e entre outros;
+ [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) - Autocomplete específico para LSP;
+ [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) - Para obter os termos do buffer;
+ [cmp-path](https://github.com/hrsh7th/cmp-path/) - Para obtermos os caminhos do sistema(Ex.: `/home/user/arquivo`) quando começarmos a digitar;
+ [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline) - Para linha de comando;
+ [LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Para snnipets;
+ [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) - Fonte dos snnipets para o LuaSnip;
+ [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) - Completar os snippets com `<Tab>`;
+ [lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim) - Para obtermos a assinatura da função que utilizarmos;
+ [cmp-tabnine](https://github.com/tzachar/cmp-tabnine) - Machine Learning para um autocomplete mais avançado;
+ [lspkind-nvim](https://github.com/onsails/lspkind-nvim) - Quando o *combo* do autocomplete for aberto exibir ícones e informações *amigáveis* .


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

# Instalando o LSP e o Autocomplete
Já de primeira vamos adicionar todos os plugins e depois vamos criar os arquivos de configuração porque todos ficarão aninhados.

Adicione essas linhas ao seu `~/.config/nvim/lua/plugins/plugins.lua`:

{% highlight lua %}
use 'neovim/nvim-lspconfig'
use 'hrsh7th/nvim-cmp'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
use 'saadparwaiz1/cmp_luasnip'
use 'L3MON4D3/LuaSnip'
use 'rafamadriz/friendly-snippets'
use 'ray-x/lsp_signature.nvim'
use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
use 'onsails/lspkind-nvim'
{% endhighlight %}
> Perceba que o **tabnine** rodará um script [sh](https://terminalroot.com.br/shell) assim que for adicionado e possui o **nvim-cmp** como dependência.

E em seguida rode: `:PackerInstall` .

---
# Configurando para o Tabnine
Agora vamos criar outro arquivo ainda em : `~/.config/nvim/lua/plugins/tabnine.lua` e adicionar o código para Machine Learning:

{% highlight lua %}
local has_any_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

require'lspconfig'.clangd.setup{}
require "lsp_signature".setup()
vim.o.completeopt = 'menuone,noselect'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local cmp = require'cmp'
local luasnip = require("luasnip")

cmp.setup({
  mapping = {

    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),

    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end,

  },

  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  sources = {
    { name = 'cmp_tabnine' },
    { name = 'luasnip' },
    { name = 'path' },
  },
})
local tabnine = require('cmp_tabnine.config')
tabnine:setup({
  max_lines = 1000;
  max_num_results = 20;
  sort = true;
  run_on_every_keystroke = true;
  snippet_placeholder = '..';
})

require('lspkind').init({
  with_text = true,
  preset = 'codicons',
  symbol_map = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "ﰠ",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "塞",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "פּ",
    Event = "",
    Operator = "",
    TypeParameter = ""
  },
})

require("luasnip/loaders/from_vscode").load()

local lspkind = require('lspkind')

local source_mapping = {
  buffer = "◉ Buffer",
  nvim_lsp = "👐 LSP",
  nvim_lua = "🌙 Lua",
  cmp_tabnine = "💡 Tabnine",
  path = "🚧 Path",
  luasnip = "🌜 LuaSnip"
}

require'cmp'.setup {
  sources = {
    { name = 'cmp_tabnine' },
    { name = 'luasnip' },
    { name = 'path' }
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      local menu = source_mapping[entry.source.name]
      if entry.source.name == 'cmp_tabnine' then
        if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
          menu = entry.completion_item.data.detail .. ' ' .. menu
        end
        vim_item.kind = ''
      end
      vim_item.menu = menu
      return vim_item
    end
  },
}
{% endhighlight %}

Ainda NÃO adicione ao seu `init.lua`, pois vamos criar uma condição.


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

# Configurações para o LSP
Vamos criar outro arquivo(`~/.config/nvim/lua/plugins/lsp.lua`) com o código parecido(você pode achar que haverá codigo duplicado, mas estamos usando todas as variáveis locais e o arquivo só será carregado de acordo com o arquivo posterior que vamos criar), mas para o LSP:

{% highlight lua %}
local has_any_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

require'lspconfig'.clangd.setup{}
require "lsp_signature".setup()
vim.o.completeopt = 'menuone,noselect'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local cmp = require'cmp'
local luasnip = require("luasnip")

local lspkind = require('lspkind')
local source_mapping = {
  buffer = "◉ Buffer",
  nvim_lsp = "👐 LSP",
  nvim_lua = "🌙 Lua",
  cmp_tabnine = "💡 Tabnine",
  path = "🚧 Path",
  luasnip = "🌜 LuaSnip"
}

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'nvim_lua' },
  },

  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      local menu = source_mapping[entry.source.name]
      if entry.source.name == 'cmp_tabnine' then
        if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
          menu = entry.completion_item.data.detail .. ' ' .. menu
        end
        vim_item.kind = ''
      end
      vim_item.menu = menu
      return vim_item
    end
  },

  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {

    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),

    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end,
  },
})

require("luasnip/loaders/from_vscode").load()
{% endhighlight %}

---

# Configurando os arquivos dinamicamente
Existe alguns detalhes para fazer todos funcionarem normalmente. O **tabnine** é interessante rodá-lo quando não há LSP disponível, geralmente eu incluo nos arquivos [Markdown]() porque fica mais fácil, já quando estou escrevendo código, ele pode atrapalhar seu LSP.

Então, para separarmos vamos fazer o seguinte, vamos criar um arquivo dentro de `lua/plugins` de nome `complete.lua` e inserir o seguinte conteúdo:

> `vim ~/.config/nvim/lua/plugins/complete.lua`

{% highlight lua %}
if extension == "md" then
  require("plugins.tabnine")
else

  require("plugins.lsp")
end
{% endhighlight %}

E para carregar esse novo arquivo, importe no seu `init.lua`:
{% highlight lua %}
require("plugins.complete")
{% endhighlight %}

---

Agora é só testar!

No vídeo dessa série vou explicar os trechos de cada código e adicionar mais coisas!

Veja abaixo alguns vídeos/gif/imagem dos plugins que instalamos:

## snippets

![Snippets](https://user-images.githubusercontent.com/67771985/131255342-e393165a-e4b1-401e-9084-a782b9dd3fef.gif) 

---

## Assinatura de funções


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

![lsp_signature](/assets/img/neovim/signature.gif) 
---

## Autocomplete

<iframe width="910" height="390" src="https://user-images.githubusercontent.com/629908/139000570-3ac39587-a88b-43c6-b35e-207489719359.mp4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

## LSP Kind 

![lspkind](https://github.com/onsails/lspkind-nvim/raw/images/images/screenshot.png) 

---

# Outros artigos da série
1. [Como Customizar do Zero](https://terminalroot.com.br/2021/11/tudo-sobre-neovim-com-lua-como-customizar-do-zero.html)
2. [Do init.vim para o init.lua](https://terminalroot.com.br/2021/11/do-initvim-para-o-initlua-tudo-sobre-neovim-com-lua.html)
3. [Instalando Plugins](https://terminalroot.com.br/2021/11/instalando-plugins-tudo-sobre-neovim-com-lua.html)
4. [Personalizando a Aparência](https://terminalroot.com.br/2021/11/personalizando-a-aparencia-tudo-sobre-neovim-com-lua.html)
5. LSP, Autocomplete e Machine Learning

No próximo será o vídeo!!!

---

Valeu e até mais!


