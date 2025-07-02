---
layout: post
title: "Crie lindas Interfaces para o Terminal com essa lib Go"
date: 2025-07-02 20:16:19
image: '/assets/img/go/bubbles-go.jpg'
description: "🫧 Sua experiência com TUI será elevada a outra dimensão!"
icon: 'ion:terminal-sharp'
iconname: 'Go'
tags:
- go
- series-go
- tui
- cli
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Uma das coisas que sempre me fascinou é utilitários para o [terminal](https://terminalroot.com.br/tags#terminal), seja modo [cli](https://terminalroot.com.br/tags#cli), bem como, [TUI](https://terminalroot.com.br/tags#tui), não é a toa que esse blog tem esse nome 😃 .

E uma das bibliotecas mais maneiras que existe é a **Charmbracelet Bubbles**. 

Já faz alguns anos que eu testo ela, mas esse ano decidi começar aprender de fato, pois apesar de eu fazer muitas coisas, mas com [C++](https://terminalroot.com.br/tags#cpp), Bubbles é para [Go](https://terminalroot.com.br/tags#go) e ainda preciso amadurecer de fato com Golang, eis um dos motivos que criei até essa [série](https://terminalroot.com.br/tags#series-go) aqui no blog, pois eu mesmo irei utilizá-la frequentemente para consultas rápidas! 😎 

O **Bubbles** é uma coleção de componentes TUI que facilita a construção de interfaces no terminal com lógica reativa e visual atrativo. 

Ele inclui:

* Spinners (atividade)
* Text input e textarea
* Progress bar
* Paginator
* Viewport (rolagem de conteúdo)
* Listas filtráveis/paginadas
* File picker
* Timer / Stopwatch
* Mini help
* Gerenciamento de keybindings


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

## Utilização
Pra você já ter certeza que ela realmente é incrível, vamos compilar esse exemplo de **Textarea** com **Bubbles**:

### 01. Crie um projeto básico e inicie um módulo
{% highlight bash %}
mkdir textarea
cd textarea
go mod init textarea
go get github.com/charmbracelet/bubbles/textarea
{% endhighlight %}

Agora, ainda dentro do seu projeto crie um arquivo, exemplo: `main.go` e cole o conteúdo abaixo:

{% highlight go %}
package main

// A simple program demonstrating the textarea component from the Bubbles
// component library.

import (
	"fmt"
	"log"

	"github.com/charmbracelet/bubbles/textarea"
	tea "github.com/charmbracelet/bubbletea"
)

func main() {
	p := tea.NewProgram(initialModel())

	if _, err := p.Run(); err != nil {
		log.Fatal(err)
	}
}

type errMsg error

type model struct {
	textarea textarea.Model
	err      error
}

func initialModel() model {
	ti := textarea.New()
	ti.Placeholder = "Once upon a time..."
	ti.Focus()

	return model{
		textarea: ti,
		err:      nil,
	}
}

func (m model) Init() tea.Cmd {
	return textarea.Blink
}

func (m model) Update(msg tea.Msg) (tea.Model, tea.Cmd) {
	var cmds []tea.Cmd
	var cmd tea.Cmd

	switch msg := msg.(type) {
	case tea.KeyMsg:
		switch msg.Type {
		case tea.KeyEsc:
			if m.textarea.Focused() {
				m.textarea.Blur()
			}
		case tea.KeyCtrlC:
			return m, tea.Quit
		default:
			if !m.textarea.Focused() {
				cmd = m.textarea.Focus()
				cmds = append(cmds, cmd)
			}
		}

	// We handle errors just like any other message
	case errMsg:
		m.err = msg
		return m, nil
	}

	m.textarea, cmd = m.textarea.Update(msg)
	cmds = append(cmds, cmd)
	return m, tea.Batch(cmds...)
}

func (m model) View() string {
	return fmt.Sprintf(
		"Tell me a story.\n\n%s\n\n%s",
		m.textarea.View(),
		"(ctrl+c to quit)",
	) + "\n\n"
}
{% endhighlight %}

Compile e rode:
{% highlight bash %}
go build main.go
./main
{% endhighlight %}

A saída será similar ao gif abaixo. Teste escrevendo alguma coisa, pressionar *[enter]* cria uma nova linha.

![Textarea Charmbracelet Bubbles](/assets/img/go/bubbles-go.gif) 

Incrível, né?!

> Utilizar módulos Go geralmente é criado uma pasta na raiz do seu usuário, existem arquivos com permissão de sistema, então para remover o diretório, rode:
> `sudo rm -rf ~/go/`

---

O Bubbles usa a arquitetura Elm: `model`, `init`, `update`, `view` e fornece os componentes prontos, basta integrá-los no modelo do [Bubble Tea](https://github.com/charmbracelet/bubbletea) e o exemplo que vimos foi retirado [daqui](https://github.com/charmbracelet/bubbletea/blob/main/examples/textarea/main.go).

Para mais informações, acesse: <https://github.com/charmbracelet/bubbles>.


