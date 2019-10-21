---
layout: page
title: "Contribua com seus artigos."
permalink: "/contribua/"
description: 'Terminal Root é Open Source.'
---

Pessoal, se vocês quiserem divulgar seus trabalhos no site Terminal Root, fiquem à vontade! Muita gente não sabe , mas o Terminal Root é Open Source 

Se você  clonar o blog , na raiz do blog tem um script: ./initpost . Pra fazer  uma postagem é só usar assim:

Logue no seu github , depois vá até o repositório: https://github.com/TerminalRootTV/terminalroottv.github.io e clique em fork , depois clone o seu repositório que vc criou o fork

$ git clone https://github.com/SEU_REPOSITORIO/terminalroottv.github.io
$ cd terminalroottv.github.io/
$ ./initpost -c "Titulo da  minha postagem" 

Automáticamente será criado um arquivo .md (Markdown)  dentro do diretório _posts/ e você pode editá-lo em Markdown como sua  postagem 

$ vim _posts/2019-09-14-titulo-da-minha-postagem.md

e depois mandar um pull request (https://terminalroot.com.br/2017/12/como-criar-um-pull-request-no-github.html) . 

Veja esse exemplo:

Blob: https://github.com/.../2019-09-12-the-fuck-o-comando-que...

Raw: https://raw.githubusercontent.com/.../2019-09-12-the-fuck...

Daí eu vejo o pull, talvez faça uns ajustes e publico.

Pra exibir códigos use a tag: {% highlight linguagem %} e feche com {% endhighlight %}

Exemplo se for BASH: 

{% highlight bash %}
#!/bin/bash
echo "Meu código"
{% endhighlight %}

Preencha o .md com 3 tags no máximo de acordo como tem esse exemplo que eu enviei , use ele como esboço.

As imagens ficarão por minha conta, mas se você quiser enviar a sua o caminho delas deve ficar em /assets/img/seu_diretorio/nome_da_imagem.jpg
Links sobre Markdown:

https://terminalroot.com.br/2016/12/markdown.html

https://terminalroot.com.br/2018/09/como-renderizar-markdown-no-linux.html

Antes de criar faça sempre um git pull 
Curso Gratuito de Git para Iniciantes:
https://terminalroot.com.br/git/

Obs.: No cabeçalho do .md troque a linha:
main-class: ''

por

author: 'Seu Nome'
image_author: '/assets/img/about/sua_imagem.jpg'
url_author: 'https://seudominio.com'

Na url_author só serão aceitas url com protocolo HTTPS , o GitHub rejeita sem ser no modo seguro pelo fato do blog ser HTTPS

Todas as postagens são automaticamente compartilhadas na página do Facebook e Twitter do Terminal Root .

Todas as postagens serão publicadas mediante à aprovação.

Não use o recurso para propagandas que será rejeitado. Use para tutoriais .


Abraços!
