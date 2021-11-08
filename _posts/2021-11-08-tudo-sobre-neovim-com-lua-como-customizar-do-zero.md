---
layout: post
title: "Tudo sobre Neovim com Lua - Como Customizar do Zero"
date: 2021-11-08 08:45:56
image: '/assets/img/neovim/neovim-lua.jpg'
description: 'Série de como customizar o seu Neovim do zero com Lua!'
icon: 'ion:terminal-sharp'
iconname: 'Neovim/Lua'
tags:
- neovim
- lua
---

![Tudo sobre Neovim com Lua - Como Customizar do Zero](/assets/img/neovim/neovim-lua.jpg)

Salve, rapaziada! Marcos aqui.

Estou a um bom tempo sem postar vídeos no canal [TerminalRootTV](https://youtube.com/TerminalRootTV) porque estou com alguns probleminhas técnicos mais precisamente com meus móveis, quando eu retornar a publicar vídeos vou fazer um vídeo tentando explicar ao certo e provavelmente mostrando algumas coisas novas.

Mas enquanto lá não fica pronto, vamos criar conteúdo por aqui mesmo. 

Muita gente tem perguntado sobre customização do zero do [Neovim](https://terminalroot.com.br/tags#neovim) , então a partir desse artigo vamos iniciar uma série de "ainda não sei bem o número de artigos suficientes" para repassar para vocês tudo que aprendi sobre o **Neovim** .

Para acompanhar essa série, acho que seria muito importante você possuir um conhecimento básico de [Vim](https://terminalroot.com.br/vim), [Neovim](https://terminalroot.com.br/tags#neovim) e [Lua](https://terminalroot.com.br/lua) . Sugiro os links, vídeos, cursos e playlists abaixo:

+ [Curso Completo de Vim Moderno e Vimscript](https://terminalroot.com.br/vim/)
+ [Guia Definitivo de Lua para Iniciantes](https://terminalroot.com.br/lua)
+ [Como Customizar seu VIM do Zero para C/C++ (Ubuntu Cinnamon)](https://www.youtube.com/watch?v=W8bFxnpJjF4)
+ [Customize seu NEOVIM com a Linguagem de Programação LUA](https://terminalroot.com.br/2021/08/customize-seu-neovim-com-a-linguagem-de-programacao-lua.html)
+ [VIM vs NEOVIM](https://www.youtube.com/watch?v=lyTI9Sz0V8E)
+ [Postagens sobre Neovim](https://terminalroot.com.br/tags#neovim)
+ [Postagens sobre Vim](https://terminalroot.com.br/tags#vim)
+ [Playlist sobre Vim](https://www.youtube.com/watch?v=nyeOFAlOgNs&list=PLUJBQEDDLNcnl-1CebtDi6tlt9TtsrkgP)


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

# Por que muita gente está migrando para o Neovim ?
Como já falamos em algum lugar dos links acima citados, o Neovim resolveu um problema de "*lentidão*" do Vim em relação ao uso de *plugins* . E o principal motivo disso foi entregar para a linguagem de programação Lua todos os: cálculos, filtragens, verificações e entre outros, pelo fato do Vimscript não ser uma linguagem muito veloz, até porque ela, até então, foi feita sem otimizações somente para executar tarefas básicas.

Mas as coisas foram crescendo e chegou um ponto que ela se tornou uma "*pedra no sapato*" do Vim . Logo, surgiu o Neovim com o intuito de resolver esse problema. Ou seja, para não "reinventar a roda" e ter de alterar todo o Vimscript(que seria um baita de um trabalho) adotou-se uma linguagem que já possui todas as otimizações necessárias que é a linguagem de programação Lua.

Se você quiser mais detalhes sobre isso sugiro [essa palestra](https://www.youtube.com/watch?v=Bt-vmPC_-Ho) do **Justin M. Keyes**(atual Líder e Mantenedor do Neovim) que foi ministrada na [VimConf](https://vimconf.org/) de 2019 .

---

# Como Lua consegue modificar as configurações do editor ?
O Vim possui diversas [API's](https://www.vim.org/docs.php) que servem para o mesmo e elas foram expandidas pelos programadores do Neovim com intuito de tornar ainda mais fácil a manipulação dos dados por Lua . Veremos mais detalhes, do zero, como isso acontece no próximo artigo . Mas após os testes, os benchmarks e próprio uso, notou-se MUITA diferença em relação à velocidade.

---

# O que vamos fazer ao certo com essa série ?
Vamos customizar DO ZERO todo nosso Neovim de forma original sem uso de distro. Utilizando os melhores plugins para diversas situações e criando nosso próprio código para situações particulares, por isso a necessidade de possuir um conhecimento básico de [Lua](https://terminalroot.com.br/lua) .

Eu cheguei a postar uma *captura de tela* da minha configuração, mas a verdade é que aqui faremos bem melhor com diversas coisas que não é possível mostrar num simples *screenshot* . mas caso você não tenha visto, segue a captura de tela do [Twitter do Terminal Root](https://twitter.com/TerminalRootTV/):

---

<blockquote class="twitter-tweet"><p lang="pt" dir="ltr">Terminei de configurar meu Neovim do zero do jeito que eu queria, daqui pra frente só basta ele! <a href="https://twitter.com/hashtag/Lua?src=hash&amp;ref_src=twsrc%5Etfw">#Lua</a> <a href="https://twitter.com/hashtag/Neovim?src=hash&amp;ref_src=twsrc%5Etfw">#Neovim</a> <a href="https://twitter.com/runixporn?ref_src=twsrc%5Etfw">@runixporn</a> <a href="https://t.co/TBRHMtTy8C">pic.twitter.com/TBRHMtTy8C</a></p>&mdash; Terminal Root (@TerminalRootTV) <a href="https://twitter.com/TerminalRootTV/status/1455837918807928837?ref_src=twsrc%5Etfw">November 3, 2021</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>


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

Vou tentar detalhar o máximo cada passo e publicar, pelo menos, 1 artigo dessa série por dia. Mas ao final teremos um vídeo com algumas dicas adicionais, até porque aqui no blog eu removi o bloco de comentários e lá no [Youtube](https://youtube.com/TerminalRootTV) poderemos interagir melhor, mas vou tentar repôr os comentários aqui no blog.

Então, por hoje é só e não se esqueça de se inscrever no nosso [newsletter](https://terminalroot.com.br/newsletter) para não perder nenhum artigo da série.

Nos vemos nossos próximos artigos!

Até lá!


