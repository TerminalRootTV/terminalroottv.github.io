---
layout: post
title: "Como Usar cURL com C++ no Windows com PowerShell e CMake"
date: 2025-01-29 20:01:55
image: '/assets/img/windows/win-curlpp.jpg'
description: "🪟 Passo a passo para rodar o código de consumir APIs no Windows."
icon: 'ion:terminal-sharp'
iconname: 'Windows'
tags:
- cpp
- curl
- windows
- powershell
- cmake
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

🪟 Nesse vídeo vamos ver o *passo a passo* pra rodar o [código do vídeo anterior que consumimos a API do Bitcoin]() no [Windows](https://terminalroot.com.br/tags#windows) e com [CMake](https://terminalroot.com.br/tags#cmake) no [PowerShell](https://terminalroot.com.br/tags#powershell).


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

## 🎥 Assista ao Vídeo

<iframe width="1253" height="705" src="https://www.youtube.com/embed/G-NbFo1TJ9M" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---


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

## 🏴 Instale as dependências de sistema
> Caso ainda não possua.
+ [Como Instalar Git e Git Bash no Windows](https://terminalroot.com.br/2023/03/como-instalar-git-e-git-bash-no-windows.html)
+ [Como Instalar GCC/G++ MinGW no Windows](https://terminalroot.com.br/2022/12/como-instalar-gcc-gpp-mingw-no-windows.html)
+ [Como Instalar o Clang no Windows com um único comando](https://terminalroot.com.br/2024/07/como-instalar-o-clang-no-windows-com-um-unico-comando.html)
+ [Como instalar o CMake no Windows](https://terminalroot.com.br/2023/03/como-instalar-o-cmake-no-windows.html)
+ [Como Consumir APIs com cURL e C++ no Terminal](https://terminalroot.com.br/2025/01/como-consumir-apis-com-curl-e-cpp-no-terminal.html)
+ Comando para instalar a `libcurl` com [WinGet](https://winstall.app/apps/cURL.cURL):
{% highlight bash %}
winget install --id=cURL.cURL  -e
{% endhighlight %}


## 🗎 Códigos e arquivos do vídeo
> As dependências do projeto estão como comentário no `CMakeLists.txt`.

> `CMakeLists.txt`
{% highlight cmake %}
cmake_minimum_required(VERSION 3.15)
cmake_policy(SET CMP0074 NEW)
project(bitcoin)
add_compile_options(-w)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# libcurl: Copie do caminho:
# C:/Users/[SEU_USUARIO]/AppData/Local/Microsoft/WinGet/Packages/
set(CURL_ROOT "CAMINHO_DA_LIBCURL_MINGW") # Inverter barras

# curlpp [PowerShell administrador]
# git clone https://github.com/jpbarrette/curlpp
# $env:CC="C:/Users/[SEU_USUARIO]/.utils/llvm-mingw/bin/clang.exe"
# $env:CXX="C:/Users/[SEU_USUARIO]/.utils/llvm-mingw/bin/clang++.exe"
# cmake -Wno-dev -S . -G "Unix Makefiles" -B build -DCURL_LIBRARY=[CAMINHO_lib]/libcurl.dll.a -DCURL_INCLUDE_DIR=[CAMINHO_include]
# cmake --build build
# cmake --install build
include_directories(
  ${CURL_ROOT}/include
  ${CMAKE_CURRENT_SOURCE_DIR}/curlpp/include
)
link_directories(${CURL_ROOT}/lib)
add_subdirectory(curlpp)
add_executable(bitcoin main.cpp curlpp/build/libcurlpp.a)
target_link_libraries(bitcoin PRIVATE curlpp::curlpp
${CURL_ROOT}/lib/libcurl.dll.a)
# copiar o libcurlpp.dll para a build/
add_custom_command(TARGET bitcoin POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
    ${CMAKE_CURRENT_SOURCE_DIR}/curlpp/build/libcurlpp.dll
    $<TARGET_FILE_DIR:bitcoin>
)

# JSON++ [PowerShell administrador]
# git clone https://github.com/nlohmann/json
# cmake -Wno-dev -G "Unix Makefiles" -B build . -DJSON_BuildTests=OFF
# cmake --build build --target install
set(CMAKE_PREFIX_PATH "C:/Program Files (x86)/nlohmann_json/include")
find_package(nlohmann_json 3.11.3 REQUIRED)
target_link_libraries(bitcoin PRIVATE nlohmann_json::nlohmann_json)

# Tabulate [PowerShell administrador]
# git clone https://github.com/p-ranav/tabulate
# cmake -Wno-dev -G "Unix Makefiles" -B build .
# cmake --build .\build\ --target install
set(CMAKE_PREFIX_PATH "C:/Program Files (x86)/tabulate")
find_package(tabulate REQUIRED)
target_link_libraries(bitcoin PRIVATE tabulate::tabulate)
# request->setOpt<curlpp::options::SslVerifyPeer>(false); // Não verificar o peer
# request->setOpt<curlpp::options::SslVerifyHost>(0L);    // Não verificar o host
{% endhighlight %}
> Não esqueça de modificar o `main.cpp` para Windows conforme há no vídeo!

## 📦 Download do arquivo RAR
> Caso você queira rodar na sua máquina.

<a class="btn btn-lg btn-danger" href="/downs/bitcoin-run.rar" download>bitcoin-run.rar</a>

---

+ ✅ Aprenda a criar sua própria linguagem de programação: <https://terminalroot.com.br/mylang>
+ ✅ Aprenda Criação de Games com C++ e SFML: <https://terminalroot.com.br/games>
+ ✅ Pacote Promocional C++: <https://terminalroot.com.br/promo>
+ ✅ Aprenda C++ e Qt: <https://terminalroot.com.br/cpp>
+ ✅ Conheça nossos Cursos: <https://bit.ly/CursosTerminalRoot>
