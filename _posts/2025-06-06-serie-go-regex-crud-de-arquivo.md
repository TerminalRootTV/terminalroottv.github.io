---
layout: post
title: "Série Go - RegEx, CRUD de Arquivo"
date: 2025-06-06 12:07:52
image: '/assets/img/go/series-go-07.jpg'
description: "🚀 Episódio 07"
icon: 'ion:terminal-sharp'
iconname: 'Série Go'
tags:
- series-go
- go
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Dando continuidade a [Série Go](https://terminalroot.com.br/tags#series-go) veremos: [Expressões Regulares](https://terminalroot.com.br/tags#regex), além de ver como: Criar, Ler, Atualizar e Deletar arquivos com [Go](https://terminalroot.com.br/tags#go).


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

## Expressões Regulares em Go (Golang)
Go possui suporte nativo a expressões regulares através do pacote `regexp`. Ele oferece funcionalidade para compilação, correspondência e manipulação de padrões regex.

Para usar RegEx em Go é necessário importar o pacote: `"regexp"`. Vamos ver exemplos:

### 01. Verificar se uma palavra está em uma string:
`re` é uma `string` e deve usar o método `MatchString`.

Você precisa compilar a expressão regular com `regexp.Compile` ou `regexp.MustCompile`:

{% highlight go %}
package main

import (
	"fmt"
	"regexp"
)

func main() {
	re := regexp.MustCompile("RegEx")
	if re.MatchString("Meu aprendizado de RegEx com Go") {
		fmt.Println("Sim!")
	}
}
{% endhighlight %}

Ou, se quiser capturar `matched`:

{% highlight go %}
package main

import (
	"fmt"
	"regexp"
)

func main(){
	re := regexp.MustCompile("RegEx")
	matched := re.MatchString("Meu aprendizado de RegEx com Go")
	if matched {
		fmt.Println("Sim!")
	}
}
{% endhighlight %}

## 02. Substituir a palavra `RegEx` por `Expressões Regulares`:
{% highlight go %}
package main

import (
	"fmt"
	"regexp"
)

func main() {
	re := regexp.MustCompile("RegEx")
	texto := "Meu aprendizado de RegEx com Go"
	resultado := re.ReplaceAllString(texto, "Expressões Regulares")
	fmt.Println(resultado)
}
{% endhighlight %}

## 03. Remover tags [HTML](https://terminalroot.com.br/tags#html) de uma string:
{% highlight go %}
package main

import (
	"fmt"
	"regexp"
)

func main() {
	html := "<h1>Título</h1>\n" +
	"<p>Meu Parágrafo</p>\n" +
	"<a href='https:\\meulink.com'>Meu Link</a>"

	re := regexp.MustCompile("<[^>]*>")
	limpo := re.ReplaceAllString(html, "")
	fmt.Println(limpo)
}
{% endhighlight %}

**DICA**: Além de concatenar(`+`) em múltiplas linhas uma string. Você também pode usar *backticks*(sinal de crase do Português):
> Observação que se você não colar à esquerda, ele irá interpretar os espaços, exemplo:
{% highlight go %}
	html := 
`<h1>Título</h1>
<p>Meu Parágrafo</p>
<a href='https:\\meulink.com'>Meu Link</a>`
{% endhighlight %}

Métodos úteis:
+ `regexp.Compile(`\regex`)` - Compila uma regex
+ `re.FindString("abc123def")` - Retorna a primeira ocorrência
+ `re.FindAllString("target1 target2 target3", -1)` - Retorna todas as ocorrências

Exemplos:
{% highlight go %}
re := regexp.MustCompile(`\d+`)
fmt.Println(re.MatchString("abc123"))               // true
fmt.Println(re.FindString("abc123def456"))          // "123"
fmt.Println(re.FindAllString("a1 b22 c333", -1))    // ["1" "22" "333"]
fmt.Println(re.ReplaceAllString("abc123", "#"))     // "abc#"
{% endhighlight %}

> **OBSERVAÇÕES**: 
+ `regexp` de Go é baseado em RE2, sem suporte a backtracking nem lookaheads/lookbehinds.
+ Não há suporte direto a flags inline como `(?i)`. Use `MustCompile` com prefixos como `(?i)` para ignorar case.


<!-- RECTANGLE LARGE -->
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

---

## CRUD de Arquivo
CRUD é a sigla para: **C**reate **R**ead **U**pdate and **D**elete. Geralmente usado para bancos de dados, mas por questões didática vamos ver como: Criar/Inserir, Ler, Atualizar e Deletar dados em arquivos com Go.

### 01. Criar um arquivo:
{% highlight go %}
package main

import (
	"os"
)

func main() {
	poema := `Ainda falta descobrir a serenidade
Ainda falta dominar a ansiedade
E aprender a esperar
Ainda me falta pacificar
Deixando o coração ficar mudo
Ainda falta aprender quase tudo
`

	err := os.WriteFile("poema.txt", []byte(poema), 0644)
	if err != nil {
		panic(err)
	}
}
{% endhighlight %}
> `ls poema.txt && cat poema.txt`

### 02. Ler um arquivo:
{% highlight go %}
package main

import (
	"fmt"
	"os"
)

func main() {
	data, err := os.ReadFile("poema.txt")
	if err != nil {
		fmt.Println("Erro ao ler o arquivo:", err)
		return
	}
	fmt.Print(string(data))
}
{% endhighlight %}

### 03. Inserir uma linha no arquivo:
#### Na 1º linha:
> Inserir a palavra: `Meu Aprendizado:`

{% highlight go %}
package main

import (
	"os"
)

func main() {
	const prefixo = "Meu Aprendizado:\n"
	const file    = "poema.txt"

	conteudo, err := os.ReadFile(file)
	if err != nil {
		panic(err)
	}

	novoConteudo := append([]byte(prefixo), conteudo...)

	err = os.WriteFile(file, novoConteudo, 0644)
	if err != nil {
		panic(err)
	}
}
{% endhighlight %}

#### Na 3º linha:
> Inserir a palavra: `---[ PAUSA ]---:`

{% highlight go %}
package main

import (
	"os"
	"strings"
)

func main() {
	const insercao = "\n---[ PAUSA ]---\n"
	const file    = "poema.txt"

	data, err := os.ReadFile(file)
	if err != nil {
		panic(err)
	}

	linhas := strings.Split(string(data), "\n")

	if len(linhas) < 2 {
		// Garante ao menos 2 quebras para chegar à linha 3
		for len(linhas) < 2 {
			linhas = append(linhas, "")
		}
	}

	// Insere após a segunda linha (posição 2)
	linhas = append(linhas[:2], append([]string{insercao}, linhas[2:]...)...)

	conteudoFinal := strings.Join(linhas, "\n")

	err = os.WriteFile(file, []byte(conteudoFinal), 0644)
	if err != nil {
		panic(err)
	}
}
{% endhighlight %}

#### Na ÚLTIMA linha:
> Inserir a palavra: `---[ FINAL ]---:`

{% highlight go %}
package main

import (
	"os"
	"strings"
)

func main() {
	const insercao = "---[ FINAL ]---"
	const file    = "poema.txt"

	data, err := os.ReadFile(file)
	if err != nil {
		panic(err)
	}

	linhas := strings.Split(string(data), "\n")

	// Se terminar com linha vazia (quebra final), remova temporariamente
	temQuebraFinal := false
	if linhas[len(linhas)-1] == "" {
		linhas = linhas[:len(linhas)-1]
		temQuebraFinal = true
	}

	if len(linhas) == 0 {
		linhas = []string{insercao}
	} else {
		// Use - 1 para inserir antes da última linha
		//linhas = append(linhas[:len(linhas)-1], append([]string{insercao}, linhas[len(linhas)-1:]...)...)

		// Insere na última linha:
		linhas = append(linhas[:len(linhas)], append([]string{insercao}, linhas[len(linhas):]...)...)
	}

	resultado := strings.Join(linhas, "\n")
	if temQuebraFinal {
		resultado += "\n"
	}

	err = os.WriteFile(file, []byte(resultado), 0644)
	if err != nil {
		panic(err)
	}
}
{% endhighlight %}

### 03. Remover linha(s):
#### Todas as linhas que possui a palavra: `TEMPORARIO`:
{% highlight go %}
package main

import (
	"os"
	"strings"
)

func main() {
	const file = "poema.txt"
	const palavra = "TEMPORARIO"

	data, err := os.ReadFile(file)
	if err != nil {
		panic(err)
	}

	linhas := strings.Split(string(data), "\n")
	var resultado []string

	for _, linha := range linhas {
		if !strings.Contains(linha, palavra) {
			resultado = append(resultado, linha)
		}
	}

	final := strings.Join(resultado, "\n")

	err = os.WriteFile(file, []byte(final), 0644)
	if err != nil {
		panic(err)
	}
}
{% endhighlight %}

#### Remover linha específica:
> Linha 3, por exemplo:

{% highlight go %}
package main

import (
	"os"
	"strings"
)

func main() {
	const file = "poema.txt"

	data, err := os.ReadFile(file)
	if err != nil {
		panic(err)
	}

	linhas := strings.Split(string(data), "\n")

	if len(linhas) >= 3 {
		linhas = append(linhas[:2], linhas[3:]...) // remove linha 3 (índice 2)
	}

	final := strings.Join(linhas, "\n")

	err = os.WriteFile(file, []byte(final), 0644)
	if err != nil {
		panic(err)
	}
}
{% endhighlight %}

### 04. Deletar um arquivo:
{% highlight go %}
package main

import (
	"fmt"
	"os"
)

func main() {
	const file = "poema.txt"
	err := os.Remove(file)
	if err != nil {
		//panic(err)
		// Ou somente:
		fmt.Println("O arquivo: '" + file + "' não existe.")
	}
}
{% endhighlight %}

---

Até o próximo artigo da série!

