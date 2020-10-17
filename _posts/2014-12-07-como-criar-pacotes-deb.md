---
layout: post
title: "Como criar pacotes .deb"
date: '2014-12-07T05:46:00.000-08:00'
image: '/assets/img/debian/deb.jpg'
description: "Pacotes .deb facilitam a instalação de aplicativos."
tags:
- debian
- linux
- dicas
- debian
- gnu
---

![Como criar pacotes .deb](/assets/img/debian/deb.jpg "Como criar pacotes .deb")

## [Assista ao vídeo](http://bit.ly/2F3CqxS)

<iframe width="1246" height="701" src="https://www.youtube.com/embed/DS7ozD5_tko" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Pacotes __.deb__ facilitam a instalação de aplicativos, aqui no blog tem dois Posts que demonstram como "Instalar o Eclipse Galileo e o Aptana", mas tudo poderia ser desprezado, se eu criasse um pacote .deb e disponibilizasse pra download, mas essa não é a idéia desse blog.

Os pacotes podem ser instalado em __Debian__ e __Debian-Likes__ (Ubuntu, Linux Mint, Backtrack 5...), que possuem o mesmo caminho para os diretórios dos aplicativos.

É bem simples __criar pacotes .deb__, vamos começar então

+ 1 - crie uma pasta onde você desejar que será o nome do programa, aqui eu vou criar a pasta terminalroot dentro da minha Área de Trabalho.
+ 2 - Depois crie dentro da sua pasta uma pasta em maiúsculo, com o nome __DEBIAN__
+ 3 - dentro da pasta __DEBIAN__, crie um arquivo com o nome de __control__, sem extensão.
+ 4 - abra esse arquivo com seu editor de texto(gEdit por exemplo) e preencha com o código abaixo
{% highlight bash %}
Package:terminalroot
Version: 0.1
Priority:
Architecture: all
Essential:
Depends:
Pre-depends:
Suggests:
Installed-Size:
Maintainer: Marcos da B. M. Oliveira
Conflicts:
Replaces:
Provides:
Description: Acesse o blog terminalroot.com.br e descubra como criar pacotes .deb
{% endhighlight %}

No código acima, as linhas que são obrigatórias, estão preenchidas, porém algumas linhas como __Depends__, por exemplo, se você preencher com pacotes necessários para o funcionamento do programa o __GDebi-Installer__ não instalará se não houver estas dependências, porém com os campos acima mencionados já podemos instalar o programa pelo __GDebi-Installer__.

Agora vamos ao programa, se você baixou um __tarball__ e não quer perder o tempo copiando arquivos pra dentro de pastas...você pode criar um __.deb__ e executá-lo, ou até mesmo, dar dois cliques nele, se o pacote foi criado com o root, ele __pedirá a senha de root__.

+ 5 - Dentro da pasta que você criou que aqui estou chamando de __terminalroot,__ crie as diretivas que você deseja, por exemplo, crie uma pasta com o nome "__usr__", dentro de "__usr__", crie uma pasta com o nome "__bin__" e dentro de "__bin__"(ISSO SERÁ O MESMO DE VOCÊ INFORMAR QUAIS OS CAMINHOS NO SEU COMPUTADOR QUE DESEJA PARA ONDE OS ARQUIVOS SEJAM COPIADOS) coloque um arquivo, sem extensão com esse código abaixo por exemplo

{% highlight bash %}
#!/bin/sh
echo "Acesse: terminalroot.com.br e descubra uma pá de coisa!"
{% endhighlight %}

E salve com o nome __terminalroot__, lembrando que logo após isso dê permissão de execução pra esse arquivo
{% highlight bash %}
chmod +x terminalroot
{% endhighlight %}

No diretório que será criado o __.deb__, vc também pode criar as pastas e sub-pastas pelo terminal, assim
{% highlight bash %}
mkdir -p usr/bin
{% endhighlight %}

O "__usr__" não pode ter "__/__" na frente e você deve estar dentro do diretório __terminalroot__, pois se se fizer __/usr__ , será criado, se houver permissão, dentro do "__usr__" do seu computador.Você também pode criar um ícone no __painel do Gnome__, é só criar a pasta que ficará a imagem no seu computador e a imagem, exemplo
{% highlight bash %}
mkdir opt/
cp imagem.jpg terminalroot/opt
{% endhighlight %}

E depois criar o icone que aparecerá no painel, exemplo, __terminalroot.desktop__, dae teria essa configuração dentro do arquivo
{% highlight bash %}
[Desktop Entry]
Name=Marcos Pinguim
Icon=/opt/terminalroot.jpg
Type=Application
Categories=GNOME;GTK;Utility;TextEditor;
Exec=terminalroot
StartupNotify=false
Terminal=false
{% endhighlight %}

Para isso é necessário haver o carregamento do __gtk__ na execução do programa, que não será esse caso, somente se você digitar no terminal "__terminalroot__", obterá o texto do salvo no arquivo __usr/bin/terminalroot__, e salvará esse arquivo __terminalroot.desktop__ dentro da pasta que será criado o pacote __.deb__
{% highlight bash %}
mkdir -p
{% endhighlight %}

+ 6 - depois de criar a pasta __DEBIAN__; o arquivo __control__; as pasta na __raiz da pasta__ que será copiado os arquivos, e pôr os arquivos que serão copiados dentro das suas respectivas páginas, basta agora "__compactar__" em __.deb__
{% highlight bash %}
dpkg-deb -b terminalroot/ terminalroot.0.1.deb
{% endhighlight %}

E o pacotes será criado.Agora instale-o, ou dando dois cliques(ou abrindo com o __Gdebi-installer)__, ou pelo terminal
{% highlight bash %}
dpkg -i terminalroot.0.1.deb
{% endhighlight %}

Todas as tarefas restantes serão feitas automaticamente, e o pacote será instalado.Agora vá ao terminal e digite "__terminalroot__", terá o texto pré-configurado para responder, se fosse um software seria executado, se houve __Gtk__ pre-configurada abriria a janela, até mesmo pelo ícone pre-programado, se você for no painel 

> Aplicativos > Acessórios

Verá a imagem lá, entre as opções dos aplicativos, porém se clicar não fará nada.Para remover, basta
{% highlight bash %}
apt-get remove terminalroot
{% endhighlight %}

Todos os arquivos copiados serão remvidos, inclusive as imagens.

Pronto, é só isso, espero que gostem e comentem.

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



