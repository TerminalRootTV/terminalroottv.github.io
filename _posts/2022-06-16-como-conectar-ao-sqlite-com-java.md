---
layout: post
title: "Como Conectar ao SQLite com Java"
date: 2022-06-16 11:35:04
image: '/assets/img/java/java-sqlite.jpg'
description: 'Simples, rápido, seguro e portável!'
icon: 'ion:terminal-sharp'
iconname: 'Java/SQLite'
tags:
- java
- sqlite
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Muitas vezes estamos desenvolvendo aplicações que a complexidade de diversos outros bancos de dados pode influenciar na praticidade e no desempenho.

Sem dizer que salvar dados em simples arquivos pode ser inseguro e/ou mais complicado.

O bom disso é que existe o [SQLite](https://terminalroot.com.br/tags#sqlite), que é simples, rápido e seguro. Aqui no blog há quase uma série(se é que podemos chamar assim) que mostra procedimentos similares à esse em outras [linguagens de programação](https://terminalroot.com.br/tags#programacao).

Hoje vamos ver como fazer isso com [Java](https://terminalroot.com.br/tags#java), uma das linguagens mais poderosas quando o assunto é portabilidade.

Vamos lá ao passo à passo de como conectar Java ao SQLite!

---

### 1. Crie um arquivo Java, exemplo `vim Base.java`

{% highlight java %}
public class Base {
  public static void main(String[] args) {
  }
}
{% endhighlight %}

### 2. Adicione os pacotes necessários:
> Os nomes são bem intuitivos então dispensa explicação. Na dúvida use: `import java.sql.*;`

{% highlight java %}
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
{% endhighlight %}

### 3. Crie uma instância da classe `Connection` e atribua como `null`:

{% highlight java %}
Connection connection = null;
{% endhighlight %}

### 4. Crie uma exceção para conectar ao banco de dados e rodar os comandos que deseja:
> Se ainda não existir, ele criará o arquivo `base.db`

{% highlight java %}
try {
  // Cria a conexão com o banco de dados
  connection = DriverManager.getConnection("jdbc:sqlite:base.db");
  Statement statement = connection.createStatement();
  statement.setQueryTimeout(30);  // Espera só por 30 segundos para conectar

  // Roda os comandos para o SQLite
  statement.executeUpdate("DROP TABLE IF EXISTS terminalroot");
  statement.executeUpdate("CREATE TABLE terminalroot (id INTEGER, name STRING)");
  statement.executeUpdate("INSERT INTO terminalroot VALUES(1, 'Marcos Oliveira')");
  statement.executeUpdate("INSERT INTO terminalroot VALUES(2, 'James Gosling')");
  ResultSet rs = statement.executeQuery("SELECT * FROM terminalroot");
  while(rs.next()) {
    // Ler os dados inseridos
    System.out.println("NOME DO CARA  : " + rs.getString("name"));
    System.out.println("IDENTIFICAÇÃO : " + rs.getInt("id"));
  }
} catch(SQLException e) {
  // Se a mensagem de erro for: "out of memory",
  // Provavelmente erro ao criar(permissão) ou caminho do banco de dados
  System.err.println(e.getMessage());
}
{% endhighlight %}


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

### 5. Use o `finally` para executar uma ação mesmo se houver um erro após a exceção
> Para fechar o arquivo ou detalhar o erro anterior

{% highlight java %}
finally {
  try {
    if(connection != null){
      connection.close();
    }
  } catch(SQLException e) {
    // Falhou também para fechar o arquivo
    System.err.println(e.getMessage());
  }
}
{% endhighlight %}

O arquivo `Base.java` completo é esse aqui:

{% highlight java %}
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Base {
  public static void main(String[] args) {
    Connection connection = null;
    try {
      // Cria a conexão com o banco de dados
      connection = DriverManager.getConnection("jdbc:sqlite:base.db");
      Statement statement = connection.createStatement();
      statement.setQueryTimeout(30);  // Espera só por 30 segundos para conectar

      // Roda os comandos para o SQLite
      statement.executeUpdate("DROP TABLE IF EXISTS terminalroot");
      statement.executeUpdate("CREATE TABLE terminalroot (id INTEGER, name STRING)");
      statement.executeUpdate("INSERT INTO terminalroot VALUES(1, 'Marcos Oliveira')");
      statement.executeUpdate("INSERT INTO terminalroot VALUES(2, 'James Gosling')");
      ResultSet rs = statement.executeQuery("SELECT * FROM terminalroot");
      while(rs.next()) {
        // Ler os dados inseridos
        System.out.println("NOME DO CARA  : " + rs.getString("name"));
        System.out.println("IDENTIFICAÇÃO : " + rs.getInt("id"));
      }
    } catch(SQLException e) {
      // Se a mensagem de erro for: "out of memory",
      // Provavelmente erro ao criar(permissão) ou caminho do banco de dados
      System.err.println(e.getMessage());
    }

    finally {
      try {
        if(connection != null){
          connection.close();
        }
      } catch(SQLException e) {
        // Falhou também para fechar o arquivo
        System.err.println(e.getMessage());
      }
    }

  }
}
{% endhighlight %}

### 6. Agora faça o download do SQLite JDBC [aqui](https://github.com/xerial/sqlite-jdbc/releases)

> Exemplo com [wget](https://terminalroot.com.br/2019/05/aprenda-a-explorar-o-comando-wget.html) para [GNU/Linux](https://terminalroot.com.br/tags#gnu):
{% highlight bash %}
wget https://github.com/xerial/sqlite-jdbc/releases/download/3.36.0.3/sqlite-jdbc-3.36.0.3.jar
{% endhighlight %}

> Exemplo com [PowerShell](https://terminalroot.com.br/2021/12/como-instalar-powershell-no-ubuntu-e-primeiros-passos.html) para [MS/Windows](https://terminalroot.com.br/tags#windows):
{% highlight ps %}1
Invoke-WebRequest -Uri "https://github.com/xerial/sqlite-jdbc/releases/download/3.36.0.3/sqlite-jdbc-3.36.0.3.jar"
{% endhighlight %}
<!--https://lazyadmin.nl/powershell/download-file-powershell/-->

> Exemplo com [cURL](https://terminalroot.com.br/2019/10/12-dicas-para-voce-usar-o-comando-curl-como-um-ninja.html), para [BSD](https://terminalroot.com.br/tags#bsd)/[macOS](https://terminalroot.com.br/tags#macos):
{% highlight bash %}
curl -LO https://github.com/xerial/sqlite-jdbc/releases/download/3.36.0.3/sqlite-jdbc-3.36.0.3.jar
{% endhighlight %}
> Use o parâmetro `-LO`, o GitHub tem redirecionamento.

### 7. Compile seu código e após compilar, rode com o parâmetro `-classpath` e indique o **sqlite-jdbc-[version].jar** e o nome da classe:

> Se for GNU/Linux/BSD/macOS, use `.:`
{% highlight bash %}
javac Base.java
java -classpath ".:sqlite-jdbc-3.36.0.3.jar" Base
{% endhighlight %}

> Se for Microsoft Windows, use `.;`
{% highlight bash %}
javac Base.java
java -classpath ".;sqlite-jdbc-3.36.0.3.jar" Base
{% endhighlight %}

Possível e provável saída:
{% highlight bash %}
NOME DO CARA  : Marcos Oliveira
IDENTIFICAÇÃO : 1
NOME DO CARA  : James Gosling
IDENTIFICAÇÃO : 2
{% endhighlight %}

Para mais informações acesse: <https://github.com/xerial/sqlite-jdbc> .




