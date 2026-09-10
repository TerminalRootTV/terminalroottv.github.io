---
layout: post
title: "Como Instalar o GNU Cobol e os primeiros passos"
date: 2025-02-10 23:04:43
image: '/assets/img/gnu/gnucobol.png'
description: "🐎 Procedimento para Windows, macOS, GNU/Linux e BSD."
icon: 'ion:terminal-sharp'
iconname: 'GnuCOBOL'
tags:
- gnu
- cobol
- linguagemc
- programacao
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')


---

**GnuCOBOL** (anteriormente conhecido como *OpenCOBOL* e brevemente como **[GNU](https://terminalroot.com.br/tags#gnu) Cobol**) é uma implementação livre da linguagem de programação COBOL que faz parte do projeto GNU. [GnuCOBOL](https://en.wikipedia.org/wiki/GnuCOBOL) traduz o código COBOL para [C](https://terminalroot.com.br/tags#linguagemc) e então o compila usando o compilador C nativo.


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
### Instalação no Ubuntu
1. **Atualize o sistema:**
Primeiro, é recomendável atualizar a lista de pacotes e o sistema:
{% highlight bash %}
sudo apt update && sudo apt upgrade
{% endhighlight %}
2. **Instale o GnuCOBOL:**
O GnuCOBOL está disponível nos repositórios padrão do Ubuntu. Você pode instalá-lo usando o seguinte comando:
{% highlight bash %}
sudo apt install gnucobol
{% endhighlight %}
3. **Verifique a instalação:**
Após a instalação, você pode verificar se o GnuCOBOL foi instalado corretamente executando:
{% highlight bash %}
cobc --version
{% endhighlight %}
Isso exibirá a versão do GnuCOBOL instalada.

### Instalação no Windows
No Windows, a instalação do GnuCOBOL pode ser manual ou via WSL2. Procedimento manual:

1. **Baixe o GnuCOBOL:** no endereço: [Direto para *files* no SourceForge](cobc -x hello.cbl 2>/dev/null)

2. **Extraia o ZIP:** para um diretório de sua escolha, por exemplo, `C:\gnucobol`.

3. **Configure as variáveis de ambiente:**
   - Adicione o diretório `bin` do GnuCOBOL ao seu `PATH`:
     1. Clique com o botão direito em "Este Computador" ou "Meu Computador" e selecione "Propriedades".
     2. Clique em "Configurações avançadas do sistema".
     3. Na aba "Avançado", clique em "Variáveis de Ambiente".
     4. Na seção "Variáveis do sistema", encontre a variável `Path` e clique em "Editar".
     5. Adicione o caminho para o diretório `bin` do GnuCOBOL (por exemplo, `C:\gnucobol\bin`) ao final da lista de caminhos.
     6. Clique em "OK" para salvar as alterações.

4. **Verifique a instalação:**
   - Abra o Prompt de Comando (CMD) e execute:
{% highlight bash %}
cobc --version
{% endhighlight %}
   - Exibirá a versão do GnuCOBOL instalada.

## Primeiros passos com GnuCOBOL
Após a instalação, você pode testar o GnuCOBOL criando um simples programa COBOL. Por exemplo, crie um arquivo chamado `hello.cbl` com o seguinte conteúdo:
> **OBSERVAÇÃO**: Em Cobol é importante respeitar esses espaços à esquerda!
{% highlight cobol %}
      *> Meu Hello World em GnuCobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLO-WORLD.
       PROCEDURE DIVISION.
           DISPLAY "Hello, World!".
           STOP RUN.
{% endhighlight %}

Para compilar e executar no [Ubuntu](https://terminalroot.com.br/tags#ubuntu) ou no [Windows](https://terminalroot.com.br/tags#windows), use os seguintes comandos:
{% highlight bash %}
cobc -x hello.cbl
./hello
{% endhighlight %}
> Se você viu algum *warning* pode estar ocorrendo porque `_FORTIFY_SOURCE` está sendo definido em algum lugar no seu ambiente de compilação. Se isso tiver lhe incomodando, ignore assim: `cobc -x hello.cbl 2>/dev/null`.

No Windows, o comando para executar o programa seria:
{% highlight bash %}
hello.exe
{% endhighlight %}

Isso deve exibir "Hello, World!" no terminal.

Para [macOS](https://terminalroot.com.br/tags#macos) e [BSD](https://terminalroot.com.br/tags#bsd) você pode tanto usar o gerenciador de pacotes do sistema, bem como fazer download, assim como no Windows, direto do SourceForge: 
> <https://sourceforge.net/projects/gnucobol/files/gnucobol/3.2/>

---

Para mais informações consulte [esse PDF](https://sourceforge.net/p/gnucobol/code/HEAD/tree/external-doc/guide/PDFs/gnucobpg-letter.pdf?format=raw), o [Guia](https://gnucobol.sourceforge.io/guides.html) e o [endereço oficial](https://gnucobol.sourceforge.io/).

