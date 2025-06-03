---
layout: post
title: "Como Executar Comandos da Shell com Go"
date: 2025-06-03 17:57:23
image: '/assets/img/go/series-go-06.jpg'
description: "🚀 Episódio 06 da Série Go"
icon: 'ion:terminal-sharp'
iconname: 'Terminal Root'
tags:
- series-go
- go
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Dando continuidade a [Série Go](https://terminalroot.com.br/tags#series-go) veremos que executar *comandos da shell* com e obter conteúdo de variáveis de ambiente [Go](https://terminalroot.com.br/tags#go).


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

## Executar Comandos da [Shell](https://terminalroot.com.br/tags#shell)
Para executar *comandos da shell*, você pode usar o pacote `os/exec`, que fornece funcionalidades para criar, executar e manipular comandos externos. Aqui está um exemplo de como executar um comando da shell e capturar sua saída:

{% highlight go %}
package main

import (
    "fmt"
    "os/exec"
)

func main() {
    // Comando a ser executado (exemplo: "ls -l")
    cmd := exec.Command("ls", "-l")

    // Executa o comando e captura a saída
    output, err := cmd.Output()
    if err != nil {
        fmt.Println("Erro ao executar o comando:", err)
        return
    }

    // Imprime a saída do comando
    fmt.Println(string(output))
}
{% endhighlight %}

Neste exemplo, o comando ls -l é executado e a saída é capturada e impressa. Vamos detalhar os passos:

Criação do Comando:

{% highlight go %}
cmd := exec.Command("ls", "-l")
{% endhighlight %}
Aqui, exec.Command cria um comando para ser executado. O primeiro argumento é o nome do comando (ls) e os demais são os argumentos do comando (-l).

Execução do Comando e Captura da Saída:
{% highlight go %}
output, err := cmd.Output()
cmd.Output() executa o comando e captura sua saída padrão. Se houver algum erro durante a execução, ele será retornado em err.
{% endhighlight %}

Tratamento de Erro:
{% highlight go %}
if err != nil {
    fmt.Println("Erro ao executar o comando:", err)
    return
}
{% endhighlight %}
Se ocorrer um erro, ele é impresso e a função retorna.

Impressão da Saída:
{% highlight go %}
fmt.Println(string(output))
{% endhighlight %}
A saída capturada, que é um slice de bytes, é convertida para string e impressa.

##### Executando Comandos com Input, Output e Error Separados
Se você precisar de mais controle sobre o comando, como separar a saída padrão e a saída de erro, pode usar os métodos cmd.StdoutPipe e cmd.StderrPipe. Aqui está um exemplo:

{% highlight go %}
package main

import (
    "fmt"
    "io"
    "os"
    "os/exec"
)

func main() {
    // Comando a ser executado (exemplo: "ls -l")
    cmd := exec.Command("ls", "-l")

    // Obtém os pipes para stdout e stderr
    stdout, err := cmd.StdoutPipe()
    if err != nil {
        fmt.Println("Erro ao obter o pipe stdout:", err)
        return
    }

    stderr, err := cmd.StderrPipe()
    if err != nil {
        fmt.Println("Erro ao obter o pipe stderr:", err)
        return
    }

    // Inicia o comando
    if err := cmd.Start(); err != nil {
        fmt.Println("Erro ao iniciar o comando:", err)
        return
    }

    // Lê e imprime stdout
    go func() {
        if _, err := io.Copy(os.Stdout, stdout); err != nil {
            fmt.Println("Erro ao copiar stdout:", err)
        }
    }()

    // Lê e imprime stderr
    go func() {
        if _, err := io.Copy(os.Stderr, stderr); err != nil {
            fmt.Println("Erro ao copiar stderr:", err)
        }
    }()

    // Espera pelo término do comando
    if err := cmd.Wait(); err != nil {
        fmt.Println("Erro ao esperar pelo comando:", err)
    }
}
{% endhighlight %}

Neste exemplo, o comando `ls -l` é executado novamente, mas a *saída padrão e a saída de erro* são lidas e impressas separadamente em `goroutines`, proporcionando mais flexibilidade na manipulação da saída do comando.


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

## Obter variáveis de ambiente com Go
Nesse exemplo básico obteremos o conteúdo da variável `$PATH`:

{% highlight go %}
package main

import (
	"fmt"
	"os"
)

func main() {
	valor, existe := os.LookupEnv("SHELL")
	if existe {
		fmt.Println("Valor:", valor)
	} else {
		fmt.Println("Variável não encontrada")
	}
}
{% endhighlight %}

---

Até o próximo artigo da série!


