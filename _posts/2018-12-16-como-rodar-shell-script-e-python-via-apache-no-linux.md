---
layout: post
title: "Como Rodar Shell Script e Python via Apache no Linux"
date: 2018-12-16 11:22:45
image: '/assets/img/servidor/sh-py-apache.jpg'
description: 'Crie Sistemas Web com Shell Script ou Python de maneira rápida e prática.'
tags:
- apache
- shellscript
- python
- web
---

![Como Rodar Shell Script e Python via Apache no Linux](/assets/img/servidor/sh-py-apache.jpg "Como Rodar Shell Script e Python via Apache no Linux")

O tutorial de hoje vamos configurar o [Apache](http://apache.org/) para rodar [Shell Script](http://terminalroot.com.br/shell) e [Python](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=python) como exemplos, mas você pode testar em qualquer linguagem de programação de seu interesse. Também vamos usar de cobaia o [Arch Linux](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=arch), mas com mínimas adaptações é o mesmo procedimento pra qualquer [Linux](http://terminalroot.com.br/linux) ou [BSD](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=bsd), e até mesmo qualquer sistema baseado em [UNIX](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=unix).

*Let's go!* ✌ 

***

+ 1º - Atualize todo o sistema de maneira efetiva com os dois comandos abaixo

{% highlight bash %}
sudo pacman -Syy
sudo pacman -Syu
{% endhighlight %}

+ 2º - Instale o Apache

{% highlight bash %}
sudo pacman -S apache
{% endhighlight %}

+ 3º - Habilite o Apache para iniciar junto com o sistema e também start para já poder usá-lo:

{% highlight bash %}
sudo systemctl enable httpd.service
sudo systemctl start httpd.service
{% endhighlight %}

+ Por padrão o conteúdo que acessa pelo **localhost** está no endereço <kbd>/srv/http/</kbd> lá após instalação não haverá nada, então crie um arquivo *index.html* e insira um conteúdo nele para poder visualizar, use um editor de texto ou com o comando abaixo:
> Lembre-se que dentro deste diretório precisa ser *root* ou *sudo* , não tente ~~sudo echo~~

{% highlight bash %}
echo 'Minha pagina HTML' | sudo tee /srv/http/index.html
{% endhighlight %}

Agora abra o navegador e acesse o endereço: <http://localhost/> , você verá o conteúdo que você escreveu.

***

# Usando um diretório alternativo sem precisa de *root* ou *sudo*

Os diretórios de usuários estão disponíveis por padrão através de <http://localhost/~usuario/> e mostram o conteúdo de <kbd>~/public_html</kbd>

> Note que há o sinal *til* (**~**) na URL, logo digite ela também antes do seu nome de usuário, caso contrário haverá **erro 404**, exemplo:

Mas para criar uma visualização customizada é necessário criar o diretório, alterar as permissões e criar um arquivo *html*:

{% highlight bash %}
mkdir ~/public_html
chmod o+x ~
chmod o+x ~/public_html/
chmod o+r ~/public_html/
echo 'Teste de página WEB com diretorio do usuario' > ~/public_html/index.html
sudo systemctl restart httpd.service
{% endhighlight %}

Depois acesse o endereço: <http://localhost/~seu_usuario/>

***

# Entendimentos básicos

O Apache possui **opções** e **diretivas** <kbd>&lt;Directory ..i></kbd> para determinar suas configurações. 

O arquivo de configuração principal é <kbd>/etc/httpd/conf/httpd.conf</kbd> , que inclui vários outros arquivos de configuração. Ao abrir ele verifique que as linhas que estão *descomentadas*(sem começar com tralha #), quer dizer que já estão pré-configuradas pra você, vejamos alguns exemplos:
	
- **ServerRoot "/etc/httpd"** - Diretório raíz do Apache onde ficam os arquivos de configuração */etc/httpd/conf/* e os módulos */etc/httpd/modules/* 
- **Listen 80** - Porta que o servidor irá exibir as páginas na Web via http, se quiser que fique acessível só pra seu computador e ninguém consiga acessar externamente altere para **Listen 127.0.0.1:80**
- **ServerAdmin you@example.com** - Este é o endereço de e-mail do administrador, que pode ser encontrado, por exemplo, em páginas de erro. Se quiser altere para o que você deseja.
- **DocumentRoot "/srv/http"** - Este é o diretório onde você deve colocar suas páginas da web. Você pode alterá-lo, mas não se esqueça de também alterar **`<Directory "/srv/http">`** para o que você mudou seu *DocumentRoot* , ou você provavelmente vai ter um **erro 403** (*falta de privilégios*) quando você tenta acessar a nova raiz do documento. Não se esqueça de alterar a linha **Require all denied** para **Require all granted** , caso contrário, você receberá um *erro 403* . Lembre-se de que o diretório *DocumentRoot* e suas pastas pai devem permitir permissão de execução para outros (pode ser configurado com <kbd>chmod o+x /path/to/DocumentRoot</kbd> ), caso contrário você obterá um **erro 403** .
- **AllowOverride None** - Esta diretiva nas seções <kbd>&lt;Directory></kbd> faz com que o [Apache](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=apache) ignore completamente os arquivos **.htaccess** . Observe que esse é o **padrão** do *Apache 2.4*, portanto, é necessário permitir explicitamente substituições se você planeja usar arquivos **.htaccess** . Se você pretende usar <kbd>mod_rewrite</kbd> ou outras configurações em arquivos **.htaccess** , pode permitir quais *diretivas* declaradas nesse arquivo podem substituir a configuração do servidor.
- **ServerSignature Off** -  Para ocultar informações do servidor, como as versões do Apache, linguagem, sistema operacional...
- **Include conf/extra/httpd-userdir.conf** - Se você não quiser que os diretórios dos usuários estejam disponíveis na web, comente essa linha. Ou se quiser alterar o nome e/ou localização do mesmo, edite o arquivo: <kbd>/etc/httpd/conf/extra/httpd-userdir.conf</kbd>.
- Entre outras opções e diretivas que podem ser vistas no próprio arquivo.

***

# Habilitando Shell Web cgi

## Introdução

> O **CGI** (**C**ommon **G**ateway **I**nterface) define uma maneira de um *servidor da Web* interagir com programas geradores de conteúdo externos, que são geralmente chamados de programas CGI ou *scripts CGI*. É uma maneira simples de colocar conteúdo dinâmico em seu site, usando qualquer linguagem de programação com a qual você esteja mais familiarizado.

+ 1º - Procure no arquivo de configuração do Apache <kbd>/etc/httpd/conf/httpd.conf</kbd> a linha que possui esse conteúdo <kbd>LoadModule cgid_module modules/mod_cgid.so</kbd> ou algo parecido, use um editor de texto (por exemplo, no [Vim](http://terminalroot.com.br/vim) <kbd>/LoadModule cgid_module.*</kbd> ) ou se quiser procurar diretamente pelo terminal, rode: <kbd>egrep 'LoadModule cgid_module modules.*' /etc/httpd/conf/httpd.conf</kbd> . Verifique que ela estará comentada (com uma *tralha* **#** na frente) , mais ou menos assim: *#LoadModule cgid_module modules/mod_cgid.so* , tire a tralha da frente e deixe mais ou menos assim: <kbd>LoadModule cgid_module modules/mod_cgid.so</kbd>

+ 2º - Próximo passo é verificar se a linha correspondente ao **ScriptAlias** está descomentada, procure a linha <kbd>ScriptAlias /cgi-bin/ "/srv/http/cgi-bin/"</kbd>, geralmente ela já está descomentada e pronta pra uso e também pode ser que ela esteja apontando para outro diretório, lembre-se desse diretório, pois é lá que você guardará seus scripts. Isso quer dizer que você vai guardar no diretório <kbd>/srv/http/cgi-bin/</kbd> , mas acessará o conteúdo pelo endereço: <http://localhost/cgi-bin/> . Se o diretório não existir, crie: <kbd>sudo chmod -p /srv/http/cgi-bin/</kbd> .

+ 3º - Permitir a execução de CGI utilizando a diretiva **Options** . Encontre as tags mais ou menos iguais a essa abaixo, na sua distro pode ser que esteja com o caminho diferente, mas esse exemplo é no Arch Linux, mas serve pra qualquer distro:

{% highlight bash %}
<Directory "/srv/http/cgi-bin">
    AllowOverride None
    Options None
    Require all granted
</Directory>
{% endhighlight %}

Altere e insira a linha <kbd>Options +ExecCGI</kbd> antes de *AllowOverride None*, ficando assim:

{% highlight bash %}
<Directory "/srv/http/cgi-bin">
    Options +ExecCGI
    AllowOverride None
    Options None
    Require all granted
</Directory>
{% endhighlight %}

> Não esqueça de ir salvando o arquivo a cada alteração correta feita.

+ 4º - O quarto passo é adicionar a diretiva **AddHandler** as extensões de arquivo que você deseja que ele aceite, encontre a linha que tem a palavra **Addhandler** e altere como deseja, por exemplo, ela vai estar mais ou menos assim:

> Essa palavra pode ser encontrada em outros lugares do arquivo, mas a única linha que não possui *tralha* **#** na frente, é justamente a que você deve alterar.

{% highlight bash %}
AddHandler cgi-script .cgi
{% endhighlight %}

Vamos supôr que você vai querer rodar no seu servidor extensões Shell Script **.sh** , Python **.py** e Perl **.pl** , então deixe ela assim:

{% highlight bash %}
AddHandler cgi-script .cgi .sh .py .pl
{% endhighlight %}

> Além, lógico, dos arquivo com extensão **.cgi** que provavelmente haverá qualquer linguagem de programação, e quem irá identificar é *SheBang* <kbd>#!/bin/linguagem</kbd> que estará no arquivo.

+ 5º - Criando um arquivo de teste para verificarmos se já está tudo ok, exemplo para shell script:

{% highlight bash %}
sudo vim /srv/http/cgi-bin/teste.sh
{% endhighlight %}

Dentro do arquivo coloque esse conteúdo:

> Obs.: Respeite a linha em branco logo abaixo da shebang um <kbd>echo</kbd> vazio logo abaixo de <kbd>echo "content-type: text/html"</kbd> também precisa ser respeitado, caso contrário haverá erro exibido pelo apache.

Arquivo exemplo:

{% highlight html %}
#!/bin/bash
  
echo "content-type: text/html"
echo
echo
echo "
  <html> <head> <meta charset='utf-8' /> <title> CGI script </title> </head>
  <body>
  <h1>Algumas informações sobre a máquina que o CGI está rodando:</h1>
  "
  
echo "<h4>uptime</h4>"
echo "<pre>$(uptime)</pre>"
  
echo "<h4>uname</h4>"
echo "<pre>$(uname -a)</pre>"
  
echo "<h4>/proc/cpuinfo</h4>"
echo "<pre>$(cat /proc/cpuinfo)</pre>"
  
echo "
  </body>
  </html>
 " 
{% endhighlight %} 

Exemplo Python:

{% highlight python %}
#!/usr/bin/python

print("Content-Type: text/plain;charset=utf-8")
print("")
print("Hello World!")
{% endhighlight %}

+ 6º - Dando as permissões necessárias para o Apache ler o navegador ler o **arquivo e o diretório** :

{% highlight bash %}
sudo chmod -R a+x /srv/http/cgi-bin/
{% endhighlight %}

Reinicie o Apache

{% highlight bash %}
sudo systemctl restart httpd
{% endhighlight %}

+ 7º - Agora abra o navegador e acesse o endereço: <http://localhost/cgi-bin/teste.sh> e veja o conteúdo!


# [Clique Aqui Para Assistir ao Vídeo](https://youtu.be/5hQyfXIMviM)


## Solução de possíveis problemas

+ O Apache usa um programinha chamado [suexec](https://en.wikipedia.org/wiki/SuEXEC) que serve pra gerar problemas de permissão ☹ . Verifique ele está habilitado e carregado com o Apache, use o comando: <kbd>apachectl -V</kbd> se na saída houver a uma linha com o conteúdo: **-D SUEXEC_BIN="/usr/bin/suexec"** , tente renomear ele e reiniciar o Apache e depois verifique se agora funcionou a exibição via browser:

{% highlight bash %}
sudo mv /usr/bin/suexec /usr/bin/suexec_tchau
sudo systemctl restart httpd
{% endhighlight %}

+ Se aparecer mensagens como: *Proibido*, *POST Method Not Allowed*,... Verifique os logs de erro lá em <kbd>/var/log/apache_ou_http/</kbd> .
+ Problemas com caracteres em Hexadecimais em requições POST ou GET ? Haha, aí é seu programinha que irá resolver, esse não é um problema do Apache, no entanto, existem alguns módulos que podem lhe ajudar, mas vai por mim, é melhor você mexer a cuca e tentar resolver com sua linguagem de programação! ☻


# Dicas adicionais

+ Se quiser que o Apache leia seus <kbd>index.sh</kbd>, <kbd>index.py</kbd>,... encontre a palavra <kbd>index.html</kbd> e ao lado dela inclua os indexes que deseja, exemplo:

{% highlight bash %}
DirectoryIndex index.html index.sh index.py
{% endhighlight %}

+ Você pode habilitar o [TLS](https://en.wikipedia.org/wiki/TLS);
+ Criar uma chave e um certificado (autoassinado) [OpenSSL](https://www.openssl.org/) [CSR](https://en.wikipedia.org/wiki/Certificate_signing_request) 
+ Virtual Hosts <kbd>/etc/hosts</kbd>
+ Integração com [MySQL](https://www.mysql.com/) e [PHP](http://www.php.net/).
+ Protocolo [HTTPS](https://pt.wikipedia.org/wiki/Hyper_Text_Transfer_Protocol_Secure).


## Conheça nosso Treinamentos de Shell Script, Vim, Expressões Regulares e Sed
# <http://terminalroot.com.br/cursos>

## Crie Sua Promoção
# <http://terminalroot.com.br/promo>

## Acompanhe todos os vídeos da **Série Shell Script Profissional** 
# [#ShellPro](http://bit.ly/shell-pro-root)


# Links Úteis

- <http://apache.org/>
- <https://httpd.apache.org/docs/2.4/mod/directives.html>
- <http://httpd.apache.org/docs/current/howto/cgi.html>
- <https://wiki.gentoo.org/wiki/Apache/pt-br>
- <https://wiki.archlinux.org/index.php/Apache_HTTP_Server>
- <http://terminalroot.com.br/2015/09/habilitando-cgi-e-sh-no-apache-do.html>


# Abraços! ☝

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

