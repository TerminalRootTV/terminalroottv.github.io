---
layout: post
title: "Curso Certificação Linux LPI-102: Configurando o Apache"
date: '2013-04-05T15:00:00.000-07:00'
image: '/assets/img/lpi/apache-http-server.jpg'
description: "O servidor Apache (ou Apache HTTP Server, ou simplesmente Apache) é o mais bem sucedido servidor web livre."
main-class: 'linux'
tags:
- Linux
- LPI
---

![Configurando o Apache](/assets/img/lpi/apache-http-server.jpg "Configurando o Apache")

O servidor __Apache__ (ou __Servidor HTTP Apache__, em inglês: __Apache HTTP Server__, ou simplesmente: __Apache__) é o __mais bem sucedido servidor web livre__.


O servidor é configurado por um arquivo mestre nomeado httpd.conf e opcionalmente pode haver configurações para cada diretório utilizando arquivos com o nome __.htaccess__, onde é possível utilizar autenticação de usuário pelo próprio protocolo HTTP utilizando uma combinação de arquivo __.htaccess__ com um arquivo __.htpasswd__, que guardará os usuários e senhas (criptografadas).

## Autenticação no Apache2
 
> Vou explicar aqui como você disponibilizar o acesso a uma pasta do __Apache(www)__ exigindo usuario e senha.

* Primeiramente devemos criar o diretório onde desejamos restringir o acesso caso o mesmo não exista.
{% highlight bash %}
mkdir /var/www/teste 
{% endhighlight %}

* Criaremos agora um arquivo somente para testes com o nome "index.html" no diretório "/var/www/teste".
{% highlight bash %}
echo Testando autenticação no Apache > /var/www/teste/index.html 
{% endhighlight %}

* Criar os arquivos .htaccess e passwd no diretório onde se deseja restringir o acesso.
{% highlight bash %}
touch passwd .htaccess
{% endhighlight %}

* Conteúdo do arquivo .htaccess 
{% highlight bash %}
AuthName "Nome que aparecerá no título da janela"
AuthType Basic
AuthUserFile /var/www/teste/passwd
require valid-user 
{% endhighlight %}

* Criação dos usuários que terão permissão para acessar o diretório
{% highlight bash %}
htpasswd -c passwd usuário
{% endhighlight %}

> Será pedida a senha do novo usuário e em seguida sua confirmação.
{% highlight bash %}
New password
Re-type new password
Adding password for user usuário
{% endhighlight %}


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


> Ao abrir o arquivo de senhas (passwd), serão vistos os nomes de usuário e senhas criptografadas.

{% highlight bash %}
more passwd
usuário:ZzbJ.YtR6TyyU
{% endhighlight %}

* Edite o arquivo
{% highlight bash %}
"/etc/apache2/sites-available/default"
{% endhighlight %}

> Colocando as seguintes linhas no final do arquivo antes da __tag__, substituindo todas as diretivas conforme suas necessidades, uma observação importante é para a tag 

> __AllowOverride__, a mesma deve conter "__AuthConfig__" para que a autenticação seja bem sucedida.
{% highlight bash %}
Alias /teste/ "/var/www/teste/"
Options Indexes MultiViews FollowSymLinks
AllowOverride AuthConfig
Order deny,allow
Deny from all
Allow from 172.16.0.0/255.0.0.0 ::1/128
{% endhighlight %}

* Reinicie o serviço do Apache para atualizar as configurações.
{% highlight bash %}
/etc/init.d/apache2 restart
{% endhighlight %}

* Teste agora suas configurações acessando __http://localhost/teste__, fornecendo o nome de usuário senha.

> Observações: as linhas abaixo se referem à restrição por IP, não são necessárias à autenticação.

{% highlight bash %}
Deny from all
Allow from 172.16.0.0/255.0.0.0 ::1/128
{% endhighlight %}


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


E todo esse tramite desse ser feito pelo usuário root para funcionar.
 
# Habilitar o mod_rewite no Apache (.htacces)

> Pra quem vai trabalhar com MVC no PHP (por exemplo) precisa habilitar o mod_rewrite no Apache pra que funcione, segue os passos pra fazer isso

## 1-Logue como root: 
{% highlight bash %}
su
{% endhighlight %}

## 2-Abra o arquivo default do Apache: 
{% highlight bash %}
vi /etc/apache2/sites-available/default
{% endhighlight %}

## 3-Edite o arquivo da seguinte forma

> Substitua por "__AllowOverride AuthConfig__" e altere a linha "__AllowOverride None__" dentro de  substituindo por "__AllowOverride All__". 

## 4- Não esqueça de habilitar o mod_rewrite
{% highlight bash %}
a2enmod rewrite
{% endhighlight %}

## 5-Reinicie o apache
{% highlight bash %}
/etc/init.d/apache2 restart
{% endhighlight %}

> Agora vamos testar 

## 6-Crie um arquivo .htacces dentro do diretório /var/www/
{% highlight bash %}
vi /var/www/.htaccess
{% endhighlight %}


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


## 7-Escreva isso dentro do Arquivo, salve e feche-o
{% highlight bash %}
RewriteEngine On
RewriteCond %{SCRIPT_FILENAME} !-f
RewriteCond %{SCRIPT_FILENAME} !-d
RewriteRule ^(.*)$ index.php?chave=$1 
{% endhighlight %}

## 8-Agora crie um arquivo index.php e cole o conteúdo logo abaixo
{% highlight bash %}
vi /var/www/index.php
{% endhighlight %}

## 9-Acesse o endereço http://localhost/nomequalquer/outronome/

Se imprimir na tela: __nomequalquer/outronome/__ (ou o nome que você escolheu), está tudo certo.Você já pode escrever seu Framework!

## Assista a um vídeo sobre Apache

<iframe width="920" height="400" src="https://www.youtube.com/embed/5hQyfXIMviM" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

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

