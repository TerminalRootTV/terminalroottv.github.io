---
layout: post
title: "O que é SGBD ?"
date: 2019-08-30 10:51:16
image: '/assets/img/mysql/sgbd.jpg'
description: 'Vamos ver conceitos e dicas SQL.'
main-class: 'sql'
tags:
- sql
- sgbd
- mysql
---

![Banco de Dados Relacional Ilustrativo](/assets/img/mysql/sgbd.jpg)

**SGBD** significa **S**istemas de **G**erenciamento de **B**anco de **D**ados (*em inglês*, Data Base Management System - DBMS), é uma coleção de programas que permitem ao usuário definir, construir e manipular Bancos de Dados para as mais diversas finalidades.

Um **SGBD** deve possuir as seguintes características:
1. **Controle de Redundâncias** - Armazenamento em um único local evitando duplicações descontroladas;
2. **Compartilhamento de Dados**;
3. **Controle de Acesso**;
4. **Interfaceamento** - Disponibilizar versões gráficas e não somente modo texto;
5. **Esquematização** - Tornar compreensível as relações entre tabelas;
6. **Controle de Integridade**;
7. **Cópias de Segurança**

Em certos casos pode ocorrer de um SGBD não obedecer uma ou outra regra das vistas acima, mas ainda assim continuarsendo considerado um SGBD. Porém alguns "Bancos de Dados" atualmente comercializados não são SGBD reais, justamente por não atenderem algumas dessas características. Existem vários tipos de bancos de dados (hierárquico, orientado ao objeto, em redes e relacional), o MySQL , por exemplo é do tipo Relacional .

O Modelo de Dados relacional representa os dados contidos em um Banco de Dados através de relações . Cada relação é uma tabela, exemplo abaixo:

```sql
mysql> SELECT * FROM developers;
+----+-----------------+-----------------------+---------------+
| id | name            | email                 | job           |
+----+-----------------+-----------------------+---------------+
|  1 | Joe Smith       | joesmith@gentoo.org   | toolchain     |
|  2 | Chris White     | chriswhite@gentoo.org | documentation |
|  3 | Sam Smith       | samsmith@gentoo.org   | amd64         |
|  4 | Marcos Oliveira | marcos@gentoo.org     | cpp           |
+----+-----------------+-----------------------+---------------+
4 rows in set (0,00 sec)

mysql> 
```

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

## SQL

Para se utilizar, administrar, e trabalhar com um banco de dados é utilizada uma linguagem padrão, que a maior parte dosSGBD aceitam. Essa linguagem é a SQL (**S**tructured **Q**uery **L**anguage - Linguagem de Consulta Estruturada, em português) .

### Exemplo básico de comandos SQL

O mais básico comando é gerar um [Hello, world!](https://en.wikipedia.org/wiki/"Hello,_World!"_program)
```sql
SELECT "Hello, World!";
```

## Exemplos de SGBDs

+ PostgreSQL
+ CouchDB
+ Firebird
+ HSQLDB
+ IBM DB2
+ IBM Informix
+ mSQL
+ MySQL
+ MariaDB
+ Oracle
+ SQL-Server
+ TinySQL
+ ZODB
+ JADE
+ Sybase
+ Microsoft Access (Alguns o consideram SGBD mas é um SGBDR)
+ Microsoft Visual Foxpro
+ MongoDB

Por hoje é só, no próximo artigo sobre Banco de Dados, vamos diponibilizar arquivos e comandos avançados mais utilizados em testes de seleção de empregos.

Espero que tenha gostado e se puder contribuir compartilhando esse artigo, será de grande valor para nós!

Abraços!
    
