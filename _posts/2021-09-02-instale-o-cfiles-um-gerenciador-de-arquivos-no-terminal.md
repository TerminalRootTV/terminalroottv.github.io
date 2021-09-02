---
layout: post
title: "Instale o Cfiles - Um Gerenciador de Arquivos no Terminal"
date: 2021-09-02 08:46:15
image: '/assets/img/terminal/cfiles.png'
description: 'Uma ótima alternativa ao Ranger.'
icon: 'ion:terminal-sharp'
iconname: 'unixporn'
tags:
- unixporn
- linguagemc
---

![Instale o Cfiles - Um Gerenciador de Arquivos no Terminal](/assets/img/terminal/cfiles.png)

Se você curte gerenciadores de arquivos para o terminal, esse você vai curtir mais ainda.

Ele é uma alternativa ao [Ranger](https://ranger.github.io/) e entre outros, mas citei o Ranger porque é considerado um dos melhores e o **Cfiles** não fica para trás.

# Instalação
Antes de qualquer coisa certifique-se de possuir as dependências:
+ `ncursesw`
+ `fzf` para pesquisar
+ `w3mimgdisplay` ou **Überzug** para pré-visualizações de imagens
+ `mediainfo` para visualizar informações de mídia e tamanhos de arquivo
+ `atool` para pré-visualizações de arquivo
+ `poppler` (especificamente pdftoppm) para visualizações em pdf


<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


Depois é só clonar,  compilar o [Makefile](https://terminalroot.com.br/2019/12/como-criar-um-makefile.html) e instalar:
{% highlight bash %}
git clone https://github.com/mananapr/cfiles
cd cfiles
make
sudo make install
{% endhighlight %}

Se você usar [Arch Linux](http://terminalroot.com.br/tags#archlinux) há um [AUR](https://aur.archlinux.org/packages/cfiles) disponível, veja [aqui](https://terminalroot.com.br/2020/12/como-instalar-pacotes-do-aur-via-yay-no-arch-linux.html) como instalar AUR.

# Utilização
Após instalado basta rodar o comando `cfiles` para abrir o gerenciador. Ele possui diversos atalhos de teclado que se resumem em:

| Atalho | Função |
|:---:| --- |
| <kbd> h j k l </kbd> | Teclas de navegação |
| <kbd> G </kbd> | Vá para o fim |
| <kbd> g </kbd> | Vá para o topo |
| <kbd> H </kbd> | Vá para o topo da visualização atual |
| <kbd> M </kbd> | Ir para o meio da visualização atual |
| <kbd> L </kbd> | Vá para a parte inferior da visualização atual |
| <kbd> pgup </kbd> | Rolar uma página para cima |
| <kbd> pgdn </kbd> | Role para baixo uma página |
| <kbd> f </kbd> | Pesquisar usando fzf |
| <kbd> F </kbd> | Pesquise usando fzf no diretório atual |
| <kbd> S </kbd> | Abra o Shell no diretório atual |
| <kbd> espaço </kbd> | Adicionar / Remover para / da lista de seleção |
| <kbd> tab </kbd> | Ver lista de seleção |
| <kbd> e </kbd> | Editar lista de seleção |
| <kbd> u </kbd> | Lista de seleção vazia |
| <kbd> y </kbd> | Copiar arquivos da lista de seleção |
| <kbd> v </kbd> | Mover arquivos da lista de seleção |
| <kbd> a </kbd> | Renomear arquivos na lista de seleção |
| <kbd> dd </kbd> | Mover arquivos da lista de seleção para a lixeira |
| <kbd> dD </kbd> | Remover arquivos selecionados |
| <kbd> i </kbd> | Ver informações de mídia e informações gerais |
| <kbd> I </kbd> | Ver antevisão |
| <kbd>. </kbd> | Alternar arquivos ocultos |
| <kbd> b </kbd> | Alternar fronteiras |
| <kbd> '</kbd> | Ver / Ir para favoritos |
| <kbd> m </kbd> | Adicionar marcador |
| <kbd> E </kbd> | Editar favoritos |
| <kbd> p </kbd> | Execute um script externo |
| <kbd> r </kbd> | Reload |
| <kbd> q </kbd> | Sair |


---

Para mais informações acesse o [repositório oficial do cfiles](https://github.com/mananapr/cfiles)
