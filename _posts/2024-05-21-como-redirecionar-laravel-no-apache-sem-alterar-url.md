---
layout: post
title: "Como Redirecionar Laravel no Apache SEM ALTERAR URL"
date: 2024-05-21 09:26:34
image: '/assets/img/laravel/laravel-apache-redirect.jpg'
description: "Na URL não apacererá 'seusite.com/seuprojeto/public' e sim somente: 'seusite.com'"
icon: 'ion:terminal-sharp'
iconname: 'Laravel'
tags:
- laravel
- apache
- php
- desenvolvimentoweb
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

O [Laravel](https://terminalroot.com.br/tags#laravel) tem sido usado com frequência por desenvolvedores web e muitos estão fazendo deploy em servidores de hospedagens com planos comuns onde só há o [Apache](https://terminalroot.com.br/tags#apache) disponível de forma simples.

Muitas vezes você está fazendo uma versão de desenvolvimento e não quer remover os arquivos da raiz do seu projeto e substituir pela versão *beta*, entre diversos outros motivos.

Nesse artigo veremos como usar o Laravel no Apache bem como usá-lo, caso queira, na raiz do seu projeto mesmo estando em uma subpasta no servidor.

Nós vimos [aqui Como Instalar Composer e Laravel no Windows e Ubuntu](https://terminalroot.com.br/2024/05/como-instalar-composer-e-laravel-no-windows-e-ubuntu.html).

Então, para acessar o Laravel no seu navegador, você pode usar o comando:
{% highlight bash %}
php artisan serve
{% endhighlight %}
> Dentro de um projeto Laravel.

Para acessar direto no Apache siga os passos seguintes...


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

# Acessando Laravel no Apache
Primeiramente vamos ver como acessar o Laravel no Apache sem precisar do: ~`php artisan serve`~.

### 1. Mova seu projeto Laravel para seu servidor:
{% highlight bash %}
mv meuprojeto /var/www/html
{% endhighlight %}
> Ou também, dependendo do seu sistema: `mv meuprojeto /var/www/localhost/htdocs`, ou qualquer outro caso.

### 2. Crie um arquivo de configuração para a porta 80
{% highlight bash %}
sudo vim /etc/apache2/sites-available/laravel.conf
{% endhighlight %}
> Alguns sistemas pode ter o caminho diferente, no meu caso mesmo(Gentoo) é: `sudo vim /etc/apache2/vhosts.d/laravel.conf`.

E insira o conteúdo abaixo:
{% highlight svg %}
<VirtualHost *:80>
    ServerName localhost
    DocumentRoot /var/www/localhost/htdocs/meuprojeto/public

    <Directory /var/www/localhost/htdocs/meuprojeto/public>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog /var/log/apache2/laravel_error.log
    CustomLog /var/log/apache2/laravel_access.log combined
</VirtualHost>
{% endhighlight %}

### 3. Atribua *todas* as possíveis permissões para acessar e editar os arquivos
{% highlight bash %}
sudo chown -R apache:apache /var/www/html/meuprojeto
sudo chown -R apache:apache /var/log/apache2
sudo chmod -R 775 /var/www/html/meuprojeto/storage/
sudo chmod -R 775 /var/www/html/meuprojeto/bootstrap/cache/
sudo usermod -a -G apache $USER
sudo find /var/www/html/meuprojeto -type f -exec chmod 664 {} \;
sudo find /var/www/html/meuprojeto -type f -exec chmod 775 {} \;
sudo chmod -R gu+w /var/www/html/meuprojeto
{% endhighlight %}

### 4. Reinicie o Apache e acesse no navegador
{% highlight bash %}
# Em alguns casos que há o comando a2enmod, rode também:
sudo a2enmod rewrite
sudo systemctl restart apache2 
{% endhighlight %}
> Use a forma de reiniciar o Apache de acordo com o seu sistema. No meu mesmo é: `sudo rc-service apache restart`, no [Windows](https://terminalroot.com.br/tags#windows) é [dessa forma](https://terminalroot.com.br/2023/05/como-instalar-o-apache-php-8-e-mysql-no-windows.html#9-agora-no-cmd-rode-o-comando-httpd--k-stop-e-depois-httpd--k-start).

Agora, acesso no navegador o endereço correspondente ao seu projeto, mas para a pasta `public`:
#### <http://localhost/meuprojeto/public>

E note que seu projeto já está rodando direto no Apache!


<!-- RECTANGLE 2 - OnParagragraph -->
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

---

# Redirecionamento ALTERANDO a URL
Pode ser que você ainda queira acessar o projeto, mas identificar no URL que foi redirecionado.

Para esse caso, crie um arquivo de nome: `.htaccess` na raiz do seu servidor, exemplo:
{% highlight bash %}
vim /var/www/html/.htaccess
{% endhighlight %}

E cole o conteúdo abaixo, substitua o nome `meuprojeto` para o nome do seu projeto:
{% highlight svg %}
RewriteEngine On

# Redireciona http://localhost para http://localhost/meuprojeto/public/
RewriteCond %{HTTP_HOST} ^(localhost)$ [NC]
RewriteCond %{REQUEST_URI} ^/$
RewriteRule ^(.*)$ /meuprojeto/public/$1 [L,R=301]
{% endhighlight %}

Há casos que talvez você precise reiniciar mais uma vez o Apache e outros casos até limpar o cache do seu navegador:
{% highlight bash %}
sudo systemctl restart apache2 

# Por exemplo limpar o cache do Google Chrome no Ubuntu
rm -rf ~/.cache/google-chrome
{% endhighlight %}

Agora teste acessando: <http://localhost> e será redirecionado para <http://localhost/meuprojeto/public>

---

# Redirecionamento SEM ALTERAR a URL
> Talvez essa seja a parte mais interessante desse artigo, ou seja, algo que você não encontrará na documentação do Laravel! 😃 

Se você quer acessar o projeto, redirecionar para `meuprojeto/public`, mas sem alterar a URL, substitua o conteúdo do `.htaccess` por esse conteúdo:
> ALtere `meuprojeto` para o nome do seu projeto. `vim /var/www/html/.htaccess`

{% highlight svg %}
RewriteEngine On

# Reescreve internamente http://localhost para http://localhost/meuprojeto/public/
RewriteCond %{HTTP_HOST} ^localhost$ [NC,OR]
RewriteCond %{HTTP_HOST} ^localhost$
RewriteCond %{REQUEST_URI} !meuprojeto/public/
RewriteRule (.*) /meuprojeto/public/$1 [L]
{% endhighlight %}

----

Espero que eu tenha ajudado, se no seu caso tiver algum problema revise os passos.

E não se esqueça de compartilhar esse artigo!


