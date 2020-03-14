---
layout: post
title: "Tratamento de imagens com ImageMagick"
date: '2015-03-17T18:18:00.000-07:00'
image: '/assets/img/dicas/imagemagick.jpg'
description: "ImageMagick é uma  poderosa ferramenta em modo texto para tratar imagens em suas diversas  formas: converter, redimensionar, criar, editar, cortar, juntar, editar  cores e mais um bilhão de funcionalidades."
color: '#009688'
tags:
- imagens
- terminal
- comandos
---

![ImageMagick](/assets/img/dicas/imagemagick.jpg)

> O [ImageMagick](http://www.imagemagick.org/) é uma  poderosa ferramenta em modo texto para tratar imagens em suas diversas  formas: converter, redimensionar, criar, editar, cortar, juntar, editar  cores e mais um bilhão de funcionalidades. De vez em quando eu me deparo  com algumas necessidades bem específicas, como por exemplo:  redimensionar todas as fotos que eu tirei dos bêbados da noite passada,  pra eu por em algum lugar sem ter que precisar dar upload de 3MB por  foto.
 Este tutorial se torna então uma referência para algumas das tarefas  que podemos fazer com imagens usando o ImageMagick. E além disso, vou  sempre tentar expandir o conteúdo quando for surgindo mais tarefas,  assim como eu faço na página de Comandos Linux.
 
## Obtendo a ferramenta

Para instalar no [Debian](http://terminalroot.com.br/tags#debian), [Ubuntu]((http://terminalroot.com.br/tags#ubuntu)) e similares, use o __APT__ com o comando *apt-get* com o __root__ ou o __sudo__
{% highlight bash %}
apt-get install imagemagick
{% endhighlight %}

Ou faça o download no endereço para outras distros, caso não haja nos repositórios da mesma pelo gerenciador de pacotes correspondentes.

[ImageMagick](http://www.imagemagick.org/)

 
Você pode pegar uma versão em código-fonte e compilar manualmente, o  que é um pouco mais demorado de se instalar. Se você usa Windows, baixe  diretamente a versão instalável (binária) para Windows. Mesma coisa para  o caso do MacOS X.

Se você usa [Linux](http://terminalroot.com.br/tags#linux), então o ImageMagick provavelmente já está incluso  em sua distribuição. Neste caso, o nome do pacote é geralmente imagemagick (Debian-like) e ImageMagick (RH-Like). Geralmente os comandos da ferramenta vão parar no */usr/bin*.

Os seguintes comandos do ImageMagick estão disponíveis:

* animate – Anima imagens e mostra na tela
* compare – Compara matematicamente e visualmente duas imagens
* composite – Adiciona uma imagem em cima da outra
* conjure – Interpretador de scripts em linguagem Magick (MSL)
* convert – Converte e altera imagens em diversos formatos e formas
* display – Mostra imagens ou sequências de imagens na tela
* identify – Mostra informações e características de uma imagem
* import – Salva o conteúdo da tela em um arquivo (famoso print-screen)
* mogrify – Mesma coisa que o convert, só que sobrescreve os arquivos que está trabalhando
* montage – Junta várias imagens em uma só
* stream – Extrai porções e/ou pixels das imagens e salva em outro local(Quando no Windows, estes mesmos nomes estão disponíveis, mas com a extensão .exe)

#### Convertendo e Editando imagens
Apesar dos vários comandos disponíveis, o que mais usaremos aqui é o convert.

#### Convertendo imagens de um formato para outro

De JPEG para PNG:
{% highlight bash %}
$ convert imagem.jpg imagem.jpg
{% endhighlight %}

{% highlight bash %}
$ identify imagem.jpg imagem.jpg
{% endhighlight %}

> imagem.jpg JPEG 256x256 256x256+0+0 DirectClass 8-bit 6.33594kb

> imagem.jpg[1] PNG 256x256 256x256+0+0 DirectClass 8-bit 23.2344kb

(O comando identify foi só para mostrar os tipos de imagem.) Note também que ele não sobrescreve o arquivo anterior, e sim cria um  novo. Qualquer operação que iria sobrescrever o arquivo original tem  que ser executada com o comando mogrify ao invés do convert. A não ser que você tenha uma razão bem específica, eu não recomendo fazer isto 

De PNG para GIF:
{% highlight bash %}
$ convert imagem.jpg imagem.gif
{% endhighlight %}

(Esteja ciente de que às vezes o <kbd>GIF</kbd> fica com pior qualidade que o <kbd>PNG</kbd>) Ou seja, basta especificar sua extensão que o convert faz a conversão para o formato adequado.
 
#### Redimensionando imagens
 
Reduzindo uma imagem para a metade do seu tamanho:
{% highlight bash %}
$ convert -resize 50% imagem.jpg metade_da_imagem.jpg
{% endhighlight %}

Redimensiona a imagem.jpg pela metade e salva no arquivo metade_da_imagem.jpg. O 50%, obviamente, pode ser substituído por outra porcentagem para diminuir/aumentar a imagem no aspecto relativo correto.

Reduzindo para um tamanho específico:

{% highlight bash %}
$ convert -resize '800x600' foto.jpg destino.jpg
{% endhighlight %}

Redimensiona a foto.jpg para 800×600 (aumenta ou diminui) e salva em destino.jpg.

Redimensionando todas as imagens de um diretório:O convert aceita os coringas (wildcards) da shell, ou seja, o asterisco (*) pode representar tudo:
 
{% highlight bash %}
$ convert -resize 50% *.jpg
{% endhighlight %}

Ele vai converter todos os arquivos que terminam com .jpg do diretório atual e o resultado ele salva em outros arquivos com  terminação *-0, -1, -2, etc*. Pode ficar um pouco confuso essa nomeclatura  no final das contas.

Então neste caso, é melhor a gente usar o comando mogrify com a opção -path, assim:
 
{% highlight bash %}
$ mkdir -p resultado
{% endhighlight %}

{% highlight bash %}
$ mogrify -path resultado -resize 50% *.jpg
{% endhighlight %}

Todos os arquivos que terminam com .jpg do diretório atual serão redimensionados para 50% de seu tamanho e armazenados com o mesmo nome no diretório resultado. Uso isto bastante para reduzir as imagens que baixo de cameras digitais de alta qualidade. Não se esqueça do *-path*! Se você se esquecer, as imagens originais serão perdidas!

Outro jeito de fazer o mesmo, agora utilizando o convert e shell-script:
 
{% highlight bash %}
$ mkdir -p resultado
{% endhighlight %}

{% highlight bash %}
$ for IMAGEM in *.jpg ; do convert -resize 50% $IMAGEM resultado/$IMAGEM ; done
{% endhighlight %}

Mexendo na qualidadeEm alguns formatos como o .jpg, é possível mexer na qualidade da imagem, que impacta também no tamanho da mesma. Exemplo:
 
{% highlight bash %}
$ convert -quality 80% imagem.jpg
{% endhighlight %}

Converte a qualidade da imagem.jpg para 80%.

# Rotacionando imagens

É possível rotacionar as imagens automaticamente, com o angulo  desejado. Por exemplo, vamos rotacionar nos angulos 90, 180 e 270 graus,  que correspondem a *"deitar a imagem"* e a virá-la de cabeça pra baixo:
 
{% highlight bash %}
$ convert -rotate 90 foto.jpg foto90g.jpg
{% endhighlight %}

{% highlight bash %}
$ convert -rotate 180 foto.jpg foto180g.jpg
{% endhighlight %}

{% highlight bash %}
$ convert -rotate 270 foto.jpg foto270g.jpg
{% endhighlight %}

#### Criando thumbnails

Quando queremos criar uma galeria de imagens em uma página, é legal criar thumbnails (miniaturas) destas imagens, para o usuário pré-visualizar, clicar e  ver o tamanho real. É uma boa visão geral de todas as imagens e ainda  economiza espaço e banda na hora de visualizar.

A melhor forma de se criar thumbnails, é utilizar a opção -thumbnail ao invés do __-resize__. Eles fazem praticamente a mesma coisa, mas a opção  __-thumbnail__ também remove informações dentro da imagem que não são úteis  em thumbnails.
 
{% highlight bash %}
$ mkdir -p thumbnails
{% endhighlight %}

{% highlight bash %}
$ mogrify -path thumbnails -thumbnail '100x150' *.jpg
{% endhighlight %}

Todas as imagens com extensão .jpg serão  redimensionadas para 100×150 pixels e jogadas em um diretório chamado  thumbnails, com o mesmo nome. Mais uma vez, não se esqueça da opção -path ou você pode perder todas as imagens originais.

Agora gerando thumbnails com apenas a largura fixa, isso significa que a altura pode variar de acordo com a foto.
 
{% highlight bash %}
$ mkdir -p thumbnails
{% endhighlight %}

{% highlight bash %}
$ mogrify -path thumbnails -thumbnail '100x150>' *.jpg
{% endhighlight %}

Se você está fazendo isso com fotos que vem de cameras digitais,  dentro da imagem geralmente tem uma informação se a imagem deve ser  rotacionada caso você tenha tirado a foto com a câmera em pé. Neste caso, a opção -auto-orient se torna bastante útil pois rotaciona pra você:
 
{% highlight bash %}
$ mkdir -p thumbnails
{% endhighlight %}

{% highlight bash %}
$ mogrify -path thumbnails -thumbnail '100x150>' -auto-orient *.jpg
{% endhighlight %}

![ImageMagick](/assets/img/dicas/imagemagick2.jpg)

Um  último exemplo de geração de thumbnail, que peguei na documentação do  ImageMagick, é criar uma “borda” no estilo foto polaroid:
 
{% highlight bash %}
$ convert -thumbnail '100x150>' -bordercolor snow -background black \
+polaroid foto.jpg foto_thumbnailpolarid.jpg
{% endhighlight %}

Também tem outras ténicas bem interessantes:
 
{% highlight bash %}
$ convert -thumbnail '100x150>' -matte -background none \
-vignette 0x4 foto.jpg foto_thumbnail2.jpg
{% endhighlight %}

{% highlight bash %}
$ convert -thumbnail '100x150>' -matte -virtual-pixel transparent \
-channel A -blur 0x8 -level 0,50% +channel foto.jpg thumbnail_softedge.jpg
{% endhighlight %}

![ImageMagick](/assets/img/dicas/imagemagick3.jpg)
 
Estes efeitos também podem ser aplicados não apenas para os thumbnails, mas para as imagens originais também. Basta remover o _-thumbnail_.

Diversos exemplos a mais de como criar thumbnails, você encontra na página oficial:

[http://www.imagemagick.org/Usage/thumbnails/](http://www.imagemagick.org/Usage/thumbnails/)

#### Extendendo o uso do ImageMagick em outras aplicações

Além de todos estes comandos e ações que o ImageMagick proporciona,  ele também pode ser aplicado diretamente em outros programas, em  diversas linguagens de programação, através de sua API. No momento que eu escrevo este tutorial, a API está disponível para as seguintes linguagens/métodos/toolkits: Ada, C, Ch, COM+, C++, Java, LabVIEW, Lisp, Neko, .NET, Pascal, Perl, PHP, Python, Ruby, Tcl/TK, XML-RPC.

#### Para mais informações consulte a página de API do ImageMagick:

[http://www.imagemagick.org/script/api.php](http://www.imagemagick.org/script/api.php)
 
## Referências

Grande parte deste artigo foi aprendido (além das páginas de manual)  através da página oficial de documentação do ImageMagick, que é muito,  muito, muito completa. O endereço é:

[http://www.imagemagick.org/Usage/](http://www.imagemagick.org/Usage/)

Via: Devin




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

