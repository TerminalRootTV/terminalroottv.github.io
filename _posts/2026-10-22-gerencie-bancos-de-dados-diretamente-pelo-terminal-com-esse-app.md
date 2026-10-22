---
layout: post
title: "Gerencie Bancos de Dados diretamente pelo Terminal com esse App"
date: 2026-10-22 18:52:25
image: '/assets/img/sql/sqlmux.jpg'
description: "🔳 Navegue por tabelas, escreva consultas SQL, visualize resultados e edite registros."
icon: 'ion:terminal-sharp'
iconname: 'Terminal/Go'
tags:
- tui
- terminal
- sql
- mysql
- postgresql
- sqlite
- redis
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

O **sqlmux** é um cliente de banco de dados com interface de [terminal (TUI)](https://terminalroot.com.br/tags#tui), desenvolvido em [Go](https://terminalroot.com.br/tags#go), que oferece uma experiência de trabalho inspirada no tmux e no [Vim](https://terminalroot.com.br/vim).

Entre seus principais recursos estão:

- **Consultas SQL:** editor com atalhos do Vim, autocompletar e formatação.
- **Navegação por tabelas:** filtros, ordenação, paginação e seleção de colunas.
- **Edição de registros:** altere células e salve mudanças em uma transação.
- **Múltiplos painéis:** organize consultas e conexões em um mesmo ambiente.
- **Paleta de comandos:** encontre e execute ações rapidamente.
- **Personalização:** configure atalhos, temas e ícones.
- **Segurança:** suporte a conexões somente leitura e confirmações para operações perigosas.

O projeto oferece suporte a PostgreSQL, [MySQL](https://terminalroot.com.br/tags#mysql), [SQLite](https://terminalroot.com.br/tags#sqlite) e Redis, conforme a documentação atual do repositório.


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
### [Windows](https://terminalroot.com.br/tags#windows)

Uma opção prática é utilizar o npm, que faz parte do ecossistema Node.js.

**Pré-requisito:** ter o Node.js e o npm instalados.

Abra o PowerShell ou o Windows Terminal e execute:

{% highlight bash %}
npm install -g sqlmux
{% endhighlight %}

Para experimentar sem uma instalação global, utilize:

{% highlight bash %}
npx sqlmux
{% endhighlight %}

Depois, confira se o comando está disponível:

{% highlight bash %}
sqlmux --help
{% endhighlight %}

Se o comando não for reconhecido, confira se o diretório dos executáveis globais do npm está no `PATH` do Windows.

### [macOS](https://terminalroot.com.br/tags#macos)

Se você utiliza o Homebrew, a instalação é simples.

Execute no Terminal:

{% highlight bash %}
brew install kackerx/tap/sqlmux
{% endhighlight %}

Em seguida, confira a instalação:

{% highlight bash %}
sqlmux --help
{% endhighlight %}

O projeto também disponibiliza binários para macOS nas arquiteturas `amd64` e `arm64`, na página oficial de releases.

### [GNU/Linux](https://terminalroot.com.br/tags#gnulinux)

É necessário ter o Go 1.26 ou superior instalado:
{% highlight bash %}
go install github.com/kackerx/sqlmux/cmd/sqlmux@latest
{% endhighlight %}

Se o executável não for encontrado, confira se o diretório de instalação do Go está incluído no `PATH`.

Outra alternativa é baixar um binário pronto para sua arquitetura na página de releases:

[https://github.com/kackerx/sqlmux/releases](https://github.com/kackerx/sqlmux/releases)

O projeto publica arquivos para Linux e macOS, nas arquiteturas `amd64` e `arm64`, acompanhados de checksums para verificação.

---

## Primeiros passos
Com o sqlmux instalado, chegou a hora de utilizá-lo.

No terminal, execute:

{% highlight bash %}
sqlmux
{% endhighlight %}

Para experimentar rapidamente, você pode abrir um arquivo SQLite:

{% highlight bash %}
sqlmux ./app.db
{% endhighlight %}

---

Para mais informações acesse o [repositório](https://github.com/kackerx/sqlmux).



