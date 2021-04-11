---
layout: post
title: "Como Configurar seu VIM para C/C++"
date: 2021-04-11 12:26:28
image: '/assets/img/vim/vim-c-cpp.jpg'
description: 'Esses procedimentos também servirão para outras linguagens de programação .'
icon: 'ion:terminal-sharp'
iconname: 'Vim'
tags:
- vim
- cpp
- linguagemc
---

![Como Configurar seu VIM para C/C++](/assets/img/vim/vim-c-cpp.jpg)

Nesse vídeos instalamos plugins para:
+ Autocomplete para [C](https://terminalroot.com.br/tags#linguagemc)/[C++](https://terminalroot.com.br/cpp/)
+ [Temas de Cores](https://terminalroot.com.br/2020/03/21-melhores-temas-para-seu-vim.html)
+ [Autocomplete com Inteligência Articial e Machine Learning](https://terminalroot.com.br/2020/06/instale-no-seu-editor-preferido-um-auto-complete-com-inteligencia-artificial.html)
+ [Powerline](https://terminalroot.com.br/2018/01/como-instalar-o-powerline.html) para o [Vim Airline](https://github.com/vim-airline/vim-airline)
+ [Mapeamentos](https://www.youtube.com/watch?v=XXGk3n1uzPg)
+ [Configurações do editor Vim](https://terminalroot.com.br/2019/10/100-dicas-para-o-editor-vim.html)
+ [Snippets](https://github.com/SirVer/ultisnips)
+ [Fonts](https://github.com/terroo/fonts)
+ [Servidor de Linguagem](https://github.com/MaskRay/ccls)
+ [Além de Dicas adicionais](https://terminalroot.com.br/tags#vim)

> Os procedimentos foram realizados no [Ubuntu Cinnamon](https://terminalroot.com.br/tags#ubuntu)

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


# Assista ao Vídeo
<iframe width="910" height="390" src="https://www.youtube.com/embed/W8bFxnpJjF4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> 

# Todas as configurações utilizadas no vídeo
# Como Configurar seu Vim para C/C++ (Ubuntu Cinnamon)
> Muitas coisas servirão para quaisquer outras Linguagens de Programação

# 01. Atualize seu sistema:
{% highlight bash %}
sudo apt update && \
  sudo apt upgrade -y && \
  sudo apt clean && \
  sudo apt autoclean && \
  sudo apt autoremove -y
{% endhighlight %}

---

# 02. Instalar o [Vim](https://terminalroot.com.br/vim), [curl](https://youtu.be/HxezVt5IEHQ) e [Git](https://terminalroot.com.br/git)
{% highlight bash %}
sudo apt install vim curl git wget
{% endhighlight %}

---

# 03. Instale o [Vim Plug](https://github.com/junegunn/vim-plug)
+ Copie esse comando no site: <https://github.com/junegunn/vim-plug> e rode:
{% highlight bash %}
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
{% endhighlight %}

+ Adicione o código ao `~/.vimrc`
{% highlight bash %}
vim ~/.vimrc
{% endhighlight %}
E dentro do arquivo:
> O plugin <https://github.com/terroo/vim-simple-emoji> servirá pra testar se está tudo funcionando.


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


{% highlight vim %}
call plug#begin('~/.vim/plugged')
" Aqui vão os pluggins

" Plugin de Exemplo inicial
Plug 'terroo/vim-simple-emoji'

call plug#end()
{% endhighlight %}

Feche o `~/.vimrc` e abra novamente e em seguida rode:
{% highlight vim %}
:PlugInstall
{% endhighlight %}

Teste pra ver se está funcionando:
{% highlight bash %}
vim teste.md
{% endhighlight %}
Digite: `:smile:` e dê espaço em seguida, se aparecer a carinha: **😃** é porque está tudo certo! Ou rode: `:ShowEmoji` .

---

# 04. Instale [fonts](https://github.com/terroo/fonts)!
{% highlight bash %}
git clone https://github.com/terroo/fonts
cd fonts
mv fonts ~/.local/share/fonts
cd && rm -rf fonts
fc-cache -fv
{% endhighlight %}
> Perceba que `:ShowEmoji` já estará diferente. Altere a fonte para **Jetbrains Mono** e também para cursor **I-Beam**.

---

# 05. Instale um [tema de cores](https://terminalroot.com.br/2020/03/21-melhores-temas-para-seu-vim.html) `vim ~/.vimrc`
> <https://github.com/Matsuuu/pinkmare>

{% highlight vim %}
Plug 'matsuuu/pinkmare'
{% endhighlight %}

> Feche o Vim abra de novo e rode: `:PlugInstall` . Após completada a instalação adicione ao seu `~/.vimrc`:
{% highlight vim %}
colorscheme pinkmare
" OPCIONAL: hi! MatchParen cterm=NONE,bold gui=NONE,bold guibg=NONE guifg=#FFFF00
{% endhighlight %}

---

# 06. [Linhas adicionais e opcionais da minha preferência](https://terminalroot.com.br/vim)
{% highlight vim %}
set nu!
set mouse=a
set title
set cursorline
set encoding=utf-8 " Importante para o YCM
{% endhighlight %}

---

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



# 07. [Mapeamentos interessantes](https://terminalroot.com.br/vim)
{% highlight vim %}
map q :quit<CR>
map <C-s> :write<CR> "echo 'stty -ixon' >> ~/.bashrc && exec $SHELL'
{% endhighlight %}

---

# 08. Instalar o [YouCompleMe](https://github.com/ycm-core/YouCompleteMe)
> <https://github.com/ycm-core/YouCompleteMe>

+ Antes instale as dependências
{% highlight bash %}
sudo apt install gcc g++ cmake make build-essential vim-nox python3-dev
{% endhighlight %}

+ Adicione esse plugin: `ycm-core/YouCompleteMe`, `:PlugInstall`
+ Complete a instalação:
{% highlight bash %}
cd .vim/plugged/YouCompleteMe/
python3 install.py --clangd-completer # Somente C/C++
# python3 install.py --all # precisa do Go e NPM:
# sudo apt install golang npm
{% endhighlight %}
+ Salve esse arquivo: [.ycm_extra_conf.py](https://raw.githubusercontent.com/ycm-core/ycmd/66030cd94299114ae316796f3cad181cac8a007c/.ycm_extra_conf.py) em `~/.vim/.ycm_extra_conf.py`

Adicione ao seu `~/.vim/.ycm_extra_conf.py` :
{% highlight python %}
'-I/usr/include/gtkmm-3.0',
'-I./',
'-I/usr/include',
{% endhighlight %}

---

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


# 09. Testar e configurar
{% highlight bash %}
vim teste.cpp
{% endhighlight %}
> Ao digitar `#include <iostream>` e `#include <vector>` ele irá autocompletar!

+ Caso não esteja adicione essa linha ao seu `~/.vimrc`
{% highlight vim %}
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
{% endhighlight %}

+ Removendo a janela suspensa quando usa o autocomplete, adicione essa linha:
{% highlight vim %}
set completeopt-=preview
{% endhighlight %}

+ Para desabilitar os diagnósticos em tempo de escrita:
{% highlight vim %}
let g:ycm_show_diagnostics_ui = 0
{% endhighlight %}

+ Compilando: `:terminal` e `g++ teste.cpp`, pra sair do terminal: `exit` .

---

# 10. Adicionando o [Auto-pairs](https://github.com/jiangmiao/auto-pairs)
> <https://github.com/jiangmiao/auto-pairs>

{% highlight vim %}
Plug 'jiangmiao/auto-pairs'
{% endhighlight %}

---

# 11. Instalando o [Servidor de Linguagens ccls](https://github.com/MaskRay/ccls)
> <https://github.com/MaskRay/ccls>

{% highlight bash %}
sudo apt install ccls
{% endhighlight %}

Copie esse código abaixo e cole no seu `.vimrc`:
{% highlight bash %}
let g:ycm_language_server =
  \ [{
  \   'name': 'ccls',
  \   'cmdline': [ 'ccls' ],
  \   'filetypes': [ 'c', 'cpp', 'cuda', 'objc', 'objcpp' ],
  \   'project_root_files': [ '.ccls-root', 'compile_commands.json' ]
  \ }]
{% endhighlight %}
> Mude o *cuda ...* para: `cc`, `h` e `hpp`
+ Abra o o `teste.cpp` e pare o mouse sobre o `std::cout` e agurade 4 segundos e verá o [ccls](https://github.com/MaskRay/ccls) funcionando.
> Perceba que ao autocompletar agora ele adiciona automaticamente um cabeçalho, se não quiser que isso aconteça, adicione essa linha ao seu `.vimrc`:

{% highlight bash %}
let g:ycm_clangd_args=['--header-insertion=never']
{% endhighlight %}
> E teste!

---

# 12. Adicionando o UtilSnips
> <https://github.com/SirVer/ultisnips> e <https://github.com/ervandew/supertab>

{% highlight vim %}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
{% endhighlight %}

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


Para funcionar adicione esse código:
{% highlight bash %}
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
{% endhighlight %}
> Teste com `teste.cpp` e `main<TAB>` . Se quiser edite os snippets(`.vim/plugged/vim-snippets/UltiSnips/cpp.snippets`)

---

# Bônus:
+ **1.** Vim-airline
{% highlight vim %}
:AirlineTheme
:help AirLineTheme
{% endhighlight %}
> **Undefined variable: g:airline_symbols** : `let g:airline_symbols = {}`

+ **2.** [Autocomplete com Inteligência Articial e Machine Learning](https://terminalroot.com.br/2020/06/instale-no-seu-editor-preferido-um-auto-complete-com-inteligencia-artificial.html)
{% highlight vim %}
let extensao = expand('%:e')

if( extensao == "cpp" || extensao == "cc" || extensao == "h" || extensao == "hpp" ) 
Plug 'ycm-core/YouCompleteMe'
else
Plug 'zxqfl/tabnine-vim'
endif
{% endhighlight %}

+ **3.** Instale o [Dracula Theme](https://draculatheme.com/)

---

# ARQUIVO FINAL:
{% highlight vim %}
let extensao = expand('%:e')

call plug#begin('~/.vim/plugged')
" Plugin de Exemplo inicial
Plug 'terroo/vim-simple-emoji'

" Aqui vão os plugins
Plug 'matsuuu/pinkmare'
if( extensao == "cpp" || extensao == "cc" || extensao == "h" || extensao == "hpp" ) 
Plug 'ycm-core/YouCompleteMe'
else
Plug 'zxqfl/tabnine-vim'
endif
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

" TEMA DE CORES
colorscheme pinkmare
hi! MatchParen cterm=NONE,bold gui=NONE,bold guibg=NONE guifg=#FFFF00

" CONFIGS RECOMENDADAS
set nu!
set mouse=a
set title
set cursorline

" MAPEAMENTOS LEGAIS
map q :quit<CR>
map <C-s> :w<CR>

" YOUCOMPLETEME
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
set completeopt-=preview
let g:ycm_show_diagnostics_ui = 0
let g:ycm_clangd_args=['--header-insertion=never']
let g:ycm_language_server =
  \ [{
  \   'name': 'ccls',
  \   'cmdline': [ 'ccls' ],
  \   'filetypes': [ 'c', 'cpp', 'cc', 'h', 'hpp' ],
  \   'project_root_files': [ '.ccls-root', 'compile_commands.json' ]
  \ }]


" UTILSNIPS
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" VIM AIRLINE
let g:airline_theme = 'dracula'
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols = {}
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰ '
let g:airline_symbols.maxlinenr = '  '
let g:airline_symbols.dirty='⚡'
{% endhighlight %}


