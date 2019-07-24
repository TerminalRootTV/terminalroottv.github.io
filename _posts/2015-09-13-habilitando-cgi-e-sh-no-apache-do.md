---
layout: post
title: "Habilitando CGI e .sh no Apache do Debian Jessie"
date: '2015-09-13T06:16:00.000-07:00'
image: '/assets/img/shell-script/gnuapache.jpg'
description: "O bom de usar CGI é que você pode executar comando do Shell Script na sua página Web."
main-class: 'bash'
tags:
- Debian
- Shell Script
- Apache
- Dicas
---

![Blog Linux](/assets/img/shell-script/gnuapache.jpg "Blog Linux")

Iremos admitir que você já sabe instalar o [Apache](http://apache.org/) e já utiliza-o com [PHP](http://php.net/), [HTML](https://www.w3.org/),...caso não saiba pesquise na internet como instalá-los. O bom de usar __CGI__ é que você pode executar comando do [Shell Script](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=shell-script) na sua *página Web*.

A maioria das distribuições já possuem o módulo __CGI__ do __Apache__ configurado e com o suporte a ele.

Caso deseje certificar-se de que o módulo já está carregado, basta verificar em
> Obs: Estou usando o Editor Nano, mas vc pode usar o de sua preferência.
Logue-se como root , se não possuir o sudo.

{% highlight bash %}
su
{% endhighlight %}

{% highlight bash %}
nano /etc/apache2/mods-available/cgi.load
{% endhighlight %}

Veja se dentro do arquivo aberto há essa linha __descomentada__
{% highlight bash %}
LoadModule cgi_module /usr/lib/apache2/modules/mod_cgi.so
{% endhighlight %}

Certifique-se __também__ de que já está __habilitado__
{% highlight bash %}
nano /etc/apache2/mods-enabled/cgi.load
{% endhighlight %}

Se estiver comentado (__#__), "descomente" e salve o arquivo.

Agora vamos informar ao Apache quais os formatos que desejamos trabalhar
{% highlight bash %}
nano /etc/apache2/mods-enabled/mime.conf
{% endhighlight %}

Procure nele a linha que possui o seguinte código
> #AddHandler cgi-script .cgi

Se estiver comentado, "descomente" e adicione o .sh no final, deixando-o assim

> AddHandler cgi-script .cgi .sh

Caso não esteja habilitado, rode esse comando para leitura de arquivos CGI
{% highlight bash %}
a2enmod cgi
{% endhighlight %}

Por padrão no [Debian Jessie](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=debian) há uma pasta que manda o __http://localhost/cgi-bin/__ para __/usr/lib/cgi-bin__ , ou seja, se você pôr um arquivo cgi dentro de __/usr/lib/cgi-bin__ automaticamente quando vc acessar seu __http://localhost/cgi-bin/__ ele irá acessar __/usr/lib/cgi-bin__. Mas caso vc deseje alterar o endereço, para por exemplo: __http://localhost/sh/__ , então vc precisa editar o arquivo __000-default.conf__ e adicionar uma linha do com __ScriptAlias__ nele, assim
{% highlight bash %}
nano /etc/apache2/sites-available/000-default.conf
{% endhighlight %}

E adicione __ANTES__ da tag o seguinte código
{% highlight bash %}
ScriptAlias /sh/ /usr/lib/cgi-bin/
{% endhighlight %}

Salve-o e depois restarte o Apache
{% highlight bash %}
systemctl restart apache2
{% endhighlight %}

Ou só releia o arquivo de configuração:
{% highlight bash %}
service apache2 reload
{% endhighlight %}

Depois é só criar um arquivo teste, exemplo o que vou disponibilizar aqui abaixo, salvá-lo no diretório __/usr/lib/cgi-bin__ e depois acessar o endereço __http://localhost/cgi-bin/__ ou __http://localhost/sh/__ , dependendo se vc criou alias do Document Root ou não, e ver se está tudo ok.

Após salvar o arquivo, não esqueça de dar permissão de visualização para ele
{% highlight bash %}
chmod a+x /usr/lib/cgi-bin/teste.cgi
{% endhighlight %}

Arquivo __teste.cgi__
{% highlight bash %}
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

Caso deseje, fiz esse __script__ que faz __TODAS AS ETAPAS__ acima descritas para __Habilitar CGI e .sh no Apache__, se não quiser rodá-lo, *veja as alterações que ele efetua*!
{% highlight bash %}
#!/bin/bash
# ./enable-cgi-apache2.sh
# esse script habilita cgi e .sh no apache do debian jessie
[[ $(id -u) != 0 ]] || echo -e "Permissão negada, é root?\nAbortar.";exit 1
echo "aguarde habilitando cgi e .sh no apache..."
VersaoApache=$(apache2 -v | sed -n 1p | awk {'print $3'} | cut -d/ -f2)
echo "versao do apache2: $VersaoApache"
echo "LoadModule cgi_module /usr/lib/apache2/modules/mod_cgi.so" >  /etc/apache2/mods-available/cgi.load
echo "LoadModule cgi_module /usr/lib/apache2/modules/mod_cgi.so" > /etc/apache2/mods-enabled/cgi.load
sed -i 's/\#AddHandler cgi\-script \.cgi/AddHandler cgi\-script \.cgi \.sh/' /etc/apache2/mods-enabled/mime.conf
a2enmod cgi
_TEMP=$(mktemp)
cat /etc/apache2/sites-available/000-default.conf > $_TEMP
echo "ScriptAlias /sh/ /usr/lib/cgi-bin/" > /etc/apache2/sites-available/000-default.conf
cat $_TEMP >> /etc/apache2/sites-available/000-default.conf
systemctl restart apache2
service apache2 reload
/etc/init.d/apache2 restart
_TESTE=$(mktemp)
wget https://goo.gl/zjBMn8 -O $_TESTE 2>/dev/null
cat $_TESTE > /usr/lib/cgi-bin/teste.sh
chmod a+x /usr/lib/cgi-bin/teste.sh
echo "configuração realizada."
echo "acesse: http://0.0.0.0/sh/teste.sh"
exit 0
{% endhighlight %}
 
# Qualquer dúvida, é só comentar.
## Abraços.
### Links úteis

> [Tutorial Oficial da Apache](http://httpd.apache.org/docs/current/howto/cgi.html)

> [Debian HandBook](https://debian-handbook.info/browse/pt-BR/stable/sect.http-web-server.html)

> [thobias.org](http://thobias.org/doc/cgi_shell.html)

> [VOL](http://www.vivaolinux.com.br/dica/Habilitar-CgiShell-no-Apache2)




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

