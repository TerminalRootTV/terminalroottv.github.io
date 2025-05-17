---
layout: post
title: "Personalize seu PowerShell Like a Pro"
date: 2025-05-17 15:04:57
image: '/assets/img/windows/posh/oh-my-posh.jpg'
description: "🐎 Um prompt personalizado e mais dicas para ícones."
icon: 'ion:terminal-sharp'
iconname: 'PowerShell'
tags:
- powershell
- windows
- shell
- terminal
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Se você usa o [PowerShell](https://terminalroot.com.br/tags#powershell) com frequência, sabe que a aparência padrão deixa a desejar e a produtividade pode melhorar com alguns ajustes. 

Neste artigo, você vai aprender como personalizar seu ambiente **PowerShell** como um profissional — do visual ao comportamento — usando ferramentas como **Oh My Posh**, fontes e muito mais. 

Deixe seu terminal bonito, funcional e com a sua cara.


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

## *Windows PowerShell* é DIFERENTE de *PowerShell*
Você precisa possuir o PowerShell instalado. Muitos pensam que o **Windows PowerShell**(que já vem instalado por padrão no Windows) é o mesmo que **PowerShell**, mas são diferentes! Veja a tabela comparativa abaixo:

| Característica     | **Windows PowerShell** | **PowerShell (Core)**                  |
| ------------------ | ---------------------- | -------------------------------------- |
| Nome do executável | `powershell.exe`       | `pwsh.exe`                             |
| Base               | .NET Framework         | .NET Core / .NET 5+                    |
| Plataforma         | Somente Windows        | Cross-platform (Windows, Linux, macOS) |
| Versões comuns     | 5.1 e anteriores       | 6.0+ (Core), 7.x (PowerShell)          |
| Suporte futuro     | Somente manutenção     | Ativamente desenvolvido                |

Para saber se seu PowerShell é o padrão, rode esses comandos abaixo:
{% highlight powershell %}
$PSVersionTable
{% endhighlight %}
* Se `Name` for `Microsoft.PowerShell.Core` e `Version` for **5.1**, está usando **Windows PowerShell**.
* Se `Version` for **6.0+ ou 7.x**, está usando **PowerShell Core** (o moderno).

**Ou**:
{% highlight powershell %}
(Get-Process -Id $PID).Path
{% endhighlight %}
* Se o caminho terminar em `powershell.exe`, é **Windows PowerShell**.
* Se terminar em `pwsh.exe`, é **PowerShell Core**.

Esse aqui é um exemplo de Windows PowerShell:
{% highlight powershell %}
> $PSVersionTable

Name                           Value
----                           -----
PSVersion                      5.1.19041.5607
PSEdition                      Desktop
PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0...}
BuildVersion                   10.0.19041.5607
CLRVersion                     4.0.30319.42000
WSManStackVersion              3.0
PSRemotingProtocolVersion      2.3
SerializationVersion           1.1.0.1


> (Get-Process -Id $PID).Path
C:\WINDOWS\System32\WindowsPowerShell\v1.0\powershell.exe
{% endhighlight %}
Se sua saída for similar a essa: `powershell.exe` então você precisa instalar o **PowerShell**.

