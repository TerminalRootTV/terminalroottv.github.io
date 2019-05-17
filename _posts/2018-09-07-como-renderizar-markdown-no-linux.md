---
layout: post
title: "Como Renderizar Markdown no Linux"
date: 2018-09-07 09:21:46
image: '/assets/img/dicas/md-linux.jpg'
description: 'O Markdown existe pra simplificar ainda mais o HTML, ou seja, ele converte seu texto em um HTML válido.'
main-class: 'html'
tags:
- markdown
- html
- git
- github
---

Uma das maiores revoluções da internet foi o [HTML](https://en.wikipedia.org/wiki/HTML) e o [Markdown](https://daringfireball.net/projects/markdown/) existe pra simplificar ainda mais o HTML, ou seja, ele converte seu texto em um HTML válido. Ficar escrevendo tags no início e fim, mesmo com IDEs ou para quem possui destreza, ainda assim é um grande esforço, e é para isso que existe o **Markdown**.

## Como escrever em Markdown

O site oficial para informações sobre Markdown é <https://daringfireball.net/projects/markdown/> , onde você poderá obter todas as dicas de utilização.

No entanto, você ainda pode simplificar o entendimento e utilizar tutoriais alternativos, ou até mesmo [pesquisar no seu buscador preferido cheat sheet de Markdown](https://is.gd/EPFKNK), eu mesmo já fiz isso e encontrei essa imagem aqui que possui um resumo bem bacana.

![Cheat Sheet Markdown](md.png "Cheat Sheet Markdown")

## Vamos escrever um exemplo básico

Quando você cria um arquivo Markdown, para que o arquivo seja lido por um '*interpretador de Markdown*' é necessário você definir a **extensão** do arquivo as duas mais utilizadas (apesar de haver outras) é `.md` ou `.markdown` , para esse exemplo vamos criar um arquivo *.md*

`vim exemplo.md`

{% highlight md  %}
# Essa é a tag h1
## Essa é a tag h2

Aqui é só um parágrafo com a tag p

> Isso é um blockquote

Nesse texto tem **negrito** *italico* e ~~aqui tem uma linha atravessada~~

+ Lista não ordenada
+ Aqui também poderia ser * com espaço
+ Ou até mesmo - 

| Tabela | Thead |
|---|---|
| 1 | Checkbox não selecionado |
| 2 | Checkbox selecionado |
| 3 | Aprenda markdown |

Aqui em baixo um código Shell Script

```sh
#!/bin/bash
echo 'Exemplo de code pre em Markdown'
```


***

[Aqui tem um link](http://terminalroot.com.br)

![Aqui uma imagem do Cheat Sheet do Markdown!](md.png "aqui tem um title")

# Valeu!
{% endhighlight  %}

Pra você visualizar seu arquivo Markdown, existem várias maneiras. A mais utilizada é em endereços da Web que já possuem 'persers' no Servidores, exemplo: se você possuem uma conta no GitHub, Gitlab, Bitbucket e entre outros, ao você copiar o arquivo pra lá você já consegue visualizar: README.md, About.md, ... mas muitas vezes você não deseja copiar pra lá pra visualizar seu arquivo Markdown, logo, existem alguns outras soluções, são elas:

### Renderizar localmente no seu Navegador Web

Se você tentar abrir o arquivo md no browser do seu navegador, ele automaticamente irá tentar baixar o arquivo ou abrir numa aplicação instalada no seu PC, logo você precisará de um complemento para conseguir abrir o arquivo. 

Pesquise os complementos disponíveis para o seu navegador, bem como a versão do mesmo. Nesse caso aqui eu vou adicionar o complemento/add-on no [GNU IceCat versão 52.0.2 (64-bit)](https://www.gnu.org/software/gnuzilla/), para essa versão é possível eu instalar o [Markdown Viewer](https://addons.mozilla.org/en-US/firefox/addon/markdown-viewer/) que é um complemento bem leve, simples e funcional, no netanto, para versões mais recentes dos navegadores baseados em Gecko, ele não funciona. 

Após instalar, conseguiremos abrir nosso arquivo exemplo de Markdown.

### Renderizar em um aplicativo no Linux

Existem diversos aplicativos/editores para escrever e renderizar Markdown, pesquise na internet e escolha o que mais lhe interessa. No meu caso e para o sistema que eu utilizo, eu utilizo o [ReText](https://github.com/retext-project/retext), assim como outros da linha, ele escreve e visualiza em *dual-pane*, ou seja, em dois painéis . 


Para instalar o ReText pesquise no repositório do gerenciador da sua distribuição, no meu caso eu pesquisei o usando a ferramenta de pesquisa da distribuição que eu utilizo: [Gentoo](http://terminalroot.com.br/2017/05/como-instalar-o-gentoo.html): 

{% highlight bash  %}
emerge --search retext
[ Results for search key : retext ]
Searching...

*  app-editors/retext
      Latest version available: 7.0.3
      Latest version installed: [ Not Installed ]
      Size of files: 388 KiB
      Homepage:      https://github.com/retext-project/retext https://github.com/retext-project/retext/wiki
      Description:   Simple editor for Markdown and reStructuredText
      License:       GPL-2
...
{% endhighlight  %}

Após encontrá-lo, basta instalá-lo `sudo emerge app-editors/retext`.

Você ainda pode converter Markdown em HTML de maneira simples, pesquise sobre o [Pandoc](http://pandoc.org/), ex.: `emerge --search pandoc` e use ele para diversos formatos: LaTex, PDF, MD, ...
Exemplo, converter um arquivo **.md** em **.html**

{% highlight bash  %}
pandoc arquivo.md -o arquivo.html
{% endhighlight  %}

Caso você possua um blog que não reconhece Markdown, não se preocupe, por exemplo, no [Blogger](https://www.blogger.com), se você copiar o conteúdo em Markdown e colar no local de escrever da sua postagem, automaticamente o Blogger irá converter em HTML, bem simples!


Caso tenha ficado alguma dúvida, veja o vídeo abaixo para maiores elucidações;
# [Clique Aqui Para Assistir ao Vídeo](https://youtu.be/vAyz2Hnepuk)

# Não deixe conhecer nosso Treinamentos que farão você se capacitar ainda mais em Linux e sistemas baseados em Unix
# <http://terminalroot.com.br/cursos>

# Customize sua promoção para aquisição de mais de um curso:
# <http://terminalroot.com.br/promo>

Conheça nosso Cursos Tutoriais Gratuitos sobre Git e LPI Linux
### <http://terminalroot.com.br/linux>
### <http://terminalroot.com.br/git>

# Comente e compartilhe!
