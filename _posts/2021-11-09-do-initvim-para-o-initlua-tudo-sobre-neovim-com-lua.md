---
layout: post
title: "Do init.vim para o init.lua - Tudo sobre Neovim com Lua"
date: 2021-11-09 08:59:22
image: '/assets/img/neovim/init-vim-init-lua.jpg'
description: 'Esse é o segundo artigo da nossa série, vamos saber como as coisas funcionam na migração!'
icon: 'ion:terminal-sharp'
iconname: 'Lua/Neovim'
tags:
- lua
- neovim
---

![Do init.vim para o init.lua - Tudo sobre Neovim com Lua](/assets/img/neovim/init-vim-init-lua.jpg)

Esse é o segundo artigo da série **Tudo sobre Neovim com Lua**, se você não leu o anterior segue o link [aqui](https://terminalroot.com.br/2021/11/tudo-sobre-neovim-com-lua-como-customizar-do-zero.html).

> **Dica**: se você possui os diretórios `nvim` tanto em `~/.local/share` como em `~/.config` remova-os ou faça backup porque aqui mostraremos do zero. Exemplo:
```sh
rm -rf ~/.config/nvim ~/.local/share/nvim
```

---

# Introdução
Todos nós sabemos que o arquivo principal de configuração do [Vim](https://terminalroot.com.br/vim) é o `~/.vimrc` e o arquivo correspondente dele no Neovim é o `~/.config/nvim/init.vim` . Ou seja, se criarmos um link simbólico do **vimrc** para o **init.vim** seu Neovim funcionará normalmente como seu Vim funciona e você também portará todas as configurações e plugins para o Neovim.

Mas e se você quiser rodar [Lua](https://terminalroot.com.br/lua) a partir desse **init.vim** é possível ? Sim, para isso você precisará usar [Here String](https://terminalroot.com.br/shell) .

Exemplo, vamos supôr que você deseja exibir uma mensagem no rodapé assim que abrir o Neovim, mas essa mensagem precisa ser entregue com a linguagem de programação Lua. Bastava você adicionar esse código ao seu `init.vim`:

```viml
lua <<EOF
 print("Olá, usuário! Seja bem-vindo ao Neovim!")
EOF
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

Agora, toda vez que você abrir seu Neovim aparecerá essa mensagem no rodapé:

![Lua Here String Neovim](/assets/img/neovim/neovim-lua-here-string.png)

Dá pra fazer isso com o Vim também ? Se você tiver compilado seu vim com suporte a Lua ou adicionado o pacote *vim-lua* para sistemas que oferencem binários, sim é possível! Mas o Vim faz uma *ponte* já o Neovim é de forma nativa, ou seja, já há uma boa diferença e no Vim você deverá usar assim(como comando): `:lua <<EOF` com dois pontos na frente.

---

# Para o `init.lua`
Mas, em vez de usar *Here String* você pode usar Lua diretamente, e isso deve ser feito no `init.lua`. Para utilizá-lo, remova seu `init.vim` e crie um `init.lua`.
> *Observação*: Não renomeie e nem use os dois(haverá erro) porque agora o inverso também não funciona, ou seja, comandos do VimScript não rodam diretamente no `init.lua`.

E para exibir aquela mesma mensagem, basta fazer assim:
```lua
print("Olá, usuário! Seja bem-vindo ao Neovim!")
```

---

# Rodando comandos do VimScript no `init.lua`
Como havíamos dito no [artigo anterior dessa série]() o Neovim utiliza API do [Vim](https://terminalroot.com.br/vim) para entregar os resultados ou consultar comandos e executá-los e para esse caso utiliza a API `vim.cmd`.

Então, com [Lua](https://terminalroot.com.br/lua) basta rodar assim, por exemplo, tornar o cursor *Beam* no modo normal, adicione isso ao seu `init.lua`:

```lua
vim.cmd([[ set guicursor= ]])
```

Você pode pôr todas as [configurações do seu Vim](https://www.youtube.com/watch?v=XXGk3n1uzPg) dentro dessa função que irá funcionar normalmente.

Se você quiser criar um arquivo separado com suas configurações e importá-lo para seu `init.lua` fica mais organizado, exemplo: criar um arquivo `settings.lua` e no seu `init.lua` basta adicionar essa linha:

```lua
require("settings")
```

O mais correto mesmo é você criar um diretório de nome **lua/** e dentro dele pôr todos os arquivos que serão importados pelo `init.lua`, exemplo:

```sh
mkdir -p ~/.config/nvim/lua
```

E mover o `settings.lua` para lá:

```sh
mv ~/.config/nvim/settings.lua ~/.config/nvim/lua/
```

E o `init.lua` irá automáticamente ler o `settings.lua` mesmo sem indicar o diretório porque isso faz parte do `'runtimepath'`, ou seja, esse diretório de nome **lua/** faz parte do padrão.


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

# Organização dos diretórios
Você pode organizar da forma que bem entender, mas há uma organização padrão. No momento não sabemos ainda tudo que precisaremos criar, mas nos próximos artigos veremos mais detalhes e a documentação do Neovim propões essa hieraquia de organização:

```sh
📂 ~/.config/nvim
├── 📁 after
├── 📁 ftplugin
├── 📂 lua
│  ├── 🌑 myluamodule.lua
│  └── 📂 other_modules
│     ├── 🌑 anothermodule.lua
│     └── 🌑 init.lua
├── 📁 pack
├── 📁 plugin
├── 📁 syntax
└── 🇻 init.vim
```
> **Note**: Que nessa hieraquia é mantido o arquivo `init.vim`, mas há um `init.lua` dentro do diretório **lua**, mas isso é baseado se você ainda não está usando o `init.lua` como principal, ou seja, essa é para a fase de transição e lógico que isso é o padrão, mas não necessariamente uma regra.

Aqui na nossa série vamos fazer similar, mas não igual, até porque nem todos esses arquivos utilizaremos.

---

# Criando sua função Lua no Neovim
Nessa altura você já pensa como entregar para Lua resultados do VimScript. Por exemplo, [nesse vídeo](https://www.youtube.com/watch?v=W8bFxnpJjF4) nós obtivemos a extensão do arquivo que é aberto toda vez que usamos o editor para escolhermos qual plugin carregar.

Bom, obter a extensão com Lua é uma coisa, mas obter a extensão que o Neovim vai abrir é outra. Sabemos que poderíamos usar o `vim.cmd`, mas como armazenar a saída para manipularmos com Lua ?

Vamos criar um arquivo novo no diretório **lua/**  de nome `nvim lua/tools.lua` e dentro dele vamos pôr esse código:
> Analise os comentários no código para uma maior compreensão.

```lua
vim.cmd([[ let extension = expand('%:e') ]]) -- criamos a variável no ambiente da API

function get_extension( var ) -- recebe o argumento para a variável
  return vim.api.nvim_get_var( var ) -- retornamos a variável
end

local ext = get_extension("extension") -- dizemos qual o nome da variável que queremos

print("A extensão desse arquivo é: " .. ext) -- usamos a extensão como quisermos
```

Agora abra seu `init.lua` e importe o `tools.lua` assim somente:
> `nvim init.lua`

```lua
require("settings")
require("tools") -- para o novo arquivo
```

Agora qualquer arquivo que nós abrirmos com o Neovim ele nos dirá no rodapé a extensão. Simples, né?!

Esse exemplo foi bem básico e fácil principalmente se você já conhece de [Lua](https://terminalroot.com.br/lua), mas os plugins usam bastante `tabelas` e `metatabelas`, no entanto, não foge muito da simplicidade!

Para mais informações rode no seu Neovim: `:h vim.api` .

Até o próximo artigo!

