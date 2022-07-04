---
layout: post
title: "Como Configurar o LSP para Typescript no Neovim"
date: 2022-07-04 11:09:42
image: '/assets/img/neovim/ts/typescript-neovim.jpg'
description: 'Segunda postagem da série: Como configurar o LSP para sua linguagem de Programação no Neovim.'
icon: 'ion:terminal-sharp'
iconname: 'Neovim/Typescript'
tags:
- neovim
- typescript
- javascript
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Na [postagem anterior](https://terminalroot.com.br/2022/06/como-instalar-lua-lsp-no-neovim.html) nós mostramos o quão fácil é configurar o LSP para a linguagem de programação [Lua](https://terminalroot.com.br/tags#lua) e nesse artigo vamos ver como configurar o LSP para uma das linguagens mais utilizadas por desenvolvedores web que é a famosa: [Typescript](https://www.typescriptlang.org/) .

Se você leu o artigo anterior verá que não há segredo, no entanto, ter as configurações do [Neovim](https://terminalroot.com.br/vim) conforme [essa outra](https://terminalroot.com.br/2021/11/tudo-sobre-neovim-com-lua-como-customizar-do-zero.html) série, é fundamental! 

Ou ainda se quiser dicas mais modernas veja [esse link](https://terminalroot.com.br/vim) do Curso de Vim Moderno que foi adicionado configurações para o [Neovim](https://terminalroot.com.br/tags#neovim) com Lua .

---

# Instale o LSP para Typescript
Primeiramente você precisa ter o **typescript-language-server** instalado no seu sistema. Para isso você pode(e deve) usar o [NPM](https://terminalroot.com.br/2019/11/como-instalar-nodejs-no-linux-e-primeiros-passos.html), se estiver em sistemas que usam o gerenciador de pacotes APT, para instalar, basta:

{% highlight bash %}
sudo apt install nodejs npm
{% endhighlight %}
> Use o `search` do gerenciador de pacotes do seu sistema para encontrar o nome correto, mas geralmente eles são referenciados por esses mesmo nomes.

Agora use o `npm` para instalar o `typescript` e o `typescript-language-server`, com o seguinte comando:

{% highlight bash %}
sudo npm install -g typescript typescript-language-server
{% endhighlight %}


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

# Configure o Neovim
Após instalado o LSP para Typescript agora é você "chamar" nas suas configurações do Neovim. No meu caso eu uso as configurações que mostrei no curso e na série citados acima que é o arquivo `~/.config/nvim/lua/plugins/lsp.lua` , mas se quiser testar pode tentar no `~/.config/nvim/init.lua` , no entanto, o ideal é o primeiro caso.

Insira a linha abaixo:

{% highlight lua %}
require'lspconfig'.tsserver.setup {}
{% endhighlight %}

---

# Testando
Após tudo instalado e adicionado conforme citados acima, basta testar!
> Lembre-se que o LSP para Typescript só vai funcionar se você tiver um `package.json` no diretório que você escrevendo o código Typescript.

Crie um projeto:

{% highlight bash %}
mkdir TESTE
cd TESTE
npm install typescript --save-dev
vim index.ts
{% endhighlight %}

Escreva seu código e se estiver tudo certo, você terá: detalhes de funções, informações de erros e warnings, autocomplete e entre outros. Exemplos:

![Typescript LSP 1](/assets/img/neovim/ts/typescript-nvim-1.png) 
![Typescript LSP 2](/assets/img/neovim/ts/typescript-nvim-2.png)
![Typescript LSP 3](/assets/img/neovim/ts/typescript-nvim-3.png)
![Typescript LSP 4](/assets/img/neovim/ts/typescript-nvim-4.png)
![Typescript LSP 5](/assets/img/neovim/ts/typescript-nvim-5.png)



---

# Links úteis
+ <https://www.typescriptlang.org/>
+ <https://github.com/pwntester/nvim-lsp/tree/master/lua/nvim_lsp>
+ <https://github.com/pwntester/nvim-lsp/blob/master/lua/nvim_lsp/tsserver.lua>

