---
layout: post
title: "COMPILE para C/C++ com XMAKE baseado em LUA"
date: 2021-09-05 17:48:26
image: '/assets/img/cpp/xmake.jpg'
description: 'Tem suporte para arquiteturas: x86 64 e 32-bit, arm64, cross-toolchains: RUST, GOLANG, ZIG e entre outros.'
icon: 'ion:terminal-sharp'
iconname: 'xmake'
tags:
- cpp
- lua
- cppdaily
- linguagemc
- rust
- go
- zig
- gtkmm
- ncurses
---

![COMPILE para C/C++ com XMAKE baseado em LUA](/assets/img/cpp/xmake.jpg)

[xmake](https://xmake.io/) é uma ferramenta para construção de binário para linguagens [C](https://terminalroot.com.br/tags#linguagemc) e [C++](https://terminalroot.com.br/cpp) com arquivos de configuração criados com a linguagem de programação [Lua](https://terminalroot.com.br/tags#lua). Tem suporte para arquiteturas: **x86 64** e **32-bit**, **arm64**, **cross-toolchains**: [Rust](https://terminalroot.com.br/tags#rust), [Golang](https://terminalroot.com.br/tags#go), Zig e entre outros.

Nesse vídeo vamos obter informações mais detalhadas sobre o xmake, como instalar o xmake, além de 10 exemplos de utilização: formas de compilar para C/C++. Compilamos também para Rust, exibimos as formas de gerar ferramentas de compilação para o iPhoneOS . Dicas de configuração para compilar com as bibliotecas: [NCURSES](https://terminalroot.com.br/ncurses) e [GTKMM](https://cutt.ly/gtkmm), como gerar *Doxygen* com xmake, como utilizar um menu interativo, além de outras dicas.


<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# ASSISTA O VÍDEO

<iframe width="910" height="390" src="https://www.youtube.com/embed/ydgcsv-hssY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

# Comandos e links
{% highlight bash %}
xmake, A cross-platform build utility based on Lua.
Copyright (C) 2015-present Ruki Wang, tboox.org, xmake.io
                         _
    __  ___ __  __  __ _| | ______
    \ \/ / |  \/  |/ _  | |/ / __ \
     >  <  | \__/ | /_| |   <  ___/
    /_/\_\_|_|  |_|\__ \|_|\_\____|
                         by ruki, xmake.io

   👉  Manual: https://xmake.io/#/getting_started
   🙏  Donate: https://xmake.io/#/sponsor
{% endhighlight %}

---

## Instalação

> Somente para seu usuário:
+ Via [cURL](https://terminalroot.com.br/2021/05/utilizando-curl-com-cpp.html)
{% highlight bash %}
bash <(curl -fsSL https://xmake.io/shget.text)
{% endhighlight %}

+ [Wget](https://terminalroot.com.br/2019/05/aprenda-a-explorar-o-comando-wget.html)
{% highlight bash %}
bash <(wget https://xmake.io/shget.text -O -)
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

+ PowerShell
{% highlight bash %}
Invoke-Expression (Invoke-Webrequest 'https://xmake.io/psget.text' -UseBasicParsing).Content
{% endhighlight %}


> Para todos usuários do seu sistema:
Dependências:
+ [git](https://terminalroot.com.br/git)
+ [make](https://terminalroot.com.br/2019/12/como-criar-um-makefile.html)
+ [gcc](https://terminalroot.com.br/2019/12/gcc-vs-llvm-qual-e-o-melhor-compilador.html) e [g++](https://terminalroot.com.br/cpp)


{% highlight bash %}
git clone --recursive https://github.com/xmake-io/xmake
cd xmake
make build
sudo make install
./scripts/get.sh __local__ __install_only__
rm ~/.local/bin/xmake
cd ..
rm -rf xmake
source ~/.bashrc
{% endhighlight %}

---

## 1. Compilação básica do zero
{% highlight bash %}
mkdir meu-projeto
nvim main.cpp
{% endhighlight %}

Com o seguinte conteúdo:
{% highlight cpp %}
#include <iostream>

int main(){
  std::cout << "Olá, xmake!" << '\n';
  return 0;
}
{% endhighlight %}

Agora vamos criar o arquivo de configuração do xmake do tipo Lua: `nvim xmake.lua` e dentro dele vamos preencher da seguinte forma:
{% highlight lua %}
target("hello-world")
    set_kind("binary")
    add_files("./main.cpp")
{% endhighlight %}

Compilar:
{% highlight bash %}
xmake
{% endhighlight %}

Rodar:
> Os parâmetros autocompletam
{% highlight bash %}
xmake run hello-world
{% endhighlight %}
> Ou somente: `xmake run`

Se você quiser instalar o binário basta rodar o comando:
{% highlight bash %}
sudo xmake install
{% endhighlight %}
> Também autocompleta.


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

O binário será copiado para o diretório padrão: `/usr/local/bin`.

E então basta rodar o binário:
{% highlight bash %}
hello-world
{% endhighlight %}

Para desinstalar, basta rodar:
{% highlight bash %}
sudo xmake uninstall
{% endhighlight %}

---

## 2. Compilação básica AUTOMÁTICA
Se você achar trabalhoso em criar os arquivos do projeto na mão, também há opção de você entregar todo esse trabalho para o `xmake`. 

{% highlight bash %}
xmake create meu-projeto
{% endhighlight %}
> Se você não informar o nome, mas tiver dentro do diretório de nome do seu projeto, será criado automaticamente um subdiretório de mesmo nome.

Agora vamos entrar no diretório e perceba que já está tudo pronto, se quiser abra os arquivos para ver o conteúdo.

Então vamos construir:
{% highlight bash %}
xmake
{% endhighlight %}

E agora em vez de instalarmos vamos gerar um [Makefile](https://terminalroot.com.br/2019/12/como-criar-um-makefile.html) para nosso projeto também de forma automática:
{% highlight bash %}
xmake project
{% endhighlight %}

Também podemos gerar arquivos de configuração para outras ferramentas de platforma cruzada como ninja e cmake, por exemplo criando um `CMakeLists.txt`:
{% highlight bash %}
xmake project -k cmake
{% endhighlight %}


Podemos rodar o `make clean` e em seguida somente o make para construir: `make` . Se rodarmos `xmake package` irá gerar um pacote do nosso binário e a partir daqui podemos também consultar o histório de comandos, por exemplo, se rodar `xmake show` irá exibir os dados do nosso projeto e em seguida podemos consultar o histórico de comandos rodados:
{% highlight bash %}
cat .xmake/linux/x86_64/cache/history
{% endhighlight %}

---

## 3. Compilando vários arquivos
Basta criar o `xmake.lua` e adicionar os arquivos:
{% highlight lua %}
target("multiplo")
  set_kind("binary")
  add_files("main.cpp")
  add_files("projeto.cpp")
{% endhighlight %}
> Depois é só rodar: `xmake` e `xmake run`

---

## 4.1 Compilando para Ncurses
> `mkdir janelas && cd janelas`
Vamos utilizar o exemplo desse link: <https://terminalroot.com.br/ncurses/#8-janelas> . O `xmake.lua` ficará assim:
{% highlight lua %}
add_rules("mode.debug", "mode.release")
add_requires("ncurses")

target("janela")
  add_packages("ncurses", {links = "ncurses"})
  add_ldflags("-ltinfo", {force = true})
  set_kind("binary")
  add_files("main.cpp")
{% endhighlight %}

---

# 4.2 Compilando para Gtkmm
De acordo com a [série que fizemos do Gtkmm](https://cutt.ly/gtkmm), eu atualizei repositório e o README, ou seja, basta ir lá, ler o README e ver o arquivo: `xmake.lua`:
> <https://github.com/terroo/pass-firefox>

O arquivo [xmake.lua](https://github.com/terroo/pass-firefox/blob/main/xmake.lua) desse repositório corresponde ao `Makefile`(que nós criamos nos vídeos da série do Gtkmm):

Se precisar instalar arquivos como
+ `.md`
+ `.desktop`
+ Imagens

Use, exemplos:
{% highlight lua %}
add_installfiles("src/*.h")
add_installfiles("doc/*.md")
{% endhighlight %}

---

## 5. Compilando para Rust
{% highlight rust %}
pub fn main() {
    println!("Compilando Rust com xmake!!!");
}
{% endhighlight %}

{% highlight lua %}
target("bin-rust")
  set_kind("binary")
  add_files("./main.rs")
{% endhighlight %}

{% highlight bash %}
xmake
xmake run <TAB>
{% endhighlight %}

---

## 6. Criar um template para o Doxygen
{% highlight bash %}
cd janelas
xmake doxygen
{% endhighlight %}

---

## 7. Compilando para iPhone
{% highlight bash %}
xmake create iphone
xmake config -p iphoneos
{% endhighlight %}

---

## 8. Rodando Lua
Via linha de comando:
{% highlight bash %}
xmake lua -c "print('Olá, Lua via xmake')"
{% endhighlight %}

Executando em uma subshell:
{% highlight bash %}
xmake lua
{% endhighlight %}
{% highlight lua %}
print(89 + 11)
os.exit()
{% endhighlight %}

---

## 9. Utilizando menu
{% highlight bash %}
xmake config --menu
{% endhighlight %}

---

## 10. Obtendo mais informações de comandos
{% highlight bash %}
xmake<TAB>` e `xmake --<TAB>
xmake --help
{% endhighlight %}






