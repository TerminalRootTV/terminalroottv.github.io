---
layout: post
title: 'Exemplo de utilização de SQLite com PHP'
date: '2011-12-13T09:25:00.000-08:00'
image: '/assets/img/php/sqlite.jpg'
description: 'SQLite é uma biblioteca em linguagem C que implementa um banco de dados SQL embutido.'
main-class: 'web'
tags:
- SQLite
- PHP
---

![Exemplo de utilização de SQLite com PHP](/assets/img/php/sqlite.jpg "Exemplo de utilização de SQLite com PHP")

__SQLite__ é uma biblioteca em __linguagem C __que implementa um banco de dados __SQL embutido__. Programas que usam a biblioteca SQLite podem ter acesso a __banco de dados SQL__ sem executar um processo __SGBD__ separado.

> SQLite não é uma biblioteca cliente usada para conectar com um grande servidor de banco de dados, mas sim o servidor. A biblioteca SQLite lê e escreve diretamente para e do arquivo do banco de dados no disco.

O uso do SQLite é recomendado onde a simplicidade da administração, implementação e manutenção são mais importantes que incontáveis recursos que SGBDs mais voltados para aplicações complexas possivelmente implementam. Entretanto situações onde a simplicidade é a melhor escolha são muito mais freqüentes do que pode-se imaginar.

## Para voçê instalar o SQLite e algumas ferramentas

O exemplo abaixo mostra no [Gentoo](http://www.terminalroot.com.br/tags#gentoo), mas use o gerenciador de pacotes da sua distribuição
{% highlight bash %}
su
emerge sqlite
emerge sqlitebrowser
emerge php5-sqlite
{% endhighlight %}

A última linha para utilização em aplicações em __PHP__, onde se usa muito o __SQLite__ em __PHP-GTK+__. Segue abaixo um exemplo de consulta básica num banco de dados __SQLite__, e mais abaixo um screeshot do __sqlitebrowser__ onde voçê pode criar o banco(é um __arquivo.db__) e as tabelas.Leia os comentários para um melhor entendimento.

{% highlight php %}
<?php
  //condição para iniciar o código
  if(isset($_POST['pesquisar'])){
    //extrair o POST e gerar as variaveis
    extract($_POST);
       /* utilizando o PDO para conectar o SQLite, o arquivo foi pre-criado com a tabela e já há dados inseridos(feito utilizando SQLite Browser com a imagem logo abaixo), não é possível abrir com editor de texto esse arquivo */
    $dbh = new PDO('sqlite:teste.db');
        //loop foreach para exibirmos os valores
    foreach ($dbh->query($query) as $row) {
          print "<b>Nome: </b>" . $row["nome"];
          print "<b> Email: </b>" . $row["email"] . "\n<br />";
        }
  }
?>
<h2>Pesquisar</h2>
<table border="1">
  <form action="" method="post">
    <tr><td>Nome:<input type="text" name="nome" /></td></tr>
    <tr><td>Email:<input type="text" name="email" /></td></tr>
    <tr><td><input type="submit" name="pesquisar" value="Pesquisar"/></td></tr>
</table> 
{% endhighlight %}

Simples e rápido, espero que gostem e comentem!

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

