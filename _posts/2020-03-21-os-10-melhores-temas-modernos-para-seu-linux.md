---
layout: post
title: "Os 10 Melhores Temas GTK Modernos para seu Linux"
date: 2020-03-21 13:10:11
image: '/assets/img/themes/macos-transparent.jpg'
description: 'Na ordem dos que eu mais gosto! 🏃️'
icon: 'simple-icons:gnome'
iconname: 'gnome'
tags:
- temas
- linux
- dicas
---

![Os 10 Melhores Temas Modernos para seu Linux](/assets/img/themes/macos-transparent.jpg)

O tema padrão do GNOME é bem clássico([Adwaita](https://github.com/GNOME/gtk/tree/master/gtk/theme/Adwaita)), até porque é o que eles testam e recomendam, no entanto, você pode dar uma melhorada no visual do seu GNU/Linux alterando o tema e para uma melhor experiência.

## Como instalar os temas?
Lembrando que antes de mais nada é interessante você possuir o [GNOME Tweaks](https://github.com/GNOME/gnome-tweaks) instalado, exemplos:
{% highlight bash %}
sudo emerge gnome-tweaks # Gentoo, Funtoo,...
sudo apt install gnome-tweaks # Debian, Ubuntu, Mint,...
sudo pacman -s gnome-tweaks # Arch, Manjaro,...
{% endhighlight %}
E então seguir esses passo:
### 1. Fazer download do tema, exemplo:
Você pode baixar via *http*, [git](https://terminalroot.com.br/git), via [linha de comando](https://terminalroot.com.br/2019/05/aprenda-a-explorar-o-comando-wget.html), ou qualquer outro meio que você encontrar
### 2. Descompacte o arquivo(se estiver compactado):
Recomendamos você utilizar o aplicativo [extract](https://github.com/terroo/extract), é simples e fácil de usar!
### 3. Mova para seu diretório `~/.themes`
Se não existir esse diretório na sua pasta pessoal, crie: `mkdir ~/.themes`.
> **Atenção**: Se dentro do tema que você baixar houver *variantes* dentro dele, mova as variantes. A pasta raiz é que possui diretamente o arquivo `index.theme` dentro dela.

### 4. Abra o GNOME Tweaks e escolha o tema
Tecle `Alt + F2` e digite: `gnome-tweaks`, ou rode esse comando no **terminal**
### 5. Escolha o tema que aparece:
> Escolha a linha **Aplicativos**, se você ainda não houver alterado estrá escolhido o *Adwaita(padrão)*, clique e altere para o nome do tema que você deseja, veja imagem abaixo:

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

![GNOME Tweaks](/assets/img/themes/gnome-tweaks.jpg)
### Alternativamente você pode alterar o tema via linha de comando usando o [gsettings](https://developer.gnome.org/GSettings/) com o comando:
{% highlight bash %}
gsettings set org.gnome.desktop.interface gtk-theme 'NOME_DO_TEMA'
{% endhighlight %}
Ou alterando o arquivo `vim ~/.config/gtk-3.0/settings.ini` e definindo o tema nesse arquivo:
{% highlight bash %}
[Settings]
gtk-theme-name = "NOME_DO_TEMA"
{% endhighlight %}

Caso deseje saber qual o nome do tema que está rodando no momento(current theme), use o comando:
```sh
gsettings get org.gnome.desktop.interface gtk-theme
```

### Eu selecionei os 10 melhores que eu testei atualmente de acordo com a data de publicação dessa postagem, são eles na ordem dos que eu mais gosto!

---

## 10. [Fantasma](https://www.opencode.net/ju1464/Fantasma/tree/master/GTK-Gnome/Fantasma)
![Fantasma](/assets/img/themes/fantasma.jpg)

<a href="https://www.opencode.net/ju1464/Fantasma/tree/master/GTK-Gnome/Fantasma" class="btn btn-danger btn-lg btn-block" style="color:#fff;text-decoration:none;">Download do Tema Fantasma</a>

---

## 09. [Teja](https://www.opencode.net/ju1464/Teja)
![Teja](/assets/img/themes/teja.jpg)

<a href="https://www.opencode.net/ju1464/Teja" class="btn btn-danger btn-lg btn-block" style="color:#fff;text-decoration:none;">Download do Tema Teja</a>

---

## 08. [Orchis](https://github.com/vinceliuice/Orchis-theme)

<!-- LISTA MIN -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

![Orchis](/assets/img/themes/orchis.jpg)

<a href="https://github.com/vinceliuice/Orchis-theme" class="btn btn-danger btn-lg btn-block" style="color:#fff;text-decoration:none;">Download do Tema Orchis</a>

---

## 07. [Nordic](https://github.com/EliverLara/Nordic)
![Nordic](/assets/img/themes/nordic.jpg)

<a href="https://github.com/EliverLara/Nordic" class="btn btn-danger btn-lg btn-block" style="color:#fff;text-decoration:none;">Download do Tema Nordic</a>

---

## 06. [Mint Aqua](https://www.gnome-look.org/p/1175954/)
![Mint Aqua](/assets/img/themes/mint-aqua.jpg)

<a href="https://www.gnome-look.org/p/1175954/" class="btn btn-danger btn-lg btn-block" style="color:#fff;text-decoration:none;">Download do Tema Mint Aqua</a>

---

## 05. [Materia](https://github.com/nana-4/materia-theme)
![Materia](/assets/img/themes/materia.jpg)

<a href="https://github.com/nana-4/materia-theme" class="btn btn-danger btn-lg btn-block" style="color:#fff;text-decoration:none;">Download do Tema Materia</a>

---

## 04. [Kimi](https://github.com/EliverLara/Kimi)
![Kimi](/assets/img/themes/kimi.jpg)

<a href="https://github.com/EliverLara/Kimi" class="btn btn-danger btn-lg btn-block" style="color:#fff;text-decoration:none;">Download do Tema Kimi</a>

---

## 03. [Juno](https://github.com/EliverLara/Juno)
![Juno](/assets/img/themes/juno.jpg)

<a href="https://github.com/EliverLara/Juno" class="btn btn-danger btn-lg btn-block" style="color:#fff;text-decoration:none;">Download do Tema Juno</a>

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

---

## 02. [macOS Transparent](https://github.com/paullinuxthemer/Mc-OS-themes)
![macOS Transparent](/assets/img/themes/macos-transparent.jpg)

<a href="https://github.com/paullinuxthemer/Mc-OS-themes" class="btn btn-danger btn-lg btn-block" style="color:#fff;text-decoration:none;">Download do Tema macOS Transparent</a>

---

# 01 - Arc Theme
![Arc](/assets/img/themes/arc-theme-arc.jpg)
![Arc Darker](/assets/img/themes/arc-theme-darker.jpg)
![Arc Dark](/assets/img/themes/arc-theme-dark.jpg)

<a href="https://github.com/arc-design/arc-theme" class="btn btn-danger btn-lg btn-block" style="color:#fff;text-decoration:none;">Download do Arc Theme</a>

---

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

Caso queira instalar todos de uma só vez rode esses comandos:

{% highlight bash %}
git clone https://github.com/terroo/terminalroot-themes
mkdir -p ~/.themes
mv terminalroot-themes/* ~/.themes
{% endhighlight %}

## Links úteis:
+ <https://www.gnome-look.org/>
+ <https://www.mate-look.org/>
+ <https://www.cinnamon-look.org/>
+ <https://www.xfce-look.org/>
+ <https://www.enlightenment-themes.org/>
+ <https://store.kde.org/>
+ <https://www.box-look.org/>
+ <https://www.pling.com/>

# Valeu! 


