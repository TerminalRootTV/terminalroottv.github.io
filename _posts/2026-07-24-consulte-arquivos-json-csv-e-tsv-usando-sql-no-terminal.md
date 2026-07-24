---
layout: post
title: "Consulte arquivos JSON, CSV e TSV usando SQL no Terminal"
date: 2026-07-24 18:28:59
image: '/assets/img/go/qo.jpg'
description: "🔳 Dê adeus a awk ou scripts em Python ou importar os dados para um banco."
icon: 'ion:terminal-sharp'
iconname: 'Go/TUI'
tags:
- go
- tui
- sql
- comandos
- terminal
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

O **qo** é uma ferramenta de linha de comando escrita em [Go](https://terminalroot.com.br/tags#go) que permite executar consultas [SQL](https://terminalroot.com.br/tags#sql) sobre dados estruturados. Ela possui uma interface [TUI (Terminal User Interface)](https://terminalroot.com.br/tags#tui) interativa, onde você escreve a consulta e visualiza o resultado em tempo real, além de funcionar perfeitamente em pipelines [Unix](https://terminalroot.com.br/tags#unix).

Entre seus principais recursos estão:

+ Consulta arquivos [JSON](https://terminalroot.com.br/tags#json), [CSV](https://terminalroot.com.br/tags#csv) e TSV.
+ Utiliza sintaxe SQL baseada no [SQLite](https://terminalroot.com.br/tags#sqlite).
+ Interface interativa para testar consultas rapidamente.
+ Funciona em pipelines (`stdin` → `stdout`).
+ Projeto open source desenvolvido em Go sob licença MIT.

## Instalação

Usando [brew](https://terminalroot.com.br/tags#brew)
{% highlight bash %}
brew install qo
{% endhighlight %}

Usando o próprio Go:

{% highlight bash %}
go install github.com/kiki-ki/go-qo/cmd/qo@latest
{% endhighlight %}

Também é possível compilar o projeto diretamente do código-fonte disponível no GitHub.

## Uso básico

Imagine um arquivo `users.json` contendo uma lista de usuários.

Você pode abrir a interface interativa:

{% highlight bash %}
qo users.json
{% endhighlight %}

Ou executar uma consulta diretamente:

{% highlight bash %}
qo users.json "SELECT name, age FROM data WHERE age >= 18"
{% endhighlight %}

Como a ferramenta trabalha bem com pipelines, também é possível:

{% highlight bash %}
cat users.json | qo
{% endhighlight %}

A sintaxe SQL facilita operações como:

* `SELECT`
* `WHERE`
* `ORDER BY`
* `GROUP BY`
* `JOIN` (quando aplicável aos dados)

Isso torna a exploração de arquivos muito mais intuitiva para quem já possui familiaridade com SQL.

---

Para mais informações acesse o [repositório](https://github.com/kiki-ki/go-qo)


