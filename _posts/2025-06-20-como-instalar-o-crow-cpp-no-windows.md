---
layout: post
title: "Como Instalar o Crow C++ no Windows"
date: 2025-06-20 09:15:38
image: '/assets/img/web/crow-windows.png'
description: "🐦‍ Crie lindas aplicações Web velozes e de forma fácil."
icon: 'ion:terminal-sharp'
iconname: 'C++/Web/Windows'
tags:
- windows
- desenvolvimentoweb
- cpp
- web
- crowcpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

[Crow C++](https://terminalroot.com.br/2022/09/crow-cpp-um-framework-web-facil-e-veloz.html) é um framework [C++](https://terminalroot.com.br/tags#cpp) para criar serviços web [HTTP](https://terminalroot.com.br/tags#desenvolvimentoweb) ou Websocket. Ele usa roteamento semelhante ao [Flask](https://github.com/pallets/flask) do [Python](https://terminalroot.com.br/tags#python), o que facilita o uso.

Para mais informações [veja o vídeo que fizemos sobre o Crow](https://youtu.be/5gyQ5MLhVIs).

Na [documentação do Crow](https://crowcpp.org/master/) orienta você usar o [Conan](https://terminalroot.com.br/2021/02/conan-um-gerenciador-de-pacotes-para-c-cpp.html) ou [vcpkg](https://terminalroot.com.br/2021/09/instale-o-vcpkg-um-gerenciador-de-pacotes-para-c-cpp.html), mas esses gerenciadores de pacotes para [C](https://terminalroot.com.br/c) e [C++](https://terminalroot.com.br/cpp) não são nada amigáveis, então...

Nesse artigo vamos ver como instalar e rodar o Crow no [Windows](https://terminalroot.com.br/tags#windows) do zero e FUNCIONANDO!


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

## 📦 Dependências

Antes de mais nada você vai precisar ter instalado no seu sistema os seguintes utiltários.
> Clique nos links para um tutorial de instalação no Windows.

+ [Git](https://terminalroot.com.br/2023/03/como-instalar-git-e-git-bash-no-windows.html)
+ [Python]()
+ [GCC](https://terminalroot.com.br/2025/05/como-instalar-a-nova-versao-do-gcc-mingw-no-windows.html)
+ [Clang](https://terminalroot.com.br/2025/05/como-instalar-a-nova-versao-do-clang-llvm-no-windows.html)

Usando o [WinGet](https://learn.microsoft.com/pt-br/windows/msix/app-installer/install-update-app-installer) se resume em instalar via [PowerShell](https://terminalroot.com.br/tags#powershell) com os comandos:

{% highlight powershell %}
winget install --id Git.Git -e --source winget
winget install --id=Kitware.CMake  -e
winget install --id=MartinStorsjo.LLVM-MinGW.UCRT  -e
winget install -e --id Python.Python.3.11 --scope machine
{% endhighlight %}

Só o [GCC](https://terminalroot.com.br/2025/05/como-instalar-a-nova-versao-do-gcc-mingw-no-windows.html) que você precisará seguir o [tutorial](https://terminalroot.com.br/2025/05/como-instalar-a-nova-versao-do-gcc-mingw-no-windows.html).
> Detalhe é que após instalá-lo, existe um [CMake]() dentro da pasta `MinGW`, então para haver compatibilidade de versão renomei o `cmake` para outro nome.

Exemplo: Se você rodar o comando: `Get-Command cmake` no [terminal](https://terminalroot.com.br/2023/04/melhore-seu-desempenho-utilizando-o-windows-terminal.html) aparecerá esse caminho:

{% highlight powershell %}
 Get-Command cmake

CommandType     Name           Version    Source
-----------     ----           -------    ------
Application     cmake.exe      4.0.1.0    C:\mingw64\bin\cmake.exe
{% endhighlight %}

Então, vc precisa renomear para outro nome, para que ele execute o `cmake` da outra instalação(a da *Kitware*), renomei assim, por exemplo:
{% highlight powershell %}
Rename-Item -Path "C:\mingw64\bin\cmake.exe" -NewName "DISABLED-cmake.exe"
{% endhighlight %}

Quando vc rodar de novo o comando: `Get-Command cmake` agora aparecerá outro caminho: `C:\Program Files\CMake\bin\cmake.exe` e versão também:

{% highlight powershell %}
 Get-Command cmake

CommandType     Name          Version    Source
-----------     ----          -------    ------
Application     cmake.exe     3.26.0.0   C:\Program Files\CMake\bin\cmake.exe
{% endhighlight %}

Feito isso, agora vamos instalar o Crow C++!

---

## 📥 Instalando o Crow

Antes de mais nada crie uma pasta para seu projeto Crow, exemplo no `Desktop` e entre na pasta do seu projeto:

{% highlight powershell %}
cd "$env:USERPROFILE\Desktop"
New-Item -ItemType Directory "MyProjectCrow"
Set-Location "MyProjectCrow"
{% endhighlight %}

O Crow depende da biblioteca [ASIO](https://think-async.com/Asio/) em tempo de compilação e em tempo de execução, então, faça o download da ASIO nesse link:
+ <https://think-async.com/Asio/>
  
Clique na opção [Download](https://sourceforge.net/projects/asio/files/asio/1.30.2%20%28Stable%29/) como na imagem:
> A versão atual(de acordo com a postagem desse artigo é `1.30.0`, mas se houver uma mais recente, escolha-a)

![ASIO Download](/assets/img/web/asio-download.jpg)

+ Você será redicionado para o [https://sourceforge.net/projects/asio/files/asio/1.30.2](https://sourceforge.net/projects/asio/files/asio/1.30.2%20%28Stable%29/).

+ No SourceForge faça o download da versão [asio-1.30.2.zip](https://sourceforge.net/projects/asio/files/asio/1.30.2%20%28Stable%29/asio-1.30.2.zip/download).

+ Após finalizado descompacte em: `Extrair aqui` ele criará uma pasta descompactada de nome: `asio-1.30.2`, renomei ela para `asio` somente.

+ Recorte essa pasta descompactada que você renomeou para `asio/` e cole dentro do seu projeto.

Agora, dentro da sua pasta `MyProCrow`, clone o repositório do [Crow](https://github.com/CrowCpp/Crow)

{% highlight powershell %}
git clone https://github.com/CrowCpp/Crow
{% endhighlight %}

Mova a `asio` que está no seu projeto/pasta `MyProCrow` para dentro da pasta `Crow` que você clonou:
{% highlight powershell %}
Move-Item -Path "asio" -Destination "Crow"
{% endhighlight %}

E entre na pasta do `Crow`:

{% highlight powershell %}
cd Crow
{% endhighlight %}

### 🛠️ Agora vamos Compilar o **Crow** junto com a **ASIO**

Eu organizo todos meus include em uma pasta na unidade `C:\`, assim como no [Unix]() fica em `/usr/include` no [Windows]() em guardo tudo(SFML3, SFML2, tmxlite, FFmpeg,...) em `C:\Includes`.

Enão crie essa pasta e juntamente com a subpasta `C:\Includes\crow` com esse comando, pois é nesse caminho que vamos instalar o Crow e a ASIO:

{% highlight powershell %}
New-Item -Path "C:/Includes/crow" -ItemType Directory
{% endhighlight %}

Agora, ainda dentro da pasta `Crow` no seu projeto compile com esse comando:
> Termina com um ponto(`.`) no final, esse ponto no final é importante também copiá-lo!

{% highlight powershell %}
cmake -G "Unix Makefiles" -B build -DCMAKE_INSTALL_PREFIX="C:/Includes/crow" -DASIO_INCLUDE_DIR="./asio" -DCMAKE_CXX_FLAGS="-I./asio" -DCROW_BUILD_EXAMPLES=OFF -DCROW_BUILD_TESTS=OFF .
{% endhighlight %}

A saída será mais ou menos essa:
{% highlight text %}
-- The CXX compiler identification is GNU 15.1.0
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: C:/mingw64/bin/c++.exe - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- No build type selected, default to Release
-- Found Python3: C:/Program Files/Python311/python.exe (found version "3.11.9") found components: Interpreter
-- Found asio: C:/Users/USERNAME/Desktop/MyProjectCrow/Crow/asio
-- Configuring done (13.6s)
-- Generating done (0.0s)
-- Build files have been written to: C:/Users/USERNAME/Desktop/MyProjectCrow/Crow/build
{% endhighlight %}

Esse `--build` é quase insignificante, pois não gera arquivos, mas rode como garantia:

{% highlight powershell %}
cmake --build build
{% endhighlight %}

Agora é só instalar:

{% highlight powershell %}
cmake --install build
{% endhighlight %}


<details>
  <summary>Ele vai mover para esses caminhos:</summary>

{% highlight powershell %}
-- Install configuration: "Release"
-- Installing: C:/Includes/crow/include
-- Installing: C:/Includes/crow/include/crow
-- Installing: C:/Includes/crow/include/crow/app.h
-- Installing: C:/Includes/crow/include/crow/ci_map.h
-- Installing: C:/Includes/crow/include/crow/common.h
-- Installing: C:/Includes/crow/include/crow/compression.h
-- Installing: C:/Includes/crow/include/crow/exceptions.h
-- Installing: C:/Includes/crow/include/crow/http_connection.h
-- Installing: C:/Includes/crow/include/crow/http_parser_merged.h
-- Installing: C:/Includes/crow/include/crow/http_request.h
-- Installing: C:/Includes/crow/include/crow/http_response.h
-- Installing: C:/Includes/crow/include/crow/http_server.h
-- Installing: C:/Includes/crow/include/crow/json.h
-- Installing: C:/Includes/crow/include/crow/logging.h
-- Installing: C:/Includes/crow/include/crow/middleware.h
-- Installing: C:/Includes/crow/include/crow/middlewares
-- Installing: C:/Includes/crow/include/crow/middlewares/cookie_parser.h
-- Installing: C:/Includes/crow/include/crow/middlewares/cors.h
-- Installing: C:/Includes/crow/include/crow/middlewares/session.h
-- Installing: C:/Includes/crow/include/crow/middlewares/utf-8.h
-- Installing: C:/Includes/crow/include/crow/middleware_context.h
-- Installing: C:/Includes/crow/include/crow/mime_types.h
-- Installing: C:/Includes/crow/include/crow/multipart.h
-- Installing: C:/Includes/crow/include/crow/multipart_view.h
-- Installing: C:/Includes/crow/include/crow/mustache.h
-- Installing: C:/Includes/crow/include/crow/parser.h
-- Installing: C:/Includes/crow/include/crow/query_string.h
-- Installing: C:/Includes/crow/include/crow/returnable.h
-- Installing: C:/Includes/crow/include/crow/routing.h
-- Installing: C:/Includes/crow/include/crow/settings.h
-- Installing: C:/Includes/crow/include/crow/socket_acceptors.h
-- Installing: C:/Includes/crow/include/crow/socket_adaptors.h
-- Installing: C:/Includes/crow/include/crow/task_timer.h
-- Installing: C:/Includes/crow/include/crow/TinySHA1.hpp
-- Installing: C:/Includes/crow/include/crow/utility.h
-- Installing: C:/Includes/crow/include/crow/version.h
-- Installing: C:/Includes/crow/include/crow/websocket.h
-- Installing: C:/Includes/crow/include/crow.h
-- Installing: C:/Includes/crow/lib/cmake/Crow/CrowTargets.cmake
-- Installing: C:/Includes/crow/lib/cmake/Crow/Findasio.cmake
-- Installing: C:/Includes/crow/lib/cmake/Crow/CrowConfig.cmake
{% endhighlight %}

</details>

É necessário também mover a pasta `asio/` que está dentro de `Crow/` para lá também:

{% highlight powershell %}
Move-Item -Path "asio" -Destination "C:\Includes\"
{% endhighlight %}

Para finalizar, basta sair de Crow e remover a pasta clonada:
{% highlight powershell %}
cd ..
Remove-Item -Path "Crow" -Recurse -Force
{% endhighlight %}

Pronto! Agora vamos testar nosso projeto!


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

## ⚙️ Rodar um `Hello, World!` no servidor com Crow

Agora sua pasta/projeto `MyProjectCrow` está vazia. Vamos criar um arquivo `main.cpp` dentro dela, exemplo com [VSCode]():

{% highlight powershell %}
code main.cpp
{% endhighlight %}

E cole isso dentro:

{% highlight cpp %}
#include "crow.h"

int main(){
    crow::SimpleApp app;

    CROW_ROUTE(app, "/")([](){
        return "Hello world";
    });

    app.port(18080).multithreaded().run();
}
{% endhighlight %}

Salve o arquivo e volte para o terminal e compile seu projeto com esse comando:
> Confirme esses caminhos porque pode ser que você tenhas subpastas. Logo dentro de `asio` tem que tem uma `include`: `C:/Includes/asio/include`.

{% highlight powershell %}
g++ main.cpp -I"C:/Includes/asio/include" -I"C:/Includes/crow/include" -lws2_32 -lmswsock -o app.exe
{% endhighlight %}

Vai gerar o arquivo: `.\app.exe`, execute-o:

Vai aparecer isso:
{% highlight powershell %}
 .\app.exe
(2025-06-20 03:58:29) [INFO    ] Crow/master server is running at http://0.0.0.0:18080 using 2 threads
(2025-06-20 03:58:29) [INFO    ] Call `app.loglevel(crow::LogLevel::Warning)` to hide Info level logs.
{% endhighlight %}

Ele manda você acessar no seu navegador o endereço: ~~http://0.0.0.0:18080~~, mas isso pode falhar, ACESSE NA VERDADE: 
### <http://localhost:18080>
> O endereço **`0.0.0.0`** é um *placeholder* que significa **"todas as interfaces de rede"** — ou seja, o servidor está ouvindo em todas as interfaces do seu computador, mas **não é um IP válido para acessar diretamente** pelo navegador.

Vai aparecer essa mensagem no navegador:

![Crow running](/assets/img/web/crow-running.jpg)
> Para finalizar a conexão pressione `Ctrl + C` no terminal.

Então, está tudo certo!

Eu venho fazendo muitas coisas com Crow, uma delas é esse `Tasks++/ToDO++` com [Crow C++](https://crowcpp.org/), [Banco de Dados](https://terminalroot.com.br/2023/09/como-conectar-ao-mysql-com-c-cpp-no-windows.html), [HTMX](https://htmx.org/) e [TailwindCSS](https://terminalroot.com.br/2023/09/como-criar-um-app-pra-web-com-vuejs-tailwindcss-e-cpp.html):

## 🎥 Veja o Vídeo

<iframe width="800" height="450" src="https://www.youtube.com/embed/5g060xZyj_0" title="Crow C++, DB, TailwindCSS e HTMX" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

---

## Para mais informações acesse:
+ <https://terminalroot.com.br/cpp>
+ <https://crowcpp.org/>

