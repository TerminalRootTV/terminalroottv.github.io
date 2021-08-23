---
layout: post
title: "Crie Interfaces Gráficas com Ultimate++"
date: 2021-08-21 16:37:04
image: '/assets/img/cpp/upp/ultimatepp.png'
description: 'Para programadores C++ que usam Linux, Windows, macOS e FreeBSD'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- c++
- cppdaily
---

![Crie Interfaces Gráficas com Ultimate++](/assets/img/cpp/upp/ultimatepp.png)

U++ é uma framework de desenvolvimento rápido de aplicativos de plataforma cruzada  em [C++](https://terminalroot.com.br/cpp) focada na produtividade dos programadores. Inclui um conjunto de bibliotecas ([GUI](https://terminalroot.com.br/cpp), [SQL](https://terminalroot.com.br/tags#sql), etc.) e um ambiente de desenvolvimento integrado.

Ele utiliza o IDE: **TheIDE** que é compilado junto com o Ultimate++ e que também pode ser usado para desenvolver aplicativos não U++.

U++ suporta as seguintes plataformas no nível de produção: [Windows](https://terminalroot.com.br/tags#windows), [macOS](https://terminalroot.com.br/tags#macos), [GNU](http://terminalroot.com.br/tags#gnu)/[Linux](https://terminalroot.com.br/linux) e [FreeBSD](https://terminalroot.com.br/tags#freebsd).

É resumo é simples e portável!


<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# Instalação
Para usuário Windows é possível fazer o download do Ultimate++ [nesse link](https://www.ultimatepp.org/downloads/upp-win-16057.7z) e para usuários macOS [nesse link](https://www.ultimatepp.org/downloads/upp-macos-16056.tar.xz).

Para usuários Linux e FreeBSD, procedam da seguinte forma:

## 1º - Instale as dependências
> Use `sudo` ou `doas` para cada um/depender do caso.

Clique no botão para ver o comando de acordo com sua distro/sistema.

<script>
  function change_code(num){
    const com = ["apt-get install g++ clang make libgtk-3-dev libnotify-dev libbz2-dev libssl-dev xdotool",
                 "emerge gui-libs/gtk x11-misc/xdotool x11-libs/libnotify",
                 "dnf install gcc-c++ clang make gtk3-devel libnotify-devel bzip2-devel freetype-devel openssl-devel",
                 "pacman -Sy --needed gcc make zlib bzip2 gtk3 libnotify openssl clang pkgconfig gdb",
                 "pkg install bash gmake gtk3 libnotify llvm90 pkgconf",
                 "zypper install gcc-c++ clang make gtk3-devel libnotify-devel bzip2-devel freetype-devel libopenssl-devel",
                 "# Pesquise os nomes dos pacotes de dependências utilizando qualquer distro citada aqui."]
    document.getElementById("code").innerHTML = com[num]
  }
</script>


<p>
  <button class="btn btn-primary btn-sm" id="cc-0" onclick="change_code(0)">Debian/Ubuntu/Mint</button> 
  <button class="btn btn-warning btn-sm" id="cc-1" onclick="change_code(1)">Gentoo</button> 
  <button class="btn btn-danger btn-sm" id="cc-2" onclick="change_code(2)">Fedora/Red Hat</button> 
  <button class="btn btn-info btn-sm" id="cc-3" onclick="change_code(3)">Arch/Manjaro</button>
  <button class="btn btn-danger btn-sm" id="cc-4" onclick="change_code(4)">FreeBSD</button>
  <button class="btn btn-success btn-sm" id="cc-5" onclick="change_code(5)">OpenSUSE</button>
  <button class="btn btn-dark btn-sm" id="cc-6" onclick="change_code(6)">Outra Distro/Sistema</button>
</p>

<pre><code id="code">apt-get install g++ clang make libgtk-3-dev libnotify-dev libbz2-dev libssl-dev xdotool</code></pre>



## 2º - Faça o download
> Exemplo usando [wget](https://terminalroot.com.br/2019/05/aprenda-a-explorar-o-comando-wget.html)

{% highlight bash %}
wget https://www.ultimatepp.org/downloads/upp-posix-16057.tar.xz
{% endhighlight %}
> Verifique se há uma nova versão [nesse link](https://www.ultimatepp.org/www$uppweb$download$en-us.html)

## 3º - Descompacte o arquivo `tar.xz`
{% highlight bash %}
tar Jxvf upp-posix-16057.tar.xz
{% endhighlight %}

## 4º - Entre no diretório descompactado
{% highlight bash %}
cd ./upp
{% endhighlight %}

## 5º - Agora instale
{% highlight bash %}
./install
{% endhighlight %}

Tecle `Y` para as perguntas no terminal durante a compilaçao. O binário final será gerado no próprio diretório com o nome TheIDE: `theide`, caso queira verificar se está funcionando, execute-o, ou instale no seu sistema:


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

## 6º - Instale no seu sistema
As imagens estarão no diretório `/uppsrc/ide`, mas são bem "*feinhas*" se quiser usá-las, fique à vontade, mas se quiser uma imagem mas bacana, baixe e salve em `pixmaps`:
{% highlight bash %}
sudo wget https://www.ultimatepp.org/index.html_0.png -O /usr/share/pixmaps/theide.png
{% endhighlight %}

## 7º - Copie o binário para `$PATH`
{% highlight bash %}
sudo cp ./theide /usr/local/bin/
sudo chmod +x /usr/share/applications/theide.desktop
{% endhighlight %}

## 8º - Copie o arquivo para o launcher
{% highlight bash %}
sudo cp ./uppsrc/ide/theide.desktop /usr/share/applications/
{% endhighlight %}

## 9º - Procure no Dash do seu desktop
![Dash GNOME U++](/assets/img/cpp/upp/dash-gnome-upp.png)

> **OBSERVAÇÃO**: Se não aparecer para você, tente rodar o TheIDE pelo terminal com o comando: `theide`, para torná-lo disponível ao sistema.

## 10º - Aceite a licença
![Licença U++](/assets/img/cpp/upp/license-upp.png)

# Criando o primeiro projeto
Após aberto pela primeira vez aparecerá uma tela similar a essa em baixo, clique na opção: **Assembly**


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

![Assembly U++](/assets/img/cpp/upp/select-assembly-upp.png)

Selecione **MyApps** e depois em **New package**

![Dash GNOME U++](/assets/img/cpp/upp/myapps-upp.png)

Em **Package name** digite o nome do arquivo, exemplo: `main.cpp` e selecione a opção **U++ Basic Ctrllib application** e clique em **Create**

![U++ Basic Ctrllib application](/assets/img/cpp/upp/create-upp-gui.png)

Agora em **main.cpp** digite o código que deseja, nesse exemplo só uma frase de teste:
{% highlight cpp %}
#include <CtrlLib/CtrlLib.h>

using namespace Upp;

GUI_APP_MAIN{
	PromptOK("Olá, Ultimate++! Bem-vindo ao Terminal Root!");
}
{% endhighlight %}

Na *Barra de Ferramentas* há atalhos para o **Build** e **Executar**, mas se preferir, tecle **F7** para compilar/build/construir e **Ctrl + F5** para executar!

Aparecerá a imagem:

![Olá, Ultimate++! Bem-vindo ao Terminal Root!](/assets/img/cpp/upp/ola-upp.png)


Para mais informações e dicas de uso dos Widgets veja [esse link](https://www.ultimatepp.org/srcdoc$CtrlLib$Tutorial$en-us.html) e também a [documentação](https://www.ultimatepp.org/www$uppweb$documentation$en-us.html)

![Ultimate++](/assets/img/cpp/upp/open-window-bottom-to-build-upp.png)

## Página oficial do Ultimate++
### <https://www.ultimatepp.org/>

---

Por hoje é só, são pequenas doses diárias que farão sempre nos manter antenado com o [C++](https://terminalroot.com.br/cpp/) !

## Acompanhe o [cpp::daily](https://terminalroot.com.br/tags#cppdaily)

# Deseja aprender [C++](https://terminalroot.com.br/cpp/) e criar seus programas Gráficos e para Terminal com portabilidade para Linux e Windows?
Então se inscreva nos nossos [Cursos de C++ Moderno](https://terminalroot.com.br/cpp/) . Você aprender criar:
- [Games](https://terminalroot.com.br/tags#games)
- [Ncurses](https://terminalroot.com.br/2021/02/crie-programas-graficos-no-terminal-com-cpp-e-ncurses.html)
- Interface Gráfica: [GTK+](https://terminalroot.com.br/2020/08/anjuta-o-melhor-ide-para-c-com-gtkmm.html) e [Qt](https://terminalroot.com.br/2021/02/gerencie-suas-contas-financeiras-pessoais-com-terminal-finances.html)
- Acesso à Banco de Dados([MySQL](https://terminalroot.com.br/mysql/) e SQLite) via [C++](https://terminalroot.com.br/cpp/)
- Padronização
- E muito mais!

Acesse o endereço:
# <https://terminalroot.com.br/cpp/> e saiba mais!

