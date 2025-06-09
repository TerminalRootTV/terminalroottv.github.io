---
layout: post
title: "Conheça o Ecode: Um Editor Leve, Multiplaforma e Moderno"
date: 2025-06-09 10:29:37
image: '/assets/img/lua/ecode.jpg'
description: "🌒 Feito com Lua e disponível para Windows, macOS, Haiku, GNU/Linux e BSD."
icon: 'ion:terminal-sharp'
iconname: 'Editor'
tags:
- editores
- lua
- cpp
- sdl
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**Ecode** é um editor de código leve escrito com [Lua](https://terminalroot.com.br/tags#lua), com foco em desempenho e fluidez, construído com a GUI acelerada por hardware da [biblioteca eepp](https://github.com/SpartanJ/eepp) escrita em [C++](https://terminalroot.com.br/tags#cpp). Está licenciado sob MIT, conta com mais de 1.100 estrelas e contribui para evolução do `eepp` .

**Principais recursos**

* Interface minimalista, portátil e altamente responsiva
* Realce de sintaxe (100+ linguagens, suporte semântico via LSP)
* Múltiplos cursores, terminal embutido, minimap
* Suporte a LSP, depuração via Debug Adapter Protocol
* Integração com Git (status, blame, branches, diffs)
* Paleta de comandos, autocomplete, lint/format personalizáveis
* Global search e replace rápido (regex, Lua, Perl)
* Divisão de janelas, soft‑wrap, code folding
* Sessões com snapshot/backup automático
* Suporte a temas, escala de GUI, modos claro/escuro
* Plugins: AI Assistant, Discord Rich Presence, entre outros.

Compatível com [Windows](https://terminalroot.com.br/tags#windows), [macOS](https://terminalroot.com.br/tags#macos), [Haiku](https://terminalroot.com.br/2021/05/conheca-o-haiku-um-sistema-operacional-escrito-em-cpp.html), [GNU](https://terminalroot.com.br/tags#gnu)/[Linux](https://terminalroot.com.br/tags#gnulinux) e [BSD](https://terminalroot.com.br/tags#bsd). 


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

## Instalação
Você pode fazer o download direto da página de *releases*, exemplos:

+ [ecode-windows-0.7.1-x86_64.zip](https://github.com/SpartanJ/ecode/releases/download/ecode-0.7.1/ecode-windows-0.7.1-x86_64.zip)
+ [ecode-freebsd-0.7.1-x86_64.tar.gz](https://github.com/SpartanJ/ecode/releases/download/ecode-0.7.1/ecode-freebsd-0.7.1-x86_64.tar.gz)
+ [ecode-haiku-0.7.1-x86_64.tar.gz](https://github.com/SpartanJ/ecode/releases/download/ecode-0.7.1/ecode-haiku-0.7.1-x86_64.tar.gz)
+ [ecode-macos-0.7.1-arm64.dmg](https://github.com/SpartanJ/ecode/releases/download/ecode-0.7.1/ecode-macos-0.7.1-arm64.dmg)
+ [ecode-macos-0.7.1-x86_64.dmg](https://github.com/SpartanJ/ecode/releases/download/ecode-0.7.1/ecode-macos-0.7.1-x86_64.dmg)
+ [ecode-linux-0.7.1-x86_64.AppImage](https://github.com/SpartanJ/ecode/releases/download/ecode-0.7.1/ecode-linux-0.7.1-x86_64.AppImage)
+ [ecode-linux-0.7.1-x86_64.tar.gz](https://github.com/SpartanJ/ecode/releases/download/ecode-0.7.1/ecode-linux-0.7.1-x86_64.tar.gz)

Existem versões para ARM também para todos os sistemas operacionais. Exemplo de instalação para distros GNU/Linux:

{% highlight bash %}
tar xvf ecode-linux-*.tar.gz
sed -i 's/Icon.*/Icon=\/opt\/ecode\/ecode.png/' ecode/ecode.desktop
sudo cp ecode/ecode.desktop /usr/share/applications/
sudo mv ecode/ /opt/
sudo ln -s /opt/ecode/ecode.bin /usr/local/bin/ecode
sudo chmod +x /usr/local/bin/ecode
sudo ln -s /opt/ecode/libs/libeepp.so /usr/lib/libeepp.so
sudo ln -s /opt/ecode/libs/libSDL2-2.0.so.0 /usr/lib/libSDL2-2.0.so.0
{% endhighlight %}

Verifique a instalação:
{% highlight bash %}
ecode --version
{% endhighlight %}

![Ecode](/assets/img/lua/ecode-run.jpg) 

---

Ecode é uma proposta sólida de editor moderno: eficiente, leve, com recursos avançados e interface responsiva. Se busca performance sem abrir mão de funcionalidades, vale testar. Por ainda estar em evolução, ideal para uso pessoal e projetos, mas para ambientes críticos, utilize com cautela.

Para mais informações acesse: <https://github.com/SpartanJ/ecode>