### Instalação do PowerShell
Você pode instalar através da [Windows Store - PowerShell](ttps://www.microsoft.com/en-us/p/powershell/9mz1snwt0n5d?SilentAuth=1&wa=wsignin1.0&WT.mc_id=-blog-scottha#activetab=pivot:overviewtab) ou só rodar o comando abaixo no Windows PowerShell:
{% highlight powershell %}
winget install Microsoft.PowerShell
{% endhighlight %}
> Se já estiver no Windows Terminal, feche e abra de novo!

Outra coisa legal(e importante) é instalar o [Windows Terminal](https://terminalroot.com.br/2023/04/melhore-seu-desempenho-utilizando-o-windows-terminal.html), veja [nesse artigo](https://terminalroot.com.br/2023/04/melhore-seu-desempenho-utilizando-o-windows-terminal.html) como instalar e configurar!

Após devidamente instalados o *Windows Terminal* e o *PowerShell*, agora basta definir o *Windows Terminal* como **Shell Padrão** escolhendo o **PowerShell**, para isso faça:
+ Abra o **Windows Terminal**;
+ Clique na seta para baixo(**⌵**);
+ Escolha **PowerShell** em **Perfil padrão** como na imagem abaixo:

![Shell Padrão](/assets/img/windows/posh/shell-padrao.jpg) 

Agora vamos ao próximo passo!


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

## Instale Fontes necessárias
Você precisará de fontes para exibir os unicodes corretamente no [terminal](https://terminalroot.com.br/tags#terminal). Há duas opções:

+ Maneira rápida e fácil: [Fontes Terminal Root](https://github.com/terroo/fonts), faça o download e instale, caso não saiba como fazer isso, [veja nesse tempo desse vídeo como fazer!](https://youtu.be/bs_xTQdgM5s?t=129);
+ Mais completa: [Nerd Fonts](https://www.nerdfonts.com/), para instalá-las acesse o endereço: <https://www.nerdfonts.com/>.

Após instalada as fontes, altere a fonte do seu Windows Terminal e escolha a fonte: [Caskaydia Cove Nerd Font](https://www.nerdfonts.com/font-downloads) da seguinte maneira:
1. Abra o Windows Terminal.
2. Clique na seta **⌵** ao lado da aba + e selecione **"Configurações"** (ou pressione `Ctrl+,`).
3. No painel esquerdo, selecione o **perfil**: **"PowerShell"**.
4. Vá até a seção **"Appearance"** (Aparência).
5. Em **"Font face"**, digite o nome da fonte: **Caskaydia Cove Nerd Font**.
6. Clique em **"Save"**(Salvar) no canto inferior direito. Veja imagem abaixo:
> Onde tem a fonte **JetBrainsMonoMedium Ner Font** altere para **Caskaydia Cove Nerd Font**.

![Alterar a fonte do Windows Terminal](/assets/img/windows/posh/fonte-pwsh.jpg) 

Agora vamos alterar o prompt!

---

## Instale o *Oh My Posh*
**Oh My Posh** é uma ferramenta de personalização de prompt para terminais como [PowerShell](https://terminalroot.com.br/tags#powershell), [GNU Bash](https://terminalroot.com.br/tags#bash), [zsh](https://terminalroot.com.br/tags#shell), entre outros. Ela permite criar um prompt visualmente atrativo e informativo, com temas prontos e suporte a ícones via Nerd Fonts.

### Principais recursos:
* Temas prontos e customizáveis em [JSON](https://terminalroot.com.br/tags#json)
* Suporte a [Git](https://terminalroot.com.br/tags#git), status de jobs, linguagem ativa, entre outros
* Compatível com [Windows](https://terminalroot.com.br/tags#windows), [GNU/Linux](https://terminalroot.com.br/tags#gnulinux) e [macOS](https://terminalroot.com.br/tags#macos)
* Funciona com PowerShell, bash, zsh, fish, etc.
* Usa **Nerd Fonts** para ícones e símbolos

É ideal para quem quer um terminal funcional e esteticamente agradável.

Para instalar basta rodar o comando abaixo:
{% highlight powershell %}
winget install JanDeDobbeleer.OhMyPosh
{% endhighlight %}
> Após isso precisa fechar e abrir de novo o Windows Terminal! Caso prefira, você pode instalar via [Windows Store - OhMyPosh](https://apps.microsoft.com/detail/xp8k0hkjfrxgck?hl=pt-BR&gl=US).

Agora se você rodar o comando abaixo já ativará o prompt personalizado:
{% highlight powershell %}
oh-my-posh --init --shell pwsh --config ~/jandedobbeleer.omp.json | Invoke-Expression
{% endhighlight %}

No entanto, quando você fechar e abrir de novo o Windows Terminal, notará que sumirá. Então, adicione ao caminho do `$PROFILE`, se você digitar isso no terminal, notará que exbirá o caminho de configuração. Mas, muito provavelmente não existirá as subpastas referentes ao caminho.

Isso é normal. O `$PROFILE` aponta para **onde o arquivo *deveria* estar**, mas **não cria a pasta ou o arquivo automaticamente**.

### Para resolver:
1. Crie a pasta:
{% highlight powershell %}
New-Item -ItemType Directory -Path (Split-Path -Parent $PROFILE) -Force
{% endhighlight %}

2. Crie o arquivo de perfil:
{% highlight powershell %}
New-Item -ItemType File -Path $PROFILE -Force
{% endhighlight %}

3. Agora você pode editar com:
{% highlight powershell %}
notepad $PROFILE
{% endhighlight %}

Nesse arquivo aberto, cole o comando que você usou para ativar a personalização do prompt:
{% highlight powershell %}
oh-my-posh --init --shell pwsh --config ~/jandedobbeleer.omp.json | Invoke-Expression
{% endhighlight %}

Salve o arquivo e após fechar e abrir novamente o Windows Terminal, note que a configuração sempre será exibida!

Existem várias configurações que você pode adicionar, na documentação há toda explicação: <https://ohmyposh.dev/docs/>.


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

## Ícones para o terminal
E pra incrementar ainda mais seu terminal, adicione um módulo de ícones, basta rodar o comando: `Install-Module -Name Terminal-Icons -Repository PSGallery` e depois adicionar ao mesmo arquivo do `notepad $PROFILE` mais uma linha, essa abaixo:
{% highlight powershell %}Import-Module -Name Terminal-Icons
{% endhighlight %}

Feche e abra o Windows Terminal, rode os comandos `dir` ou `ls` e note que os arquivos e pastas serão listados com ícones coloridos!

![Windows Terminal com Oh My Posh](/assets/img/windows/posh/custom-powershell.jpg) 

---

Show de bola, né?! Para mais informações acesse [esse link](https://learn.microsoft.com/en-us/windows/terminal/tutorials/custom-prompt-setup).

<!--
Via: https://www.hanselman.com/blog/my-ultimate-powershell-prompt-with-oh-my-posh-and-the-windows-terminal
-->

