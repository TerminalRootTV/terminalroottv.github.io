---
layout: post
title: "Crie Jogos 2D com PHP e Raylib"
date: 2023-10-22 12:19:20
image: '/assets/img/php/php-raylib.jpg'
description: 'Para os amantes de GameDev que também amam PHP!'
icon: 'ion:terminal-sharp'
iconname: 'GameDev/PHP'
tags:
- php
- raylib
- gamedev
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Para aqueles que curtem [Desenvolvimento de Jogos](https://terminalroot.com.br/tags#gamedev) e já sabem [PHP](https://terminalroot.com.br/php) e também desejam unir essas duas paixões em uma só.

[RayLib](https://terminalroot.com.br/2022/11/crie-jogos-para-windows-linux-e-web-com-raylib-c-cpp.html) é muito útil para garantir sua *empreitada*.

Vamos ver o passo à passo para atingir essa meta!

---

# 01. Dependências
> Exemplo no Ubuntu 23.10

{% highlight bash %}
sudo apt update
sudo apt install libasound2-dev mesa-common-dev libx11-dev build-essential \
                 libxrandr-dev libxi-dev xorg-dev libgl1-mesa-dev pkg-config \
                 libglu1-mesa-dev php-cli php-dev git make gcc g++ cmake
{% endhighlight %}
> Para outros sistemas: [Windows](https://terminalroot.com.br/tags#windows), [macOS](https://terminalroot.com.br/tags#macos) e outras [distros](https://terminalroot.com.br/tags#distros) veja [nesse link](https://github.com/raysan5/raylib#build-and-installation) o procedimento.

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

# 02. Instale a Raylib

Clone o repositório e entre no mesmo:
{% highlight bash %}
git clone https://github.com/raysan5/raylib
cd raylib
cmake -DBUILD_SHARED_LIBS=ON . -B build
cd build
make
sudo make install
{% endhighlight %}

<details>
 <summary>Veja os caminhos onde são instalados os arquivos</summary>

{% highlight bash %}
Install the project...
-- Install configuration: "Debug"
-- Installing: /usr/local/lib/libraylib.so.4.5.0
-- Installing: /usr/local/lib/libraylib.so.450
-- Installing: /usr/local/lib/libraylib.so
-- Installing: /usr/local/include/raylib.h
-- Installing: /usr/local/include/rlgl.h
-- Installing: /usr/local/include/raymath.h
-- Installing: /usr/local/lib/pkgconfig/raylib.pc
-- Installing: /usr/local/lib/cmake/raylib/raylib-config-version.cmake
-- Installing: /usr/local/lib/cmake/raylib/raylib-config.cmake
{% endhighlight %}

</details>

Limpe os arquivos:
{% highlight bash %}
cd ../..
rm -rf raylib
{% endhighlight %}

> OPCIONAL: **CASO TENHA ERRO AO COMPILAR CRIE ESSE ARQUIVO**.
{% highlight bash %}
sudo vim /usr/lib64/pkgconfig/raylib.pc
{% endhighlight %}

E cole isso dentro e depois salve:
{% highlight bash %}
prefix=/usr
exec_prefix=${prefix}
libdir=/usr/lib64
includedir=${prefix}/include

Name: raylib
Description: A simple and easy-to-use library to enjoy videogames programming
URL: https://github.com/raysan5/raylib
Version: 4.5.0
Libs: -L"${libdir}" -lraylib -lGL -lm -lpthread -ldl -lrt -lX11
Libs.private: -lGL -lm -lpthread -ldl -lrt -lX11
Cflags: -I"${includedir}" -I/usr/local/include
{% endhighlight %}
> Arquivo baseado em: [raylib.pc.in](https://github.com/raysan5/raylib/blob/master/raylib.pc.in).


<!-- MINI ADS -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# 03. Instale a Raylib-PHP

{% highlight bash %}
git clone https://github.com/joseph-montanez/raylib-php
cd raylib-php/
{% endhighlight %}

> Eu detectei um *BUG* na versão atual e para resolver isso eu alterei o *commit*. Se você quiser pular essa etapa e quiser tentar com a versão atual certifique-se que se não der certo você terá de remover esse repositório clonado e depois clonar novamente e então fazer esse passo de alterar o *commit*.

Altere o *commit*:
{% highlight bash %}
git checkout 2968648
{% endhighlight %}
> Esse *commit* refere-se a linha: `Initial Support for RayLib 4.0 Fonts need testing`, caso queira vê-lo rode: `git log --oneline`.

Prepare a extensão, rode o [Make](https://terminalroot.com.br/tags#make), entre no `build`, construa e instale:
{% highlight bash %}
phpize # Prepara a extensão
./configure 
make
sudo make install
{% endhighlight %}

Limpe os arquivos utilizados:
{% highlight bash %}
cd ..
rm -rf raylib-php
{% endhighlight %}

---

# 04. Testando o RayLib com PHP
Crie um arquivo de teste, exemplo: `vim main.php`.

Adicione o código abaixo que só imprime uma frase na janela que se abrirá:
{% highlight php %}
<?php
use raylib\Color;
use raylib\Draw;
use raylib\Text;
use raylib\Timming;
use raylib\Window;

$screenWidth  = 800;
$screenHeight = 450;
$lightGray    = new Color(245, 245, 245, 255);
$gray         = new Color(200, 200, 200, 255);
$black        = new Color(0, 0, 0, 255);

Window::init($screenWidth, $screenHeight, "raylib PHP basic window");

Timming::setTargetFps(60);

while (!Window::shouldClose()){
    Draw::begin();
    Draw::clearBackground($lightGray);
    Text::draw("RayLib com PHP uhuulll", 190, 200, 20, $black);
    Draw::end();
}

Window::close();
{% endhighlight %}

Para rodar use o comando:
{% highlight bash %}
php -dextension=raylib main.php
{% endhighlight %}

![Raylib rodando com PHP](/assets/img/php/run-raylib-php.png) 
> Resultado do teste!

Para aprender **Raylib** e **PHP** veja os links:
+ <https://www.raylib.com/>
+ <https://terminalroot.com.br/php>
+ <https://terminalroot.com.br/2022/11/crie-jogos-para-windows-linux-e-web-com-raylib-c-cpp.html>

<!-- Links Úteis:
+ <https://github.com/joseph-montanez/raylib-php>
+ <https://thephp.website/en/issue/games-with-php/>
+ <https://joseph-montanez.github.io/raylib-php-docs/docs/getting-started/>
+ <https://github.com/NxtLvLSoftware/php-sfml>
+ <https://www.youtube.com/watch?v=q1X_6TYd030&ab_channel=JosephMontanez>
+ <https://ma.ttias.be/how-to-compile-and-install-php-extensions-from-source/>
+ <https://www.php.net/manual/en/install.pecl.windows.php>
-->



