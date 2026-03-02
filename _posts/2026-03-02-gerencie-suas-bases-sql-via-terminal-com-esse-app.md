---
layout: post
title: "Gerencie suas bases SQL via Terminal com esse App"
date: 2026-03-02 11:01:59
image: '/assets/img/go/pam.jpg'
description: "📟 Para desenvolvedores, DBAs e analistas que precisam de uma ferramenta leve, rápida e poderosa para diferentes bancos de dados no terminal."
icon: 'ion:terminal-sharp'
iconname: 'Go/CLI/TUI'
tags:
- go
- tui
- cli
- comando
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Pam é uma ferramenta de linha de comando ([CLI](https://terminalroot.com.br/tags#cli)) minimalista, escrita em [Go](https://terminalroot.com.br/tags#go), projetada para facilitar o gerenciamento e a execução de consultas [SQL](https://terminalroot.com.br/tags#sql) em múltiplos bancos de dados. Inspirada no universo de “The Office”, Pam homenageia a personagem que organiza tudo com eficiência.

### Principais Destaques

- **Biblioteca de Queries:** Salve e organize suas consultas SQL mais usadas, facilitando o acesso e reuso.
- **Multi-banco de dados:** Compatível com PostgreSQL, MySQL, SQLite, Oracle, SQL Server, ClickHouse e Firebird.
- **Interface [TUI (Terminal User Interface)](https://terminalroot.com.br/tags#tui):** Navegação focada no teclado, com atalhos inspirados no Vim, permitindo manipulação eficiente dos resultados das queries.
- **Edição Direta:** Atualize células, exclua linhas e edite SQL diretamente na tabela de resultados.
- **Exportação de Dados:** Exporte resultados em formatos como [CSV](https://terminalroot.com.br/2023/05/como-fazer-parser-de-csv-com-cpp-moderno.html), [JSON](https://terminalroot.com.br/2025/01/como-consumir-apis-com-curl-e-cpp-no-terminal.html), SQL, [Markdown](https://terminalroot.com.br/2026/01/notes-um-aplicativo-de-anotacoes-rapido-bonito-e-open-source.html) ou[ HTML](https://terminalroot.com.br/tags#html).
- **Parâmetros em Queries:** Suporte a consultas parametrizadas, facilitando buscas dinâmicas sem precisar reescrever SQL.


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

Você pode instalar Pam via Go, baixando o binário diretamente do repositório de releases, ou usando [Nix/NixOS](https://terminalroot.com.br/2021/12/nixos-um-sistema-operacional-para-programadores.html). 

{% highlight bash %}
go install github.com/eduardofuncao/pam/cmd/pam@latest
{% endhighlight %}

---

## Uso Básico

Após instalar, basta inicializar uma conexão com o banco de dados desejado:

{% highlight bash %}
pam init mydb postgres "postgresql://user:pass@localhost:5432/mydb"
{% endhighlight %}

Adicione queries à sua biblioteca:

{% highlight bash %}
pam add list_users "SELECT * FROM users"
{% endhighlight %}

E execute-as de forma interativa:

{% highlight bash %}
pam run list_users
{% endhighlight %}

Exemplo:

![alt text](https://private-user-images.githubusercontent.com/45571086/535609147-b62bec1d-2255-4d02-9b7f-1c99afbeb664.gif?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NzI0NjAwMDIsIm5iZiI6MTc3MjQ1OTcwMiwicGF0aCI6Ii80NTU3MTA4Ni81MzU2MDkxNDctYjYyYmVjMWQtMjI1NS00ZDAyLTliN2YtMWM5OWFmYmViNjY0LmdpZj9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNjAzMDIlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjYwMzAyVDEzNTUwMlomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWQwZmNkYjE4OGNlYWI5ZTk1MGFmM2Q3YzdhYWJhNGQ5N2VjNTZhYTk0NjIyMDY2ODg4ZWYxYjQ3MTNhNDk4N2MmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.oihmYpe5xuETxb5WPDYGJl4qRt0qqNCmGTZoP_o3Dd8) 

A interface TUI permite navegação com atalhos do tipo Vim (`j`, `k`, `h`, `l`), cópia de células (`y`), exportação de dados (`x`), edição de células (`u`), exclusão de linhas (`D`), entre outros comandos rápidos.

Pam armazena suas configurações em `~/.config/pam/config.yaml`, permitindo ajustar limites de linhas, largura de colunas e esquemas de cores para a interface.

O aplicativo oferece exemplos de comandos para conectar-se facilmente a diversos tipos de bancos de dados, incluindo PostgreSQL, [MySQL](https://terminalroot.com.br/tags#mysql), SQL Server, Oracle, SQLite, ClickHouse e Firebird.

---

Para mais informações acesso o [repositório](https://github.com/eduardofuncao/pam)


