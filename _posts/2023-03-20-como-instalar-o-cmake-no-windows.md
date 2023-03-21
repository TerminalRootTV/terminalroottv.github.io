---
layout: post
title: "Como instalar o CMake no Windows"
date: 2023-03-20 22:30:52
image: '/assets/img/cmake/cmake-windows.jpg'
description: 'CMake é um SCons para automatizar tarefas de compilação.'
icon: 'ion:terminal-sharp'
iconname: 'CMake/Windows'
tags:
- cmake
- windows
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

[CMake](https://terminalroot.com.br/tags#cmake) é um sistema para automatizar tarefas de compilação de arquivos de código criados em [C](https://terminalroot.com.br/tags#linguagemc) e [C++](https://terminalroot.com.br/tags#cpp). 

Em sistemas tipo [Unix](https://terminalroot.com.br/tags#unix) podemos dizer que ele é um "*gerador de [Makefile](https://terminalroot.com.br/tags#make)*". Ele é classificado como um [SCons](https://en.wikipedia.org/wiki/SCons).

Nós já fizemos uma breve introdução [aqui no blog](https://terminalroot.com.br/2019/12/como-compilar-seus-programas-com-cmake.html) sobre CMake, mas é possível também gerar Makefiles no Windows, apesar do CMake também gerar arquivos para o [Visual Studio](https://terminalroot.com.br/2021/12/os-32-melhores-ides-editores-de-texto-para-cpp.html#23-visual-studio).

Hoje veremos como instalar o CMake no [Windows](https://terminalroot.com.br/tags#windows).

---

# Dependências
Como nesse exemplo usaremos o [GCC](https://terminalroot.com.br/tags#gcc), é importante você possui ele instalado no seu Windows via [MinGW](https://terminalroot.com.br/2022/12/como-instalar-gcc-gpp-mingw-no-windows.html), veja [aqui como fazer isso](https://terminalroot.com.br/2022/12/como-instalar-gcc-gpp-mingw-no-windows.html).

Agora vamos ao passo à passo!


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

# Instalação

## 01. Faça o download do CMake clicando no botão abaixo:
<a href="https://github.com/Kitware/CMake/releases/download/v3.26.0-rc6/cmake-3.26.0-rc6-windows-x86_64.msi" class="btn btn-danger btn-lg">Download do CMake para Windows 64-bit</a> 

Após feito o download dê um duplo clique sobre o arquivo baixado: `cmake-3.26.0-rc6-windows-x86_64.msi` e dê permissão de administrador para iniciar o setup de instalação.

---

## 02. Apresentação do setup
> Basta clicar em `Next`.

[![14](/assets/img/cmake/win/14-cmake.jpg)](/assets/img/cmake/win/14-cmake.jpg)
[![01](/assets/img/cmake/win/01-cmake.jpg)](/assets/img/cmake/win/01-cmake.jpg)

---

## 03. Aceite os termos da licença
> E em seguida clique em `Next`.

[![02](/assets/img/cmake/win/02-cmake.jpg)](/assets/img/cmake/win/02-cmake.jpg)

---

## 04. Adicione o CMake à sua `PATH`
Marque a opção `Add CMake to the system PATH for all users` para o comando ficar disponível para todos o usuários do sistema. E em seguida clique em `Next`.

[![03](/assets/img/cmake/win/03-cmake.jpg)](/assets/img/cmake/win/03-cmake.jpg)

---

## 05. Selecione o caminho de instalação
> Dica: Mantenha o que já aparece e clique em `Next`.

[![04](/assets/img/cmake/win/04-cmake.jpg)](/assets/img/cmake/win/04-cmake.jpg)


<!-- RECTANGLE LARGE -->
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

---

## 06. Inicie a instalação
CLique em `Install` e aguarde o final da instalação.

[![05](/assets/img/cmake/win/05-cmake.jpg)](/assets/img/cmake/win/05-cmake.jpg)

> Instalando:
[![06](/assets/img/cmake/win/06-cmake.jpg)](/assets/img/cmake/win/06-cmake.jpg)

> Após finalizado clique em `Finish`:
[![07](/assets/img/cmake/win/07-cmake.jpg)](/assets/img/cmake/win/07-cmake.jpg)

---

# Testando o CMake
Abra o [PowerShell](https://terminalroot.com.br/2021/12/como-instalar-powershell-no-ubuntu-e-primeiros-passos.html) ou o `CMD` e digite o comando:
{% highlight bash %}
cmake --version
{% endhighlight %}

Se a saída for similar a imagem abaixo é porque está tudo certo e instalado perfeitamente:

[![08](/assets/img/cmake/win/08-cmake.jpg)](/assets/img/cmake/win/08-cmake.jpg)

---

## Compilando com CMake

+ Crie uma pasta, exemplo `MyProject` entre na mesma(pelo CMD ou PowerShell, `cd MyProject`) e dentro dela faça:

+ Crie um arquivo de nome `CMakeLists.txt` com seu [Editor de Códigos ou IDE Preferido](https://terminalroot.com.br/2021/12/os-32-melhores-ides-editores-de-texto-para-cpp.html) e preencha com o código abaixo:

{% highlight cmake %}
cmake_minimum_required(VERSION 3.10)
project(HelloWorld)
add_executable(hello main.cpp)
{% endhighlight %}
[![09](/assets/img/cmake/win/09-cmake.jpg)](/assets/img/cmake/win/09-cmake.jpg)

+ Crie também um arquivo `main.cpp` com um código básico, exemplo:

{% highlight cpp %}
#include <iostream>

auto main(int argc, char** argv) -> int {
  std::printf("CMake is working on Windows!\n");
  return EXIT_SUCCESS;
}
{% endhighlight %}
[![12](/assets/img/cmake/win/12-cmake.jpg)](/assets/img/cmake/win/12-cmake.jpg)

Ao final sua pasta `MyProject` terá 2 arquivos: `CMakeLists.txt` e o `main.cpp` conforme imagem abaixo:

[![10](/assets/img/cmake/win/10-cmake.jpg)](/assets/img/cmake/win/10-cmake.jpg)

+ Agora execute o comando:
{% highlight bash %}
cmake -G "Unix Makefiles" -B build
{% endhighlight %}
> Ele vai criar uma pasta de nome `build` dentro do seu projeto. Se não informar `-G "Unix Makefiles"` ele irá preparar arquivos para o Visual Studio, e nesse caso queremos para Makefile similar ao Unix.

A saída será similar a imagem abaixo:

[![11](/assets/img/cmake/win/11-cmake.jpg)](/assets/img/cmake/win/11-cmake.jpg)

+ Após terminado, entre na pasta **build**(`cd build`) e rode o comando `make`(se não existir esse comando é porque você não renomeu o arquivo do MinGW para esse nome conforme citado no artigo sobre MinGW citado acima, então provavelmente o comando será `mingw32-make`). E em seguida rode o binário final: `hello`:

[![13](/assets/img/cmake/win/13-cmake.jpg)](/assets/img/cmake/win/13-cmake.jpg)

Pronto, agora você já pode compilar seu código [C](https://terminalroot.com.br/tags#linguagemc) e [C++](https://terminalroot.com.br/tags#cpp) com CMake!

---

# Links úteis
+ <https://cmake.org/>
+ <https://cmake.org/download/>
+ <https://github.com/Kitware/CMake/>


