---
layout: post
title: "Como Instalar o C# em Qualquer Distro GNU/Linux"
date: 2022-12-24 18:35:56
image: '/assets/img/csharp/csharp.jpg'
description: 'CSharp é uma linguagem de programação de tipo forte e multiparadigma desenvolvida pela Microsoft como parte da plataforma .NET.'
icon: 'ion:terminal-sharp'
iconname: 'CSharp'
tags:
- csharp
- programacao
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

[C#](https://terminalroot.com.br/tags#csharp) é uma linguagem de programação de tipo forte e multiparadigma desenvolvida pela Microsoft como parte da plataforma .NET.

Sua sintaxe é orientada a objetos e foi baseada em [C++](https://terminalroot.com.br/tags#cpp), mas inclui muitas influências de outras linguagens de programação, como Object Pascal e, principalmente, [Java](https://terminalroot.com.br/tags#java), sendo essa última sua maior concorrente.

Neste artigo veremos como instalar em qualquer [Distribuição](https://terminalroot.com.br/tags#distros) [GNU](https://terminalroot.com.br/tags#gnu)/[Linux](https://terminalroot.com.br/tags#linux) .

---

# 01. Baixe o script [Bash](https://terminalroot.com.br/tags#bash) de instalação 

Com [wget](https://terminalroot.com.br/2019/05/aprenda-a-explorar-o-comando-wget.html)
{% highlight bash %}
wget https://dot.net/v1/dotnet-install.sh
{% endhighlight %}

ou com [cURL](https://terminalroot.com.br/2019/10/12-dicas-para-voce-usar-o-comando-curl-como-um-ninja.html)
{% highlight bash %}
curl -LO https://dot.net/v1/dotnet-install.sh
{% endhighlight %}

---

# 02. Dê permissão de execução com `sudo` ou `root`
{% highlight bash %}
sudo chmod +x ./dotnet-install.sh
{% endhighlight %}

---

# 03. Rode o script para instalar a versão mais recente
{% highlight bash %}
./dotnet-install.sh --version latest
{% endhighlight %}

---

# 04. Habilite o CSharp para todos os usuários
> Apesar de ser opcional, é bom para tornar o comando global, isso será bom para diversas circunstâncias!

{% highlight bash %}
sudo mv ./.dotnet/ /opt/dotnet
{% endhighlight %}

---


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

# 05. Informe o caminho do binário para sua `$PATH` e para o CSharp encontrar o documento root
Rode os três comandos abaixo na ordem:
{% highlight bash %}
echo -e '\nexport DOTNET_ROOT=/opt/dotnet' | sudo tee -a /etc/profile
echo 'export PATH=$PATH:/opt/dotnet:/opt/dotnet/tools' | sudo tee -a /etc/profile
source /etc/profile
{% endhighlight %}

---

# 06. Teste o comando `dotnet`
{% highlight bash %}
dotnet --version
dotnet --help
{% endhighlight %}

---

# 07. Crie um [Hello, World!](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html) de teste, e rode!
Crie um novo projeto
{% highlight bash %}
dotnet new console -o HelloWorld
{% endhighlight %}

Entre no projeto, compile e rode:
{% highlight bash %}
cd HelloWorld
dotnet build
dotnet run
{% endhighlight %}

---

# Links Úteis
+ <https://terminalroot.com/how-to-install-csharp-on-ubuntu-and-getting-started/>
+ <https://github.com/terroo/langs-test-loop/blob/main/round2/main.cs>
+ <https://learn.microsoft.com/en-us/dotnet/core/install/linux-scripted-manual>
+ <https://docs.microsoft.com/en-us/dotnet/core/install/linux-ubuntu>
+ <https://docs.microsoft.com/pt-br/dotnet/csharp/tour-of-csharp/tutorials/>
+ <https://dotnet.microsoft.com/en-us/learn/dotnet/hello-world-tutorial/intro>
+ <https://docs.microsoft.com/pt-br/dotnet/csharp/>



