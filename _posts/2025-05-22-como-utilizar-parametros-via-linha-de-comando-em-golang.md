---
layout: post
title: "Como Utilizar Parâmetros via Linha de Comando em Golang"
date: 2025-05-22 12:31:57
image: '/assets/img/go/series-go-05.jpg'
description: "🚀 Dominar o tratamento de argumentos de linha de comando em Go permite criar aplicativos mais poderosos e flexíveis."
icon: 'ion:terminal-sharp'
iconname: 'Série Go'
tags:
- series-go
- go
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Dando continuidade a [Série Go](https://terminalroot.com.br/tags#series-go) veremos que trabalhar com parâmetros de linha de comando é uma habilidade essencial para desenvolvedores [Golang](https://terminalroot.com.br/tags#go), permitindo criar aplicativos mais flexíveis e configuráveis. 

Neste artigo, exploraremos diferentes métodos para processar argumentos de linha de comando em [Go](https://terminalroot.com.br/tags#go), desde o básico até técnicas mais avançadas.


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

## Método Básico: O pacote `os`
A maneira mais simples de acessar argumentos em Go é através do pacote `os`, que fornece a variável `Args`.

{% highlight go %}
package main

import (
    "fmt"
    "os"
)

func main() {
    // os.Args[0] é o nome do programa
    // os.Args[1] em diante são os argumentos
    if len(os.Args) > 1 {
        fmt.Println("Argumentos recebidos:", os.Args[1:])
    } else {
        fmt.Println("Nenhum argumento fornecido.")
    }
}
{% endhighlight %}

Exemplo de uso:
{% highlight bash %}
$ ./args arg1 arg2 arg3
Argumentos recebidos: [arg1 arg2 arg3]
{% endhighlight %}

---

## Pacote `flag`: Para opções mais sofisticadas
Para um parsing mais robusto de argumentos, incluindo flags (como `-h` ou `--help`), Go oferece o pacote `flag`.

### Exemplo básico com `flag`:

{% highlight go %}
package main

import (
    "flag"
    "fmt"
)

func main() {
    // Definindo flags
    nome := flag.String("nome", "Visitante", "Seu nome")
    idade := flag.Int("idade", 0, "Sua idade")
    admin := flag.Bool("admin", false, "É administrador?")

    // Parse dos argumentos
    flag.Parse()

    // Usando os valores
    fmt.Printf("Olá, %s! Você tem %d anos.\n", *nome, *idade)
    if *admin {
        fmt.Println("Privilégios de administrador ativados.")
    }
}
{% endhighlight %}

Exemplo de uso:
{% highlight bash %}
$ ./args -nome João -idade 30 -admin
Olá, João! Você tem 30 anos.
Privilégios de administrador ativados.
{% endhighlight %}

### Flags posicionais
Você também pode processar argumentos posicionais (não nomeados) após as flags:

{% highlight go %}
package main

import (
    "flag"
    "fmt"
)

func main() {
    flag.Parse()
    args := flag.Args() // Argumentos posicionais
    
    if len(args) > 0 {
        fmt.Println("Argumentos posicionais:", args)
    }
}
{% endhighlight %}

---

## Trabalhando com subcomandos
Para aplicativos mais complexos (como `git commit` ou `docker ps`), você pode implementar subcomandos:

{% highlight go %}
package main

import (
    "flag"
    "fmt"
    "os"
)

func main() {
    if len(os.Args) < 2 {
        fmt.Println("Uso: args <comando> [args]")
        os.Exit(1)
    }

    switch os.Args[1] {
    case "add":
        addCmd := flag.NewFlagSet("add", flag.ExitOnError)
        item := addCmd.String("item", "", "Item para adicionar")
        addCmd.Parse(os.Args[2:])
        fmt.Printf("Adicionando: %s\n", *item)
        
    case "list":
        listCmd := flag.NewFlagSet("list", flag.ExitOnError)
        all := listCmd.Bool("all", false, "Listar todos os itens")
        listCmd.Parse(os.Args[2:])
        fmt.Printf("Listando (all=%v)\n", *all)
        
    default:
        fmt.Printf("Comando desconhecido: %s\n", os.Args[1])
        os.Exit(1)
    }
}
{% endhighlight %}

Outras alternativas:
- [`spf13/cobra`](https://github.com/spf13/cobra) - Para aplicativos CLI sofisticados
- [`urfave/cli`](https://github.com/urfave/cli) - Alternativa popular ao pacote `flag`

Dicas:
1. Sempre forneça mensagens de ajuda claras (`-h` ou `--help`)
2. Valide os argumentos fornecidos
3. Considere fornecer valores padrão sensíveis
4. Documente os parâmetros esperados
5. Trate erros de forma amigável

---

Acompanhe a [Série Go](https://terminalroot.com.br/tags#series-go).

