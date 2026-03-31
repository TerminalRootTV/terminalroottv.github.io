---
layout: post
title: "Conheça o DuckDB, um banco de dados moderno"
date: 2025-03-06 11:39:26
image: '/assets/img/sql/duckdb.jpg'
description: "🦆 E comparação de usabilidade a comandos do GNU/UNIX."
icon: 'ion:terminal-sharp'
iconname: 'Banco de Dados'
tags:
- sql
- duckdb
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

O **DuckDB** é um sistema de gerenciamento de banco de dados relacional (RDBMS) orientado a colunas de código aberto, lançado pela primeira vez em 2019.

Ele foi projetado para <u>fornecer alto desempenho em consultas complexas em grandes bancos de dados em configuração incorporada</u>, como combinar tabelas com centenas de colunas e bilhões de linhas. Ao contrário de outros bancos de dados incorporados (por exemplo, [SQLite](https://terminalroot.com.br/tags#sql)).

> O DuckDB não compete com os DBMS tradicionais como **MSSQL**, **PostgreSQL** etc. 

O DuckDB usa um mecanismo de processamento de *consultas vetorizadas*. O DuckDB é especial entre os sistemas de gerenciamento de banco de dados porque não tem nenhuma dependência externa e pode ser construído com apenas um compilador [C++11](https://terminalroot.com.br/tags#cpp). 

O DuckDB também se desvia do modelo tradicional *Cliente-Servidor* ao ser executado dentro de um processo host (ele tem ligações, por exemplo, para um interpretador [Python](https://terminalroot.com.br/tags#python) com a capacidade de colocar dados diretamente em matrizes [NumPy](https://terminalroot.com.br/2022/01/numcpp-o-numpy-para-cpp.html).

Existem inúmeras situações em que usar DuckDB pode ser vantajoso. Abaixo veremos como instalar o DuckDB, que pode ser instalado em qualquer [sistema operacional](https://terminalroot.com.br/tags#sistemaoperacional), veremos como instalar no [Ubuntu](https://terminalroot.com.br/tags#ubuntu) e no [Windows](https://terminalroot.com.br/tags#windows), além de dicas de usabilidade e comparativos com os [comandos](https://terminalroot.com.br/tags#comandos) do [GNU](https://terminalroot.com.br/tags#gnu)/[UNIX](https://terminalroot.com.br/tags#unix).


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

## Instalação 
O DuckDB, como foi dito, pode ser usado em qualquer sistema operacional. O procedimento se resume em fazr download e mover para a pasta do sistema responsável para armazenar os programas, no entanto, é possível também instalar via [pip](https://pypi.org/project/pip/). 

### Exemplo no [Ubuntu](https://terminalroot.com.br/tags#ubuntu):
#### 01. **Atualize o sistema:**
Primeiro, é uma boa prática atualizar o sistema antes de instalar novos pacotes.
{% highlight bash %}
sudo apt update && sudo apt upgrade -y
{% endhighlight %}

#### 02. **Baixe o DuckDB:**
Você pode baixar o DuckDB diretamente do site oficial ou usar um gerenciador de pacotes como o `pip` se preferir a versão Python.
- **Método 1: Baixar o binário diretamente:**
> Exemplo baseado na versão atual(v1.2.1) de acordo com a data de publicação desse artigo. Para versões mais recente acesse a página de releases no GitHub.

{% highlight bash %}
wget https://github.com/duckdb/duckdb/releases/download/v1.2.1/duckdb_cli-linux-amd64.zip
unzip duckdb_cli-linux-amd64.zip
sudo mv duckdb /usr/local/bin/
{% endhighlight %}

- **Método 2: Instalar via pip (para uso com Python):**
{% highlight bash %}
pip install duckdb
{% endhighlight %}
> Observação: O `pip` requer um ambiente virtual, isso pode dificultar o uso DuckDB.

#### 03. **Verifique a instalação:**
Após a instalação, você pode verificar se o DuckDB está instalado corretamente executando:
{% highlight bash %}
duckdb --version
{% endhighlight %}

### Instalação no [Windows](https://terminalroot.com.br/tags#windows)
#### 01. **Baixe o DuckDB:**
- Acesse o [repositório oficial do DuckDB no GitHub](https://github.com/duckdb/duckdb/releases).
- Baixe o arquivo `.zip` correspondente à versão mais recente para Windows.

#### 02. **Extraia o arquivo:**
- Extraia o conteúdo do arquivo `.zip` para uma pasta de sua escolha, por exemplo, `C:\duckdb`.

#### 03. **Adicione ao `PATH`:**
- Para facilitar o uso, você pode adicionar o caminho da pasta onde o DuckDB foi extraido ao seu PATH.
- Abra o "Painel de Controle" > "Sistema e Segurança" > "Sistema" > "Configurações avançadas do sistema" > "Variáveis de ambiente".
- Na seção "Variáveis do sistema", encontre a variável `Path`, selecione-a e clique em "Editar".
- Adicione o caminho da pasta onde o DuckDB foi extraido (por exemplo, `C:\duckdb`).

#### 04. **Verifique a instalação:**
- Abra o Prompt de Comando ou PowerShell e execute:
{% highlight bash %}
  duckdb --version
{% endhighlight %}


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

## Como utilizar o DuckDB
Aqui estão alguns exemplos de consultas no DuckDB e suas equivalências aproximadas em comandos [GNU](https://terminalroot.com.br/tags#gnu)/[UNIX](https://terminalroot.com.br/tags#unix):

#### 01. **Selecionar todas as linhas de uma tabela:**
- **DuckDB:**
{% highlight sql %}
SELECT * FROM tabela;
{% endhighlight %}
- **GNU/UNIX (usando `cat`):**
{% highlight bash %}
cat arquivo.csv
{% endhighlight %}

#### 02. **Filtrar linhas com base em uma condição:**
- **DuckDB:**
{% highlight sql %}
SELECT * FROM tabela WHERE coluna = 'valor';
{% endhighlight %}
- **GNU/UNIX (usando `grep`):**
{% highlight bash %}
grep 'valor' arquivo.csv
{% endhighlight %}

#### 03. **Contar o número de linhas:**
- **DuckDB:**
{% highlight sql %}
SELECT COUNT(*) FROM tabela;
{% endhighlight %}
- **GNU/UNIX (usando `wc -l`):**
{% highlight bash %}
wc -l arquivo.csv
{% endhighlight %}

#### 04. **Agrupar e contar:**
- **DuckDB:**
{% highlight sql %}
SELECT coluna, COUNT(*) FROM tabela GROUP BY coluna;
{% endhighlight %}
- **GNU/UNIX (usando `awk` e `sort`):**
{% highlight bash %}
awk -F, '{print $1}' arquivo.csv | sort | uniq -c
{% endhighlight %}

#### 05. **Ordenar resultados:**
- **DuckDB:**
{% highlight sql %}
SELECT * FROM tabela ORDER BY coluna;
{% endhighlight %}
- **GNU/UNIX (usando `sort`):**
{% highlight bash %}
sort -t, -k1 arquivo.csv
{% endhighlight %}

---

## Utilizando o DuckDB pelo [REPL](https://terminalroot.com.br/2025/01/crie-comandos-repl-facilmente.html)
Para usar o DuckDB diretamente via linha de comando, basta invocar o comando `duckdb`. Abaixo um exemplo criação de banco de dados, tabela, update, select e entre outros:
{% highlight sql %}
v1.2.1 8e52ec4395
Enter ".help" for usage hints.
Connected to a transient in-memory database.
Use ".open FILENAME" to reopen on a persistent database.
D SHOW DATABASES;
┌───────────────┐
│ database_name │
│    varchar    │
├───────────────┤
│ memory        │
└───────────────┘
D CREATE TABLE terminalroot (id INTEGER, name STRING);
D INSERT INTO terminalroot VALUES(1, 'Marcos Oliveira');
D INSERT INTO terminalroot VALUES(2, ' Mark Raasveldt');
D INSERT INTO terminalroot VALUES(3, 'Hannes Mühleisen');
D SELECT * FROM terminalroot;
┌───────┬──────────────────┐
│  id   │       name       │
│ int32 │     varchar      │
├───────┼──────────────────┤
│     1 │ Marcos Oliveira  │
│     2 │  Mark Raasveldt  │
│     3 │ Hannes Mühleisen │
└───────┴──────────────────┘
D UPDATE terminalroot SET name='Mark Raasveldt' WHERE id = 2;
D SELECT * FROM terminalroot;
┌───────┬──────────────────┐
│  id   │       name       │
│ int32 │     varchar      │
├───────┼──────────────────┤
│     1 │ Marcos Oliveira  │
│     2 │ Mark Raasveldt   │
│     3 │ Hannes Mühleisen │
└───────┴──────────────────┘
D 
{% endhighlight %}

> Para sair digite `.exit`.

---

Existe um ecossistema enorme que envolve o DuckDB e é possível até testá-lo *online*. Abaixo segue links interessantes para você consultar!

+ <https://duckdb.org/>
+ <https://github.com/duckdb/duckdb>
+ <https://duckdb.org/docs/stable/clients/wasm/overview.html>
+ <https://github.com/duckdb/duckdb-web>


