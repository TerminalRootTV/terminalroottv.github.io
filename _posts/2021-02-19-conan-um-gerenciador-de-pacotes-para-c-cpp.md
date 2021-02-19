---
layout: post
title: "Conan - Um gerenciador de pacotes para C/C++"
date: 2021-02-19 00:47:39
image: '/assets/img/cpp/conan.jpg'
description: 'Instale facilmente dependências para seus projetos C e C++ .'
icon: 'ion:terminal-sharp'
iconname: 'C/C++'
tags:
- cpp
- linguagemc
---

![Conan - Um gerenciador de pacotes para C/C++](/assets/img/cpp/conan.jpg)

# Introdução
[Conan](https://conan.io/) é um gerenciador de pacotes de software destinado a desenvolvedores [C](https://terminalroot.com.br/tags#liguagemc) e [C++](https://terminalroot.com.br/cpp/).

Funciona em todos os sistemas operacionais, incluindo [Windows](https://terminalroot.com.br/tags#windows), [Linux](https://terminalroot.com.br/linux/), [macOS](https://terminalroot.com.br/2018/03/como-instalar-o-mac-os-x-em-virtualbox-no-linux.html), [FreeBSD](https://terminalroot.com.br/2017/09/como-instalar-o-freebsd-11-1.html), Solaris e outros, e pode ser direcionado a qualquer plataforma, incluindo desktop, [servidor](https://terminalroot.com.br/tags#servidor) e construção cruzada para dispositivos embarcados e bare metal.

Ele se integra com outras ferramentas como [Docker](https://terminalroot.com.br/2019/08/tutorial-definitivo-de-docker-para-iniciantes-ubuntu.html), [MinGW](https://terminalroot.com.br/2018/03/como-usar-o-shell-bash-no-windows.html), [WSL](https://www.youtube.com/watch?v=Mxt42P62HjY) e com todos os sistemas de construção, como [CMake](https://terminalroot.com.br/2019/12/como-compilar-seus-programas-com-cmake.html), MSBuild, [Makefiles](https://terminalroot.com.br/2019/12/como-criar-um-makefile.html), [Meson](https://terminalroot.com.br/2020/03/como-compilar-programas-com-meson-build.html), SCons. Ele pode até mesmo se integrar com qualquer sistema de construção proprietário.

Conan é totalmente gratuito, de código aberto e totalmente descentralizado. O repositório central ConanCenter contém centenas de pacotes de bibliotecas de código aberto populares, com muitos binários pré-compilados .

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# Instalação
Existem diversas maneiras de instalar o **Conan** . Dentre as possibilidades você pode usar o [Portage](https://terminalroot.com.br/2020/03/10-dicas-fundamentais-para-seu-gentoo-linux.html) no [Gentoo](https://terminalroot.com.br/2019/02/como-instalar-o-gentoo-linux-em-dual-boot-com-o-ubuntu.html) ou [Funtoo](https://terminalroot.com.br/2018/10/como-instalar-o-funtoo-pelo-ubuntu-ou-linux-mint.html), da seguinte forma:
{% highlight bash %}
emerge dev-util/conan
{% endhighlight %}

No [Arch Linux](https://terminalroot.com.br/2020/01/arch-linux-openbox-tint2.html) você pode usar o [Yay](https://terminalroot.com.br/2020/12/como-instalar-pacotes-do-aur-via-yay-no-arch-linux.html):
{% highlight bash %}
# sem sudo
yay -S conan
{% endhighlight %}

Você também pode baixar os pacotes [.deb](https://terminalroot.com.br/2014/12/como-criar-pacotes-deb.html), [.rpm](https://terminalroot.com.br/2013/04/curso-certificacao-linux-lpi-102_16.html), [tarball](https://terminalroot.com.br/2019/10/como-extrair-varios-formatos-compactados-com-um-comando.html) diretamente por [aqui](https://conan.io/downloads.html) e instalar:

Ou até mesmo instalar via [pip](https://pypi.org/project/pip/), segundo eles, mais recomendado:
> ANtes você precisará do Pip instalado, exemplo para sistemas que utilizam o APT:
{% highlight bash %}
sudo apt install python3-pip
{% endhighlight %}

E basta rodar assim:
{% highlight bash %}
pip3 install conan
{% endhighlight %}
> Se tiver algum problema na instalação, tente somente para seu usuário:
{% highlight bash %}
pip3 install conan --user
{% endhighlight %}

---

# Utilização
Vamos começar com um exemplo: vamos criar um aplicativo de calculadora de hash MD5 que usa uma das bibliotecas [C++](https://terminalroot.com.br/cpp/) mais populares: [Poco](https://pocoproject.org/). Usaremos o [CMake](https://terminalroot.com.br/2019/12/como-compilar-seus-programas-com-cmake.html) como sistema de construção neste caso, mas tenha em mente que Conan funciona com qualquer sistema de construção e não se limita a usar somente o CMake.

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

### 1. Crie o seguinte arquivo de origem dentro de um diretório. 
{% highlight bash %}
mkdir mymd5 && cd mymd5
vim md5.cpp
{% endhighlight %}

Este será o arquivo fonte de nosso aplicativo:
{% highlight cpp %}
#include "Poco/MD5Engine.h"
#include "Poco/DigestStream.h"

#include <iostream>

int main(int argc, char** argv){
   Poco::MD5Engine md5;
   Poco::DigestOutputStream ds(md5);
   std::string str = {};
   if( argc > 1 ){
      str = argv[1];
   }else{
     std::cout << "Informe a palavra para gerar a HASH MD5." << '\n';
     exit(0);
   }
   ds << str;
   ds.close();
   std::cout << Poco::DigestEngine::digestToHex(md5.digest()) << '\n';
   return 0;
}
{% endhighlight %}

### 2. Agora vamos instalar o [Poco](https://pocoproject.org/)
Podemos fazer a pesquisa direto pelo navegador no link: <https://conan.io/center>, ou usar o `conan` via linha de comando:
{% highlight bash %}
conan search poco --remote=conan-center
{% endhighlight %}
> A opção `--remote=conan-center` pede pra fazer a pesquisa online, pode ser ignorada a menos que você tenha o arquivo `remotes.json` devidamente configurado no diretório: `$HOME/.conan/remotes.json` .

A saída será similar a isso:
{% highlight bash %}
user@host ~/mymd5
Existing package recipes:

poco/1.8.1
poco/1.9.3
poco/1.9.4
poco/1.10.0
poco/1.10.1
user@host ~/mymd5
{% endhighlight %}

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


Suponhamos que você usou o comando `conan inspect poco/1.9.4`(Use o help para mais informações: `conan --help`) para inspecionar essa versão e é justamente a versão que você deseja, então basta instalá-lo. Para isso crie um arquivo de nome: `conanfile.txt` dentro do seu projeto( nesse caso, o  projeto: *mymd5* ) com as seguintes informações:
{% highlight bash %}
[requires]
poco/1.9.4

[generators]
cmake
{% endhighlight %}
> Certifique-se de ter o [CMake](https://terminalroot.com.br/2019/12/como-compilar-seus-programas-com-cmake.html) instalado. Isso vai gerar o arquivo `conanbuildinfo.cmake` .

### 3. Antes de instalar, vamos preparar nosso profile pro Conan
Para isso rode os comando:
{% highlight bash %}
conan profile update settings.compiler.libcxx=libstdc++11 default
{% endhighlight %}
> Se quiser que o Conan detecte automaticamente rode: `conan profile new default --detect`, se a [ABI](https://pt.wikipedia.org/wiki/Interface_binária_de_aplicação) do seu compilador não for compatível você receberá um "belo de um *warning*" e precisará rodar o comando indicado logo acima de qualquer forma.

Esse comando irá configurar o arquivo no caminho: `$HOME/.conan/profiles/default`, mais ou menos assim:
{% highlight bash %}
[settings]
os=Linux
os_build=Linux
arch=x86_64
arch_build=x86_64
compiler=gcc
compiler.version=9
compiler.libcxx=libstdc++11
build_type=Release
[options]
[build_requires]
[env]
{% endhighlight %}

### 4. Agora vamos instalar as dependências com Conan
Para isso basta rodar os comandos:
{% highlight bash %}
mkdir build && cd build
conan install ..
{% endhighlight %}
A saída será similar a isso:

![Conan Install](/assets/img/cpp/conan-install.jpg)

### 5. Criar o arquivo de construção
Agora vamos criar o arquivo `CMakeLists.txt` baseado no arquivo: `conanbuildinfo.cmake`
> `vim CMakeLists.txt` - Fora do diretório `build`, na raiz do seu projeto.

{% highlight bash %}
cmake_minimum_required(VERSION 2.8.12)
project(MD5Encrypter)

add_definitions("-std=c++11")

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

add_executable(md5 md5.cpp)
target_link_libraries(md5 ${CONAN_LIBS})
{% endhighlight %}

### 6. Tudo pronto, vamos criar essa bagaça!
Para [Linux](https://terminalroot.com.br/tags#linux) ou [macOS](https://terminalroot.com.br/tags#macos) rode esse comando:
{% highlight bash %}
cmake .. -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release
make
{% endhighlight %}

Pronto, foi gerado o binário `md5` dentro do diretório `bin/md5` e já podemos testá-lo

![Gerando MD5 com Poco e instalado com Conan](/assets/img/cpp/md5-poco-conan.png)

Simples, né?!

Para mais informações consulte o [repositório oficial do Conan](https://github.com/conan-io/conan).

# Deseja aprender [C++](https://terminalroot.com.br/cpp/) e criar seus programas Gráficos e para Terminal com portabilidade para Linux e Windows?
Então se inscreva nos nossos [Cursos de C++ Moderno](https://terminalroot.com.br/cpp/) . Você aprender criar:
- Games
- Ncurses
- Interface Gráfica: [GTK+](https://terminalroot.com.br/2020/08/anjuta-o-melhor-ide-para-c-com-gtkmm.html) e [Qt](https://terminalroot.com.br/2021/02/gerencie-suas-contas-financeiras-pessoais-com-terminal-finances.html)
- Acesso à Banco de Dados(MySQL e SQLite) via C++
- Padronização
- E muito mais!

Acesse o endereço:
# <https://terminalroot.com.br/cpp/> e saiba mais!

# Fui!

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


