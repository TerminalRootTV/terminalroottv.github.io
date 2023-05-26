---
layout: post
title: "Como Conectar ao SQLite com Python"
date: 2022-01-04 15:13:57
image: '/assets/img/python/sqlite-python.jpg'
description: 'Simples e rápido!'
icon: 'ion:terminal-sharp'
iconname: 'Python/SQLite'
tags:
- python
- sqlite
---

![Como Conectar ao SQLite com Python](/assets/img/python/sqlite-python.jpg)

---

Na postagem anterior: [Como Conectar ao SQLite com Lua](https://terminalroot.com.br/2022/01/como-conectar-ao-sqlite-com-lua.html) nós fizemos esse mesmo procedimento com [Lua](https://terminalroot.com.br/lua). Pode ser que informações contidas lá ajude a você a usar e instalar o [SQLite](https://terminalroot.com.br/2021/02/como-utilizar-o-sqlite.html) e alguns processos.

Nesse artigo serei um pouco mais breve. Ou seja, postarei somente o código, pois dicas de instalação e utilização do SQLite você pode obter [aqui](https://terminalroot.com.br/2021/02/como-utilizar-o-sqlite.html).

---

# Código pronto
O código é bem simples, basta uma lida no mesmo e nos comentários e já é possível entender e/ou implementar no seu projeto, segue:

{% highlight python %}
import sqlite3
import datetime
import os

# Se o arquivo não existir ele cria e conecta, senão só conecta
con = sqlite3.connect('example.db')
cur = con.cursor()

# Cria a tabela no banco de dados do arquivo acima se a tabela não existir
cur.execute('''CREATE TABLE IF NOT EXISTS stocks
               (date text, trans text, symbol text, qty real, price real)''')

# Esse bloco do código eu criei só pra caso você rodar o script mais de uma vez
# ele só insere os dados se o arquivo /tmp/insertok não existir e cria o arquivo
# Só insere os dados se o arquivo /tmp/insertok não existir 
if os.path.isfile('/tmp/insertok'):
    print("", end ="")
else:
    cur.execute("INSERT INTO stocks VALUES ('2006-01-05','BUY','RHAT',100,35.14)")
    f = open("/tmp/insertok", "a")
    f.write("insertok")
    f.close()

# valida as alterações feitas
con.commit()

# Seleciona os dados da tabela do banco de dados e imprime na tela
for row in cur.execute('SELECT * FROM stocks ORDER BY price'):
    print(row[0])
    data = row[0] # criei isso só para formatar a saída para dd/mm/yyyy
    print(row[1])
    print(row[2])
    print(row[3])
    print(row[4])
    #print(row)
con.close()

# formtando a data
output = datetime.datetime.strptime(data, '%Y-%m-%d')
print(output.date().strftime("%d/%m/%Y"))
{% endhighlight %}

---

# Veja também 
## [20 Livros sobre Linguagem SQL que você deveria ler](https://terminalroot.com.br/2023/05/20-livros-sobre-linguagem-sql-que-voce-deveria-ler.html)

---

# Links úteis
+ <https://docs.python.org/3/library/sqlite3.html>
+ <https://docs.python.org/3/library/datetime.html#datetime.datetime.fromisoformat>
+ <https://docs.python.org/3/library/datetime.html>



