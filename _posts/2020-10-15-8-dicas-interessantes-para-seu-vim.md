---
layout: post
title: "8 Dicas Interessantes para seu Vim"
date: 2020-10-15 13:56:15
image: '/assets/img/vim/vim-tips.jpg'
description: 'Eu vi, vim e venci!'
icon: 'simple-icons:vim'
iconname: 'vim'
tags:
- vim
---

![8 Dicas Interessantes para seu Vim](/assets/img/vim/vim-tips.jpg)

---

# 1. Criar um novo arquivo ou diretório usando o [NERDTree](https://github.com/preservim/nerdtree)
Muita gente não sabe, mas é possível criar arquivos e diretórios diretamente pelo [NERDTree](https://github.com/preservim/nerdtree). 

Com o NERDTree aberto, posicione o cursor no diretório que deseja criar e tecle `m`, em seguida tecle a e digite o nome do arquivo/diretório, se você pôr uma barra `/` no final irá criar um diretório, se não será criado um arquivo!

![NERDTree file or directory](/assets/img/vim/nerdtree-file-dir.jpg)

Para cancelar tecle `ESC`, para atualizar o NERDTree após criação tecle `Shift + r` e para outros procedimentos leia o menu como na imagem acima! 😃 , show, né?!

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


# 2. Colchete de fechamento do [SURROUND](https://github.com/tpope/vim-surround)
Eu utilizo muito o [Vim.surround] para gerar links em [MarkDown](https://terminalroot.com.br/2018/09/como-renderizar-markdown-no-linux.html) e geralmente a palavra já está digitada e isso me trazia alguns *trabalhos* a mais.

Quando você seleciona uma palavra, tecla `S` e em seguida tecla `[` ele produz isso: `[ palavra ]`, ou seja, ele cria um **espaço** entre os colchetes e a palavra, para evitar isso, em vez de usar o colchete de abertura, use o colchete de fechamento e ele irá produzir: `[palavra]`(sem espaços), para ir ao final da palavra basta teclar `W` no modo de comando [🍺](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=MDBKEUL69LKSY) .

---

# 3. Autocomplete de listas com [Bullets.vim](https://github.com/dkarter/bullets.vim)
Problemas ao criar listas dinamicas no [Vim](https://terminalroot.com.br/vim/) ?! Não mais, utilize o [Bullets.vim](https://github.com/dkarter/bullets.vim) e deixe que ele autocomplete suas listas para você:

![Bullets.vim](/assets/img/vim/bullets.gif)

---

# 4. Set mouse={a,n,i,c,v,h,r}
Você gosta da facilidade do `set mouse=a`, mas também *odeia* 😡 quando você que selecionar no modo normal ??? Ter de ficar rodando o comando toda hora é chato, né minha filho(a) ?!

Use essa função no seu `~/.vimrc` ou no seu `~/.config/nvim/init.vim` e altere o modo somente teclando `F4`
```viml
function! StatusMouse()
        if &mouse == 'a' 
         set mouse=i
        else
         set mouse=a
        endif
endfunction
nnoremap <silent> <F4> <ESC>:call StatusMouse()<CR>
```
Simples e prático! 😃

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

# 5. TAB BUFFER no NERDTree
Vamos lá de novo com mais uma dica para o NERDTree. Chateado com a forma que o NERDTree abre o arquivo quando você clica diretamente nele ? Force-o a carregar o arquivo em buffer com esse código:
```viml
nnoremap <C-q> :bp<cr>:bd #<cr>
```
Para mais informações consulte a documentação do NERDTree: `:h NERDTree`

---

# 6. Emojis simples e úteis
Existem várias opções para [inserir emoji automaticamente no Vim](https://terminalroot.com.br/2019/10/como-inserir-rapidamente-emojis-nos-seus-textos-pelo-vim.html), mas muitas delas estressam também pela quantidade de emojis.

Então, para contornar esse problema eu criei o o [Vim Simple Emoji](https://github.com/terroo/vim-simple-emoji). Para instalá-lo utilize seu gerenciador de plugins favorito, exemplo:
```sh
Plugin 'terroo/vim-simple-emoji'
```
E depois rode o comando: `:PluginInstall`.

E para usar insira o nome do emoji entre dois pontos e pressione o botão *[espaço]* e o emoji será exibido na posição do cursor. Exemplo
```viml
:smile:<space>
```
Isso irá resultar em: 😃 

Quer saber o nome de todos os emojis disponíveis ? Rode: `:ShowEmoji`. Alguns nomes foram modificados para torná-los mais peculiares, exemplo: `:linux:` irá exibir o pinguim 🐧

![Vim Simple Emoji](/assets/img/vim/vim-simple-emoji.jpg)

---

# 7. Defina as cores do seu Vim ao seu modo
Quer umas cores maneiras para o background e front para seu Vim ? Defina você mesmo! Para o *back* alter o hexadecimal do valor `guibg` e para o front `guifg`, exemplo:
```viml
highlight Normal guifg=#e0e0e0 guibg=#353945 gui=NONE ctermfg=250 ctermbg=235 cterm=NONE
```
Se quiser um fundo dark ou light, use também: `set bg=dark` ou `set bg=light`

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

Também quer destaque na linha atual? Moleza, use: `set cursorline`. 😎 

# 8. Seu [vim-airline]() mais legal!
E pra finalizar as dicaas de hoje, nada como inserir um [unicode](https://pt.wikipedia.org/wiki/Unicode) maneiro no seu [vim-airline](https://github.com/vim-airline/vim-airline) , adicione o símbolo: **◉**  a barra de seção:
```viml
let g:airline_section_z = '◉ ␤ % %l/%c'
```
Isso irá produzir sua barra como na imagem abaixo:

![bar vim-airline](/assets/img/vim/bar-vim-airline.png)
14. AIRLINE SECTION ◉
15. CREATE PLUGIN VIM-UTILS-PLUGINS

---

Essa dicas foram criadas baseadas nas perguntas que me fazem tipo: **Como você fez isso aí no seu Vim?** . Se tiver uma pergunta maneira, nos envie um e-mail, nos adicione nas redes sociais e assine nosso NewsLetter:

<a href="https://terminalroot.com.br/newsletter" target="_blank" class="btn btn-danger btn-block">Receba novidades por e-mail!</a> 

Abaixo alguns vídeos com dicas Vim que podem lhe ajudar!

<iframe width="1237" height="696" src="https://www.youtube.com/embed/LMKiTPMV4U4?list=PLUJBQEDDLNcnl-1CebtDi6tlt9TtsrkgP" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="1237" height="696" src="https://www.youtube.com/embed/PmKJT6SlN-Q?list=PLUJBQEDDLNcnl-1CebtDi6tlt9TtsrkgP" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="1237" height="696" src="https://www.youtube.com/embed/nfPubmjO5xw?list=PLUJBQEDDLNcnl-1CebtDi6tlt9TtsrkgP" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="1237" height="696" src="https://www.youtube.com/embed/nFWQJiLvjnk?list=PLUJBQEDDLNcnl-1CebtDi6tlt9TtsrkgP" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="1237" height="696" src="https://www.youtube.com/embed/XXGk3n1uzPg?list=PLUJBQEDDLNcnl-1CebtDi6tlt9TtsrkgP" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

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

# Links Úteis
+ <https://sookocheff.com/post/vim/creating-a-new-file-or-directoryin-vim-using-nerdtree/>
+ <https://stackoverflow.com/questions/8584182/how-to-refresh-in-nerdtree-plugin>
+ <https://stackoverflow.com/questions/9164405/vim-surround-inserts-extra-space-around-the-word>

# Fui!



