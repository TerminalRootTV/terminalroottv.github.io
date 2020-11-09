---
layout: post
title: "Como Instalar CORRETAMENTE o LAMP com Laravel no Debian GNU/Linux"
date: 2020-11-09 11:47:31
image: '/assets/img/laravel/lamp-debian.jpg'
description: 'Tudo em uma única vez.'
icon: 'cib:laravel'
iconname: 'lamp + laravel'
tags:
- laravel
- php
- mariadb
- mysql
- apache
- phpmyadmin
---

![Como Instalar CORRETAMENTE o LAMP com Laravel no Debian GNU/Linux](/assets/img/laravel/lamp-debian.jpg)

Pra quem encontra dificuldade em "montar" o ambiente de desenvolvimento LAMP( [Linux](https://terminalroot.com.br/linux/) , [Apache](https://terminalroot.com.br/tags#apache) , [MySQL](https://terminalroot.com.br/mysql/) e [PHP](https://terminalroot.com.br/php/) ), esse procedimento auxilia de forma definitiva.

Em vez do [MySQL](https://terminalroot.com.br/mysql/) utilizamos o [MariaDB](https://terminalroot.com.br/tags#mariadb) , [nesse artigo](https://terminalroot.com.br/2020/10/diferencas-entre-mysql-e-mariadb.html) há uma explicação das diferenças entre ambos: [Diferenças entre MySQL e MariaDB](https://terminalroot.com.br/2020/10/diferencas-entre-mysql-e-mariadb.html).

Em resumo, são **6 Etapas**!

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


# 1. Atualização do sistema e Instalação dos Pacotes Básicos
{% highlight bash %}
sudo apt update && sudo apt upgrade
sudo apt install apache2 php7.3 php-mysql mariadb-client mariadb-server
sudo chown -R $USER:$USER /var/www/html/
cd /var/www/html/
rm index.html
cat <<EOF > index.php
<?php
  echo "Tah funfando!";
?>
{% endhighlight %}
Depois acesse o endereço: <http://localhost> e verifique se está rodando o server.

# Parte 2 - Conectando ao MySQL/MariaDB
{% highlight bash %}
sudo mysql_secure_installation
# Crie uma senha, ex.: 123456
# Responda as perguntas, ex.:
n
n
n
n
y
sudo mysql -u root -p
123456

{% endhighlight %}

# Parte 3 - Conectar sem o sudo
{% highlight bash %}
sudo mysql -u root -p
123456

MariaDB [(none)]> 
  use mysql;
  flush privileges;
  update user set plugin='mysql_native_password' where User='root';
  flush privileges;
  exit
sudo systemctl restart mysql.service
sudo systemctl restart mariadb.service
mysql -u root

MariaDB [(none)]> 
  use mysql;
  ALTER USER 'root'@'localhost' IDENTIFIED BY '123456';
  exit
mysql -u root -p
Enter password:

MariaDB [(none)]> 

{% endhighlight %}

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

# Parte 4 - Testar conexão do PHP ao MariaDB/MySQL com PDO
{% highlight php %}

<?php

	class Connect {
		
		static function conn(){
			try{

				if( !isset($pdo) ){
					$pdo = new PDO('mysql:host=localhost;dbname=mysql', 'root', '123456');
					return $pdo;
				}
			
			}catch( PDOException $e){
				die("Sistema indisponivel, consulte o administrador");
			}
		}
		
	}

	class Select extends Connect{
		public function test(){
			$sql = "SELECT Host,User,Password FROM user";
			$query = self::conn()->prepare($sql);
			$query->execute();
			//return ( $query->rowCount() > 0 ) ? TRUE : FALSE;
			return $query->fetch(PDO::FETCH_ASSOC);
		}
	}


	$obj = new Select;
	//echo ( $obj->test() ) ? "Tudo ok!" : "Falha.";
	//echo "<pre>";
	//var_dump( $obj->test()  );
	$r = $obj->test();
	echo "HOST: " . $r['Host'];
	echo '<br>';
	echo "USER: " . $r['User'];
	echo '<br>';
	echo "PASS: " . $r['Password'];


?>
{% endhighlight %}


# Parte 5 - Instalar o PHPMyAdmin
{% highlight bash %}
vim /etc/apt/sources.list
# copie a linha do main e altere para buster-backports
sudo apt install -t buster-backports phpmyadmin
# Se houver problema ao configurar o usuário tente novamente com Socket UNIX e com TCP/IP, se ainda permanecer, somente aborte
{% endhighlight %}
Depois acesse o endereço <http://localhost/phpmyadmin> e logue com usuário e senha do seu MariaDB.

# Parte 6 - Instalar o Composer e o Laravel
Para instalar o [Composer](https://getcomposer.org) rode os comandos abaixo:
{% highlight bash %}
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'c31c1e292ad7be5f49291169c0ac8f683499edddcfd4e42232982d0fd193004208a58ff6f353fde0012d35fdd72bc394') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer
{% endhighlight %}

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


Para instalar o [Laravel](https://laravel.com) e adicioná-lo à sua variável `$PATH` como `alias`, rode:
{% highlight bash %}
composer -vvv global require laravel/installer
ls .config/composer/vendor/bin/laravel >> .bashrc
alias laravel="${HOME}/.config/composer/vendor/bin/laravel"
exec $SHELL
laravel new blog
# primeira vez que executa demora mesmo, mas as próximas são mais rápidas
cd blog
php artisan serve
http://localhost:8000
{% endhighlight %}

# Assista ao vídeo

<iframe width="910" height="390" src="https://www.youtube.com/embed/obmI47mKixA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> 

Se você ainda não sabe, ou se sente inseguro em [MySQL/MariaDB](https://terminalroot.com.br/mysql/) sugiro você fazer nosso [Curso de Desenvolvimento Web do Zero - PHP & MySQL](https://terminalroot.com.br/php/) que além de MySQL/MariaDB você vai aprender [PHP](https://terminalroot.com.br/php/) do jeito certo! Além de:
+ Programação Orientada a Objetos;
+ Wordpress;
+ Laravel;
+ Composer;
+ Psy Shell;
+ PHP-GTK;
+ Redirecionamento sem alterar a URL;
+ PHPMailer;
+ Deploy de PHP puro e de Laravel na Heroku;
+ E muito mais!

É recomendado também pra quem não sabe nada, pois o curso inclui: [HTML e CSS](https://www.youtube.com/watch?v=SGA6nQqYH7A), [Javascript](https://www.youtube.com/watch?v=HI6YZJxoaIQ), [Bootstrap](https://www.youtube.com/watch?v=mRlkt7P2gZI), [Jekyll](https://www.youtube.com/watch?v=7lI5BfHK-kA), [GitHub](https://terminalroot.com.br/git), [Gitlab e Netlify](https://www.youtube.com/watch?v=ahkpilbOtpE).

Corre que ainda dá tempo! [Clique aqui para saber mais sobre o curso](https://terminalroot.com.br/php/).


<!-- RETANGULO LARGO -->
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


