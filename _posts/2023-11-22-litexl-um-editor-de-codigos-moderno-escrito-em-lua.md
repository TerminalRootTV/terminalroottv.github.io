---
layout: post
title: "LiteXL, um Editor de Códigos Moderno escrito em Lua"
date: 2023-11-22 11:45:16
image: '/assets/img/lua/lite-xl.jpg'
description: 'A digitação fica mais leve e o visual é muito agradável!'
icon: 'ion:terminal-sharp'
iconname: 'Lua/Editor de Código'
tags:
- lua
- editores
- linguagemc
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**Lite XL** é um moderno [editor de código](https://terminalroot.com.br/tags#editores) escrito em [Lua](https://terminalroot.com.br/tags#lua) e [Linguagem C](https://terminalroot.com.br/tags#linguagemc) com um design muito elegante.

Ele é um fork do **Lite**, mas o Lite faz tempo que não há novos *commits*, por isso o LiteXL foi criado.

Eu fiz alguns testes e achei agradável de digitar(inclusive essa postagem eu escrevi nele) e tem um interface bem leve.

Nesse artigo veremos como instalar e os primeiros passos com o LiteXL.

---

# Instalação
É possível instalar de diversas formas:  
+ usar ogerenciador de pacotes do seu sistema operacional; 
+ compilar do zero(foi assim que eu instalei);
+ fazer download do binário pré-compilado em formato compactado, descompactar e executar e/ou instalar.


Se quiser usar gerenciador de pacotes:
{% highlight bash %}
choco install lite-xl                             # chocolatey
scoop bucket add extras && scoop install lite-xl  # scoop
sudo port install lite-xl                         # macports
yay -S lite-xl                                    # AUR
nix-env -i lite-xl                                # nixos
sudo dnf install lite-xl                          # fedora
{% endhighlight %}

---

Para fazer download de binários pré-compilado você pode fazer o download diretamente da página de [releases](https://github.com/lite-xl/lite-xl/releases).


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

Para compilar do zero, certifique-se de antes possuir as ferramentas de construção: [GCC](https://terminalroot.com.br/tags#gcc), [Git](https://terminalroot.com.br/tags#git), [Meson](https://terminalroot.com.br/tags#meson) e [Ninja](https://terminalroot.com.br/tags#ninja).

Depois é só rodar os comandos abaixo na ordem:
> Exemplo em [Distros](https://terminalroot.com.br/tags#distros) [GNU](https://terminalroot.com.br/tags#gnu)/[Linux](https://terminalroot.com.br/tags#linux):

{% highlight bash %}
git clone https://github.com/lite-xl/lite-xl
cd lite-xl
meson setup --buildtype=release --prefix /opt build
meson compile -C build
DESTDIR="$(pwd)/lite-xl" meson install --skip-subprojects -C build
sudo mkdir -p /opt/lite-xl
sudo mv ./lite-xl/opt/* /opt/lite-xl/
sudo ln -s /opt/lite-xl/bin/lite-xl /usr/local/bin/lite-xl
{% endhighlight %}
> Depois remova o repositório clonado: `cd .. && rm -rf lite-xl/`

Crie um ícone para acessar facilmente pelo dashboard:
{% highlight bash %}
sudo vim /usr/share/applications/com.lite_xl.LiteXL.desktop
{% endhighlight %}

Adicione o conteúdo abaixo:
{% highlight bash %}
[Desktop Entry]
Type=Application
Name=Lite XL
Comment=A lightweight text editor written in Lua
Exec=lite-xl %F
Icon=/opt/lite-xl/share/icons/hicolor/scalable/apps/lite-xl.svg
Terminal=false
StartupWMClass=lite-xl
Categories=Development;IDE;
MimeType=text/plain;inode/directory;
{% endhighlight %}

Atualize a exibição do ícone
{% highlight bash %}
xdg-desktop-menu forceupdate
{% endhighlight %}

Após isso é só procurar no Dashboard do seu sistema e abrí-lo!

---

# Utilização
Alguns atalhos são similares a outros editores e IDEs, exemplos:
+ `Ctrl + o` - Abre um arquivo, detalhe: Não há janela suspensa, aparece um *input* na parte inferior do Editor e você precisa digitar o caminho do aquivo.
+ `Ctrl + s` - Salva um arquivo
+ `Ctrl + z` - Desfaz uma operação
+ `Ctrl + y` - Refaz uma operação  

E entre outros.

O arquivo de configuração fica no caminho:
{% highlight bash %}
lite-xl ~/.config/lite-xl/init.lua
{% endhighlight %}

O arquivo possui diversos comentários que auxiliam de forma intuitiva como você auto-configurá-lo, por exemplo:

Alterar a fonte e o tamanho da mesma:
> Exemplo:
{% highlight bash %}
style.font = renderer.font.load("/home/[USUARIO]/.local/share/fonts/JetBrainsMono-Medium.ttf", 16 * SCALE)
{% endhighlight %}
> Observação: **Troque [USUARIO] pelo nome do seu usuário! Precisa remover o DATADIR e a concatenação, além de pôr o caminho completo, ou seja, não use variáveis da SHELL e nem atalhos: `~`.**

Existem diversos plugins que você pode adicionar que servem para: Auto-complete, LSP, Snnipets, ColorScheme,...

E ele podem ser adquiridos nos endereços: 
+ Plugins: <https://github.com/lite-xl/lite-xl-plugins>
+ Temas de Cores: <https://github.com/lite-xl/lite-xl-colors>

Para mais informações, documentação, tutoriais e dicas, accesse os links:
+ Repositório no GitHub: <https://github.com/lite-xl/lite-xl>
+ Página Oficial: <https://lite-xl.com/>
+ Servidor no Discord(Tem sempre mais 60 pessoas online): <https://discord.gg/UQKnzBhY5H>
+ Documentação: <https://lite-xl.com/en/documentation/usage>
+ Tutoriais: <https://lite-xl.com/en/tutorials/simple-plugin>


