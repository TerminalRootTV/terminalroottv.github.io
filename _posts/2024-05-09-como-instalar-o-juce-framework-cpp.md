---
layout: post
title: "Como Instalar o JUCE Framework C++"
date: 2024-05-09 13:06:23
image: '/assets/img/cpp/juce.jpg'
description: 'Crie Reprodutores e Espectros de Áudio, Plugins e mais com Interface Gráfica. Multiplataforma e amada por músicos programadores!'
icon: 'ion:terminal-sharp'
iconname: 'JUCE Framework'
tags:
- multimidia
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

*JUCE* é um framework [C++](https://terminalroot.com.br/tags#cpp) disponível para [Windows](https://terminalroot.com.br/tags#windows), [macOS](https://terminalroot.com.br/tags#macos), [GNU/Linux](https://terminalroot.com.br/tags#gnulinux), [Android](https://terminalroot.com.br/tags#android) e [iOS](https://terminalroot.com.br/tags#swift), de código aberto, usada para o desenvolvimento de aplicativos desktop e móveis. 

JUCE é usado em particular para suas bibliotecas [GUI](https://terminalroot.com.br/tags#gui) e **plug-ins**. Possui licença dupla sob a [GPLv3](https://terminalroot.com.br/tags#gnu) e uma licença comercial.

O objetivo do JUCE é permitir que o software seja escrito de forma que o mesmo código-fonte seja compilado e executado de forma idêntica independente da plataforma. 

Suporta vários ambientes de desenvolvimento e compiladores.

---

# Download do JUCE
Como dito, o [código-fonte está disponível no GitHub](https://github.com/juce-framework/JUCE). Ou seja, você pode baixá-lo e compilar direto na sua máquina. Certique-se antes de possuir as [dependências necessárias](https://github.com/juce-framework/JUCE/blob/master/docs/Linux%20Dependencies.md)(nesse caso para distribuições GNU/Linux).

Mas, também já há binários já pré-compilados que rodam na sua máquina. Você pode acessar o endereço oficial de downloads:
#### <https://juce.com/get-juce/>

Escolher o plano(há o **Free**), escolher para seu [sistema operacional](https://terminalroot.com.br/tags#sistemasoperacionais), descompactar e rodar o binário.

Em distros GNU/Linux, pode ser:
{% highlight bash %}
wget https://api.juce.com/api/v1/download/juce/latest/linux -O juce-latest.zip
unzip juce-latest.zip
{% endhighlight %}
> Para versões anteriores, em casos de compatibilidade, você pode fazer o download na paǵina de [releases no GitHub](https://github.com/juce-framework/JUCE/releases). De acordo com a data de publicação desse artigo a versão mais atual é a: `7.0.12`.


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

# Rodando o Projucer
O **Projucer** é um [IDE](https://terminalroot.com.br/2021/12/os-32-melhores-ides-editores-de-texto-para-cpp.html) para O JUCE. O binário dele está disponível dentro do diretório `JUCE/` que vocÊ descompactou, para rodá-lo se estiver no Windows ou macOS, basta clicar no binário, em distros GNU/Linux, entre via [terminal](https://terminalroot.com.br/tags#terminal) e execute com `./`:

{% highlight bash %}
cd JUCE
./Projucer
{% endhighlight %}

Será aberta a janela:
[![Projucer running](/assets/img/cpp/JUCE.png)](/assets/img/cpp/JUCE.png)

Há também o binário do **Demo** que pode ser executado no mesmo diretório:
{% highlight bash %}
./DemoRunner
{% endhighlight %}

Aparecerá:
[![DemoRunner](/assets/img/cpp/demo-runner.png)](/assets/img/cpp/demo-runner.png) 

Você ainda pode mover para `/opt` e linkar binários para abrir via Dashboard, incluindo o ícone e um `.desktop`.

---

Para mais informações, tutoriais, documentação e outros acesse os links abaixo:
+ <https://juce.com/>
+ <https://github.com/juce-framework/JUCE>


