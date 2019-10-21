---
layout: page
title: "Contribua com seus artigos."
permalink: "/contribua/"
description: 'Terminal Root é Open Source.'
image: '/assets/img/opensource/opensource.png'
---

![Contribua com seus artigos. Terminal Root é Open Source.](/assets/img/opensource/opensource.png "Contribua com seus artigos. Terminal Root é Open Source.")

> Pessoal, se vocês quiserem divulgar seus trabalhos no site [Terminal Root](https://terminalroot.com.br/), fiquem à vontade! Muita gente não sabe , mas o [Terminal Root](https://terminalroot.com.br/blog) é [Open Source](https://opensource.org/) . 

Se você  [clonar](https://terminalroot.com.br/2019/09/como-clonar-somente-um-subdiretorio-com-git-ou-svn.html) o blog , na raiz do blog tem um script: `./initpost` . Pra fazer uma postagem é só usar assim:

Logue no seu [GitHub](https://github.com/login) , depois vá até o **repositório**: <https://github.com/TerminalRootTV/terminalroottv.github.io> e clique em **fork** , depois **clone** o seu **repositório** que vc criou o **fork** .

{% highlight bash %}
git clone https://github.com/SEU_REPOSITORIO/terminalroottv.github.io
cd terminalroottv.github.io/
./initpost -c "Titulo da  minha postagem"
{% endhighlight %}

Automáticamente será criado um arquivo **.md**( [Markdown](https://terminalroot.com.br/2016/12/markdown.html) )  dentro do diretório **_posts/** e você pode editá-lo em [Markdown](https://terminalroot.com.br/2016/12/markdown.html) como sua  postagem.

{% highlight bash %}
vim _posts/2019-09-14-titulo-da-minha-postagem.md
{% endhighlight %}

E depois mandar um [pull request](https://terminalroot.com.br/2017/12/como-criar-um-pull-request-no-github.html) → <https://terminalroot.com.br/2017/12/como-criar-um-pull-request-no-github.html>.

<iframe width="920" height="400" src="https://www.youtube.com/embed/dSUT0Y7suPI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Veja esse exemplo:
+ Blob: <https://git.io/JeRGk>
+ Raw: <https://git.io/JeRGI>

Daí eu vejo o **pull**, talvez faça uns ajustes e publico.

Pra exibir códigos use a tag: **{****% highlight linguagem %****}** 
E feche com **{****% endhighlight %****}**

Exemplo se for BASH: 
![Modelo Highlight para Bash](/assets/img/opensource/highlight.png "Modelo Highlight para Bash")

Preencha o **.md** com **3 tags no mínimo** de acordo como tem esse exemplo que eu enviei , use ele como esboço.

As imagens ficarão por minha conta, mas se você quiser enviar a sua o caminho delas deve ficar em **/assets/img/seu_diretorio/nome_da_imagem.jpg**

## Links sobre Markdown:
+ <https://terminalroot.com.br/2016/12/markdown.html>
+ <https://terminalroot.com.br/2018/09/como-renderizar-markdown-no-linux.html>

Antes de criar faça sempre um git pull [Curso Gratuito de Git para Iniciantes](https://terminalroot.com.br/git/>

> Obs.: No cabeçalho do .md troque a linha: **main-class: ''** . 
> 
> **Seu site/blog/endereço/url** será divulgado no **rodapé** com seu **card** 🙌️ .

por

{% highlight txt %}
author: 'Seu Nome'
image_author: '/assets/img/about/sua_imagem.jpg'
url_author: 'https://seudominio.com'
{% endhighlight %}

- Na **url_author** só serão aceitas **urls** com protocolo [HTTPS]() , o [GitHub](https://github.com/) rejeita sem ser no modo seguro pelo fato do blog ser [HTTPS]() .
- Todas as postagens são automaticamente compartilhadas na página do [Facebook](https://www.facebook.com/TerminalRootTV) e [Twitter](https://twitter.com/TerminalRootTV) do [Terminal Root](https://terminalroot.com.br/) .
- Todas as postagens serão publicadas mediante à aprovação 👍️ .

> Não use o recurso para ~~propagandas~~ que será rejeitado. Use para tutoriais e dicas 📖️ .

## Abraços!
