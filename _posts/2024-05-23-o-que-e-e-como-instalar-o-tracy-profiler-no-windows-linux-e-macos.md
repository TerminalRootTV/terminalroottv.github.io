---
layout: post
title: "O que é e Como Instalar o Tracy Profiler no Windows, Linux e macOS"
date: 2024-05-23 08:59:20
image: '/assets/img/cpp/tracy-profiler.jpg'
description: "O Tracy Profiler é um exemplo de profiler que se destaca por ser uma ferramenta de análise de desempenho em tempo real para aplicativos escritos em C++."
icon: 'ion:terminal-sharp'
iconname: 'Tracy Profiler'
tags:
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

# O que é um Profiler?
Um profiler é uma <u>ferramenta usada para medir e analisar o desempenho de um programa de software</u>. 

Ele ajuda os desenvolvedores a identificar *gargalos*, otimizar o uso de recursos e melhorar a eficiência do código. 

O **Tracy Profiler** é um exemplo de profiler que se destaca por ser uma ferramenta de análise de desempenho em tempo real para aplicativos escritos em [C++](https://terminalroot.com.br/tags#cpp).

### Funcionalidades de um Profiler como o Tracy:
#### 1. Medição de Desempenho:
+ **Tempo de Execução**: Mede o tempo que cada parte do código leva para ser executada.
+ **Uso de CPU e Memória**: Analisa o consumo de CPU e memória, identificando áreas que podem estar causando lentidão ou desperdício de recursos.

#### 2. Visualização de Dados:
+ **Gráficos e Relatórios**: Gera gráficos e relatórios detalhados que ajudam a visualizar o desempenho do aplicativo.
+ **Timeline**: Exibe uma linha do tempo das execuções de funções, permitindo uma análise detalhada do fluxo de execução.

#### 3. Identificação de Gargalos:
+ **Funções Lentas**: Identifica quais funções estão consumindo mais tempo de CPU.
+ **Bloqueios e Deadlocks**: Detecta problemas de concorrência, como bloqueios e deadlocks.

#### 4. Análise em Tempo Real:
+ **Feedback Imediato**: Fornece feedback imediato durante a execução do programa, permitindo ajustes e otimizações em tempo real.

#### 5. Integração com Ambientes de Desenvolvimento:
+ **Ferramentas de Debug**: Pode ser integrado a ferramentas de debug para uma análise mais aprofundada.
+ **Suporte a Diversas Plataformas**: Funciona em várias plataformas, como [Windows](https://terminalroot.com.br/tags#windows), [macOS](https://terminalroot.com.br/tags#macos) e [Linux](https://terminalroot.com.br/tags#gnulinux).

### Como o Tracy Profiler se Destaca:
+ **Baixa Sobrecarga**: O Tracy é projetado para ter uma sobrecarga mínima, o que significa que ele não afeta significativamente o desempenho do aplicativo enquanto o perfilamento está ativo.
+ **Interface de Usuário Intuitiva**: Fornece uma interface gráfica de usuário (GUI) intuitiva para a visualização de dados de perfilamento.
+ **Funcionalidades Avançadas**: Oferece recursos avançados, como a captura de pilhas de chamadas, análise de alocação de memória, e suporte a sistemas multithread.

### Exemplos de Uso:
+ **Desenvolvimento de Jogos**: Otimização do desempenho de jogos, onde cada milissegundo conta para uma experiência fluida.
+ **Aplicativos de Tempo Real**: Análise de desempenho de aplicativos que requerem respostas rápidas e consistentes.
+ **Software Empresarial**: Identificação e resolução de gargalos em grandes sistemas de software empresarial para melhorar a eficiência e a escalabilidade.

Em resumo, um profiler como o Tracy é uma ferramenta essencial para qualquer desenvolvedor que deseja garantir que seu software funcione de maneira eficiente e sem problemas de desempenho.


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

# Com quais ferramentas o Tracy Profiler foi desenvolvido?
O Tracy Profiler é uma ferramenta sofisticada de profiling desenvolvida com uma combinação de várias tecnologias e bibliotecas que suportam sua funcionalidade e interface gráfica. 

As principais ferramentas e bibliotecas utilizadas no desenvolvimento do Tracy Profiler são:

#### 1. [C++](https://terminalroot.com.br/tags#cpp):
+ A linguagem principal usada para desenvolver o Tracy Profiler. [C++](https://terminalroot.com.br/tags#cpp) é uma escolha comum para ferramentas de desempenho devido à sua eficiência e controle de baixo nível sobre os recursos do sistema.
#### 2. [Dear ImGui](https://terminalroot.com.br/tags#imgui):
+ Uma biblioteca de interface gráfica para C++ que facilita a criação de interfaces gráficas intuitivas e de alta performance. Tracy usa Dear ImGui para construir sua interface de usuário, permitindo que os desenvolvedores visualizem os dados de profiling de maneira interativa e em tempo real.

#### 3. [OpenGL](https://terminalroot.com.br/tags#imgui):
+ Uma API de gráficos utilizada para renderização. O Tracy usa OpenGL junto com Dear ImGui para desenhar a interface gráfica e os gráficos de desempenho.

#### 4. [GLFW](https://terminalroot.com.br/tags#glfw):
+ Uma biblioteca que fornece uma interface simples para criar janelas, contextos OpenGL e capturar eventos de entrada. GLFW é usada no Tracy para gerenciar janelas e entradas de teclado e mouse.

#### 5. [Capstone Disassembly Framework](https://www.capstone-engine.org/):
+ Uma framework de desmontagem multiplataforma utilizada para análise de código binário. No Tracy, o Capstone é usado para funções avançadas de profiling que envolvem a análise do código de máquina.

#### 6. [miniz](https://github.com/richgel999/miniz):
+ Uma biblioteca de compressão zlib/deflate usada para compressão de dados. O Tracy usa miniz para compactar os dados de profiling, facilitando a transmissão e armazenamento eficientes dos dados.

#### 7. [Threads e Sincronização (C++ Standard Library)](https://terminalroot.com.br/tags#cppdaily):
+ O Tracy faz uso extensivo de threads para capturar dados de desempenho em tempo real sem interferir significativamente no desempenho do aplicativo monitorado.

#### 8. [Network Programming (C++ Standard Library)](https://en.cppreference.com/w/cpp/experimental/networking):
+ Para enviar dados de profiling do aplicativo monitorado para a interface do usuário do Tracy, técnicas de programação de rede são utilizadas.

### Processo de Desenvolvimento
O desenvolvimento do Tracy Profiler envolve a combinação dessas ferramentas para criar uma aplicação que é ao mesmo tempo poderosa e eficiente. 

> A integração de Dear ImGui e OpenGL permite uma interface gráfica fluida e responsiva, enquanto bibliotecas como GLFW e Capstone fornecem suporte adicional para a funcionalidade avançada de profiling. 

O uso de C++ e bibliotecas de compressão como miniz garante que o Tracy seja capaz de lidar com grandes volumes de dados de desempenho de maneira eficiente.

### Benefícios da Escolha dessas Ferramentas
+ **Desempenho**: A combinação de C++ e OpenGL garante que o Tracy seja capaz de operar com alta performance, crucial para uma ferramenta de profiling.
+ **Interatividade**: Dear ImGui proporciona uma interface de usuário altamente interativa e customizável.
+ **Portabilidade**: Bibliotecas como GLFW e miniz são multiplataforma, permitindo que o Tracy funcione em diferentes sistemas operacionais.
+ **Funcionalidade Avançada**: O uso de frameworks como Capstone permite funcionalidades avançadas, como a análise de código de máquina e profiling detalhado.

Essas ferramentas e bibliotecas trabalham em conjunto para fazer do Tracy Profiler uma ferramenta robusta e eficaz para desenvolvedores que precisam analisar e otimizar o desempenho de seus aplicativos.


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

# Instalação no Windows
A instalação no Windows consiste em 
+ Fazer o download na página de [releases](https://github.com/wolfpld/tracy/releases); 
+ Descompactar o arquivo compactado de extensão `.7z`;
+ Entrar na pasta extraída e dar um duplo clique no arquivo: `Tracy.exe`

Caso queira fazer o download por aqui mesmo, basta clicar no botão abaixo:
> De acordo com a data de publicação desse artigo, a versão mais recente é a `0.10`.

<a href="" class="btn btn-danger btn-lg">Baixar o <code>Tracy-0.10.7z</code></a>

---

# Instalação no macOS e em distros GNU/Linux
Em sistemas tipo [Unix](https://terminalroot.com.br/tags#unix): [macOS](https://terminalroot.com.br/tags#macOS), [FreeBSD](https://terminalroot.com.br/tags#freebsd) e [GNU/Linux](https://terminalroot.com.br/tags#gnulinux) você precisará antes de dependências tanto em tempo de execução quanto em tempo de compilação.

Utilize o **Gerenciador de Pacotes** do seu [sistema operacional](https://terminalroot.com.br/tags#sistemasoperacionais), exemplos: Brew, APT, Pacman, pkg, emerge, ...

Exemplo no [Ubuntu](https://terminalroot.com.br/tags#ubuntu) usando o APT:
> Pesquise esses nomes de pacotes para seu sistema!

{% highlight bash %}
sudo apt install build-essential libdbus-1-dev libfreetype-dev libtbb-dev libglfw3-dev
{% endhighlight %}
> Para Wayland, adicione: `sudo apt install libxkbcommon-dev libwayland-dev libglvnd-dev`.

Você precisa também do Capstone instalado.

Você pode tentar os pacotes dos repositórios do seu sistema, mas geralmente esses pacotes(salvo o Gentoo e Ports que compilam do código-fonte) estão com versões defasadas ou quebradas, e a maioria tem problemas ao executar o binário. 

Logo, é recomendado remover esses pacotes caso estejam instalados e compilar o Capstone do código-fonte pra não ter problemas.

Então, para usar o pacote correto, é necessário remover, caso já tenha instalado:
{% highlight bash %}
sudo apt remove libcapstone-dev --purge
# Ou
sudo apt remove libcapstone3 --purge
# Para não correr nenhum risco, rode também
sudo apt autoremove
sudo apt autoclean
{% endhighlight %}

### Compilar o Capstone:
{% highlight bash %}
git clone https://github.com/capstone-engine/capstone
git checkout 5.0.1
./make.sh
sudo ./make.sh install
{% endhighlight %}
Em seguida, adicione o diretório onde você baixou o capstone à variável de ambiente `$PKG_CONFIG_PATH`, exemplo:
{% highlight bash %}
echo 'export PKG_CONFIG_PATH="/caminho/para/o/capstone"' >> ~/.bashrc
exec $SHELL
{% endhighlight %}

---

# Clonar, Compilar e Instalar o Tracy Profiler
Agora chegou a hora mais esperada! Rode os comandos na ordem:

{% highlight bash %}
git clone https://github.com/wolfpld/tracy
cd tracy
git checkout v0.10
cd profiler/build/unix/
make LEGACY=1 # Para X11 ou só 'make' para Wayland
{% endhighlight %}
> Se não usar a flag `LEGACY=1` em X11 o binário irá abortar a operação após execução. Outra coisa, se nçao fizer *checkout* na tag(`git checkout v0.10`), o diretório `build` não estará disponível.

Executando:
{% highlight bash %}
./Tracy-release
{% endhighlight %}

Instalar:
{% highlight bash %}
sudo install -v Tracy-release /usr/local/bin/tracy-profiler
{% endhighlight %}


<!-- RECTANGLE 2 - OnParagragraph -->
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

# Utilização
Para utilizar o Tracy não é tão simples para iniciantes, mas há ajudas, manuais, PDFs, ... para lhe auxiliar!

#### Rodando:
{% highlight bash %}
tracy-profiler
{% endhighlight %}

[![Tracy Profiler running](./tracy-profile-run.png)](/assets/img/cpp/tracy-profile-run.png) 
> Tracy Profiler rodando! Clique na imagem para abrir numa nova aba para ver melhor.

#### Usando o `help`:
{% highlight bash %}
tracy-profiler --help
{% endhighlight %}

#### Manual:
{% highlight bash %}
wget -q https://github.com/wolfpld/tracy/releases/latest/download/tracy.pdf && xdg-open tracy.pdf
{% endhighlight %}

### [Exemplos](https://github.com/wolfpld/tracy/tree/master/examples)
### [Versão Web](https://tracy.nereid.pl/)
### Links úteis
+ <https://github.com/wolfpld/tracy>
+ <https://www.youtube.com/watch?v=ghXk3Bk5F2U&ab_channel=CppCon>
+ <https://davespace.xyz/blog/building-tracy-profiler-on-linux>


---

### Informação adicional
Se você só clonar e compilar de forma tradicional com [CMake](https://terminalroot.com.br/tags#cmake) ou [Meson](https://terminalroot.com.br/tags#meson), isso só instala a biblioteca estática com CMake e a dinâmica com Meson, exemplo:

> CMake
{% highlight bash %}
git clone https://github.com/wolfpld/tracy
cd tracy
cmake -B build .
cd build && make
sudo make install
{% endhighlight %}

> Meson
{% highlight bash %}
git clone https://github.com/wolfpld/tracy
cd tracy
meson build
ninja
{% endhighlight %}

Assim você poderá usar a biblioteca em seus código fonte para aplicações específicas:
{% highlight cpp %}
# include <tracy/Tracy.hpp>
{% endhighlight %}
> E usar diretivas e flags específicas.

Caso queira saber os locais de instalação:

<details>
 <summary>Clique aqui ver os caminhos</summary>

{% highlight bash %}
[100%] Built target TracyClient
Install the project...
-- Install configuration: ""
-- Installing: /usr/local/lib64/libTracyClient.a
-- Installing: /usr/local/include/tracy/TracyC.h
-- Installing: /usr/local/include/tracy/Tracy.hpp
-- Installing: /usr/local/include/tracy/TracyD3D11.hpp
-- Installing: /usr/local/include/tracy/TracyD3D12.hpp
-- Installing: /usr/local/include/tracy/TracyLua.hpp
-- Installing: /usr/local/include/tracy/TracyOpenCL.hpp
-- Installing: /usr/local/include/tracy/TracyOpenGL.hpp
-- Installing: /usr/local/include/tracy/TracyVulkan.hpp
-- Installing: /usr/local/include/client/tracy_concurrentqueue.h
-- Installing: /usr/local/include/client/tracy_rpmalloc.hpp
-- Installing: /usr/local/include/client/tracy_SPSCQueue.h
-- Installing: /usr/local/include/client/TracyArmCpuTable.hpp
-- Installing: /usr/local/include/client/TracyCallstack.h
-- Installing: /usr/local/include/client/TracyCallstack.hpp
-- Installing: /usr/local/include/client/TracyCpuid.hpp
-- Installing: /usr/local/include/client/TracyDebug.hpp
-- Installing: /usr/local/include/client/TracyDxt1.hpp
-- Installing: /usr/local/include/client/TracyFastVector.hpp
-- Installing: /usr/local/include/client/TracyLock.hpp
-- Installing: /usr/local/include/client/TracyProfiler.hpp
-- Installing: /usr/local/include/client/TracyRingBuffer.hpp
-- Installing: /usr/local/include/client/TracyScoped.hpp
-- Installing: /usr/local/include/client/TracyStringHelpers.hpp
-- Installing: /usr/local/include/client/TracySysPower.hpp
-- Installing: /usr/local/include/client/TracySysTime.hpp
-- Installing: /usr/local/include/client/TracySysTrace.hpp
-- Installing: /usr/local/include/client/TracyThread.hpp
-- Installing: /usr/local/include/common/tracy_lz4.hpp
-- Installing: /usr/local/include/common/tracy_lz4hc.hpp
-- Installing: /usr/local/include/common/TracyAlign.hpp
-- Installing: /usr/local/include/common/TracyAlloc.hpp
-- Installing: /usr/local/include/common/TracyApi.h
-- Installing: /usr/local/include/common/TracyColor.hpp
-- Installing: /usr/local/include/common/TracyForceInline.hpp
-- Installing: /usr/local/include/common/TracyMutex.hpp
-- Installing: /usr/local/include/common/TracyProtocol.hpp
-- Installing: /usr/local/include/common/TracyQueue.hpp
-- Installing: /usr/local/include/common/TracySocket.hpp
-- Installing: /usr/local/include/common/TracyStackFrames.hpp
-- Installing: /usr/local/include/common/TracySystem.hpp
-- Installing: /usr/local/include/common/TracyUwp.hpp
-- Installing: /usr/local/include/common/TracyYield.hpp
-- Installing: /usr/local/share/Tracy/TracyTargets.cmake
-- Installing: /usr/local/share/Tracy/TracyTargets-noconfig.cmake
-- Installing: /usr/local/share/Tracy/TracyConfig.cmake
{% endhighlight %}

</details>




