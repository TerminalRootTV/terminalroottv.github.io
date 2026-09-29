---
layout: post
title: "Monitore sua rede diretamente pelo terminal"
date: 2026-09-29 19:24:41
image: '/assets/img/go/flow.jpg'
description: "🔳 Escrito em Go."
icon: 'ion:terminal-sharp'
iconname: 'Terminal/Go'
tags:
- go
- tui
- rede
- terminal
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

O [`flow`](https://github.com/programmersd21/flow) é um monitor de tráfego de rede em tempo real para o terminal. 

Ele é escrito em **Go**, utiliza [Bubble Tea](https://terminalroot.com.br/2025/07/crie-lindas-interfaces-para-o-terminal-com-essa-lib-go.html) para a interface [TUI](https://terminalroot.com.br/tags#tui) e funciona em [GNU/Linux](https://terminalroot.com.br/tags#gnulinux), [macOS](https://terminalroot.com.br/tags#macos) e [Windows](https://terminalroot.com.br/tags#windows).

Características:
+ Velocidade de download
+ Velocidade de upload
+ Gráficos do tráfego
+ Picos de transferência
+ Latência
+ Interface de rede utilizada
+ Processos que possuem conexões de rede
+ Informações da interface, como IP, MAC e MTU
+ Totais de tráfego da sessão/dia
+ Temas e esquemas de cores personalizados

A interface se adapta automaticamente ao tamanho do terminal, oferecendo quatro modos: **Hero, Compact, Mini e Tiny**.


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

## Como instalar
O projeto disponibiliza binários pré-compilados para **Linux, macOS e Windows**, tanto para `amd64` quanto para `arm64`. Também existem métodos específicos para cada plataforma.

### GNU/Linux
Se você utiliza Arch Linux, pode instalar através do AUR:

{% highlight bash %}
yay -S flow-network-monitor-bin
{% endhighlight %}

### Usando [Go](https://terminalroot.com.br/tags#go)
Com o Go instalado:
{% highlight bash %}
go install github.com/programmersd21/flow/cmd/flow@latest
{% endhighlight %}

Verifique:
{% highlight bash %}
flow
{% endhighlight %}

### Compilando a partir do código-fonte
{% highlight bash %}
git clone https://github.com/programmersd21/flow
cd flow
make install
{% endhighlight %}

O projeto também disponibiliza binários diretamente na página de releases.

---

## macOS
A maneira mais simples é utilizar o Homebrew:
{% highlight bash %}
brew install programmersd21/flow/flow
{% endhighlight %}

Depois:
{% highlight bash %}
flow
{% endhighlight %}

---

## Windows
No Windows, você pode baixar o binário correspondente à arquitetura da sua máquina na página de **Releases** do projeto.

Existem builds para:

{% highlight text %}
amd64
arm64
{% endhighlight %}

O processo de release gera um arquivo `.zip` para Windows.

Depois de extrair o executável, você pode executar:
{% highlight powershell %}
.\flow.exe
{% endhighlight %}

Se quiser chamar `flow` diretamente de qualquer terminal, adicione a pasta do executável ao `PATH` do Windows.

---

## Primeiros passos
Depois de instalado, basta executar:

{% highlight bash %}
flow
{% endhighlight %}

O programa detecta automaticamente a interface de rede e inicia o monitoramento.

### Modos de visualização

Você pode iniciar diretamente em diferentes modos:

{% highlight bash %}
flow --compact
{% endhighlight %}

Layout compacto.

{% highlight bash %}
flow --mini
{% endhighlight %}

Somente os gráficos.

{% highlight bash %}
flow --tiny
{% endhighlight %}

Uma única linha, ideal para barras de status.

Por exemplo, o modo `tiny` pode ser integrado ao **tmux**:

{% highlight text %}
set -g status-right "#(flow --tiny --no-color)"
{% endhighlight %}

### Escolher uma interface

Se o computador possui várias interfaces de rede:

{% highlight bash %}
flow --interface wlan0
{% endhighlight %}

Também é possível alternar entre interfaces dentro da própria aplicação usando:

{% highlight text %}
i
{% endhighlight %}

### Alterar unidade

Pressione:

{% highlight text %}
c
{% endhighlight %}

para alternar entre escalas como:

{% highlight text %}
B/s
KB/s
MB/s
{% endhighlight %}

Ou inicie utilizando bits por segundo:

{% highlight bash %}
flow --bits
{% endhighlight %}

### Alterar o intervalo de atualização

Por padrão, o `flow` trabalha com uma amostragem de 100 ms.

Você pode alterar:

{% highlight bash %}
flow --refresh 500ms
{% endhighlight %}

### Monitorar a latência

É possível definir o destino utilizado para o teste de latência:

{% highlight bash %}
flow --ping 8.8.8.8
{% endhighlight %}

O endereço padrão é `1.1.1.1`.

---

### Atalhos


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

Durante a execução:

| Tecla     | Ação                         |
| --------- | ---------------------------- |
| `q`       | Sair                         |
| `m`       | Alterar modo de visualização |
| `d`       | Download / Upload / Ambos    |
| `t`       | Selecionar tema              |
| `n`       | Processos de rede            |
| `i`       | Alterar interface            |
| `I`       | Detalhes da interface        |
| `c`       | Alterar unidade              |
| `b`       | Bits/s ↔ Bytes/s             |
| `+` / `-` | Alterar intervalo            |
| `p`       | Pausar/continuar             |
| `r`       | Resetar picos                |
| `?`       | Ajuda                        |

---

### JSON e automação

O `flow` não precisa ser utilizado somente como uma TUI.

Para obter uma saída JSON única:

{% highlight bash %}
flow --json
{% endhighlight %}

Para receber dados continuamente em JSON Lines:

{% highlight bash %}
flow --json-stream
{% endhighlight %}

Isso permite integrar o `flow` com scripts, dashboards e outras ferramentas de terminal.

Também existe:

{% highlight bash %}
flow --once
{% endhighlight %}

para obter uma saída única em texto.

---


Para mais informações acesse o [repositório](https://github.com/programmersd21/flow).


