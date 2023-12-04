---
layout: post
title: "Instale esse Emulador de Terminal feito com TypeScript"
date: 2023-12-04 14:47:51
image: '/assets/img/typescript/tabby.png'
description: 'Configurações fáceis e utiliza até CSS para personalização!'
icon: 'ion:terminal-sharp'
iconname: 'Terminal/TypeScript'
tags:
- typescript
- terminal
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**Tabby** é um [emulador de terminal](https://terminalroot.com.br/2019/08/os-10-melhores-emuladores-de-terminal-para-seu-linux.html) disponível para [Windows](https://terminalroot.com.br/tags#windows), [macOS](https://terminalroot.com.br/tags#macos) e [GNU/Linux](https://terminalroot.com.br/tags#gnulinux) para diversas arquiteturas incluindo: `x86` e `ARM`.

É infinitamente personalizável para usar a [Shell](https://terminalroot.com.br/tags#shell) localmente ou via [SSH](https://terminalroot.com.br/tags#ssh) e [Telnet](https://terminalroot.com.br/2017/02/100-melhores-ferramentas-de-seguranca-de-codigo-aberto.html).

---

# Instalação
Você pode fazer o download diretamente da [página de releases do repositório deles](https://github.com/Eugeny/tabby/releases/tag/v1.0.205). Como disse, há binários para diversas arquiteturas e [sistemas operacionais](https://terminalroot.com.br/tags/#sistemasoperacionais).

Por exemplo, em [distros](https://terminalroot.com.br/tags#distros) [GNU/Linux](https://terminalroot.com.br/tags#gnulinux) você pode usar até um AppImage:
> Exemplo para: `x86_62`
{% highlight bash %}
wget -q https://github.com/Eugeny/tabby/releases/download/v1.0.205/tabby-1.0.205-linux-x64.AppImage
chmod +x tabby-1.0.205-linux-x64.AppImage
./tabby-1.0.205-linux-x64.AppImage
{% endhighlight %}
> Já abrirá funcionando!

Para Windows, macOS e outros você também pode instalar através de binários pré-compilados: `.exe`, `.dmg`, `.deb` e entre outros.


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

# Utilização
Absolutamente tudo que você faz em outros emuladores é possível com o Tabby, tais como:
+ Alterar o tipo do cursor: `I-Beam`, `Block` e `Line`
+ Definir temas de cores
+ Customizar fonte
+ ...

Se você clicar no ícone de engrenagem(⚙️ ) no canto superior direito, e depois clicar em `Appearance` ao final há possibilidade de inserir CSS em: `Custom CSS`. Por exemplo, deixar fundo transparente e com imagem, adicione esse CSS:
{% highlight css %}
.xterm-viewport {
   background-image: url("/caminho/para/image.jpg");
   background-repeat: no-repeat;
   background-size: auto 100vh;
   opacity: 0.2;
   z-index: 1;
   filter: blur(8px);
}
{% endhighlight %}

E entre diversas outras personalizações!

Eu instalei e tô curtindo, inclusive fiz esse artigo no [Neovim](https://terminalroot.com.br/tags#neovim) aberto pelo **Tabby**.

Para mais informações acesse:
+ [Página Oficial](https://tabby.sh/)
+ [Repositório Oficial do Tabby](https://github.com/Eugeny/tabby)



