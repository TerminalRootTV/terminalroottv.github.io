---
layout: post
title: "Gerencie suas anotações, tarefas e projetos diretamente pelo Terminal"
date: 2026-11-18 10:10:47
image: '/assets/img/go/lazymark.jpg'
description: "🔳 Feito com Go."
icon: 'ion:terminal-sharp'
iconname: 'TUI/Go'
tags:
- go
- tui
- terminal
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**LazyMark** combina editor de anotações Markdown, gerenciamento de tarefas e quadro Kanban em uma [interface de terminal (TUI)](https://terminalroot.com.br/tags#tui). Tudo isso sem depender de banco de dados proprietário: seus arquivos continuam sendo arquivos Markdown comuns.

Entre seus principais recursos estão:

- **Anotações Markdown:** crie, edite, renomeie, mova e organize suas notas.
- **Gerenciamento de tarefas:** identifique automaticamente tarefas escritas com `- [ ]` e `- [x]`.
- **Quadro Kanban:** organize tarefas nas colunas A Fazer, Em Andamento e Concluído.
- **Notas diárias:** crie automaticamente registros diários utilizando modelos.
- **Categorias:** utilize tags como `#programacao`, `#estudos` e `#projetos`.
- **Pesquisa:** encontre rapidamente informações em suas anotações.
- **Temas:** personalize a aparência com diferentes esquemas de cores.
- **Compatibilidade com Obsidian:** utilize a mesma pasta de notas nos dois aplicativos.
- **Integração MCP:** disponibilize operações para agentes de IA por meio do Model Context Protocol.


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
Existem algumas maneiras de instalar o LazyMark. Você pode utilizar os binários disponibilizados pelo projeto ou compilar o código-fonte utilizando [Go](https://terminalroot.com.br/tags#go).

Antes de começar, vale observar que a compilação a partir do código-fonte exige **Go 1.27.2 ou superior**. Também é recomendado instalar uma Nerd Font no terminal para visualizar corretamente os ícones de pastas e arquivos.

### **[Windows](https://terminalroot.com.br/tags#windows)**
No Windows, a maneira mais simples é baixar o executável disponibilizado na página de releases.

1. Acesse [LazyMark Releases](https://github.com/MathiasDrizzy/lazymark/releases).
2. Baixe o pacote correspondente ao Windows e à arquitetura do seu computador.
3. Extraia o arquivo compactado.
4. Coloque o executável em uma pasta de sua preferência.
5. Adicione essa pasta à variável de ambiente `PATH` para executar o programa de qualquer diretório.

Depois, abra o Windows Terminal, PowerShell ou CMD e execute:

{% highlight bash %}
lazymark --version
{% endhighlight %}

Se a versão for exibida, a instalação está funcionando.

**Alternativa utilizando Go:**

Caso tenha o Go instalado, execute:

{% highlight bash %}
go install github.com/MathiasDrizzy/lazymark/cmd/lazymark@latest
{% endhighlight %}

Certifique-se de que o diretório `bin` do Go esteja no `PATH` do Windows.

### **[macOS](https://terminalroot.com.br/tags#macos)**
No macOS, a instalação pode ser realizada facilmente utilizando o Homebrew.

Execute:

{% highlight bash %}
brew install mathiasdrizzy/tap/lazymark
{% endhighlight %}

Depois, verifique a instalação:

{% highlight bash %}
lazymark --version
{% endhighlight %}

Outra possibilidade é utilizar o Go:

{% highlight bash %}
go install github.com/MathiasDrizzy/lazymark/cmd/lazymark@latest
{% endhighlight %}

### **[GNU/Linux](https://terminalroot.com.br/tags#gnulinux)**
No GNU/Linux, você pode instalar o LazyMark utilizando um binário pré-compilado ou o Go.

**Opção 1 — Binário pré-compilado**

1. Acesse [a página de releases](https://github.com/MathiasDrizzy/lazymark/releases).
2. Baixe o pacote correspondente à sua distribuição e arquitetura.
3. Extraia o executável.
4. Coloque-o em um diretório presente no `PATH`, como `/usr/local/bin`.

Por exemplo, considerando que o executável já esteja extraído no diretório atual:

{% highlight bash %}
sudo install -m 755 lazymark /usr/local/bin/lazymark
{% endhighlight %}

**Opção 2 — Utilizando Go**

Se você já possui o Go instalado:

{% highlight bash %}
go install github.com/MathiasDrizzy/lazymark/cmd/lazymark@latest
{% endhighlight %}

Verifique se o diretório `$(go env GOPATH)/bin` está presente no `PATH`.

**Verificando a instalação**

Independentemente do sistema operacional, você pode verificar se tudo está funcionando com:

{% highlight bash %}
lazymark --version
{% endhighlight %}

---

## Utilização
Com o LazyMark instalado, basta abrir seu terminal e executar:

{% highlight bash %}
lazymark
{% endhighlight %}

Na primeira execução, o aplicativo cria automaticamente o diretório `~/Documents/notes`, caso ele ainda não exista, e utiliza essa pasta para armazenar suas anotações.

Se quiser utilizar outro diretório, execute:

{% highlight bash %}
lazymark --dir ~/meus-projetos
{% endhighlight %}

No Windows, por exemplo:

{% highlight bash %}
lazymark --dir C:\Users\SeuUsuario\Documents\Notas
{% endhighlight %}

---

Para mais informações acesse o [repositório](https://github.com/MathiasDrizzy/lazymark).


