---
layout: post
title: "Conheça um Ambiente Desktop para o Terminal"
date: 2025-06-04 16:34:24
image: '/assets/img/tui/vtm.jpg'
description: "🐓 Esse aplicativo C++ TUI é impressionante!"
icon: 'ion:terminal-sharp'
iconname: 'TUI/C++'
tags:
- tui
- terminal
- cpp
- windows
- macos
- gnulinux
- bsd
- unix
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

O projeto **vtm** é um ambiente de desktop baseado em texto escrito em [C++](https://terminalroot.com.br/tags#cpp) que utiliza uma matriz [TUI](https://terminalroot.com.br/tags#tui) para representar toda a interface do usuário como um mosaico de células de texto no [terminal](https://terminalroot.com.br/tags#terminal).

**Principais Características:**

* **Ambiente de Desktop Baseado em Texto:** Permite a execução de múltiplas aplicações de console simultaneamente, organizadas em janelas dentro de um ambiente de desktop textual.

* **Renderização Flexível:** A matriz TUI pode ser exibida tanto em uma janela GUI própria quanto em terminais de texto compatíveis.

* **Suporte Multiplataforma:** Compatível com [Windows](https://terminalroot.com.br/tags#windows) (8.1 e posteriores), [GNU/Linux](https://terminalroot.com.br/tags#gnulinux), [macOS](https://terminalroot.com.br/tags#macos), [FreeBSD](https://terminalroot.com.br/tags#freebsd), [NetBSD](https://terminalroot.com.br/tags#bsd) e [OpenBSD](https://terminalroot.com.br/tags#openbsd).

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

* **Configuração Avançada:** Utiliza arquivos de configuração em [XML](https://terminalroot.com.br/2025/05/como-usar-o-tmxlite-para-mapas-de-jogos-windows.html) puro, permitindo herança de configurações e referências dinâmicas.

* **Aplicações Integradas:** Inclui aplicativos internos como console teletype, visualizador de logs e outros, todos operando dentro do ambiente textual.

* **Licença MIT:** Código-fonte aberto sob a licença MIT.

**Recursos Adicionais:**

* **Documentação:** Disponível no repositório, abrangendo arquitetura, opções de [linha de comando](https://terminalroot.com.br/tags#comando), [interface do usuário](https://terminalroot.com.br/tags#gui), configurações e mais.

* **Downloads Binários:** Disponíveis para várias plataformas, incluindo diferentes arquiteturas de Windows, [nix-like e macOS.

Exemplo de instalação em distros [GNU](https://terminalroot.com.br/tags#gnu)/[Linux](https://terminalroot.com.br/tags#gnulinux)`x86_64`:

{% highlight bash %}
wget -q https://github.com/directvt/vtm/releases/latest/download/vtm_linux_x86_64.zip
unzip vtm_linux_x86_64.zip
tar xf vtm_linux_x86_64.tar # Tem um .tar dentro do zip
sudo install -v vtm /usr/local/bin/
rm vtm_linux_x86_64.zip vtm_linux_x86_64.tar
{% endhighlight %}

E depois rode:

{% highlight bash %}
vtm
{% endhighlight %}

![vtm run](/assets/img/tui/vtm-print.jpg) 

Para mais informações rode:
{% highlight bash %}
vtm --help
{% endhighlight %}

---

Acesse o repositório do projeto: <https://github.com/directvt/vtm>

## 🎥 Assista ao vídeo demonstração

<iframe width="800" height="450" src="https://www.youtube.com/embed/kofkoxGjFWQ" title="vtm. Tiling Window Manager with Drag&amp;Drop" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

---

## 👓 Veja também

<iframe width="1271" height="715" src="https://www.youtube.com/embed/ucYAJHuSi1A" title="Crie Facilmente Janelas no Terminal com essa Biblioteca C++" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>



