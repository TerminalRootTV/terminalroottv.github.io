---
layout: post
title: "Como utilizar o SQLite"
date: 2021-02-22 13:23:29
image: '/assets/img/sqlite/sqlite.jpg'
description: 'Simples, Veloz e Seguro!'
icon: 'ion:terminal-sharp'
iconname: 'sqlite'
tags:
- sqlite
- sql
---

![Como utilizar o SQLite](/assets/img/sqlite/sqlite.jpg)

[SQLite](https://www.sqlite.org/) é uma biblioteca **in-process** que implementa um mecanismo de banco de dados [SQL](https://terminalroot.com.br/2019/08/conheca-o-servico-online-para-executar-seus-comandos-sql.html) transacional independente, sem servidor e com configuração zero. O código para [SQLite](https://www.sqlite.org/) é de domínio público e, portanto, gratuito para uso para qualquer finalidade, comercial ou privada. SQLite é o banco de dados mais amplamente implantado no mundo, com mais aplicativos do que podemos contar, incluindo vários projetos de alto perfil.

Ao contrário da maioria dos outros [bancos de dados SQL](https://terminalroot.com.br/2019/08/o-que-e-sgbd.html), o SQLite não tem um processo de servidor separado. O SQLite lê e grava diretamente em arquivos de disco comuns. Um banco de dados SQL completo com várias tabelas, índices, gatilhos e visualizações está contido em um único arquivo de disco. O formato do arquivo de banco de dados é multiplataforma - você pode copiar livremente um banco de dados entre sistemas de 32 e 64 bits ou entre as arquiteturas big-endian e little-endian.

Em resumo o [SQLite](https://www.sqlite.org/) faz jus ao seu slogan: **Pequeno, Rápido e de Confiança. Escolha todos ou qualquer um dos três!**(Small. Fast. Reliable. Choose any three.)

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# Instalação
Instalar é tão simples quanto o SQLite, basta usar o [gerenciador de pacotes](https://terminalroot.com.br/2021/02/conan-um-gerenciador-de-pacotes-para-c-cpp.html) da sua [distro](https://terminalroot.com.br/tags#distros) e que com certeza haverá no repositório, exemplos:

{% highlight bash %}
emerge sqlite3 # Gentoo, Funtoo, ...
sudo apt install sqlite3 # Debian, Ubuntu, Mint, ...
sudo pacman -S sqlite3 # Arch, Manjaro, ...
sudo dnf install sqlite3 # Red Hat, CentOS, Fedora, ...
{% endhighlight %}

# Utilização
Após instalado você pode obter mais informações através de documentos e comandos no seu computador, exemplos:
{% highlight bash %}
sqlite3 --help
man sqlite3
{% endhighlight %}

Para abrir/criar uma base de dados , basta rodar o comando:
{% highlight bash %}
sqlite3 nome-da-minha-base-de-dados.db
{% endhighlight %}
> Se o arquivo não existir, o SQLite irá criá-lo automaticamente, após você criar pelo menos uma tabela. Se você não criar nenhuma tabela o arquivo não será criado a menos que você use o `.save`, mas cuidado, esse comando sobreescreve arquivos.

Assim que você roda esse comando você entra numa [subshell](https://terminalroot.com.br/shell/) para rodar seus comandos [SQL](https://terminalroot.com.br/mysql/) . Exemplos de exibição:
{% highlight bash %}
user@host ~ $ sqlite3 nome-da-minha-base-de-dados.db
SQLite version 3.34.0 2020-12-01 16:14:00
Enter ".help" for usage hints.
sqlite> 

{% endhighlight %}

A maioria dos comandos do [MySQL](https://terminalroot.com.br/mysql/)/[MariaDB](https://terminalroot.com.br/2020/10/diferencas-entre-mysql-e-mariadb.html) também funcionam no [SQLite](https://www.sqlite.org/) , mas possuem diversas exceções, algumas coisas são específicas no SQLite, exemplo:

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

+ Criar uma tabela básica com 4 campos: id(autoincrement, único e não nulo), nome(string de máximo 64 caracteres) e diahora(do tipo datetime e preenchimento padrão):
{% highlight sql %}
CREATE TABLE tabela ( id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL, nome VARCHAR (64), diahora DATETIME DEFAULT (CURRENT_TIMESTAMP) );
{% endhighlight %}
+ Inserir dados na tabela:
{% highlight sql %}
INSERT INTO tabela ( nome ) VALUES ( "Marcos Oliveira" );
{% endhighlight %}

+ Selecionar os dados da tabela
{% highlight bash %}
SELECT * FROM tabela
{% endhighlight %}
> Exemplo de saída:

{% highlight bash %}
1|Marcos Oliveira|2021-02-19 05:00:41
{% endhighlight %}

E dentre diversos outros [comandos SQL](https://terminalroot.com.br/2019/10/inner-join-left-join-right-join-mysql.html) como: `UPDATE`, `DELETE`, ... Como eu havia dito alguns casos os comandos serão diferentes, note no exemplo `CREATE` acima, mas a maioria segue a regra das tabelas relacionais da linguagem [SQL](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html) , por exemplo:

+ No [MySQL](https://terminalroot.com.br/mysql/) para saber a estrutura de uma tabela, você roda o comando: `DESCRIBE tabela;` já o SQLite, para obter essa mesma informação, use assim:
{% highlight sql %}
.schem tabela
{% endhighlight %}

Ou para todas as tabelas:
{% highlight bash %}
.schema
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

+ Para sair do prompt do SQLite , basta rodar o comando:
{% highlight sql %}
.exit
{% endhighlight %}

+ Para obter uma ajuda rápida, basta tecla:
{% highlight sql %}
.help
{% endhighlight %}

+ Para alterar o separador da saída. Notamos que a saída dos dados são separados por uma barra vertical(`|`), mas se quisermos outros separadores, por exemplo: vírgula precedido de espaço, basta usar o comando `.separator`:
{% highlight sql %}
sqlite> .separator ", "
sqlite> SELECT * FROM tabela;
1, Marcos Oliveira, 2021-02-19 05:00:41
{% endhighlight %}

+ Se quiser a saída das strings entre aspas simples:
{% highlight sql %}
sqlite> .mode quote
sqlite> SELECT * FROM tabela;
1,'Marcos Oliveira','2021-02-19 05:00:41'
{% endhighlight %}

+ Saídas com símbolo de igualdade:
{% highlight sql %}
sqlite> SELECT * FROM tabela;
     id = 1
   nome = Marcos Oliveira
diahora = 2021-02-19 05:00:41
{% endhighlight %}

+ Saídas em colunas:
{% highlight sql %}
sqlite> .mode column
sqlite> SELECT * FROM tabela;
id  nome             diahora
--  ---------------  -------------------
1   Marcos Oliveira  2021-02-19 05:00:41
{% endhighlight %}

+ ALterando o espaçamento das colunas:
{% highlight bash %}
sqlite> .width 12 -6
sqlite> SELECT * FROM tabela;
id                       nome  diahora            
------------  ---------------  -------------------
1             Marcos Oliveira  2021-02-19 05:00:41
{% endhighlight %}

+ Saídas no estilo tabelas para [MarkDown](https://terminalroot.com.br/2016/12/markdown.html)
{% highlight bash %}
sqlite> .mode markdown
sqlite> SELECT * FROM tabela;
| id |      nome       |       diahora       |
|----|-----------------|---------------------|
| 1  | Marcos Oliveira | 2021-02-19 05:00:41 |
{% endhighlight %}

+ Para exibir todas as tabelas do sua base de dados:
{% highlight sql %}
sqlite> .tables
tabela
sqlite> 
{% endhighlight %}

+ Exibir o caminho da sua base de dados:
{% highlight sql %}
sqlite> .databases
main: /home/marcos/nome-da-minha-base-de-dados.db r/w
sqlite>
{% endhighlight %}

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

# SQlite Studio
Existe uma interface gráfica para você manipular suas bases de dados do do SQLite que é o [SQLite Studio](https://sqlitestudio.pl/)(<https://sqlitestudio.pl/>) e é disponível para diversos [sistemas operacionais](https://github.com/pawelsalawa/sqlitestudio/releases): [Linux](https://terminalroot.com.br/linux/), [Windows](https://terminalroot.com.br/tags#windows) e [macOS](https://terminalroot.com.br/tags#macos).

No [Linux](https://terminalroot.com.br/tags#linux) você pode usar o [app-get](https://terminalroot.com.br/2020/05/conheca-o-app-get-um-gerenciador-de-appimages-via-linha-de-comando.html), por exemplo, para instalá-lo:
{% highlight bash %}
app-get --update
app-get sqlitestudio
{% endhighlight %}

Você pode importar, exportar, criar,... bases de dados e tabelas e ele é bem intuitivo. Mostramos o [uso dele](https://www.sqlite.org/cli.html) no [Curso de C++ Moderno Avançado](https://terminalroot.com.br/cpp/) onde criamos aplicativos CLI com acesso ao banco de dados tanto SQlite quanto MySQL/MariaDB  e no [Curso de Qt Moderno com C++ para Linux e Windows](https://terminalroot.com.br/cpp/) criamos dois aplicativos com acesso ao SQLite, para mais informações [clique aqui](https://terminalroot.com.br/cpp/).

Segue abaixo uma caputura de tela após importarmos a base de dados de exemplo(`nome-da-minha-base-de-dados.db`) que utilizamos aqui:

![SQLite Studio running](/assets/img/sqlite/sqlitestudio-terminalroot.jpg)

---

Até mais!


