---
layout: post
title: "Usando C++ como Shell Script"
date: 2024-06-14 23:57:50
image: '/assets/img/cpp/cpp-bash.jpg'
description: "🗞️ Parece loucura, mas além de um ótimo exercício, melhora muito o desempenho das tarefas."
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- bash
- shellscript
- comandos
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Há um tempo atrás eu havia criado um *script* em [Bash](https://terminalroot.com.br/tags#bash)([Shell Script](https://terminalroot.com.br/tags#shellscript) que limpava algumas coisas no meu sistema, dentre elas:
+ O cache de imagens que foram visualizadas, incluindo as thumbnails;
+ O cache dos navegadores que eu tinha instalado na minha máquina: [Google Chrome](https://terminalroot.com.br/tags#chrome), [Firefox](https://terminalroot.com.br/tags#firefox) e Opera;
+ O histório com Bash;
+ Os arquivos recentes;
+ E a lixeira!

O script funcionava normalmente, bastava eu rodar o comando `limpeza` no [terminal](https://terminalroot.com.br/tags#terminal).

No entanto, um belo dia quando rodei esse script, notei que ele demorou muito de executar. O motivo disso foi que na lixeira havia diversos arquivos `.iso`, somados acho que havia uns 5GB de tamanho!

E então eu pensei perguntando pra mim mesmo: 
> *— Por que o Bash demorou tanto para remover???*

E pensei:
> *— Se eu fizesse esse script em [C++](https://terminalroot.com.br/tags#cpp), será que demoraria tanto?!*

Então, eu decidi fazer e testar! Após terminar de escrever, deletei uns 10GB de `.iso`(joguei na lixeira) e rodei o código pós-compilado pra testar com o comando [time](https://terminalroot.com.br/2021/03/testei-o-desempenho-de-10-linguagens-de-programacao-com-ranking.html) e comparei o resultado do mesmo comando com o do script em Bash.

E a diferença foi GRANDEEEE! Ou seja, o mesmo script feito em [C++](https://terminalroot.com.br/cpp) foi muito mais rápido!

Bom, isso já faz muito tempo, mas decidi postar aqui, pois esse "*script*" serve de exercício para quem está treinando seus códigos C++, é uma boa você usar: **C++ como Shell Script** para aprimorar suas habilidades!

Nos próximos tópicos vou descrever cada linha/trecho do código e ao final haverá todos os arquivos separados para caso você queira compilar e testar na sua máquina.


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

# Escrevendo o código
Como vamos compilar com [CMake](https://terminalroot.com.br/tags#cmake), o ideal é criar uma pasta para o projeto:
{% highlight bash %}
mkdir cleanup
cd cleanup
{% endhighlight %}

E então crie esse primeiro arquivo: `vim limpeza.hpp`:
> O cabeçalho local: `colors.hpp`, pode ser obtido da postagem: [Crie sua própria biblioteca de cores para C++](https://terminalroot.com.br/2021/05/crie-sua-propria-biblioteca-de-cores-para-cpp.html). Acesse, copie o código que tem lá e salve com esse mesmo nome.

Vamos adicionar:

{% highlight cpp %}
#pragma once
#include <iostream>
#include <filesystem>
#include <memory>
#include <array>
#include <fstream>
#include "colors.hpp"
{% endhighlight %}

Pra não estender muito o nome do `namespace`
{% highlight cpp %}
namespace fs = std::filesystem;
{% endhighlight %}

Nome da classe, bem intuitivo! =)
{% highlight cpp %}
class Limpeza
{% endhighlight %}

Caso o usuário queira executar o código sem alterar/remover nada no seu PC, além de exibir o(a)s pastas/arquivos que serão removidos:
{% highlight cpp %}
bool m_debug;
{% endhighlight %}

Armazena os caminhos dinamicamente:
{% highlight cpp %}
std::string m_path;
{% endhighlight %}

Capta a pasta pessoal do usuário:
{% highlight cpp %}
const std::string m_home = std::getenv("HOME");
{% endhighlight %}

Tudo aquilo que iremos limpar, que falei no início:
{% highlight cpp %}
const fs::path m_trash  = ".local/share/Trash/files";
const fs::path m_thumbs = ".cache/thumbnails";
const fs::path m_chrome = ".cache/google-chrome";
const fs::path m_fox    = ".cache/mozilla";
const fs::path m_opera  = ".cache/opera";
const fs::path m_recent = ".local/share/recently-used.xbel";
const fs::path m_bash_h = ".bash_history";
{% endhighlight %}

Essa funções-membro declarei como: `protected`:
+ Imprime com Unicode e cores:
{% highlight cpp %}
void print(bool, const std::string&);
{% endhighlight %}

Recebe um *array opcional* com: caminho, mensagem `true` e mensagem `false`. Essas duas funções-membro fazem quase a mesma coisa, sendo que uma é para *pastas* e a outra para `arquivos regulares`:
{% highlight cpp %}
bool clean_dir(const std::array<std::string, 3>& = {});
bool clean_file(const std::array<std::string, 3>& = {});
{% endhighlight %}

E como `public` só declarei o *construtor* e `run()`:
+ Recebe o modo debug como parâmetro:
{% highlight cpp %}
Limpeza(bool);
void run(); // Para ser chamada na main
{% endhighlight %}

Após isso criei a execução do código no arquivo: `vim limpeza.cpp`:
{% highlight cpp %}
#include "limpeza.hpp"
{% endhighlight %}

C++ não precisa de `getters` e `setters` sempre, como em [Java](https://terminalroot.com.br/tags#java). Você já pode(e deve) inicializar os membros com essa sintaxe no construtor. Nesse caso, inicializamos o `m_debug` e a `m_path`:
{% highlight cpp %}
Limpeza::Limpeza(bool debug) : m_debug(debug){
  m_path = {};
}
{% endhighlight %}

Essa função-membro chama as outras funções-membro e se o `modo debug` estiver ativado ela exibe o caminho, para você ter certeza que **não deletará nada que não seja os arquivos/pastas especificados**!
{% highlight cpp %}
void Limpeza::run(){
  this->clean_dir({m_trash, "Lixeira esvaziada", "esvaziar lixeira"});
  if(m_debug){ std::cout << hey::yellow << m_path << hey::off << "\n\n";}

  this->clean_file({m_recent, "Arquivos recentes limpados", "limpar arquivos recentes"});
  if(m_debug){ std::cout << hey::yellow << m_path << hey::off << "\n\n";}

  this->clean_file({m_bash_h, "Histórico do Bash removido", "limpar histórico do Bash"});
  if(m_debug){ std::cout << hey::yellow << m_path << hey::off << "\n\n";}

  this->clean_dir({m_thumbs, "Thumbnails removidas", "remover cache das Thumbnails"});
  if(m_debug){ std::cout << hey::yellow << m_path << hey::off << "\n\n";}

  this->clean_dir({m_chrome, "Cache do Chrome limpado", "remover cache do Chrome"});
  if(m_debug){ std::cout << hey::yellow << m_path << hey::off << "\n\n";}

  this->clean_dir({m_fox, "Cache do Firefox limpado", "remover cache do Firefox"});
  if(m_debug){ std::cout << hey::yellow << m_path << hey::off << "\n\n";}

  this->clean_dir({m_opera, "Cache do Opera limpado", "remover cache do Opera"});
  if(m_debug){ std::cout << hey::yellow << m_path << hey::off << "\n\n";}
}
{% endhighlight %}

Essa `print`, organiza a saída para não ficar repetindo sempre:
{% highlight cpp %}
void Limpeza::print(bool action, const std::string& msg){
  (action) ? 
    std::cout << hey::green + "\u2705 " + msg + " com sucesso!" + hey::off << '\n' :
    std::cerr << hey::red + "\u274C Falha ao " + msg + "." + hey::off << '\n';
}
{% endhighlight %}

Remove os diretórios: 
+ se existir;
+ se der pra remover;
+ se não estiver vazio;
+ se o debug estiver desabilitado.
Tudo de forma segura e com todas as verificações possíveis! E cria um novo(quando for necessário) para agilizar o processo:

{% highlight cpp %}
bool Limpeza::clean_dir(const std::array<std::string, 3>& arr){
  m_path = m_home + '/' + arr[0];
  if(m_debug){
    this->print(true, arr[1]);
    return true;
  }

  try {
    if (fs::exists(m_path) && fs::is_directory(m_path)) {
      if (fs::is_empty(m_path)) {
        return false;
      }else{
        if(fs::remove_all(m_path)){
          this->print(true, arr[1]);
          fs::create_directory(m_path);
        }else{
          this->print(false, arr[2]);
          return false;
        }
      }
    }else{
      return false;
    }
  }catch (const fs::filesystem_error& e){
    std::cerr << "EXECUTAR ESSA AÇÃO: " << e.what() << '\n';
    return false;
  }
  return true;
}
{% endhighlight %}

As mesmas ações da função-membro acima, mas para `arquivos regulares` e usa a `std::ofstream` em vez da `std::filesystem` para recriar os arquivos e não pastas:
{% highlight cpp %}
bool Limpeza::clean_file(const std::array<std::string, 3>& arr){
  m_path = m_home + '/' + arr[0];
  if(m_debug){
    this->print(true, arr[1]);
    return true;
  }

  try {
    if (fs::exists(m_path) && fs::is_regular_file(m_path)) {
      std::size_t size = std::filesystem::file_size(m_path);
      if(size == 0){
        return false;
      }
      if(fs::remove_all(m_path)){
        this->print(true, arr[1]);
        std::ofstream out(m_path);
        out.close();
      }else{
        this->print(false, arr[2]);
        return false;
      }
    }else{
      return false;
    }
  }catch (const fs::filesystem_error& e){
    std::cerr << "EXECUTAR ESSA AÇÃO: " << e.what() << '\n';
    return false;
  }
  return true;
}
{% endhighlight %}

E por final, nosso arquivo: `vim main.cpp`:
> Note que passamos o `--debug` como parâmetro de forma opcional!

{% highlight cpp %}
#include "limpeza.hpp"

int main(int argc, char** argv){
  bool debug {false};
  std::string param {};
  if(argc > 1){
    param = argv[1];
    if(param == "--debug"){
      debug = true;
    }else{
      std::cerr << "Use: " << argv[0] << " [--debug]\n";
    }
  }
  auto lp = std::make_unique<Limpeza>(debug);
  lp->run();
  return 0;
}
{% endhighlight %}


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

# Todos os arquivos

### `limpeza.hpp`
{% highlight cpp %}
#pragma once
#include <iostream>
#include <filesystem>
#include <memory>
#include <array>
#include <fstream>
#include "colors.hpp"

namespace fs = std::filesystem;

class Limpeza {

  bool m_debug;
  std::string m_path;

  const std::string m_home = std::getenv("HOME");

  const fs::path m_trash  = ".local/share/Trash/files";
  const fs::path m_thumbs = ".cache/thumbnails";
  const fs::path m_chrome = ".cache/google-chrome";
  const fs::path m_fox    = ".cache/mozilla";
  const fs::path m_opera  = ".cache/opera";
  const fs::path m_recent = ".local/share/recently-used.xbel";
  const fs::path m_bash_h = ".bash_history";

  protected:
    void print(bool, const std::string&);
    bool clean_dir(const std::array<std::string, 3>& = {});
    bool clean_file(const std::array<std::string, 3>& = {});

  public:
    Limpeza(bool);
    void run();
};
{% endhighlight %}

### `limpeza.cpp`
{% highlight cpp %}
#include "limpeza.hpp"

Limpeza::Limpeza(bool debug) : m_debug(debug){
  m_path = {};
}

void Limpeza::run(){
  this->clean_dir({m_trash, "Lixeira esvaziada", "esvaziar lixeira"});
  if(m_debug){ std::cout << hey::yellow << m_path << hey::off << "\n\n";}

  this->clean_file({m_recent, "Arquivos recentes limpados", "limpar arquivos recentes"});
  if(m_debug){ std::cout << hey::yellow << m_path << hey::off << "\n\n";}

  this->clean_file({m_bash_h, "Histórico do Bash removido", "limpar histórico do Bash"});
  if(m_debug){ std::cout << hey::yellow << m_path << hey::off << "\n\n";}

  this->clean_dir({m_thumbs, "Thumbnails removidas", "remover cache das Thumbnails"});
  if(m_debug){ std::cout << hey::yellow << m_path << hey::off << "\n\n";}

  this->clean_dir({m_chrome, "Cache do Chrome limpado", "remover cache do Chrome"});
  if(m_debug){ std::cout << hey::yellow << m_path << hey::off << "\n\n";}

  this->clean_dir({m_fox, "Cache do Firefox limpado", "remover cache do Firefox"});
  if(m_debug){ std::cout << hey::yellow << m_path << hey::off << "\n\n";}

  this->clean_dir({m_opera, "Cache do Opera limpado", "remover cache do Opera"});
  if(m_debug){ std::cout << hey::yellow << m_path << hey::off << "\n\n";}
}

void Limpeza::print(bool action, const std::string& msg){
  (action) ? 
    std::cout << hey::green + "\u2705 " + msg + " com sucesso!" + hey::off << '\n' :
    std::cerr << hey::red + "\u274C Falha ao " + msg + "." + hey::off << '\n';
}

bool Limpeza::clean_dir(const std::array<std::string, 3>& arr){
  m_path = m_home + '/' + arr[0];
  if(m_debug){
    this->print(true, arr[1]);
    return true;
  }

  try {
    if (fs::exists(m_path) && fs::is_directory(m_path)) {
      if (fs::is_empty(m_path)) {
        return false;
      }else{
        if(fs::remove_all(m_path)){
          this->print(true, arr[1]);
          fs::create_directory(m_path);
        }else{
          this->print(false, arr[2]);
          return false;
        }
      }
    }else{
      return false;
    }
  }catch (const fs::filesystem_error& e){
    std::cerr << "EXECUTAR ESSA AÇÃO: " << e.what() << '\n';
    return false;
  }
  return true;
}

bool Limpeza::clean_file(const std::array<std::string, 3>& arr){
  m_path = m_home + '/' + arr[0];
  if(m_debug){
    this->print(true, arr[1]);
    return true;
  }

  try {
    if (fs::exists(m_path) && fs::is_regular_file(m_path)) {
      std::size_t size = std::filesystem::file_size(m_path);
      if(size == 0){
        return false;
      }
      if(fs::remove_all(m_path)){
        this->print(true, arr[1]);
        std::ofstream out(m_path);
        out.close();
      }else{
        this->print(false, arr[2]);
        return false;
      }
    }else{
      return false;
    }
  }catch (const fs::filesystem_error& e){
    std::cerr << "EXECUTAR ESSA AÇÃO: " << e.what() << '\n';
    return false;
  }
  return true;
}
{% endhighlight %}

### `main.cpp`
{% highlight cpp %}
#include "limpeza.hpp"

int main(int argc, char** argv){
  bool debug {false};
  std::string param {};
  if(argc > 1){
    param = argv[1];
    if(param == "--debug"){
      debug = true;
    }else{
      std::cerr << "Use: " << argv[0] << " [--debug]\n";
    }
  }
  auto lp = std::make_unique<Limpeza>(debug);
  lp->run();
  return 0;
}
{% endhighlight %}

### Além do arquivo `colors.hpp` que é da [postagem que falei](https://terminalroot.com.br/2021/05/crie-sua-propria-biblioteca-de-cores-para-cpp.html).

---

# Compilando com CMake, rodando e instalando
Para compilar vamos usar esse `CMakeLists.txt`:
{% highlight cmake %}
cmake_minimum_required(VERSION 3.10)
set_property(GLOBAL PROPERTY INTERPROCEDURAL_OPTIMIZATION TRUE)

project(Limpeza
  LANGUAGES CXX
  VERSION 0.0.1
)

add_compile_options(-g -Wall -Wextra -Wpedantic -pedantic)
if(CHECK_MEM)
  message("Compilando com libasan. Saiba mais: <https://github.com/google/sanitizers/>")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fsanitize=address")
endif()

set (CMAKE_CXX_STANDARD 23)
add_executable(limpeza main.cpp limpeza.cpp)
{% endhighlight %}

Note no `CMakeLists.txt` que podemos passar o parâmetro opcional: `-DCHECK_MEM=ON` para o usar a `libasan` que é a biblioteca: [sanitizers do Google](https://github.com/google/sanitizers/), para mais informações veja o vídeo: [10 Dicas de Flags e Parâmetros para GNU GCC](https://terminalroot.com.br/2023/08/10-dicas-de-flags-e-parametros-para-gnu-gcc.html).

Logo você pode usar o CMake assim(com libasan):
{% highlight bash %}
cmake -B build . -DCHECK_MEM=ON
{% endhighlight %}
> Ou somente: `cmake -B build .`

Em seguida, compilar e testar com `modo debug`:
{% highlight bash %}
cmake --build build
build/limpeza --debug
{% endhighlight %}

Se quiser instalar e usar para fazer suas limpezas, recomendo usar localmente(só para seu usuário):
{% highlight bash %}
mkdir -p ~/.local/bin
echo 'export PATH="${PATH}:${HOME}/.local/bin" >> ~/.bashrc'
exec $SHELL
install -v ./build/limpeza ~/.local/bin
{% endhighlight %}

Teste de novo para ver tudo que será ou não removido e depois rode definitivamente:
> Lembrando que sem ser no modo debug, somente as ações que ele executar haverá saída. Po exemplo, você não tem o Opera instalado, ou já rodou o comando antes, ele não fará nada e nem exibirá!

{% highlight bash %}
limpeza
{% endhighlight %}

Saída:

![Saída comando limpeza feito com C++](/assets/img/cpp/saida-cpp-bash.png) 

Se quiser que o histórico do terminal fique limpo após rodar tudo, adicione o um alias assim:
```bash
echo 'alias limpeza="limpeza && history -c"' >> ~/.bashrc
exec $SHELL
```
> Faça assim, pois rodar processos como esse com `std::system` além de não funcionar não é recomendado!

---

Futuramente pretendo mostrar outros *scripts* que eu fiz com [C++](https://terminalroot.com.br/tags#cpp) e depois organizar todos e pôr em um único repositório no [GitHub](https://github.com/terroo).

Espero que tenham gostado dessa mini-aventura! 😎 


