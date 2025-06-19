---
layout: post
title: "Como Instalar facilmente Python e PIP no Windows"
date: 2025-06-19 20:52:17
image: '/assets/img/windows/python-windows.jpg'
description: "🐍 A versão mais recente!"
icon: 'ion:terminal-sharp'
iconname: 'Windows/Python'
tags:
- windows
- python
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

A forma mais rápida e fácil de instalar o [Python](https://terminalroot.com.br/tags#python) no [Windows](https://terminalroot.com.br/tags#windows) é usar o [WinGet](https://winstall.app/apps/Python.Python.3.13)

Abra o [PowerShell](https://terminalroot.com.br/2025/05/personalize-seu-powershell-like-a-pro.html) e rode:

{% highlight powershell %}
winget install -e --id Python.Python.3.11 --scope machine
{% endhighlight %}
> Se houver versões superiores após o dia de gravação desse vídeo: <https://winstall.app/apps?q=tags:%20python3>

Feche o PowerShell, abra novamente e rode o comando:
{% highlight bash %}
python --version
{% endhighlight %}
> Se aparecer a a versão é porque está tudo certo!

Aproveite e instale o [Instalar o PIP](https://winstall.app/apps/LionelJouin.PiP-Tool) também:

O **PIP** é um gerenciador de pacotes para Python, com ele instalamos tudo que precisamos para Python:

{% highlight powershell %}
winget install --id=LionelJouin.PiP-Tool  -e
{% endhighlight %}

Feche o PowerShell, abra novamente e rode o comando:
{% highlight bash %}
pip --version
{% endhighlight %}
> Se aparecer a a versão é porque está tudo certo!


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

## Veja também:
+ [Aprenda a Criar Bibliotecas pra Python com C/C++](https://terminalroot.com.br/2023/10/aprenda-a-criar-bibliotecas-pra-python-com-c-cpp.html)
+ [Conheça o Bython, um Python com chaves e sem erros de indentação](https://terminalroot.com.br/2024/08/conheca-o-bython-um-python-com-chaves-e-sem-erros-de-indentacao.html)
+ [10 Livros de Python que vale à pena você ler](https://terminalroot.com.br/2022/09/10-livros-de-python-que-vale-a-pena-voce-ler.html)
+ [Crie bibliotecas para Python com C++ de forma mais fácil](https://terminalroot.com.br/2024/08/crie-bibliotecas-para-python-com-cpp-de-forma-mais-facil.html)
+ [Conheça o Mojo 🔥, a Linguagem 35.000x Mais Rápida que Python](https://terminalroot.com.br/2023/06/conheca-o-mojo-a-linguagem-35000x-mais-rapida-que-python.html)
+ [Codon, um Compilador Python escrito com C++ e LLVM](https://terminalroot.com.br/2022/12/codon-um-compilador-python-escrito-com-cpp-e-llvm.html)
+ [Rich, uma biblioteca Python para saídas mais estilosas](https://terminalroot.com.br/2021/05/rich-uma-biblioteca-python-para-saidas-mais-estilosas.html)
+ [As 30 melhores bibliotecas e pacotes Python para Iniciantes](https://terminalroot.com.br/2019/12/as-30-melhores-bibliotecas-e-pacotes-python-para-iniciantes.html)
+ [Crie Jogos com Python e Raylib](https://terminalroot.com.br/2024/05/crie-jogos-com-python-e-raylib.html)

