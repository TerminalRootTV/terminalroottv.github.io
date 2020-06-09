---
layout: post
title: "10 plataformas para blogs de código aberto para desenvolvedores"
date: 2020-06-09 19:38:53
image: '/assets/img/blogs/blog-programming.jpg'
description: 'Para desenvolvedores Node.js, Python, PHP, Go e Ruby.'
icon: 'carbon:blog'
iconname: 'blogs para programadores'
tags:
- jekyll
- nodejs
- github
- programacao
- desenvolvimento
- php
- python
---

![10 plataformas para blogs de código aberto para desenvolvedores](/assets/img/blogs/blog-programming.jpg)

As principais plataformas de blogs como [WordPress](https://br.wordpress.org/), [Blogger](https://www.blogger.com/), [Tumblr](https://terminalroot.tumblr.com/) etc. Não foram projetadas para [hackers](https://pt.wikipedia.org/wiki/Hacker). Eles são sobrecarregados por recursos que os desenvolvedores simplesmente não precisam ou desejam.

E, prontamente, as populares plataformas de blogs certamente carecem de muitas coisas que programadores desejam, como realce de sintaxe de código, recursos de temas de blog usando um mecanismo de modelagem padronizado, suporte a linguagem de marcação além de [HTML](https://terminalroot.com.br/html/) e integração com repositórios de código-fonte, entre outros.

Se você está procurando uma solução de blog que seja amigável para programadores, veio ao lugar certo. As plataformas de blog gratuito e de código aberto de que falarei são projetadas para as necessidades dos desenvolvedores.

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

# [Hexo](https://hexo.io/)
![Hexo](/assets/img/blogs/hexo.png)

O Hexo é uma plataforma de blogs criada pelo [Node.js](https://terminalroot.com.br/2019/11/como-instalar-nodejs-no-linux-e-primeiros-passos.html). (é o que diz ali no slogan do site). Seus recursos compatíveis com hackers incluem suporte nativo ao GitHub Flavored Markdown (GMF), além de recursos de modelagem e extensibilidade usando EJS, Swig e Stylus.

A instalação do Hexo levará apenas alguns segundos, supondo que você já tenha o npm configurado e pronto para usar:
{% highlight bash %}
npm install hexo -g
{% endhighlight %}

Fato tangencial interessante: "npm" não significa Node packaged modules ou Node Package Manager. É um acrônimo recursivo como [PHP](https://terminalroot.com.br/tags#php). Ou, mais precisamente: "é uma abreviação bacronymic recursiva, pois significa ‘npm is not an acronym’.

+ Licença: [MIT](https://github.com/tommy351/hexo/blob/master/LICENSE)
+ [Manual](http://hexo.io/docs/)
+ [GitHub](https://github.com/tommy351/hexo)

---

# [Jekyll](http://jekyllrb.com/)
![Jekyll](/assets/img/blogs/jekyll.png)

O Jekyll é um gerador de site estático que compila seus arquivos de marcação em documentos HTML prontos para a Web - é o que todos os geradores de site estático fazem, mais ou menos - a proposta de valor é o melhor desempenho da Web e a opção de abandonar seus bancos de dados e scripts do servidor.

Dos citados aqui, [Jekyll](https://terminalroot.com.br/tags#jekyll) é o mais utilizado no mundo, foi desenvolvido pelo [GitHub](https://terminalroot.com.br/tags#github), mas está disponível para diversas plataformas. Possuímos diversos conteúdos sobre Jekyll aqui no blog e no canal. Para instalá-lo veja esse vídeo:

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

<iframe width="1234" height="694" src="https://www.youtube.com/embed/RdFoGToeqFM" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> 

+ Licença: [MIT](https://github.com/jekyll/jekyll/blob/master/LICENSE)
+ [Manual](http://jekyllrb.com/docs/home/)
+ [GitHub](https://github.com/jekyll/jekyll)

Para um tutorial do zero sobre Jekyll, sugiro você assistir esse vídeo também:

<iframe width="1234" height="694" src="https://www.youtube.com/embed/7lI5BfHK-kA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> 

---

# [Anchor CMS](http://anchorcms.com/) 
![Anchor CMS](/assets/img/blogs/anchorcms.png)

Anchor CMS é extremamente leve. O arquivo `.zip` do código-fonte do projeto tem pouco mais de **200KB** 😱️ .

o Anchor suporta a sintaxe [Markdown](https://terminalroot.com.br/2018/09/como-renderizar-markdown-no-linux.html), que muitos programadores consideram mais fácil e natural para escrever e formatar blogs. Ele também suporta blogs direcionados a arte, ou seja, é possível fazer com que cada post pareça diferente.

+ Licença: Desconhecida
+ [Manual](http://anchorcms.com/docs)
+ [GitHub](https://github.com/anchorcms/anchor-cms)

---

# [Wheat](https://github.com/creationix/wheat)
Wheat extrai artigos do seu repositório do GitHub e os publica no seu site. Imagine as possibilidades! Como os blogs de código aberto, onde outros hackers podem enviar [pull request](https://terminalroot.com.br/2017/12/como-criar-um-pull-request-no-github.html) para corrigir e melhorar as postagens do seu blog.

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

Wheat é desenvolvido com o Node.js e pode ser instalado como um módulo empacotado do Node:
{% highlight bash %}
npm install wheat
{% endhighlight %}

+ Licença: [MIT](https://github.com/creationix/wheat/blob/master/LICENSE)
+ [Manual](https://github.com/creationix/wheat/blob/master/README.markdown)
+ [GitHub](https://github.com/creationix/wheat/)

---

# [Nikola](http://getnikola.com/)
![Nikola](/assets/img/blogs/nikola.png)

O Nikola, um gerador estático de sites, é fortemente orientado para blogs, mas também pode ser usado para qualquer outro tipo de site. Os organizadores de código vão adorar o fato de ter uma pequena base de código, que o criador do Nikola considera uma vantagem porque significa que "os programadores podem entender todo o núcleo do Nikola em um dia".

A Nikola suporta várias linguagens de marcação: reStructuredText, Markdown, etc. E, é claro, o HTML também funcionará bem se é assim que você rola.

+ Licença: [MIT]()
+ [Manual]()
+ [GitHub]()

---

# [toto](https://github.com/cloudhead/toto)
Roubado diretamente de sua descrição do repositório: toto é "o mecanismo de blog de 10 segundos para hackers".

O toto é um mecanismo de blog minimalista que roda no Git, o que significa que você pode controlar a versão de suas postagens da mesma maneira que faria ao escrever um código.

+ Licença: [MIT](https://github.com/cloudhead/toto/blob/master/LICENSE)
+ [Manual](https://github.com/cloudhead/toto#introduction)
+ [GitHub](https://github.com/cloudhead/toto)

---

# [Poet](http://jsantell.github.io/poet/)
![Poet](/assets/img/blogs/poet.jpg)

O Poet é outra plataforma de blog Node.js. O que o torna único é o mascote de personagem arrogante do projeto 😀️ . 

O que é notável no Poeta é que ele permite escrever suas postagens no blog usando uma linguagem de marcação na qual você se sinta confortável, seja Markdown, Jade ou o que quiser. Além disso, a personalização de rotas para suas postagens no blog e outras páginas é muito simples.

+ Licença: [MIT](https://github.com/jsantell/poet/blob/master/LICENSE)
+ [Manual](http://jsantell.github.io/poet/)
+ [GitHub](https://github.com/jsantell/poet)

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

---

# [Dropplets](https://github.com/Circa75/dropplets)
Dropplets é uma plataforma de blog minimalista do Markdown. Seu conjunto de recursos limitado propositadamente ajuda a garantir que você gaste mais tempo escrevendo e menos tempo mexendo.

+ Licença: [MIT](https://github.com/Circa75/dropplets#license)
+ [Manual](https://github.com/Circa75/dropplets#installation)
+ [GitHub](https://github.com/Circa75/dropplets)

---

# [Pelican](http://blog.getpelican.com/)
![Peli](/assets/img/blogs/pelican.png)

O Pelican é outro gerador de site estático, só que escrito em Python. Ele suporta a marcação [reStructuredText](https://docutils.sourceforge.io/rst.html), [Markdown](https://daringfireball.net/projects/markdown/syntax) ou [AsciiDoc](https://asciidoc.org/). Possui syntax highlighting erecurso de importação de dados provenientes de outras plataformas de publicação, como o WordPress. os temas podem ser feitos usando o [Jinja2](http://jinja.pocoo.org/).

+ Licença: [GNU AGPL](https://github.com/getpelican/pelican/blob/master/LICENSE)
+ [Manual](http://docs.getpelican.com/en/3.3.0/)
+ [GitHub](https://github.com/getpelican/pelican/)

---

# [Hugo](https://gohugo.io/)
![Hugo](/assets/img/blogs/hugo.png)

Hugo é um dos geradores de sites estáticos de código aberto mais populares. Com sua incrível velocidade e flexibilidade, Hugo torna a construção de sites divertida e fácil.

+ Licença: [Apache](https://github.com/gohugoio/hugo/blob/master/LICENSE)
+ [Manual](https://gohugo.io/documentation/)
+ [GitHub](https://github.com/gohugoio/hugo)

---

# [Bolt](http://bolt.cm/)
![Bolt](/assets/img/blogs/bolt.png)

O Bolt é um sistema completo de gerenciamento de conteúdo, para que você possa usá-lo para outros fins fora dos blogs. Ele usa o [Twig](http://twig.sensiolabs.org/) para modelagem e vem com sua própria barra de depuração do [Symphony](https://symfony.com/) para rastrear problemas de código. 

E, sem absolutamente nenhuma mágica necessária, você pode escolher qual sistema de gerenciamento de banco de dados relacional usar: [SQLite](https://terminalroot.com.br/2011/12/exemplo-de-utilizacao-de-sqlite-com-php.html), [MySQL](https://terminalroot.com.br/2019/10/inner-join-left-join-right-join-mysql.html) ou [PostgreSQL](https://www.postgresql.org/). Precisa de mais razões? Que tal isso: o Bolt foi desenvolvido para que você execute testes de unidade no seu CMS; suporta [PHPUnit](http://phpunit.de/) nativamente.

+ Licença: [MIT](http://opensource.org/licenses/mit-license.php)
+ [Manual](http://opensource.org/licenses/mit-license.php)
+ [GitHub](https://github.com/bolt/bolt)

---

Se você quiser saber como hospedar e qual a melhor plataforma para isso, sugiro você também assistir a esse vídeo:

<iframe width="1234" height="694" src="https://www.youtube.com/embed/ahkpilbOtpE" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

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

Via: [WebFX](https://www.webfx.com/blog/web-design/open-source-blogging-platforms-for-developers/) com modificações.
