---
layout: post
title: "Habilitando Renderização de MarkDown no Apache Web Server"
date: 2019-12-02 21:33:24
image: '/assets/img/markdown/apache-markdown.jpg'
description: 'Vamos adicionar um módulo ao Apache.'
tags:
- markdown
- apache
- discount
- apsx
---

![Habilitando Renderização de MarkDown no Apache Web Server](/assets/img/markdown/apache-markdown.jpg)

Como bem sabemos, um dos diferenciais positivos do [Apache](https://www.apache.org) se compararmos ao **NGINX** é que ele é modular, ou seja, podemos adicionar e remover recursos , coisa que no NGINX não é possível.

Se você tentar acessar arquivo `.md` no Apache ele não irá abrir o arquivo , mas se você alterar o arquivo de configuração do [Apache] para ler esse arquivo, ainda sim, ele não converterá os *símbolos* [MarkDown](http://daringfireball.net/projects/markdown) em HTML, para isso vamos usar um *parser* que pode ser adquirido no endereço: <https://github.com/hamano/apache-mod-markdown> . Vamos ver como instalá-lo, configurá-lo e customizá-lo aqui nesse artigo para que você possa abrir seus arquivos [MarkDown](http://daringfireball.net/projects/markdown).

## Instale as [dependências](http://www.pell.portland.or.us/~orc/Code/discount/):
{% highlight bash %}
sudo emerge -a app-text/discount # Gentoo, Funtoo, ...
apt install build-essential libtool automake autoconf libmarkdown2-dev apache2 apache2-dev # Debian, Ubuntu, ...
{% endhighlight %}

## Clone, compile e instale:

+ Clone o repositório do módulo:
{% highlight bash %}
git clone https://github.com/hamano/apache-mod-markdown
{% endhighlight %}

+ Entre no diretório clonado:
{% highlight bash %}
cd apache-mod-markdown/
{% endhighlight %}

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

+ Gere um `./configure` com o [autotools](https://www.gnu.org/software/automake/):
{% highlight bash %}
autoreconf -f -i
{% endhighlight %}

+ Rode o `./configure` para verificar as dependências e gerar o `Makefile`:

{% highlight bash %}
./configure
{% endhighlight %}
> Se tiver algum problema, descubra o caminho do seu arquivo `mkdio.h` usando o comando: `find /usr/ -name mkdio.h` no meu caso foi encontrado em: `/usr/include/mkdio.h` , então vou usar ele para a variável: **DISCOUNT_DIR** , assim: `./configure --with-discount=/usr/include` .

+ Construa o binário:
{% highlight bash %}
make
{% endhighlight %}

+ Instale tornando-o reconhecido pela variável *PATH*:
{% highlight bash %}
make install
{% endhighlight %}

## Configurando o [Apache](https://www.apache.org)

1. Abra seu *http.conf*: `sudo vim /etc/apache2/httpd.conf` e insira essa linha ao arquivo:
{% highlight bash %}
LoadModule markdown_module modules/mod_markdown.so
{% endhighlight %}
> Algumas distros o caminho do módulo é diferente, no meu caso é o padrão da instalação mesmo: `/usr/lib64/apache2/modules/mod_markdown.so` , mas distros como Debian, Ubuntu,... o caminho pode ser outro, verifique e insira o módulo corretamente, exemplo: `LoadModule markdown_module /usr/lib/apache2/modules/mod_markdown.so`

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

2. Agora vamos fazer o Apache aceitar ler arquivos com extensão `.md` e `.markdown` e também aceitar páginas **Index** em `.md` também, edite ou inclua-os: `sudo vim /etc/apache2/modules.d/00_default_settings.conf` , verifique o caminho na sua distro.
{% highlight bash %}
<IfModule dir_module>
        DirectoryIndex index.html index.md
        AddHandler markdown .md
</IfModule>
{% endhighlight %}

3. Agora reinicie o apache:
{% highlight bash %}
sudo rc-service apache2 restart
{% endhighlight %}

Se seu sistema usa [systemd](https://terminalroot.com.br/2019/07/por-que-systemd.html) , esqueça o coamndo acima e use esse:
{% highlight bash %}
sudo systemctl restart apache2
{% endhighlight %}

4. Criado um teste para ver se está tudo ok:
> O caminho do seu Web Server pode ser diferente, verique antes.

{% highlight bash %}
echo -e "## Teste markdown no Apache\n> Tudo certo.\n" > /var/www/localhost/htdocs/teste.md
{% endhighlight %}
Depois abra um navegador e acesse: <http://localhost/teste.md>

Se renderizar é porque está tudo certo.

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

## Customizações

+ Utilizando um CSS customizado

Se quiser utilizar um CSS próprio por padrão, você pode editar o arquivo: `sudo vim /etc/apache2/modules.d/00_default_settings.conf` e adicionar a linha `MarkdownCss style.css` ao mesmo (logo após o **AddHandler** que criamos/editamos acima) . Então é só criar um arquivo **.css** no diretório do seu arquivo `.md` que ele lerá automaticamente, exemplo:

{% highlight bash %}
<IfModule dir_module>
	DirectoryIndex index.html index.html.var index.sh index.cpp index.md
	AddHandler markdown .md
	MarkdownCss style.css
</IfModule>
{% endhighlight %}

> Lembre-se se restartar o Apache para que as alterações tenham efeito.

+ Documento em **HTML5**

Por padrão ele renderiza o markdown em uma versão do HTML (4.01) se quiser alterar para **HTML5** , edite também o o arquivo: `sudo vim /etc/apache2/modules.d/00_default_settings.conf` e adicione a linha `MarkdownDoctype` e o argumento **HTML_5** , assim:

{% highlight bash %}
<IfModule dir_module>
	DirectoryIndex index.html index.html.var index.sh index.cpp index.md
	AddHandler markdown .md
	MarkdownDoctype HTML_5
</IfModule>
{% endhighlight %}

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Você pode usar em conjunto(uma linha acima ou abaixo) com o `MarkdownCss`, existem outras opções também como: `MarkdownHeaderHtml`, `MarkdownFooterHtml` , `MarkdownWrapper` e `MarkdownFlags` , essa última serve pra customizar a renderização de acordo com o [Discount](http://www.pell.portland.or.us/~orc/Code/discount/) .

Veja alguns outros artigos e vídeo sobre [MarkDown](http://daringfireball.net/projects/markdown):

+ [Como Rodar Shell Script e Python via Apache no Linux](https://terminalroot.com.br/2018/12/como-rodar-shell-script-e-python-via-apache-no-linux.html)
+ [HTML é coisa do passado, o negócio agora é MarkDown!](https://terminalroot.com.br/2016/12/markdown.html)
+ [Remarkable, Um Ótimo Editor MarkDown para Linux](https://terminalroot.com.br/2017/02/remarkable-editor-markdown-para-linux.html)

<iframe width="920" height="400" src="https://www.youtube.com/embed/vAyz2Hnepuk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
