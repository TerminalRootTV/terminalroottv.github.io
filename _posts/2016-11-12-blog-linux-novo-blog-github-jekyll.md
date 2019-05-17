---
layout: post
title: "Novo Blog Terminal Root com GitHub e Jekyll"
date: '2016-11-12 20:41:38'
image: '/assets/img/novo-blog/blog-linux-github-jekyll.jpg'
description: "Nossa nova aventura em busca de tecnologia mais moderna e funcional."
main-class: "html"
color: '#fbbc05'
author: Terminal Root
tags:
- github
- jekyll
- markdown
categories:
twitter_text: "Novo Blog Terminal Root com GitHub e Jekyll"
introduction:	"Nossa nova aventura em busca de tecnologia mais moderna e funcional."
---

![Novo Blog Terminal Root com GitHub e Jekyll](/assets/img/novo-blog/blog-linux-github-jekyll.jpg)

# Salve salve, rapaziada!!!

Nesse lance de *bloggin* , comecei no [Blogger](https://www.blogger.com), logo depois comprei um curso de [Wordpress](https://wordpress.org/) e achei magnífico, mas o meu descontentamento com as falhas de segurança do Wordpress me fez retornar ao Blogger, mas não aguentava mais a lentidão e a bagunça do Blogger, então mudei pro [Jekyll](http://jekyllrb.com/) e o hospedagem no [GitHub](https://github.com/), que é o que há no momento de novidade. Aprendi desenvolvimento, escrevendo Aplicativos Locais de Contabilidade, minha área é Contábeis, e o conhecimento de Mobile e Web também são fundamentais também.

O [Git](https://en.wikipedia.org/wiki/Git) é um sistema de controle de versão ; o [GitHub](https://en.wikipedia.org/wiki/GitHub) é um Serviço de Web Hosting Compartilhado para projetos que usam o controle de versionamento Git, escrito em Ruby on Rails . O cara que criou o GIT, foi justamente o mesmo cara que criou o Linux : Linus Torvalds , inclusive o Kernel Linux está hospedado no GitHub , não só ele como inúmeros projetos de sucesso: GNOME, Android, MATE , ... Jekyll é um fantástico gerador de código estático desenvolvido em Ruby. Nele você pode criar blog, usando HTML misturado com alguns truques que ajudam a converter seu site em arquivos estáticos pronto pra ser publicado .

Uma das *revoluções* da internet é o [MarkDown](daringfireball.net/projects/markdown/), John Gruber e Aaron Swartz para simplificar a estruturação de um texto, o Markdown é um sistema de formatação aberto que torna a escrita e a leitura mais simples, e foi escrito em Python ! O HTML já é coisa do passado, com o MarkDown você ganha mais praticidade e velocidade... 

Esse post foi escrito 100% em MarkDown , os antigos posts até ficarão com problemas de formatação, pois a escrita foi totalmente direcionada pra MarkDown, eu já escrevi inúmeros Scripts em Shell para tentar resolver o problema, mas ainda não consegui uma solução, pois esse LayOut foi um FORK de um outro Projeto do [Willian Justen](https://willianjusten.com.br) e ainda estou aprendendo os macetes do tema.

# Como criar seu próprio Blog no GitHub com Jekyll

Acho que essa parte do texto é a que mais interessa a vocês :) , então, vamos lá!!!

+ Primeiramente crie uma conta no GitHub, [clique aqui pra criar](https://github.com/join?source=header-home)
+ Depois de criada a conta e logado nela, clique em __New Repository__ e nomei-o com o mesmo nome do seu usuário do GitHub, __só aceita__ o mesmo nome para o [GitHub Pages](https://github.io/) com o github.io, exemplo:

{% highlight bash %}
seu-nome-de-usuario.github.io
{% endhighlight %}

Coloque justamente esse nome do seu repositório.

+ Escolha um tema , tem vários legais, você pode usar o [Jekyll Themes](http://jekyllthemes.org/) pra escolher , tenha paciência o tema é um passo importantíssimo, se você for até o projeto, ao clicar em fork , você faz uma cópia do projeto pro seu GitHub, depois clicando em Settings você pode renomeá-lo para *seu-nome.github.io* , caso você ainda não tenha criado o seu repósitório, pronto , aí você já possuirá um Blog funcionando no GitHub!

# Instalando Ferramentas Necessárias na sua Máquina

Lógicamente, você precisará, antes de tudo de ferramentas poderosíssimas para tal feito 

>Lembrando que eu uso Debian Jessie e nos repositórios possuem tais ferramentas, caso sua não distro não possua nos repositórios , você precisará compilá-los . E o Jekyll funciona em Linux e MAC OS X, até uma gambiarra que dá pra funcionar no Windows, mas vai saber, né?!

Instale o GIT, o Jekyll o Ruby e suas dependências, se não possuí-lo:

{% highlight bash %}
apt-get install git jekyll ruby ruby2.1-dev curl nodejs build-essential
{% endhighlight %}

Depois com o GEM instale o Jekyll Cliente, como o __root__ ou **sudo**.

{% highlight bash %}
gem install jekyll --user-install
{% endhighlight %}

## Clone seu repositório

{% highlight bash %}
git clone endereço-do-repositório
{% endhighlight %}


## Modifique o tema e mude as configurações pra suas

O diretório do clone terá essa estrutura padrão, mais ou menos:

{% highlight js %}
  seu-nome-de-usuario.github.io
 ├──  _config.yml
 ├──  index.html
 ├── _includes
 │   ├──  footer.html
 │   └──  header.html
 ├──  _layouts
 │   ├──  default.html
 │   └──  post.html
 ├──  _posts
 │   ├──  2011-10-25-primeiro-post.md
 │   └──  2011-04-26-hello-world.md
 └── _site
{% endhighlight %}

Granulando cada um dos itens:

#### _config.yml

Configurações gerais do site, como título e descrição.    

#### index.html

A página incial

#### _includes

Nele fica tudo que você deseja incluir: header, footer,...

#### _layouts

Tipo o _includes , só que diferente , mas a mesma coisa =)
	
#### _posts

Aqui vão todas as suas postagens.
Você pode escrever em markdown, que é infinitamente simples e recomendável, e usar HTML quando e se precisar.
Os nomes dos arquivos precisam ser escritos em um formato específico:

{% highlight html %}
YYYY-MM-DD-titulo.md
{% endhighlight %}

Por exemplo, 2011-10-25-meu-primeiro-post.md, informa ao Jekyll a data 25 de Outubro de 2011 e o título “Meu Primeiro Post”.

#### _site

É nesta pasta que o Jekyll gera todos os arquivos que efetivamente serão servidos. Você pode ignorá-la sem remorso.
Tudo aqui é constantemente reescrito, de forma que qualquer alteração que você fizer nesta pasta será perdida para todo o sempre.

Depois de efetuar as mudanças necesárias , entre no seu diretório e rode o comando jekyll serve , você também pode usar a opção 
*--watch* , que a página atenderar as mudanças em tempo real, somente com __F5__, lógico, menos quando você alterar o *_config.yml*

{% highlight bash %}
cd seu-nome-de-usuario.github.io
jekyll serve --watch
{% endhighlight %}
	
depois acesse **http://0.0.0.0:4000** pra ver o seu blog antes de mandá-lo pro GitHub
	
Recomendo, antes de qualquer jekyll serve também você rodar o *jekyll build* , pra evitar demora nas atualizações de mudanças efetuadas.
	
Tudo que fica descrito em .gitignore , será ignorado e não sofrerá push , ou seja, não será uploadado pro GitHub , se você perceber 
a pasta _sites mesmo está descrita dentro o .gitignore , logo ela só serve pra visualização local na porta __4000__ :)
	
# Publicando suas alterações

Ainda dentro do seu diretório, rode esses comandos:

{% highlight bash %}
git add -A
git commit -m "Seu comentário"
git push
{% endhighlight %}

Coloque seu login e senha, assim que solicitado e visualize depois as mudanças online no seu endereço:

### seu-nome.github.io

Você ainda pode criar no diretório raiz do seu projeto, arquivos que complementarão seu blog: *404.md, sitemap.xml, feed.xml ,...*
Pequise sobre as configurações ou dê um fork de algum projeto já pronto!

Você também pode importar seus posts do Blogger ou do Wordpress

No meu caso, importei do Blogger, apoś exportar as postagens lá no blogger, usei o seguinte comando via Jekyll , da linguagem Ruby:

>Lembrando que o arquivo /path/to/blog-MM-DD-YYYY.xml é o caminho e o arquivo importado.

{% highlight bash %}
$ ruby -rubygems -e 'require "jekyll-import";
JekyllImport::Importers::Blogger.run({
  "source"                => "/path/to/blog-MM-DD-YYYY.xml",
  "no-blogger-info"       => false, # not to leave blogger-URL info (id and old URL) in the front matter
  "replace-internal-link" => false, # replace internal links using the post_url liquid tag.
})'
{% endhighlight %}

[Nesse link](http://import.jekyllrb.com/docs/installation/) possui todos os comandos para importação de qualquer CMS: __Wodpress, Drupal, Joomla,__ ... veja ao lado da página.

# Integrando comentários do Disqus com Jekyll

O [Disqus](https://disqus.com/websites/) é uma plataforma de comentários bem útil e fácil de implementar. Eu até testei o Muut, mas ele não é tão completo e bonitão.

Para integrar o Disqus com Jekyll, siga as instruções do [Perfectly Random](http://www.perfectlyrandom.org/2014/06/29/adding-disqus-to-your-jekyll-powered-github-pages/).

# Você pode usar seu domínio próprio também

[Clique aqui pra ver como fazer](https://willianjusten.com.br/dominio-proprio-no-github-pages/). E de onde [veio a primeira inspiração do Gregs, na época GGIO](http://gregs.blog.br/blog/como-fiz-meu-site-com-jekyll-e-github-pages/) dessa mudança, não se esqueça de ler bastante, pena que sobre	esse conteúdo, a maioria é em inglês, e usar muita tipografia e um pouco de Neurolinguística =) , e siga firme!

# Então é isso galera

Espero que tenham gostado do Novo Blog do [Terminal Root](http://www.terminalroot.com.br/) que não será só novo de CMS, Hospedagem, LayOut, ... mas também
nas postagens, aquela linguagem técnica será mais utilizada no Canal [TerminalRootTV](https://www.youtube.com/TerminalRootTV) , as postagens serão mais relatos , experiências e
curiosidades vividas por mim e os colaboradores dessa comunidade, espero que sintam-se à vontade, e não esqueça de comentar esse feito.
Ah antes que eu me esqueça, na importação do Blogger , as postagens vem com .html no final, dae bastou editar o PermaLink no _config.yml , seguindo essas dicas o [Jekyll](https://jekyllrb.com/docs/permalinks/) !!!

Dae nem precisei usar minha gambiarra no 404.md

{% highlight js %}

<script>
var str = window.location.href;

if(str.match(/.html/)){

	var str = str.replace(".html", "/");
	location.href=str;
}else{
	document.write('Pagina Nao Encontrada');
}
</script>

{% endhighlight %}


# Abraços!
