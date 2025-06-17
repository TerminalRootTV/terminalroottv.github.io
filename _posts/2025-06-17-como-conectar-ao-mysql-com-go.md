---
layout: post
title: "Como Conectar ao MySQL com Go"
date: 2025-06-17 11:03:00
image: '/assets/img/go/go-mysql.jpg'
description: "🐹 Episódio #08 da Série Golang."
icon: 'ion:terminal-sharp'
iconname: 'Go'
tags:
- go
- series-go
- mysql
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Dando continuidade a [Série Go](https://terminalroot.com.br/tags#series-go) veremos: [Conexão ao MySQL](https://terminalroot.com.br/mysql), existem diversos [bancos de dados](https://terminalroot.com.br/tags#sql) que [Go](https://terminalroot.com.br/tags#go) possui *drivers* para estabelecer a conexão.

No entanto, nesse exemplo veremos com **MySQL**, pois é um dos mais populares.


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

## Conexão ao MySQL
Lembre-se de antes possui, lógico, o [MySQL](https://terminalroot.com.br/tags#mysql) instalado no seu sistema.

{% highlight bash %}
mkdir myproject
cd myproject
go mod init gosql # Crie um módulo
go get -u github.com/go-sql-driver/mysql # Faça download do driver
vim main.go
{% endhighlight %}

> `main.go`

{% highlight go %}
package main

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/go-sql-driver/mysql"
)

func main() {
	dsn := "usuario:senha@tcp(127.0.0.1:3306)/nomedobanco"
	db, err := sql.Open("mysql", dsn)
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	err = db.Ping()
	if err != nil {
		log.Fatal("Não conectou:", err)
	}

	fmt.Println("Conexão bem-sucedida!")
}
{% endhighlight %}

Compilar e rodar:
{% highlight bash %}
go build main.go
./main
{% endhighlight %}
> `Conexão bem-sucedida!`

---

## Rodar comandos
Você pode fazer `INSERT`, `UPDATE`, `DELETE`, `SELECT`,... Mas, nesse exemplo vamos mostrar somente o `SELECT`:

Vamos selecionar os campos: `User` e `Password` da tabela `user` do banco de dados `mysql`.

{% highlight go %}
package main

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/go-sql-driver/mysql"
)

func main() {
	dsn := "usuario:senha@tcp(127.0.0.1:3306)/mysql"
	db, err := sql.Open("mysql", dsn)
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	rows, err := db.Query("SELECT User, Password FROM user")
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()

	for rows.Next() {
		var user, password string
		if err := rows.Scan(&user, &password); err != nil {
			log.Fatal(err)
		}
		fmt.Printf("User: %s, Password: %s\n", user, password)
	}

	if err := rows.Err(); err != nil {
		log.Fatal(err)
	}
}
{% endhighlight %}

Exemplo de saída:
{% highlight bash %}
User: mariadb.sys, Password: 
User: root, Password: *2A032F7C5BA932872F0F045E0CF6B53CF702F2C5
User: mysql, Password: invalid
{% endhighlight %}

---

Até o próximo artigo da [série](https://terminalroot.com.br/tags/#series-go)!

---

## Links Úteis
+ [**Driver MySQL para Go** (oficial)](https://github.com/go-sql-driver/mysql)
+ [**Documentação `database/sql` (padrão do Go)**](https://pkg.go.dev/database/sql)
+ [**Tutorial prático (Go + MySQL CRUD)** – fresh e direto](https://gobyexample.com/mysql)
> *(não oficial, mas bem escrito)*
+ [**Go.dev playground com exemplos de `sql`**](https://go.dev/play/)
> *(pra testar, embora sem MySQL, é bom pra mockar)*


