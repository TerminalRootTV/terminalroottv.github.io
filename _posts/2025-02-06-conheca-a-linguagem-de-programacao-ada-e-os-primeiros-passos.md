---
layout: post
title: "Conheça a Linguagem de Programação Ada e os Primeiros Passos"
date: 2025-02-06 20:15:32
image: '/assets/img/programacao/ada.png'
description: "🛰 Precisão, segurança e confiabilidade para sistemas críticos."
icon: 'ion:terminal-sharp'
iconname: 'Ada'
tags:
- programacao
- ada
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

A linguagem de programação **Ada** foi a primeira linguagem que se autodenominou *memory-safe*(que na verdade é **Memory Sanitize** que é incorretamente traduzida para o português como: ~~memória segura~~).

> Ela foi oficialmente lançada em **1983** como uma linguagem de programação para sistemas críticos e de tempo real, com o objetivo de unificar e melhorar a confiabilidade de softwares utilizados pelo governo dos Estados Unidos.

Foi projetada para resolver os problemas de portabilidade, confiabilidade e manutenibilidade dos softwares em sistemas embarcados e de tempo real, especialmente em áreas como defesa e aeroespacial.


<!-- SQUARE - GAMES ROOT -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

### Exemplos de software feitos com Ada:
- **Sistemas de controle de aviões** e **sistemas aeroespaciais** (como o software que controla o sistema de bordo do Boeing 787 e o Airbus A380).
- **Sistemas de controle de missões espaciais**, como as missões da NASA.
- **Sistemas de defesa** e **armamentos**, como os sistemas de mísseis e radares.

### Onde ela mais atua:
- **Aeroespacial**
- **Defesa e sistemas militares**
- **Sistemas de transporte (aviões, trens, etc.)**
- **Automação industrial**
- **Sistemas médicos**
  
### Qualidades
- **Tipos de dados fortes e verificações de tipo**, o que reduz o risco de bugs de tipo e facilita a depuração.
- **Gerenciamento de exceções** e controle de **erros em tempo de execução**.
- **Suporte para programação concorrente e multitarefa** com o **Ada Tasking**.

### Objetivo para criação da Ada:
Ada foi criada para **substituir** linguagens de programação anteriores, como **Fortran**, [C](https://terminalroot.com.br/tags#linguagemc), **ALGOL**, e **PL/1**, que eram usadas no ambiente militar, mas com muitos problemas de interoperabilidade e confiabilidade. A primeira versão do compilador Ada foi escrita em [Assembly](https://terminalroot.com.br/tags#assembly), mas, como qualquer linguagem moderna, Ada foi posteriormente implementada por compiladores escritos nela mesma, tornando-se autossuficiente.

### Características adicionais importantes:
- **Padrão ANSI/ISO**: Ada foi padronizada pelo **ANSI** (American National Standards Institute) e **ISO** (International Organization for Standardization) para garantir consistência e portabilidade.
- **Concorrência**: Ada é especialmente projetada para **programação concorrente** e sistemas de tempo real, oferecendo facilidades como **tasks**, **protected objects** e **rendezvous**, recursos fundamentais para garantir a execução correta de sistemas com múltiplas operações simultâneas.
- **Qualidade e Certificação**: Ada tem uma forte base de **certificação** para sistemas que exigem **verificação formal**, o que é essencial em setores como defesa e aeroespacial.


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

## Instalação
Para ter *Ada*(GNAT) no seu sistema, basta usar o gerenciador de pacotes do seu sistema operacional.

Exemplos com: [winget](https://learn.microsoft.com/pt-br/windows/package-manager/winget/), [Chocolatey](https://chocolatey.org/), [Scoop](https://scoop.sh/), APT, Brew e outros nos sistemas [Windows](https://terminalroot.com.br/tags#windows), [macOS](https://terminalroot.com.br/tags#macos), [Ubuntu](https://terminalroot.com.br/tags#ubuntu) e outros. Ou até mesmo fazero download dos binários pré-compilado para seu sistema diretamente no site oficial do GNAT: <https://www.adacore.com/download>(Siga as instruções e adicione a sua **PATH** para usar facilmente no terminal).

Exemplos:

Chocolatey no Windows:
{% highlight bash %}
choco install gnat
{% endhighlight %}
> Para instalar o Chocolatey você pode usar o [PowerShell](https://terminalroot.com.br/tags#powershell): 
> `Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))`
> 

Scoop no Windows:
{% highlight bash %}
scoop bucket add extras
scoop install gnat
{% endhighlight %}
> Para instalar o Scoop: `iex (new-object net.webclient).downloadstring('https://get.scoop.sh')`.

Brew no macOS:
{% highlight bash %}
brew install gnat
{% endhighlight %}
> Caso não tenha o Brew instalado, rode: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`.

APT no Ubuntu:
{% highlight bash %}
sudo apt install gnat
{% endhighlight %}

Após devidamente instalado, teste vendo a versão:
{% highlight bash %}
gnat --version
{% endhighlight %}

Exemplo de saída:
{% highlight txt %}
GNAT 13.3.0
Copyright (C) 1996-2023, Free Software Foundation, Inc.
This is free software; see the source for copying conditions.
There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
{% endhighlight %}


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

## Hello, World!
> Primeiros passos com Ada.

Use a extensão `.adb` para criar códigos em Ada, exemplo: `main.adb`
{% highlight ada %}
with Ada.Text_IO;
procedure Hello is
begin
   Ada.Text_IO.Put_Line("Hello, Ada!");
end Hello;
{% endhighlight %}

Compile e execute:
{% highlight bash %}
gnatmake main.adb
./main
{% endhighlight %}

Caso queira ter o ambiente de desenvolvimento Ada completo no seu sistema, instale as ferramentas de desenvolvimento: 
+ Editores de texto; 
+ e **Depuradores adequados**. 

Você pode instalar pacotes adicionais como o `gprbuild` (para compilar projetos Ada) e o `gnat-gps`(um IDE para Ada):
{% highlight bash %}
sudo apt install gprbuild gnat-gps
{% endhighlight %}

---

Para mais informações acesse o endereço oficial: <https://www.adacore.com/> e [Wikipédia](https://en.wikipedia.org/wiki/Ada_(programming_language)).

