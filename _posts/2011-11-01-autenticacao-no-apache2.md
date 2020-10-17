---
layout: post
title: 'Autenticação no Apache2'
date: '2011-11-01T06:37:00.000-07:00'
description: 'Vou explicar aqui como você disponibilizar o acesso a uma pasta do Apache exigindo usuario e senha.'
tags:
- servidores
- apache
---

Vou explicar aqui como você disponibilizar o acesso a uma pasta do __Apache(www)__ exigindo usuario e senha.

+ Primeiramente devemos criar o diretório onde desejamos restringir o acesso caso o mesmo não exista.
{% highlight bash %}
mkdir /var/www/teste 
{% endhighlight %}


+ Criaremos agora um arquivo somente para testes com o nome "__index.html__" no diretório "__/var/www/teste__".
{% highlight bash %}
echo "Testando autenticação no Apache" > /var/www/teste/index.html 
{% endhighlight %}


+ Criar os arquivos __.htaccess__ e __passwd__ no diretório onde se deseja restringir o acesso.
{% highlight bash %}
touch passwd .htaccess
{% endhighlight %}


+ Conteúdo do arquivo __.htaccess__
{% highlight bash %}
AuthName "Nome que aparecerá no título da janela"
AuthType Basic
AuthUserFile /var/www/teste/passwd
require valid-user 
{% endhighlight %}


+ Criação dos usuários que terão permissão para acessar o diretório
{% highlight bash %}
htpasswd -c passwd usuário
{% endhighlight %}


Será pedida a senha do novo usuário e em seguida sua confirmação.
{% highlight bash %}
New password:
Re-type new password:
Adding password for user
{% endhighlight %}


Ao abrir o arquivo de senhas (passwd), serão vistos os nomes de usuário e senhas criptografadas.
{% highlight bash %}
more passwd
{% endhighlight %}


+ Edite o arquivo
{% highlight bash %}
"/etc/apache2/sites-available/default"
{% endhighlight %}


Colocando as seguintes linhas no final do arquivo antes da tag substituindo todas as diretivas conforme suas necessidades, uma observação importante é para a tag __AllowOverride__ a mesma deve conter "__AuthConfig__" para que a autenticação seja bem sucedida.

{% highlight bash %}
Alias /teste/ "/var/www/teste/"
Options Indexes MultiViews FollowSymLinks
AllowOverride AuthConfig
Order deny,allow
Deny from all
Allow from 172.16.0.0/255.0.0.0 ::1/128
{% endhighlight %}


+ Reinicie o serviço do Apache para atualizar as configurações.
{% highlight bash %}
/etc/init.d/apache2 restart
{% endhighlight %}


+ Teste agora suas configurações acessando __http://localhost/teste__, fornecendo o nome de usuário senha.

> Observações: as linhas abaixo se referem à restrição por IP, não são necessárias à autenticação.

__Deny from all__

__Allow from 172.16.0.0/255.0.0.0 ::1/128__

E todo esse tramite desse ser feito pelo usuário root para funcionar.

Eu uso aqui e você, vai deixar de se proteger!

Fonte:Viva o Linux

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



