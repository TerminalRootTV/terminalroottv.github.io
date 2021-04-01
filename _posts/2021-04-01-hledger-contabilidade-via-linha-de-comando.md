---
layout: post
title: "hledger - Contabilidade via Linha de Comando"
date: 2021-04-01 13:44:52
image: '/assets/img/contabeis/hledger.png'
description: 'Contabilidade em modo texto simples e facil!'
icon: 'ion:terminal-sharp'
iconname: 'contabilidade'
tags:
- contabeis
- finances
---

![hledger - Contabilidade via Linha de Comando](/assets/img/contabeis/hledger.png)

[hledger](https://github.com/simonmichael/hledger) é um software de contabilidade de plataforma cruzada para usuários avançados e pessoas novas em contabilidade. É bom para rastrear dinheiro, tempo, investimentos, criptomoedas, estoque e muito mais. É uma reimplementação do [Ledger CLI](https://www.ledger-cli.org/) e também do [Transity](https://awesomeopensource.com/project/feramhq/transity) com um foco particular na facilidade de uso e robustez.

# Instalação
O **hledger** é multiplataforma e está disponível para [GNU](https://terminalroot.com.br/tags#gnu)/[Linux](https://terminalroot.com.br/tags#linux), [Windows](https://terminalroot.com.br/tags#windows), [Mac](https://terminalroot.com.br/tags#macos), [FreeBSD](https://terminalroot.com.br/tags#freebsd), [OpenBSD](https://terminalroot.com.br/tags#openbsd), Raspberry Pi e Cloud.

Em [distros](https://terminalroot.com.br/tags#distros) [Linux](https://terminalroot.com.br/linux) e sistemas [BSD](https://terminalroot.com.br/tags#bsd) você pode usar o gerenciador de pacotes das mesmas, exemplos:

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

{% highlight bash %}
sudo layman -a haskell && sudo emerge hledger hledger-ui hledger-web # Gentoo, Funtoo,...
sudo pacman -S hledger hledger-ui hledger-web # Arch Linux, Manjaro, ...
sudo xbps-install -S hledger hledger-ui hledger-web # Void Linux
sudo apt install hledger hledger-ui hledger-web # Debian, Ubuntu, Mint, ...
sudo dnf install hledger # Fedora, Red Hat, ...
sudo pkg install hs-hledger hs-hledger-ui hs-hledger-web # FreeBSD, helloSystem
make -C /usr/ports/openbsd-wip/productivity/hledger install # OpenBSD
{% endhighlight %}

Para Windows, macOS e outros baixe o binário por [esse link](https://github.com/simonmichael/hledger/releases/tag/1.21) .

# Uso
Você pode começar com `hledger` de forma muito simples e ficar mais "avançado" à medida que aprende mais sobre contabilidade de partidas dobradas. Aqui estão algumas maneiras comuns de usá-lo:
+ Web ou IU do terminal: [Use hledger-web](https://hledger.org/web.html) ou use [hledger-ui](https://hledger.org/ui.html) para inserir transações e ver relatórios.

Linha de comando: use os prompts interativos do [hledger add](https://hledger.org/add.html) para inserir transações, execute os comandos do hledger para ver os relatórios.

### Exemplos
Registrar as transações em um arquivo de texto simples, ou auxiliado por um modo de editor:
{% highlight bash %}
$HOME/.hledger.journal (or $LEDGER_FILE)

2020-01-01 opening balances
    assets:checking         $1234
    equity

2020-03-15 client payment
    assets:checking         $2000
    income:consulting

2020-03-20 Sprouts
    expenses:food:groceries  $100
    assets:cash               $40
    assets:checking
{% endhighlight %}

Execute comandos hledger para relatar saldos, receitas e despesas e muito mais:
{% highlight bash %}
$ hledger bs
Balance Sheet 2020-03-20

             || 2020-03-20 
=============++============
 Assets      ||            
-------------++------------
 assets      ||      $3134 
   cash      ||        $40 
   checking  ||      $3094 
-------------++------------
             ||      $3134 
=============++============
 Liabilities ||            
-------------++------------
-------------++------------
             ||            
=============++============
 Net:        ||      $3134 

$ hledger is -M
Income Statement 2020-01-01-2020-03-20

                         || Jan  Feb    Mar 
=========================++=================
 Revenues                ||                 
-------------------------++-----------------
 income:consulting       ||   0    0  $2000 
-------------------------++-----------------
                         ||   0    0  $2000 
=========================++=================
 Expenses                ||                 
-------------------------++-----------------
 expenses:food:groceries ||   0    0   $100 
-------------------------++-----------------
                         ||   0    0   $100 
=========================++=================
 Net:                    ||   0    0  $1900 

{% endhighlight %}

<!-- RETANGULO LARGO 2 -->
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

# Mais detalhes
Para consultar a documentação completa, acesse: <https://hledger.org/>



