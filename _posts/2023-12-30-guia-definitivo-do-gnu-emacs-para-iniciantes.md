---
layout: post
title: "Guia Definitivo do GNU Emacs para Iniciantes"
date: 2023-12-30 11:25:22
image: '/assets/img/'
description: 'Comandos, Atalhos, Auto-complete, Syntax Highlight, Configurações prontas e entre outros!'
icon: 'ion:terminal-sharp'
iconname: 'GNU Emacs'
tags:
- gnu
- editores
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---


# Guia Definitivo do GNU Emacs para Iniciantes
> 

![GNU Emacs](/assets/img/gnu/emacs.png)

---

O [GNU Emacs](https://www.gnu.org/software/emacs/), ou somente Emacs, é um editor de texto, usado por programadores e usuários que necessitam desenvolver documentos técnicos, em diversos sistemas operacionais. A primeira versão do Emacs foi escrita em 1976 por [Richard Stallman](https://terminalroot.com.br/2018/10/Etica-vigilancia-e-democracia-na-visao-de-richard-stallman.html).

O Emacs tem sua base em [Lisp](https://terminalroot.com.br/2022/01/conheca-a-linguagem-de-programacao-wisp-o-lisp-escrito-em-cpp.html), especificamente um dialeto de Lisp chamado [Emacs Lisp](https://terminalroot.com.br/tags#lisp). Este permite que ele se torne configurável ao ponto de se transformar em uma espécie de *canivete suíço* para escritores, analistas e programadores.

Alguns recursos disponíveis no Emacs:
+ Realce de sintaxe para várias linguagens
+ Aceita configurações para comandos de shell (a [EShell](https://www.gnu.org/software/emacs/manual/html_mono/eshell.html))
+ Programável em [Emacs Lisp](https://terminalroot.com.br/tags/#lisp)

Nesse artigo veremos como **instalar**, **usar** e **configurar** o **GNU Emacs**!

---

# Instalação
O GNU Emacs está disponível para qualquer sistema operacional, dentre eles: [Windows](https://terminalroot.com.br/tags#windows), [macOS](https://terminalroot.com.br/tags#macos), [GNU/Linux](https://terminalroot.com.br/tags#gnulinux), [BSD](https://terminalroot.com.br/tags#bsd), [Haiku](https://terminalroot.com.br/2021/05/conheca-o-haiku-um-sistema-operacional-escrito-em-cpp.html) e entre outros!

Para instalar você pode fazer o [download direto da página oficial do GNU Emacs](https://www.gnu.org/software/emacs/) ou usar o gerenciador de pacotes do seu sistema operacional.

Exemplo de instalação no [Ubuntu](https://terminalroot.com.br/tags#ubuntu):
{% highlight bash %}
sudo apt install emacs
{% endhighlight %}
> Provavelmente após instalar ele vai perguntar sobre o **Tipo de Configuração para o Servidor de E-mail**, você pode selecionar **Sem configuração**.

Após devidamente instalado você pode procurar pelo programa pelo dashboard do seu sistema, ou iniciá-lo via linha de comando através do terminal, além de obter informações, exemplo:
{% highlight bash %}
emacs --version
emacs --help
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

# Utilização
Após abri-lo, seja rodando o comando `emacs` no terminal ou de forma gráfica, essa será a tela inicial do editor:

![GNU Emacs](/assets/img/gnu/start-emacs.png)

---

Já nessa tela é possível notar links que ao clicar será aberta página no próprio Emacs para elucidar o que foi clicado. Por exemplo, se você clicar no link **Welcome to [GNU Emacs](https://www.gnu.org/software/emacs/)** será aberta a página do link no próprio Emacs, ou seja, ele também é um Navegador! 😊

Para fechar os links que você selecionou, basta clicar no ícone: <span style="color:red;">⨂ </span> na barra de ferramentas. Aliás, os ícones(que são atalhos) nessa barra possuem um *alt/title* que ao passar o mouse em cima ele descreverá o que os mesmos fazem além de uma dica de usá-los com comandos.

Que é para lá(comandos) que iremos!

---

# Comandos do GNU Emacs
Uma coisa importante também é que existe a versão [TUI](https://terminalroot.com.br/tags#tui) do Emacs. Ou seja, você não precisa necessariamente usá-lo graficamente, apesar de ser mais fácil e intuitivo. No entanto, é possível usá-lo diretamente pelo terminal!

E para esse tópico ficar mais legal vamos abri-lo pelo terminal como o comando:
{% highlight bash %}
emacs --no-window-system
{% endhighlight %}
> Ou somente: `emacs -nw`. A tela inicial será a mesma do modo gráfica, mas com o aspecto TUI!

![GNU Emacs terminal mode](/assets/img/gnu/gnu-emacs-terminal.png)

Você também pode abrir pelo terminal e já definir o(s) arquivo(s) que deseja editar, exemplo:
{% highlight bash %}
emacs --no-window-system file.md
emacs -nw file.md main.cpp
{% endhighlight %}

Se for múltiplos arquivos ele irá dividir a tela automaticamente, exemplo:

![GNU Emacs multiple files](/assets/img/gnu/gnu-emacs-multiple-files.png)
> Note que estou criando esse artigo com GNU Emacs(*cru*) pelo terminal. **Note também** que meu arquivo [Markdown](https://terminalroot.com.br/tags#markdown) possui *Syntax Highlight*, muito provavelmente o seu não terá, mas no tópico sobre configuração mostro como obter isso.


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

## Teclas rápidas
+ `C-x o` → Significa: `Ctrl + x` e em seguida teclar `o` → **Altera entre os arquivos abertos**, se houver mais de um aberto;
+ `C-x C-s` → **Salva** um arquivo;
+ `C-x C-c` → **Sai**, mas se você não salvou antes aparecerá uma mensagem no rodapé perguntando se você deseja salvar: `Save file /home/user/file.txt? (y, n, !, ., q, C-r, C-f, d or C-h)`, caso queira, pressione `y` para sair e salvar;
+ `M-<` → **Move o cursor para o início do arquivo**. Lembrando que a letra `M` significa tecla **Meta** e ela pode ser tanto o `Alt` quanto o `Esc`, como estamos no terminal, o `Esc` é o recomendado, ou seja, tecle: `Esc` e em seguida o caractere `<`;
+ `M->` → O cursor para para o **final do arquivo**;
+ `C-a` → Move o cursor para o **início da linha**;
+ `C-e` → Move o cursor para o **final da linha**;
+ `M-u` = `Alt + u` = `Esc u` → Converte uma frase para **MAIÚSCULAS**, mas antes você precisa posicionar o cursor antes da palavra que deseja converter;
+ `M-l` = `Alt + l` = `Esc l` → Converte uma frase para **minúsculas**, mas antes você precisa posicionar o cursor antes da palavra que deseja converter;
+ `C-<espaço>` → Inicia o modo **seleção**, com as teclas direcionais você escolhe a direção da seleção. Se quiser selecionar até o final da linha tecle: `C-e`;
+ `M-w`, ou mais preferível especialmente se estiver no terminal: `Esc w` → **Copia** o texto pós selecionado;
+ `C-y` → **Cola** o texto pós copiado no local/linha desejado;
+ `C-k` → **Deleta** uma linha(se o cursor estiver no início da linha) ou parte de uma linha dependendo da posição do cursor;
+ `C-x u` → **Desfaz** um operação;
+ `C-g` → **Refaz** uma operação, mas antes ele sai do modo e em seguida você precisa teclar `C-x u`;
+ `M-x replace-string` e depois pressione ENTER → **Substitui** todas as ocorrências de uma palavra por outra. No entanto, é necessário posicionar o cursor no início do arquivo: `Esc <` e em sequida teclar `M-x replace-string`, lembrando que o Emacs possui auto-complete nessa secção, para isso basta pressionar **TAB**. Abrirá uma *caixa* no rodapé para você informar a palavra que deseja encontrar para substituir: `Replace string: ` digite a palavra. Após isso abrirá uma nova *caixa* agora para você informar qual será o novo termo para inserir na substituição: `Replace string X with: `, após digitar a palavra que deseja basta pressionar ENTER e todas as ocorrências serão substituídas!
+ `C-s` → **Pesquisa** palavras no arquivo.

É possível notar que existem diversos comandos e atalhos, por isso ler aquela documentação que aparece na página inicial é interessante, mas a maioria você vai aprendendo aos poucos!

---

# Configurações
Os arquivos de configuração do Emacs ficam no diretório raiz da sua pasta pessoal. Ele pode estar em um arquivo direto:
{% highlight bash %}
~/.emacs
{% endhighlight %}

Ou dentro de um diretório também na raiz da pasta pessoal, mas no arquivo `init.el`:
{% highlight bash %}
~/.emacs.d/init.el
{% endhighlight %}

Vamos adotar o `~/.emacs` direto nesse exemplo, pois fica mais simples.

---

## Instalar e Habilitar Syntax Hightlight para o Markdown
Abra esse arquivo:
{% highlight bash %}
emacs -nw ~/.emacs
{% endhighlight %}

E iremos usar o gerenciador de pacotes do Emacs: `package.el` para instalar o `markdown-mode`, cole o conteúdo abaixo:
{% highlight lisp %}
;; Adiciona o repositório MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Instala o markdown-mode
(unless (package-installed-p 'markdown-mode)
  (package-refresh-contents)
  (package-install 'markdown-mode))
{% endhighlight %}

Agora salve o arquivo `C-x C-s` e saia do mesmo: `C-x C-c`.
> Muito provavelmente quando você abrir esse arquivo novamente o Emacs, notará que estará modificado com informações adicionais feitas pelo próprio package.el

Abra um arquivo Markdown no Emacs e o `markdown-mode` será ativado automaticamente e já terá ativado o *syntax highlight*. Se isso não acontecer, você pode forçar a ativação usando o seguinte comando: `M-x markdown-mode`.


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

# Adicionar Auto-complete para [C++](https://terminalroot.com.br/cpp)
Você pode adicionar auto-complete para qualquer [linguagem de programação](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html), no entanto veremos esse exemplo que serve para C++, mas se você digitar palavras do buffer em qualquer arquivo, note que o que iremos adicionar, instalar e habilitar aqui servirá para vários casos inclusive para o auto-complete(com TAB) para arquivos do tipo Markdown!

Abra o arquivo de configuração:

{% highlight bash %}
emacs ~/.emacs
{% endhighlight %}

E cole o conteúdo abaixo, nas linhas há *comentários* inciados por `;;`. Logo abaixo haverá imagens de linhas específicas:
{% highlight lisp %}
;; START C++ AUTO COMPLETE
;; Instala o pacote 'company'
(unless (package-installed-p 'company)
  (package-refresh-contents)
  (package-install 'company))

;; Instala os pacotes 'irony' e 'company-irony'
(unless (package-installed-p 'irony)
  (package-install 'irony))
(unless (package-installed-p 'company-irony)
  (package-install 'company-irony))

;; Configura o 'company-mode' e 'irony-mode'
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

;; Ativa o 'company-mode' e 'irony-mode' globalmente
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'c++-mode-hook 'irony-mode)
;; FINAL C++ AUTO COMPLETE
{% endhighlight %}

Agora salve e saia e abra um arquivo [C++](https://terminalroot.com.br/tags#cpp) ou qualquer outro arquivo e teste o auto-complete!

Imagens exemplo:

![GNU Emacs auto-complete 1](/assets/img/gnu/gnu-emacs-cpp-autocomp.png)
![GNU Emacs auto-complete 2](/assets/img/gnu/gnu-emacs-local-autocomp.png)
![GNU Emacs auto-complete 3](/assets/img/gnu/gnu-emacs-md-autocomp.png)

Se aparecer *Warnings* de falha de configuração pode ser que a versão do seu `package.el` está desatualizada, mas você pode ignorar essas janelas verticais que se abrirão, rodando o Emacs com o parâmetro `--debug-init`, exemplo:

{% highlight bash %}
emacs -nw --debug-init main.cpp
{% endhighlight %}

Existe diversos recursos adicionais inclusive *snippets*, ao final desse artigo deixarei links úteis!

---

# Configurações prontas!
Existem diversas configurações prontas para você utilizar no seu GNU Emacs. Existe uma bem legal do usuário do GitHub: **Likhon-baRoy**(A imagem de *chamada* desse artigo) que você pode customizar automaticamente:

### 1º. Faça backup da suas configurações
{% highlight bash %}
cp ~/.emacs BKP-emacs
{% endhighlight %}

### 2°. Depois remova todos os diretórios de configuração
{% highlight bash %}
rm -rf ~/.emacs*
{% endhighlight %}

### 3.° Clone o repositório com o [Git](https://terminalroot.com.br/tags#git)
{% highlight bash %}
cd
git clone https://github.com/Likhon-baRoy/.emacs.d
{% endhighlight %}

Depois é só abrir o Emacs, de preferência no mode terminal, e aguardar ele instalar e habilitar todos os *plugins*. Durante a abertura acompanhe no rodapé as instalações, ele irá pedir uma confirmação para atualização dos plugins, tecle `y` para aceitar e em seguida aparecerá a tela inicial similar a imagem abaixo:

![GNU Emacs Linkhon](/assets/img/gnu/gnu-emacs-linkhon.png)

Para mais informações acesse o [repositório do GitHub](https://github.com/Likhon-baRoy/.emacs.d).

---

# Conclusão
Esse GUIA assim como foi mencionado é destinado à INICIANTES e eu tentei compartilhar tudo que aprendi quando comecei com o GNU Emacs. 

No entanto, não dá pra aprender tudo logo no início, pois o GNU Emacs é um sistema operacional disfarçado de editor de texto! 😊

Mas, espero ter ajudado! 

Não esqueça de consultar o próximo tópico(Links úteis) e compartilhar esse artigo!!!

Abraços!

---

# Links úteis
+ <https://www.gnu.org/software/emacs/refcards/pdf/refcard.pdf>
+ <https://github.com/emacs-tw/awesome-emacs>
+ <https://jblevins.org/projects/markdown-mode/>
+ <https://github.com/mikajoh/.emacs.d/blob/master/setup.el>
+ <https://melpa.org/#/>
+ <https://cs.hamilton.edu/misc/EmacsCheatSheet_iupui.pdf>
+ <https://ccrma.stanford.edu/guides/package/emacs/emacs.html>

