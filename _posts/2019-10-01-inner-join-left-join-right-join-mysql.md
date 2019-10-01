---
layout: post
title: "Como Fazer um INNER JOIN, LEFT JOIN e RIGHT JOIN em SQL"
date: 2019-10-01 11:02:55
image: '/assets/img/mysql/joins-mysql.jpg'
description: 'Uma cláusula JOIN é usada para combinar linhas de duas ou mais tabelas, com base em uma coluna relacionada entre elas.'
tags:
- mysql
- sql
- join
---

![Como Fazer um INNER JOIN, LEFT JOIN e RIGHT JOIN em SQL](/assets/img/mysql/joins-mysql.jpg "Como Fazer um INNER JOIN, LEFT JOIN e RIGHT JOIN em SQL")

Quando você tem tabelas que a resposta de uma consulta pode estar relacionada em outra tabela, muitas vezes para exibirmos de maneira simplificada precisamos fazer esses tipos de consultas um pouco *mais complexas* .

Então vamos ver de forma mais simples para pegar o jeito de uma vez por todas. Lembrando que se você não possuir um [banco de dados](https://terminalroot.com.br/2011/10/curso-certificacao-linux-lpi-102.html), nesse caso o [MySQL](https://terminalroot.com.br/2011/10/curso-certificacao-linux-lpi-102.html) instalado, você pode testar essas consultas online com uma das ferramentas apresentadas nesse artigo: [Conheça 7 Serviços OnLine para Executar seus Comandos SQL](https://terminalroot.com.br/2019/08/conheca-o-servico-online-para-executar-seus-comandos-sql.html)

![Imagens ilustrativas](/assets/img/mysql/meme1.jpg "Imagens ilustrativas")

## Introdução

Uma cláusula JOIN é usada para combinar linhas de duas ou mais tabelas, com base em uma coluna relacionada entre elas. 
 
### Diferentes tipos de SQL JOINs

Aqui estão os diferentes tipos de JOINs no SQL:

- INNER JOIN : Retorna registros que possuem valores correspondentes nas duas tabelas;
- LEFT JOIN: Retorna todos os registros da tabela esquerda e os registros correspondentes da tabela direita;
- RIGHT JOIN: Retorna todos os registros da tabela da direita e os registros correspondentes da tabela da esquerda.

## Conteúdo das Tabelas

Para explicar como funciona essas consultas vamos usar esse banco de dados [examples_joins.sql](/downs/example_joins.sql) . Se quiser importar a tabela use esse comando:

1. Logue no [MySQL](https://terminalroot.com.br/2011/10/curso-certificacao-linux-lpi-102.html) e crie uma [base de dados(https://www.luis.blog.br/banco-de-dados-e-sql-diferenca-entre-base-de-dados-e-banco-de-dados.html);

- A opção `-u` informa o usuário;
- A opção `-p` informa que precisa inserir senha;

{% highlight bash %}
mysql -u NOME_DO_USUÁRIO -p
{% endhighlight %}

2. Crie uma *base de dados* com o nome *examples_joins*:
{% highlight sql %}
CREATE DATABASE examples_joins;
{% endhighlight %}
![Criando Database e Mudando](/assets/img/mysql/login-create-use.png "Criando Database e Mudando")

3. Após sair do MySQL com o comando `exit` ou `quit`, rode o comando abaixo para importar a base:
> Lembrando que o arquivo precisa estar no mesmo diretório que você fará a importação.
{% highlight bash %}
mysql -u NOME_DO_USUÁRIO -p NOME_DA_BASE < examples_joins.sql
{% endhighlight %}

4. Depois entre no MySQL e verifique se está tudo certo. Após logar rode o comando `USE examples_joins;` para mudar/definir a base para uso. E rode um `SHOW TABLES` para verificar as tabelas. Veja as imagens abaixo:
- A opção `-D` informa a base de dados;
{% highlight bash %}
mysql -u NOME_DO_USUÁRIO -p -D examples_joins 
{% endhighlight %}
![Logando e Exibindo a base examples_joins](/assets/img/mysql/login-show.png "Logando e Exibindo a base examples_joins")

5. Verificando se realmente está tudo certo com `SELECT * FROM NOME_DE_ALGUMA_TABELA`:
{% highlight sql %}
SELECT * FROM clientes;
SELECT * FROM notebooks;
SELECT * FROM vendas;
{% endhighlight %}
![SELECT * FROM NOME_DE_ALGUMA_TABELA](/assets/img/mysql/select-all.png "SELECT * FROM NOME_DE_ALGUMA_TABELA")

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

## Realizando um INNER JOIN
> Retorna registros que possuem valores **correspondentes nas duas tabelas**.
![INNER JOIN](/assets/img/mysql/inner_join.jpg "INNER JOIN")
{% highlight sql %}
SELECT * FROM vendas AS v INNER JOIN clientes AS c ON (v.id_cliente = c.id);
{% endhighlight %}
+ a opção `AS` cria uma *alias*(apelido **v**) para a tabela *vendas* e outros para a tabela *clientes*(apelido **c**)

Alternativamente você poderia fazer esse *INNER JOIN* sem usar a cláusula `AS` para aliases, assim:
{% highlight sql %}
SELECT * FROM vendas v INNER JOIN clientes c ON (v.id_cliente = c.id);
{% endhighlight %}
> Eu prefiro usar o `AS` pra não acabar me confundindo mais tarde. =)
![INNER JOIN](/assets/img/mysql/inner.png "INNER JOIN")

## Realizando um LEFT JOIN
> Retorna todos os registros da tabela **esquerda** e os registros correspondentes da tabela direita.
![LEFT JOIN](/assets/img/mysql/left_join.jpg "LEFT JOIN")
{% highlight sql %}
SELECT * FROM vendas AS v LEFT JOIN clientes AS c ON (v.id_cliente = c.id);
{% endhighlight %}
ou
{% highlight sql %}
SELECT * FROM vendas v LEFT JOIN clientes c ON (v.id_cliente = c.id);
{% endhighlight %}
![LEFT JOIN](/assets/img/mysql/left.png "LEFT JOIN")

## Realizando um RIGHT JOIN
> Retorna todos os registros da tabela da **direita** e os registros correspondentes da tabela da esquerda.
![RIGHT JOIN](/assets/img/mysql/right_join.jpg "RIGHT JOIN")
{% highlight sql %}
SELECT * FROM vendas AS v RIGHT JOIN clientes AS c ON (v.id_cliente = c.id);
{% endhighlight %}
ou
{% highlight sql %}
SELECT * FROM vendas v RIGHT JOIN clientes c ON (v.id_cliente = c.id);
{% endhighlight %}
![RIGHT JOIN](/assets/img/mysql/right.png "RIGHT JOIN")


## Conclusão

Podemos tiras nossas conclusões a partir dessa essa imagem abaixo e notar as difereças de cada um dos tipos de consultas.
![JOINS](/assets/img/mysql/joins.png "JOINS")

*[DICAS EXTRAS](https://king.host/wiki/artigo/mysql-via-ssh/)*: Se quiser exportar a base de dados, caso você faça alguma alteração, rode o comando:
{% highlight bash %}
mysqldump -h HOST -u NOME_DO_USUÁRIO -p NOME_DA_BASE > examples_joins.sql
{% endhighlight %}

E na importação, se tiver problemas com codifição(uso de letras com acentos por exemplo), importe assim:
{% highlight bash %}
mysql -h HOST -u NOME_DO_USUÁRIO -p --default_character_set utf8 NOME_DA_BASE < examples_joins.sql
{% endhighlight %}

## Links úteis

+ <https://dev.mysql.com/doc/refman/8.0/en/join.html>
+ <https://terminalroot.com.br/2011/10/curso-certificacao-linux-lpi-102.html>
+ <https://terminalroot.com.br/2019/08/conheca-o-servico-online-para-executar-seus-comandos-sql.html>
+ <https://terminalroot.com.br/2019/08/o-que-e-sgbd.html>
+ <https://ayltoninacio.com.br/blog/como-utilizar-inner-left-right-join-mysql>
    
