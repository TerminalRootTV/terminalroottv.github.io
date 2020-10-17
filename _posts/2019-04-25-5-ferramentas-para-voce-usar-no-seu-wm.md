---
layout: post
title: "5 Ferramentas para você usar no seu WM"
date: 2019-04-25 20:16:38
image: '/assets/img/dicas/5-tools-to-unixporn.jpg'
description: '5 ferramentas (in)úteis, mas atrativas para usar no seu rice no #unixporn .'
tags:
- shellscript
- shell
- bash
- fetch
---

![ScreenShot](/assets/img/dicas/5-tools-to-unixporn.jpg)

Nessa postagem vou mostrar 5 ferramentas (in)úteis, mas atrativas para usar no seu *rice* no [#unixporn](https://www.reddit.com/r/unixporn/)

## 1. Pipes

Pipes são proteções de tela animadas

Para instalar:

{% highlight bash %}
git clone https://github.com/pipeseroni/pipes.sh.git
cd pipes.sh
sudo make install
{% endhighlight %}

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Depois rode `pipes.sh` no terminal , para sair pressione a tecla *q* . Mais informações e parâmetros consulte a página da secção 6 do manual: `man 6 pipes.sh` .

![Screenshot pipes.sh](/assets/img/dicas/pipes.sh.png)

Links úteis pro **pipes.sh**
+ <https://github.com/pipeseroni/pipes.sh>
+ <https://pipeseroni.github.io/pipes.sh/pipes.sh.6.html#HISTORY>

## 2. tty-clock

Exibe um simples relógio digital no terminal.

Para instalar:

{% highlight bash %}
git clone https://github.com/xorg62/tty-clock.git
cd tty-clock
sudo make install
{% endhighlight %}

<!-- LISTA MIN -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Depois rode `tty-clock` no terminal se quiser deixar no centro rode com o parâmetro *-c* `tty-clock -c` , para sair pressione a tecla *q* . Mais informações e parâmetros consulte a página da secção 1 do manual: `man 1 tty-clock` .

![Screenshot tty-clock](/assets/img/dicas/tty-clock.png)

Link pro **tty-clock**
+ <https://github.com/xorg62/tty-clock>

## 3. Neofetch com imagens:

Exibe imagem no neofetch em vez de caracteres ASCII .

Após instalar o Neofetch via seu gerenciador de pacotes, instale também o pacote **w3m**, exemplos:

{% highlight bash %}
emerge w3m # Gentoo, Funtoo, Sabayon, ...
apt install w3m # Debian, Ubuntu, Mint, ...
pacman -S w3m # Arch, Manjaro, Antergos, ...
{% endhighlight %}

Depois edite o arquivo de configuração do neofetch: `vim ~/.config/neofetch/config.conf` em seguida procure a linha com o termo: *image_backend* , se não encontrar adicione-a atribuido ao w3m: `image_backend="w3m"` .

<!-- RETANGULO LARGO 2 -->
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

Altere também a linha com o termo **image_source** e atribua o caminho da sua imagem: `image_source="/caminho/da/imagem.png"` , se quiser que apareça o seu Wallpaper, atribua a palavra *wallpaper*: `image_source="wallpaper"`

Rode o `neofetch`.

![Screenshot neofetch](/assets/img/dicas/neofetch.jpg)

Link pro **neofetch**
+ <https://github.com/dylanaraps/neofetch>


## 4. pacman.sh:

Baixe o código: `wget http://bit.ly/pacmansh -O pacman.sh` , torne-o executável `chmod +x pacman.sh` , rode-o: `./pacman.sh` . Se quiser que apareça sempre que abrir o terminal, rode os comandos abaixo:

Para [BASH](http://terminalroot.com.br/shell):
{% highlight bash %}
mv pacman.sh ~/.local/share/
echo '$HOME/.local/share/pacman.sh' >> ~/.bashrc
{% endhighlight %}

Para [ZSH](http://terminalroot.com.br/2018/02/como-instalar-e-usar-o-shell-zsh-e-o-oh-my-zsh.html):
{% highlight bash %}
mv pacman.sh ~/.local/share/
echo '$HOME/.local/share/pacman.sh' >> ~/.zshrc
{% endhighlight %}

Para [FISH](http://terminalroot.com.br/2018/01/fish-shell-mais-produtividade-no-seu-shell-script.html):
{% highlight bash %}
mv pacman.sh ~/.local/share/
echo '$HOME/.local/share/pacman.sh' >> ~/.config/fish/config.fish
{% endhighlight %}

![Screenshot pacman.sh](/assets/img/dicas/pacman.sh.png)

<!-- RETANGULO LARGO -->
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

## 5. colors.sh

Testa o esquema de cores do emulador do seu terminal.

Baixe o código: `wget http://bit.ly/colorssh -O colors.sh` , torne-o executável `chmod +x colors.sh` , rode-o: `./colors.sh` . Se quiser que vire um comando pro seu usuário, rode os comandos abaixo:

Para [BASH](http://terminalroot.com.br/shell):
{% highlight bash %}
mv colors.sh ~/.local/share/
echo 'alias colors="$HOME/.local/share/colors.sh"' >> ~/.bashrc
source ~/.bashrc
colors
{% endhighlight %}

Para [ZSH](http://terminalroot.com.br/2018/02/como-instalar-e-usar-o-shell-zsh-e-o-oh-my-zsh.html):
{% highlight bash %}
mv colors.sh ~/.local/share/
echo 'alias colors="$HOME/.local/share/colors.sh"' >> ~/.zshrc
source ~/.zshrc
colors
{% endhighlight %}

Para [FISH](http://terminalroot.com.br/2018/01/fish-shell-mais-produtividade-no-seu-shell-script.html):
{% highlight bash %}
mv colors.sh ~/.local/share/
echo 'alias colors="$HOME/.local/share/colors.sh"' >> ~/.config/fish/config.fish
source ~/.config/fish/config.fish
colors
{% endhighlight %}

![Colors.sh](/assets/img/dicas/colors.sh.png)

Links úteis:

+ [Novo Curso Extremamente Avançado de Shell Script Bash](http://terminalroot.com.br/2018/06/novo-curso-extremamente-avancado-de-shell-script-bash.html)
+ [Como Criar um FETCH, estilo ScreenFetch e Neofetch em SHELL SCRIPT](http://terminalroot.com.br/2019/01/como-criar-um-fetch-estilo-screenfetch-e-neofetch-em-shell-script.html)
+ [Fish Shell, mais produtividade no seu Shell Script](http://terminalroot.com.br/2018/01/fish-shell-mais-produtividade-no-seu-shell-script.html)
+ [Aprenda a Criar Shell Script Profissional - Episódio 1](http://terminalroot.com.br/2018/09/aprenda-a-criar-shell-script-profissional-episodio-1.html)
+ [Como Instalar e Usar o Shell ZSH e o Oh My Zsh!](http://terminalroot.com.br/2018/02/como-instalar-e-usar-o-shell-zsh-e-o-oh-my-zsh.html)

## Quer ficar fera no Terminal e em comandos Linux ?

Conheça nos cursos de [Shell Script](http://terminalroot.com.br/shell) e [entre outros](http://terminalroot.com.br/cursos).

## Comente!

Valeu!

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


