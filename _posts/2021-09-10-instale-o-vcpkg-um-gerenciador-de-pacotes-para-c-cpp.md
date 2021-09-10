---
layout: post
title: "Instale o VCPKG - Um gerenciador de pacotes para C/C++"
date: 2021-09-10 11:17:42
image: '/assets/img/cpp/vcpkg.png'
description: 'O gerenciador de pacotes de plataforma cruzada da Microsoft' 
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![Instale o VCPKG - Um gerenciador de pacotes para C/C++](/assets/img/cpp/vcpkg.png)

Nós já publicamos uma vez sobre o [CONAN](https://terminalroot.com.br/2019/09/oh-my-fish.html) que também é um gerenciador de pacotes para [C](https://terminalroot.com.br/tags#linguagemc) e [C++](https://terminalroot.com.br/cpp). E hoje vamos saber como instalar um dos mais utilizados que é o **vcpkg** da Microsoft.

[vcpkg](https://vcpkg.io/) é um gerenciador de pacotes de código aberto de plataforma cruzada da Microsoft .

Ele fornece acesso a bibliotecas [C](https://terminalroot.com.br/tags#linguagemc) e [C++](https://terminalroot.com.br/cpp) para suas plataformas suportadas. O utilitário de [linha de comando](https://terminalroot.com.br/tags#comandos) está disponível atualmente no [Windows](https://terminalroot.com.br/tags#windows) , [macOS](https://terminalroot.com.br/tags#macos) e [Linux](https://terminalroot.com.br/tags#linux) .


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
Dependências:
+ [Git](https://git-scm.com/)
+ [g++ >= 6](https://gcc.gnu.org/)
+ [tar](https://www.gnu.org/software/tar/)
+ [curl](https://curl.se/)
+ [zip](https://www.gnu.org/software/gzip/)
+ [unzip](https://www.gnu.org/software/gzip/)

Exemplo de instalação em sistemas que utilizam o [APT](https://wiki.debian.org/Apt):
{% highlight sh %}
sudo apt install build-essential tar curl zip unzip
{% endhighlight %}

Faça o download da última versão com o [wget](https://terminalroot.com.br/2019/05/aprenda-a-explorar-o-comando-wget.html):
{% highlight sh %}
wget -O vcpkg.tar.gz https://github.com/microsoft/vcpkg/archive/master.tar.gz
{% endhighlight %}

[Descompacte](https://terminalroot.com.br/2019/10/como-extrair-varios-formatos-compactados-com-um-comando.html) o arquivo:
{% highlight sh %}
tar zxvf vcpkg.tar.gz
{% endhighlight %}

Renomei o diretório que foi descompactado:
{% highlight sh %}
mv vcpkg-master vcpkg
{% endhighlight %}

Mova para `/opt`:
{% highlight sh %}
sudo mv vcpkg /opt/
{% endhighlight %}

Rode o [shell script](https://terminalroot.com.br/shell):
{% highlight sh %}
sudo /opt/vcpkg/bootstrap-vcpkg.sh -disableMetrics
{% endhighlight %}
> A Microsoft faz [telemetria](https://github.com/microsoft/vcpkg#telemetry), se quiser habilitar a telemetria, remova o parâmetro `-disableMetrics` .


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



Crie um link simbólico para o comando ficar disponível na sua `$PATH`:
{% highlight sh %}
sudo ln -s /opt/vcpkg/vcpkg /usr/local/bin/vcpkg
{% endhighlight %}

Teste pra ver se está tudo certo:
{% highlight sh %}
vcpkg version
{% endhighlight %}

Limpe o arquivo do download:
{% highlight sh %}
rm vcpkg.tar.gz
{% endhighlight %}

---

# Configurações

Adicione o caminho ao `VCPKG_ROOT`:
{% highlight sh %}
echo 'export VCPKG_ROOT="/opt/vcpkg"' >> ~/.bashrc
source ~/.bashrc
{% endhighlight %}

Crie um link simbólico para as bibliotecas:
{% highlight sh %}
sudo ln -s /opt/vcpkg/installed/x64-linux/include /usr/local/include/vcpkg
{% endhighlight %}

Habilite o autocomplete:
> Para [Bash](https://terminalroot.com.br/bash):
{% highlight sh %}
vcpkg integrate bash
source ~/.bashrc
{% endhighlight %}

> Para [ZSH](https://terminalroot.com.br/2018/02/como-instalar-e-usar-o-shell-zsh-e-o-oh-my-zsh.html) ou [FISH](https://terminalroot.com.br/2019/09/oh-my-fish.htmlLINK):
{% highlight sh %}
vcpkg integrate zsh # ZSH
vcpkg integrate x-fish # FISH
{% endhighlight %}


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

# Utilização
Instale sua primeira biblioteca.

Exemplo, instalar o [Toml++]() que foi assunto do artigo anterior: [Como fazer Parser de Toml com C++]() .

{% highlight sh %}
sudo vcpkg install tomlplusplus
{% endhighlight %}

---

## Compilando com [g++](https://gcc.gnu.org/)
{% highlight sh %}
g++ -I/usr/local/include/vcpkg/ -std=c++17 main.cpp
{% endhighlight %}

---

## Compilando com [CMake](https://terminalroot.com.br/2019/12/como-compilar-seus-programas-com-cmake.html):
> Nas versões atuais do CMake, ele já compila no [C++17](https://terminalroot.com.br/cpp), certifique-se que a versão do seu g++ também é atual:

> `vim CMakeLists.txt`:

{% highlight cmake %}
cmake_minimum_required(VERSION 3.21.2)
project(Tomlpp)
include_directories(include /usr/local/include/vcpkg/)
add_executable(tomlpp main.cpp)
{% endhighlight %}
> Note que precisamos incluir a linha: `include_directories(include /usr/local/include/vcpkg/)`

{% highlight sh %}
mkdir build && cd build
cmake ..
make
./tomlpp
{% endhighlight %}

---

## Compilando com [xmake](https://terminalroot.com.br/2021/09/compile-para-c-cpp-com-xmake-baseado-em-lua.html)

> `vim xmake.lua`:

{% highlight lua %}
add_rules("mode.debug", "mode.release")
set_config("cxxflags", "-std=c++17")
add_cflags("-g", "-Wall", {force = true})

target("parsertomlpp")
  set_kind("binary")
  add_sysincludedirs("/usr/local/include/vcpkg")
  add_files("main.cpp")
{% endhighlight %}
> Note que precisamos incluir a linha: `add_sysincludedirs("/usr/local/include/vcpkg")`

{% highlight sh %}
xmake && xmake run
{% endhighlight %}

---

## Desinstalação
Execute esse comandos na ordem, a ordem é importante!

{% highlight sh %}
sudo unlink /usr/local/include/vcpkg
sudo unlink /usr/local/bin/vcpkg
sed -i '/VCPKG_ROOT/d' ~/.bashrc
sed -i '/vcpk/d' ~/.bashrc
sudo rm -rf /opt/vcpkg
sudo rm -rf /root/.cache/vcpkg
sudo rm -rf /root/.vcpkg
rm -rf ~/.vcpkg
sudo rm -rf ~/.cache/vcpkg
{% endhighlight %}

Para mais informações rode:
{% highlight sh %}
vcpkg --help
{% endhighlight %}

---

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




