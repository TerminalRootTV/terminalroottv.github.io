---
layout: post
title: "Conheça esse emulador de terminal escrito em Zig"
date: 2025-04-28 13:04:25
image: '/assets/img/terminal/ghostty.png'
description: "🚀 Multiplataforma, rápido e rico em recursos."
icon: 'ion:terminal-sharp'
iconname: 'Terminal'
tags:
- zig
- terminal
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**Ghostty** é um emulador de terminal multiplataforma, rápido e rico em recursos, desenvolvido em [Zig](https://terminalroot.com.br/tags#zig). Seu diferencial é combinar desempenho, interface nativa e conformidade com padrões modernos, sem comprometer nenhum desses aspectos.

### Principais Características
- **Desempenho**: Utiliza renderização via GPU (OpenGL no [GNU/Linux](https://terminalroot.com.br/tags#gnulinux), Metal no [macOS](https://terminalroot.com.br/tags#macos)), mantendo *60fps* mesmo sob carga intensa. Em benchmarks, supera terminais como *iTerm* e *Terminal.app* em velocidade de I/O . 

- **Interface Nativa**: No macOS, é uma aplicação [SwiftUI](https://terminalroot.com.br/tags#swift) completa com suporte a menus, preferências e integração ao sistema. No Linux, utiliza GTK4 e libadwaita, oferecendo uma experiência visual consistente com o ambiente .

- **Conformidade com Padrões**: Implementa extensivamente sequências de controle do [xterm](https://terminalroot.com.br/tags#terminal), além de suportar protocolos modernos como o de gráficos e teclado do [Kitty](https://terminalroot.com.br/tags#terminal). É compatível com [shells](https://terminalroot.com.br/tags#shell) e ferramentas existentes .

- **Recursos Avançados**: Suporte a múltiplas janelas, abas, divisões de tela, ligaduras tipográficas e renderização de gráficos inline.

- **Biblioteca Embutível**: Disponibiliza o `libghostty`, uma biblioteca [C](https://terminalroot.com.br/c) compatível para integração em outros projetos. O próprio aplicativo macOS é um consumidor dessa biblioteca .

### Status Atual
- Disponível para macOS e Linux.
- Versão 1.0 lançada após dois anos de testes privados com cerca de 2.000 usuários .
- Código-fonte aberto sob licença MIT.
- Mais de 30 mil estrelas no GitHub.
- Versão para Windows ainda em desenvolvimento.


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
No [Ubuntu](https://terminalroot.com.br/tags#ubuntu) eu instalei usando o AppImage: [Ghostty-1.1.4-main+38445dc-x86_64.AppImage](https://github.com/pkgforge-dev/ghostty-appimage/releases)
{% highlight bash %}
wget https://github.com/pkgforge-dev/ghostty-appimage/releases/download/tip/Ghostty-1.1.4-main+38445dc-x86_64.AppImage
chmod +x Ghostty-1.1.4-main+38445dc-x86_64.AppImage
./Ghostty-1.1.4-main+38445dc-x86_64.AppImage
{% endhighlight %}
> Fiz isso porque tentei via snap, mas tá bugado!

Veja abaixo instalação para outros sistemas operacionais:

{% highlight bash %}
brew install --cask ghostty # Brew/macOS
sudo snap install ghostty --classic # Snap/Ubuntu[BUGADO]
sudo pacman -S ghostty # Pacman/Arch
emerge -av ghostty # Gentoo

# Fedora
dnf copr enable pgdev/ghostty
dnf install ghostty
{% endhighlight %}
> Mais aqui: <https://ghostty.org/docs/install/binary>

### Construir do Zero
Instale o [Zig](https://terminalroot.com.br/tags#zig) via [essa postagem](https://terminalroot.com.br/2021/11/primeiros-passos-com-a-linguagem-de-programacao-zig.html>
+ <https://ziglang.org/download/) utilize a versão estável mais recente(não a *branch* de desenvolvimento) que de acordo com essa postagem até a data atuall é a versão: `0.14.0`.

Para compilar o Ghostty:

Clone o repositório:
{% highlight bash %}
git clone https://github.com/ghostty-org/ghostty
cd ghostty
{% endhighlight %}

Compile:
{% highlight bash %}
zig build -Doptimize=ReleaseSafe
{% endhighlight %}
   
Depois de compilar o Ghostty, instale com:

{% highlight bash %}
zig build install
{% endhighlight %}

Por padrão, ele instala em `~/.local/bin`. Você pode mudar o local com:

{% highlight bash %}
zig build install --prefix /caminho/desejado
{% endhighlight %}

Se quiser pode criar um ícone para o launch:

Aqui está um exemplo simples de `.desktop` para o Ghostty:

{% highlight ini %}
[Desktop Entry]
Name=Ghostty
Exec=/home/seu-usuario/.local/bin/ghostty
Icon=utilities-terminal
Type=Application
Categories=Utility;TerminalEmulator;
{% endhighlight %}

Salve como `ghostty.desktop` em `~/.local/share/applications/` e rode:

{% highlight bash %}
update-desktop-database ~/.local/share/applications
{% endhighlight %}

---

Para mais informações acesse o [repositório oficial](https://github.com/ghostty-org/ghostty)


