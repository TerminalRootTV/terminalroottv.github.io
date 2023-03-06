---
layout: post
title: "Como instalar MariaDB/MySQL no Ubuntu 22.10"
date: 2023-03-06 10:29:23
image: '/assets/img/mariadb/mariadb-mysql.jpg'
description: 'Diversos softwares constantemente atualizam suas formas de configurar devido à motivos de segurança e entre outros.'
icon: 'ion:terminal-sharp'
iconname: 'MariaDB/MySQL'
tags:
- mariadb
- mysql
- ubuntu
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

Aqui no [blog](https://terminalroot.com.br/blog) tem bastante conteúdo sobre [MySQL/MariaDB](https://terminalroot.com.br/tags#mysql), além de um [GUIA para Comandos do MySQL](https://terminalroot.com.br/mysql).

Como diversos softwares constantemente atualizam suas formas de configurar devido à motivos de segurança e entre outros, hoje veremos como instalar o MariaDB/MySQL no Ubuntu 22.10 que muito provavelmente servirá para versões mais recentes e até mais antigas.

---

## 1. Atualize seu sistema
{% highlight bash %}
sudo apt update
{% endhighlight %}

## 2. Instale os pacotes
{% highlight bash %}
sudo apt install mariadb-server mariadb-client
{% endhighlight %}

## 3. Agora configure a senha de acesso:
{% highlight bash %}
sudo mysql_secure_installation
{% endhighlight %}

Iniciará esse prompt com algumas perguntas e vai pedir que você crie senha, use senha com 11 caracteres incluindo maiúsculas e minúsculas e um caractere diferente, exemplo de senha: `SenhaQualquer@` , e para todas as perguntas de *[Sim/Não] → [Y/N]* , marque Y para todas:


{% highlight bash %}
NOTE: RUNNING ALL PARTS OF THIS SCRIPT IS RECOMMENDED FOR ALL MariaDB
      SERVERS IN PRODUCTION USE!  PLEASE READ EACH STEP CAREFULLY!

In order to log into MariaDB to secure it, we'll need the current
password for the root user. If you've just installed MariaDB, and
haven't set the root password yet, you should just press enter here.

Enter current password for root (enter for none): 
OK, successfully used password, moving on...

Setting the root password or using the unix_socket ensures that nobody
can log into the MariaDB root user without the proper authorisation.

You already have your root account protected, so you can safely answer 'n'.

Switch to unix_socket authentication [Y/n] y
Enabled successfully!
Reloading privilege tables..
 ... Success!


You already have your root account protected, so you can safely answer 'n'.

Change the root password? [Y/n] y
New password: 
Re-enter new password: 
Password updated successfully!
Reloading privilege tables..
 ... Success!


By default, a MariaDB installation has an anonymous user, allowing anyone
to log into MariaDB without having to have a user account created for
them.  This is intended only for testing, and to make the installation
go a bit smoother.  You should remove them before moving into a
production environment.

Remove anonymous users? [Y/n] y
 ... Success!

Normally, root should only be allowed to connect from 'localhost'.  This
ensures that someone cannot guess at the root password from the network.

Disallow root login remotely? [Y/n] y
 ... Success!

By default, MariaDB comes with a database named 'test' that anyone can
access.  This is also intended only for testing, and should be removed
before moving into a production environment.

Remove test database and access to it? [Y/n] y
 - Dropping test database...
 ... Success!
 - Removing privileges on test database...
 ... Success!

Reloading the privilege tables will ensure that all changes made so far
will take effect immediately.

Reload privilege tables now? [Y/n] y
 ... Success!

Cleaning up...

All done!  If you've completed all of the above steps, your MariaDB
installation should now be secure.

Thanks for using MariaDB!
{% endhighlight %}

## 4. Verique o status do banco de dados:
{% highlight bash %}
sudo systemctl status mariadb
{% endhighlight %}

Exemplo de saída:

{% highlight bash %}
● mariadb.service - MariaDB 10.6.11 database server
     Loaded: loaded (/lib/systemd/system/mariadb.service; enabled; preset: enabled)
     Active: active (running) since Tue 2023-02-07 21:52:51 -03; 6min ago
       Docs: man:mariadbd(8)
             https://mariadb.com/kb/en/library/systemd/
    Process: 15772 ExecStartPre=/usr/bin/install -m 755 -o mysql -g root -d /var/run/mysqld (code=exited, status=0/SUCCESS)
    Process: 15773 ExecStartPre=/bin/sh -c systemctl unset-environment _WSREP_START_POSITION (code=exited, status=0/SUCCESS)
    Process: 15775 ExecStartPre=/bin/sh -c [ ! -e /usr/bin/galera_recovery ] && VAR= ||   VAR=`cd /usr/bin/..; /usr/bin/galera_recovery`; [ $? -eq 0 ]   && systemctl set-en>
    Process: 15818 ExecStartPost=/bin/sh -c systemctl unset-environment _WSREP_START_POSITION (code=exited, status=0/SUCCESS)
    Process: 15820 ExecStartPost=/etc/mysql/debian-start (code=exited, status=0/SUCCESS)
   Main PID: 15805 (mariadbd)
     Status: "Taking your SQL requests now..."
      Tasks: 9 (limit: 4512)
     Memory: 62.0M
        CPU: 730ms
     CGroup: /system.slice/mariadb.service
             └─15805 /usr/sbin/mariadbd

fev 07 21:52:51 notebook mariadbd[15805]: 2023-02-07 21:52:51 0 [Note] InnoDB: Loading buffer pool(s) from /var/lib/mysql/ib_buffer_pool
fev 07 21:52:51 notebook mariadbd[15805]: 2023-02-07 21:52:51 0 [Note] Plugin 'FEEDBACK' is disabled.
fev 07 21:52:51 notebook mariadbd[15805]: 2023-02-07 21:52:51 0 [Warning] You need to use --log-bin to make --expire-logs-days or --binlog-expire-logs-seconds work.
fev 07 21:52:51 notebook mariadbd[15805]: 2023-02-07 21:52:51 0 [Note] Server socket created on IP: '127.0.0.1'.
fev 07 21:52:51 notebook mariadbd[15805]: 2023-02-07 21:52:51 0 [Note] InnoDB: Buffer pool(s) load completed at 230207 21:52:51
fev 07 21:52:51 notebook mariadbd[15805]: 2023-02-07 21:52:51 0 [Note] /usr/sbin/mariadbd: ready for connections.
fev 07 21:52:51 notebook mariadbd[15805]: Version: '10.6.11-MariaDB-0ubuntu0.22.10.1'  socket: '/run/mysqld/mysqld.sock'  port: 3306  Ubuntu 22.10
fev 07 21:52:51 notebook systemd[1]: Started MariaDB 10.6.11 database server.
fev 07 21:52:51 notebook /etc/mysql/debian-start[15822]: Upgrading MySQL tables if necessary.
fev 07 21:52:51 notebook /etc/mysql/debian-start[15837]: Triggering myisam-recover for all MyISAM tables and aria-recover for all Aria tables
{% endhighlight %}

> Tecle 'q' para sair.

---

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

## 5. Logue no MariaDB/MySQL:

{% highlight bash %}
sudo mysql
{% endhighlight %}

Comandos SQL para criar um senha para o root:

{% highlight sql %}
SHOW DATABASES; --opcional
use mysql;
SHOW TABLES; --opcional
ALTER USER 'root'@'localhost' IDENTIFIED BY 'SENHA_PARA_USUARIO_ROOT';
flush privileges;
exit
{% endhighlight %}

Teste o mesmo comando usado para entrar sem senha:

{% highlight bash %}
sudo mysql
{% endhighlight %}
> Obterá o erro: `ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: NO)`.

Agora para logar é o comando:

{% highlight bash %}
mysql -u root -p
#Enter password:SENHA_PARA_USUARIO_ROOT
{% endhighlight %}

---

# Dica para gerenciamento do MariaDB/MySQL
Você pode instalar o [PHPMyAdmin](https://www.phpmyadmin.net/), mas é mais fácil de instalar e usar o do link abaixo:
## [Instale esse Cliente SQL que tem uma Interface Moderna](https://terminalroot.com.br/2022/08/instale-esse-cliente-sql-que-tem-uma-interface-moderna.html)

---

# Dica adicional: Instale também o SQLite:
{% highlight bash %}
sudo apt install libsqlite3-dev sqlite3
{% endhighlight %}
> Saiba mais: [Como utilizar o SQLite](https://terminalroot.com.br/2021/02/como-utilizar-o-sqlite.html)

---

# Links úteis
+ <https://wiki.crowncloud.net/?How_to_Install_MariaDB_10_on_Ubuntu_22_10>
+ <https://www.ibm.com/docs/en/spectrum-lsf-rtm/10.2.0?topic=ssl-configuring-default-root-password-mysqlmariadb>
+ <https://github.com/drogonframework/drogon/issues/342#issuecomment-581478208>

