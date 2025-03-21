---
layout: post
title: "Série Go: Uma abordagem sobre a Linguagem de Programação Golang"
date: 2025-03-20 18:29:00
image: '/assets/img/go/series-go/series-go.png'
description: "🐹 O core Go, WebDev, GameDev, CliDev, GUIDev e exemplos diferentes."
icon: 'ion:terminal-sharp'
iconname: 'Go'
tags:
- go
- series-go
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Hoje vamos iniciar séries sobre várias linguagens de programação diferentes. Trata-se de [documentos que eu fui escrevendo durante muito tempo](https://x.com/TerminalRootTV/status/1788013077092352384) e ficou aqui parado e não sabia o que fazer com eles.

Algumas pessoas sugeriram fazer um [Curso](https://terminalroot.com.br/cursos), mas isso iria me tomar ainda mais tempo, pode ser até que eu transforme, no futuro, se der, em vídeo. Mas, pra não continuar com todo esse conteúdo aqui parado, vou começar a "*soltar*" como postagens.

O diferencial dessas séries é que os exemplos são diferenciados dos que você pode encontrar por aí. São coisas que eu mesmo criei e as pessoas gostam das coisas que eu faço, acho que deve ser a experiência que eu carrego desde [2011](https://terminalroot.com.br/2011/10/ola-mundo.html) quando inicie o [Terminal Root](https://terminalroot.com.br/), aliás, ele começou assim, coisas que eu fazia pra mim e resolvi *guardar* no [Blogger](https://cpp-terminal.blogspot.com/) e sem querer, os links já estavam em vaŕios fóruns, que foi aí que eu descobri porque o meu *blog* tava tendo muito acesso.

Nessa primeira série iremos abordar a linguagem de programação [Go/Golang](https://terminalroot.com.br/tags#go).

A linguagem de programação [Go](https://terminalroot.com.br/tags#go) é responsável por muitas coisas que muitos de nós usamos no dia a dia. Diversos softwares famosos são feitos com Go, dentre alguns deles, temos:

+ [Docker](https://terminalroot.com.br/tags#docker) - Virtualização em nível de sistema operacional.
+ [Kubernetes](https://kubernetes.io/) - Orquestrador de containers amplamente usado.
+ [Terraform](https://www.terraform.io/) - Ferramenta de infraestrutura como código (IaC) da HashiCorp.
+ [Prometheus](https://prometheus.io/) - Sistema de monitoramento e alerta.
+ [Grafana Loki](https://grafana.com/oss/loki/) – Sistema de logs escalável.
+ [Hugo](https://gohugo.io/) – Gerador de sites estáticos rápido.
+ [Gogs/Gitea – Plataformas self](https://docs.gitea.com/1.19/installation/upgrade-from-gogs) - hosted de gerenciamento de repositórios Git.

O mais recente é o [TypeScript Go](https://github.com/microsoft/typescript-go), trata-se de um *runtime* [TypeScript](https://terminalroot.com.br/tags#typescript) feito pela Microsoft, que será o padrão para rodar em aplicações como: [VS Code](https://terminalroot.com.br/tags#vscode) e outras.

Esse *port* do TypeScript para Go deu muito que falar nos últimos dias, pois a execução do TypeScript ficou [10x mais rápida](https://www.youtube.com/watch?v=pNlq-EVld70)!

Além de diversos outros menos conhecidos.

Um dos diferenciais da linguagem de programação Go é que diferentemente de linguagens como: [Swift](https://terminalroot.com.br/tags#swift), [Rust](https://terminalroot.com.br/tags#rust), [Zig](https://terminalroot.com.br/tags#zig), e entre outras, **Go** NÃO DEPENDE DO [LLVM](https://terminalroot.com.br/tags#llvm)/[C++](https://terminalroot.com.br/tags#cpp) para compilar e criar seus arquivos binários, toda a estrutura da linguagem é original e própria.

Além também de não ter recorrido a invenção do [C++](https://terminalroot.com.br/tags#cpp) de deletar ponteiros e sim utilizar [Garbage Collector](https://en.wikipedia.org/wiki/Garbage_collection_(computer_science)), que há um pequeno impacto no desempenho, mas não corre o risco severo de *vazamento de memória*. Para quem ainda não entende bem como isso funciona, saiba que o Rust que é visto como *memory safety* possui uma [página em sua documentação](https://doc.rust-lang.org/book/ch15-06-reference-cycles.html) alertando que é possível sim haver *memory leaks*.

A única diferença é que o compilador original, assim como Swift, [Carbon](https://terminalroot.com.br/2022/07/carbon-nova-linguagem-de-programacao-do-google-pretende-ser-sucessora-do-cpp.html), Rust, Zig e outras, foi escrito em [C++](https://terminalroot.com.br/tags#cpp) que foi o [gofrontend](https://github.com/golang/gofrontend), mas também já "*sofreu*": *bootstraping*.


Nesses episódios da série vamos tentar abordar de 3 a 4 tópicos. Nesse **Episódio 01** de hoje vamos ver:

+ **01**. [Introdução](#01-introducao)
+ **02**. [Preparando o Ambiente](#02-preparando-o-ambiente)
+ **03**. [Olá, Mundo!](03-olá-mundo)
+ e **04**. [Comentários](#04-comentários)


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

## 01. Introdução
**Go** é uma linguagem de programação criada pela [Google](https://google.com/) e lançada em código livre em novembro de 2009. 

É uma linguagem [compilada](https://terminalroot.com.br/2021/10/diferencas-entre-compiladores-e-interpretadores.html) e focada em produtividade e programação concorrente, baseada em trabalhos feitos no sistema operacional chamado [Inferno](https://terminalroot.com.br/2020/09/conheca-o-inferno.html). 

O projeto inicial da linguagem foi feito em setembro de 2007 por **Robert Griesemer**, **Rob Pike** e **Ken Thompson**(um dos criadores do [UNIX](https://terminalroot.com.br/tags#unix)). 

Atualmente, há implementações para [Windows](https://terminalroot.com.br/tags#windows), [macOS](https://terminalroot.com.br/tags#macos), [GNU/Linux](https://terminalroot.com.br/tags#gnulinux) e [FreeBSD](https://terminalroot.com.br/tags#freebsd).

Para mais informações [veja aqui](https://en.wikipedia.org/wiki/Go_(programming_language)), a página oficial do Go é: <https://go.dev/>

---

## 02. Preparando o Ambiente
Antes de mais nada você precisa ter o **Go** instalado no seu sistema. Você pode fazer o download aqui: <https://go.dev/dl/> ou utilizar o gerenciador de pacotes do seu [sistema operacional](https://terminalroot.com.br/tags#so), exemplos:

+ No [Windows](https://terminalroot.com.br/tags#windows) com [WinGet](https://winstall.app/apps/GoLang.Go)
> É interessante abrir o [PowerShell](https://terminalroot.com.br/tags#powershell) como **Administrador**.
{% highlight bash %}
winget install --id=GoLang.Go  -e
{% endhighlight %}
![Go WinGet](/assets/img/go/series-go/go-winget.jpg) 

+ No [macOS](https://terminalroot.com.br/tags#macOS) com [Brew](https://formulae.brew.sh/formula/go)
{% highlight bash %}
brew install go
{% endhighlight %}

+ No [Ubuntu]() via APT ou [snap](https://snapcraft.io/go)
{% highlight bash %}
sudo apt install golang-go
{% endhighlight %}

Após instalado teste rodando o comando `go version` se aparecer a versão similar ao conteúdo abaixo é porque está tudo certo.

{% highlight bash %}
go version
go version go1.22.2 amd64
{% endhighlight %}

Alternativamente você também pode usar o compilador do [GCC](https://terminalroot.com.br/tags#gcc) que é o **GCCGO**, para isso veja os links abaixo:
+ <https://gcc.gnu.org/onlinedocs/gccgo/>
+ <https://go.dev/doc/install/gccgo>

É interessante também você instalar **snippets** para Go no seu [IDE/Editor](https://terminalroot.com.br/tags/#editores) preferido.

---

## 03. Olá, Mundo!
O programa mais básico de todos é sempre um [Hello, World!](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html), então vamos criar nosso exemplo com Go. Crie uma arquivo de nome qualquer e extensão `.go`, exemplo: `hello.go` e insira o conteúdo abaixo:

{% highlight go %}
package main

import "fmt"

func main (){
  fmt.Println("Olá, Go!")
}
{% endhighlight %}

Para rodar você pode rodar o comando abaixo, apesar de não ser a melhor forma, pois fica lento, mas é possível:
{% highlight sh %}
go run hello.go
{% endhighlight %}

O correto mesmo é construir o binário(fica mais veloz) e executar posteriormente:
{% highlight sh %}
go build hello.go
./hello
{% endhighlight %}

Explicando o código:
+ `package main` → Cada programa Go é composto de pacotes. Programas começam rodando pelo pacote `main`.
+ `import "fmt"` → Este programa está usando o pacote com caminho de importação "fmt", alternativamente poderia usar a sintaxe: `import ("fmt")` usada para mais de uma importação.
+ `func main()`  → Essa é a função principal, ele sempre precisa existir em todos os programas Go, precisamos abrí-la com `{` e fechar com `}`.
+ `fmt.Println("Olá, Golang!")` → Para imprimimos o conteúdo desejado usa-se `fmt.Println()`, a função `Println()` faz parte da biblioteca `fmt`, o P em maiúsculo deve ser respeitado. 


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

## 04. Comentários
Go usa estilo [C](https://terminalroot.com.br/tags#linguagemc)/[C++](https://terminalroot.com.br/tags#cpp) para escrever comentários(parte do código que não influenciará no resultado, somente para fins informativos de quem venha ler o código) `// comentário` ou `/* comentário */`(múltiplas linhas) , exemplos:

{% highlight go %}
// Meu primeiro código Go
package main // importa o pacote main

import "fmt" // utilizando a biblioteca fmt para Println

func main (){ // função principal
  fmt.Println("Olá, Golang!") // Imprimindo
}
/*
Para rodar e/ou compilar use respectivamente
$ go run hello.go

OU

$ go build hello.go
$ ./hello

*/
{% endhighlight %}

---

Bom, por esse **Episódio 01** da **Série Go** já tá de bom tamanho, lhe espero nos próximos episódios!


