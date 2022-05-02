---
layout: post
title: "Instale esse Gerenciador de Janelas escrito em C++"
date: 2022-05-02 09:53:46
image: '/assets/img/wm//wmderland.jpg'
description: 'Com configurações similar à do i3wm e gaps como o bspwm.'
icon: 'ion:terminal-sharp'
iconname: 'WM'
tags:
- cpp
- cppdaily
- wm
- unixporn
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**WMDerland** é um gerenciador de janelas lado a lado(Tiling Window Manager) para o servidor X11 e usa árvores de particionamento de espaço. 

Foi escrito em [C++](https://terminalroot.com.br/tags#cpp), possui *gaps*(espaços) entre as janelas e pode ser configurado facilmente por um arquivo com sintaxe`INI` . 

---

# Instalação
Antes de instalar você precisará das seguintes dependências:

+ [Git](https://terminalroot.com.br/tags#git)
+ [LibX11](https://terminalroot.com.br/2021/05/5-dicas-rapidas-para-cpp.html#02-obter-a-resolu%C3%A7%C3%A3o-da-sua-tela)
+ [G++](https://terminalroot.com.br/tags#g++)/[GCC](https://terminalroot.com.br/tags#gcc)
+ [Make](https://terminalroot.com.br/tags#make)
+ [CMake](https://terminalroot.com.br/tags#cmake)

Exemplo de instalação de dependências em sistemas que usam o gerenciador de pacotes APT:

{% highlight sh %}
sudo apt install git libx11-dev g++ gcc make cmake
{% endhighlight %}

Agora basta clonar, entrar no diretório e construir com os seguintes comandos:

{% highlight sh %}
git clone https://github.com/aesophor/wmderland
cd wmderland
./build --install
{% endhighlight %}
> Após finalização da construção irá pedir sua senha de `sudo/doas/su` para copiar os arquivos para os diretórios do sistema.

Você também pode instalar via [AUR](https://aur.archlinux.org/packages/wmderland-git/) ou [Overlay](https://github.com/aesophor/aesophor-overlay) no Arch ou Gentoo, respectivamente:
{% highlight sh %}
yay -S wmderland-git
emerge -av x11-wm/wmderland
{% endhighlight %}


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

# Configuração
Após instalado crie um diretório de nome `wmderland` em `~/.config` e copie o arquivo de configuração padrão:

{% highlight sh %}
mkdir -p ~/.config/wmderland
cp /etc/xdg/wmderland/config ~/.config/wmderland/.
{% endhighlight %}

No [arquivo de configuração](https://github.com/aesophor/wmderland/blob/master/example/config) o [emulador de terminal](https://terminalroot.com.br/2019/08/os-10-melhores-emuladores-de-terminal-para-seu-linux.html) padrão é o [rxvt-unicode](http://software.schmorp.de/pkg/rxvt-unicode.html), se você não tiver ele instalado altere a **linha 178** do arquivo de configuração e substitua `urxvt` pelo seu terminal, exemplo se você utiliza o `gnome-terminal`:

{% highlight sh %}
sed -i 's/exec urxvt/exec gnome-terminal/g' ~/.config/wmderland/config
{% endhighlight %}

Agora é só deslogar, escolher o `wmderland`, que já estará disponível, no seu Display Manager e logar. Se você loga com `~/.xinitrc` adicione essa linha ao mesmo:

{% highlight sh %}
exec wmderland
{% endhighlight %}

---

# Utilização
O WMDerland utiliza a tecla `Super` como `mod`, logo os atalhos de teclado mais comuns são:
+ **Super + Enter** - Abre o terminal padrão definido;
+ **Super + Shift + q** - Fecha uma janela;
+ **Super + Shift + Esc** - Desloga do WMDerland;

E entre outras que você também pode modificar no [arquivo de configuração](https://github.com/aesophor/wmderland/blob/master/example/config) .

Há algumas configurações já pré estabelecidas no `config` que você deve alterar/remover conforme os softwares instalados no seu sistema.

Para mais informações acesse o [repositório oficial](https://github.com/aesophor/wmderland) .




