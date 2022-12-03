---
layout: post
title: "Como Instalar PowerShell no Ubuntu e Primeiros Passos"
date: 2021-12-02 14:01:47
image: '/assets/img/terminal/powershell.jpg'
description: 'Além de dica de como proceder em qualquer outra distribuição Linux.'
icon: 'ion:terminal-sharp'
iconname: 'PowerShell'
tags:
- powershell
- terminal
- ubuntu
---

![Como Instalar PowerShell no Ubuntu e Primeiros Passos](/assets/img/terminal/powershell.jpg)



**PowerShell** é um [shell](https://terminalroot.com.br/shell) de linha de comando baseado em tarefas e linguagem de script desenvolvido no **.NET**. Inicialmente, apenas um componente do Windows.

É possível instalá-lo em qualquer [distribuição](https://terminalroot.com.br/tags#distros) [Linux](https://terminalroot.com.br/linux) . Nesse artigo vamos ver como fazer isso no Ubuntu **21.04** ou superior. E os primeiros passos, além de dicas para outras distros.

---

# Instalação
Rode os comandos abaixo nessa sequência:

{% highlight sh %}
sudo apt update
sudo apt install -y wget apt-transport-https software-properties-common
wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt update && sudo apt upgrade
sudo apt install powershell
{% endhighlight %}


<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# Utilização
Utilizando o PowerShell direto pelo terminal:
{% highlight sh %}
pwsh 
{% endhighlight %}

Aparecerá:
{% highlight sh %}
PowerShell 7.2.0
Copyright (c) Microsoft Corporation.

https://aka.ms/powershell
Type 'help' to get help.
{% endhighlight %}

Para sair tecle:
{% highlight sh %}
exit
{% endhighlight %}

---


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

# Criando um script básico
Vamos rodar um [Olá, mundo!/Hello, World!](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html).

Crie o arquivo e insira o conteúdo no mesmo:
> `nvim hello-world.pwsh`
{% highlight sh %}
Write-Host 'Hello, World!'
{% endhighlight %}

Rode:
{% highlight sh %}
pwsh hello-world.pwsh
{% endhighlight %}

Ou simplesmente:
> `nvim hello-world.pwsh`

{% highlight sh %}
#!/usr/bin/env pwsh
Write-Host 'Hello, World!'
{% endhighlight %}

Dê permisão de execução e rode:
{% highlight sh %}
chmod +x hello-world.pwsh
./hello-world.pwsh
{% endhighlight %}

Para outras distros veja [aqui](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-linux?view=powershell-7.2) o procedimento.


