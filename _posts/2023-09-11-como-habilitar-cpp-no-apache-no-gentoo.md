---
layout: post
title: "Como Habilitar C++ no Apache no Gentoo"
date: 2023-09-11 10:48:46
image: '/assets/img/web/apache-cpp.jpg'
description: 'Sem usar framework! O CGI para Web é a base de como tudo funciona na vida real.'
icon: 'ion:terminal-sharp'
iconname: 'C++ pra Web'
tags:
- web
- cpp
- apache
- desenvolvimentoweb
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

A maioria dos servidores locais que rodamos para [desenvolvimento](https://terminalroot.com.br/tags#desenvolvimentoweb) de uma aplicação nada mais é do que um protótipo para aquilo que realmente irá funcionar.

No [Curso de C++ Moderno Avançado](https://terminalroot.com.br/cpp) nós mostramos como fazer isso no [Mint](https://terminalroot.com.br/tags#mint) que também serve para [Ubuntu](https://terminalroot.com.br/tags#ubuntu), [Debian](https://terminalroot.com.br/tags#debian) e sistemas relacionados, e como um pouco mais de esforço você consegue fazer isso no [Windows](https://terminalroot.com.br/tags#windows) se baseando na instalação do [Apache](https://terminalroot.com.br/tags#apache) que você pode entender e saber como funciona [nesse artigo](https://terminalroot.com.br/2023/05/como-instalar-o-apache-php-8-e-mysql-no-windows.html).

Você também pode seguir [esse tutorial](https://terminalroot.com.br/2015/09/habilitando-cgi-e-sh-no-apache-do.html) e substituir tudo que houver no tutorial de `.sh` por `.cpp` que, com certeza, irá funcionar tranquilamente.

No [Gentoo](https://terminalroot.com.br/gentoo) é o mesmo processo só que com caminhos e ferramentas de adição diferente, vamos ver como fazer!

---

# Habilitando o Apache para interpretar binários criados pelo [C++](https://terminalroot.com.br/tags#cpp)
Antes de mais nada. lógico, você precisa do Apache instalado:
{% highlight bash %}
emerge apache
{% endhighlight %}

Atualmente, por padrão, o Apache no Gentoo já possui suporte para CGI, logo não precisa adicionar *flags* ao `make.conf`(~*APACHE2_MODULES="cgi"*~). Então, só basta editar os seguintes arquivos:

## 01. Descomentar a linha do CGI
Outra coisa que funciona também como padrão é a linha `LoadModule cgi_module modules/mod_cgi.so` no arquivo: `/etc/apache2/httpd.conf`, ou seja, não precisa fazer nada, mas é bom sempre dar aquela *conferida* pra ver se realmente está descomentada.

No entanto, abra o arquivo:
{% highlight bash %}
sudo vim /etc/apache2/modules.d/00_mod_mime.conf
{% endhighlight %}

E descomente a linha: `AddHandler cgi-script`. Vai estar assim:
{% highlight bash %}
#AddHandler cgi-script .cgi
{% endhighlight %}

Deixe assim:
{% highlight bash %}
AddHandler cgi-script .cgi
{% endhighlight %}

Se quiser que o Apache também rode URLs com extensão `.cpp`(por padrão ele só lê `.html` e pra quem tem o [PHP](https://terminalroot.com.br/php) instalado, lê também `.php`), adicione-o ao final da linha, assim:
{% highlight bash %}
AddHandler cgi-script .cgi .cpp
{% endhighlight %}
> Pode até adicionar mais extensões aí, caso seja do seu interesse, ex.: `.cc`, `.c`, `.hpp`, `.h`, ...


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

## 02. Habilite o suporte para CGI para o Apache
Abra o arquivo:
{% highlight bash %}
sudo vim /etc/conf.d/apache2
{% endhighlight %}

Procure a linha que tem a variável `APACHE2_OPTS` e ela está mais ou menos assim:
{% highlight bash %}
APACHE2_OPTS="-D DEFAULT_VHOST -D INFO -D SSL -D SSL_DEFAULT_VHOST"
{% endhighlight %}

Adicione o suporte para CGI inserindo um `-D CGI` ao final:
{% highlight bash %}
APACHE2_OPTS="-D DEFAULT_VHOST -D INFO -D SSL -D SSL_DEFAULT_VHOST -D CGI"
{% endhighlight %}

Se quiser, adicione também o `-D CPP` ao final, igual se faz quando instala o PHP(`-D PHP`), deixando assim:
{% highlight bash %}
APACHE2_OPTS="-D DEFAULT_VHOST -D INFO -D SSL -D SSL_DEFAULT_VHOST -D CGI -D CPP"
{% endhighlight %}
> No caso do PHP isso é obrigatório, mas pra C++ essa parte é opcional!

---

## 03. Restart o servidor Apache
Use o seu gerenciador de inicialização para *restartar* o Apache. No meu caso eu uso [OpenRC](https://wiki.gentoo.org/wiki/OpenRC):
{% highlight bash %}
sudo rc-service apache2 restart
{% endhighlight %}
> Se você usa [SystemD](https://terminalroot.com.br/2019/07/por-que-systemd.html) use o comando correspondente para reiniciar o Apache!

---

## 04. Alterar permissões e criar o diretório padrão para códigos C++
Antes de mais nada é interessante permitir criar e ler arquivos em CGI, para isso atribua as seguintes permissões:
{% highlight bash %}
sudo chown -R $USER:$USER /var/www/localhost
{% endhighlight %}

Agora crie o diretório `cgi-bin`:
> Lembrando que o Gentoo separa o `localhost/htdocs`, ou seja, os arquivos públicos ficam em `htdocs` e os arquivos *backend* ficam em `localhost/cgi-bin`. 

Geralmente o próprio Apache cria esse diretório, se já houver, é recomendado também alterar o dono desse diretório pra você conseguir criar e editar arquivos sem precisar de usar `sudo` ou `root`, mas se não houver, crie o diretório:
{% highlight bash %}
cd /var/www/localhost
mkdir cgi-bin
{% endhighlight %}
> Se já existir não esqueça de se tornar dono dele: `sudo chown -R $USER:$USER /var/www/localhost/cgi-bin`.

Em sistemas baseados em APT(Debian, Ubuntu, Mint,...) esse diretório fica em `/usr/lib/cgi-bin`.


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

## 05. Testando C++ na Web
Agora vamos criar um arquivo dentro do diretório `localhost/cgi-bin`:
{% highlight bash %}
cd /var/www/localhost/cgi-bin
vim main.cpp
{% endhighlight %}

E use o seguinte código de exemplo:
> Atenção para os dois `/n/n` em `Content-Type`, eles são fundamentais para evitar o erro do Apache de interpretação de código: `Internal Server Error`.

{% highlight cpp %}
#include <iostream>

int main(int argc, char **argv){
  std::cout << "Content-Type: text/html\n\n";
  std::cout << "<h1>C++ rodando de boa na Web!</h1>" << '\n';
  return 0;
}
{% endhighlight %}

Compile normalmente:
{% highlight bash %}
g++ main.cpp -o index.html
{% endhighlight %}
> Se tiver habilitando o `AddHandler` para `.cpp` também, pode salvar como `index.cpp` ou até mesmo sem extensão!

Agora é só acessar o entendeço: <http://localhost/cgi-bin/> ou <http://localhost/cgi-bin/index.cpp>(se você habilitou e salvou como `index.cpp`)

![C++ rodando no Apache Web Server](/assets/img/web/cpp-apache-web.png)

Se quiser que o Apache interprete o `index.cpp` sem precisar indicar o arquivo na URL edite o arquivo: `/etc/apache2/modules.d/00_default_settings.conf`:
{% highlight bash %}
sudo vim /etc/apache2/modules.d/00_default_settings.conf
{% endhighlight %}

Procure a linha que tem o conteúdo:
{% highlight bash %}
<IfModule dir_module>
	DirectoryIndex index.html index.html.var
</IfModule>
{% endhighlight %}

E adicione o `index.cpp` logo após ao `index.html.var` deixando assim:
{% highlight bash %}
<IfModule dir_module>
	DirectoryIndex index.html index.html.var index.cpp
</IfModule>
{% endhighlight %}

E reinicie o servidor:
{% highlight bash %}
sudo rc-service apache2 restart
{% endhighlight %}

---

É possível fazer absolutamente tudo: *GET*, *POST*, *Autenticação*, *Sessões*, *Banco de Dados*, *Tokens*, *Cookies*,... com C++ no Apache, aliás, muitos sites famosos que você acessa usa C++ na Web!

### [Aprenda Gentoo](https://terminalroot.com.br/gentoo)
### [Aprenda C++](https://terminalroot.com.br/cpp)

Para mais informações acesse o links:
+ <https://wiki.gentoo.org/wiki/Apache>
+ <https://stdcxx.apache.org/>
+ <https://terminalroot.com.br/2021/07/como-ler-arquivos-markdown-com-cpp-para-o-apache.html>
+ <https://terminalroot.com.br/2015/09/habilitando-cgi-e-sh-no-apache-do.html>
+ <https://wiki.gentoo.org/wiki/Apache/pt-br>
+ <https://forums.gentoo.org/viewtopic-t-852840-start-0.html>
+ <https://forums.gentoo.org/viewtopic-t-955922-start-0.html>



