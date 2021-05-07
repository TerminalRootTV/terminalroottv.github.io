---
layout: post
title: "Crie Barras de Progresso facilmente em C++"
date: 2021-05-07 11:10:39
image: '/assets/img/cppdaily/indicators.jpg'
description: 'Vários estilos de barras de progresso.'
icon: 'ion:terminal-sharp'
iconname: 'cpp::daily'
tags:
- cppdaily
- cpp
- terminal
---

![Crie Barras de Progresso facilmente em C++](/assets/img/cppdaily/indicators.jpg)

**Indicators** é um projeto que dispõe código pronto para você implementar ao criar barras de progresso no [terminal](http://terminalroot.com.br/tags/#terminal).

# Características
+ Barras de progresso seguras com thread e spinners
+ Biblioteca apenas de cabeçalho. Pegue uma cópia de incluir.
+ Versão de cabeçalho único em `single_include`.
+ A fonte do GIF
+ Licença MIT

# Criando uma básica barra de progresso
Para implementar uma barra de progresso em seu aplicativo, inclua `indicators/progress_bar.hpp` e crie um objeto ProgressBar. Esta é a estrutura geral de uma barra de progresso:
{% highlight cpp %}
{prefix} {start} {fill} {lead} {remaining} {end} {percentage} [{elapsed}<{remaining}] {postfix}
         ^^^^^^^^^^^^^ Bar Width ^^^^^^^^^^^^^^^
{% endhighlight %}

A quantidade de progresso em ProgressBar é mantida como um `size_t` no intervalo [0, 100]. Quando o progresso chega a 100, a progressão está concluída.

No código no nível do aplicativo, existem duas maneiras de atualizar esse progresso:
Progresso de atualização usando `bar.tick()`

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

![Indicators 1](https://raw.githubusercontent.com/p-ranav/indicators/master/img/progress_bar_tick.gif)

{% highlight cpp %}
#include <indicators/progress_bar.hpp>
#include <thread>
#include <chrono>

int main() {
  using namespace indicators;
  ProgressBar bar{
    option::BarWidth{50},
    option::Start{"["},
    option::Fill{"="},
    option::Lead{">"},
    option::Remainder{" "},
    option::End{"]"},
    option::PostfixText{"Extracting Archive"},
    option::ForegroundColor{Color::green},
    option::FontStyles{std::vector<FontStyle>{FontStyle::bold}}
  };

  // Update bar state
  while (true) {
    bar.tick();
    if (bar.is_completed())
      break;
    std::this_thread::sleep_for(std::chrono::milliseconds(100));
  }

  return 0;
}
{% endhighlight %}

# Outros exemplos
## Barra de progresso indeterminada

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

![Indicators 2](https://raw.githubusercontent.com/p-ranav/indicators/master/img/indeterminate_progress_bar.gif)

---

## Barra de progresso em bloco

![Indicators 3](https://raw.githubusercontent.com/p-ranav/indicators/master/img/block_progress_bar.gif)

## Spinners

![Indicators 4](https://raw.githubusercontent.com/p-ranav/indicators/master/img/progress_spinner.gif)

---

# Implementado na vida real
Se você tiver uma `iso` de por exemplo 5GB e deseja copiar para outro diretório, o código seria;

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

{% highlight cpp %}
#include <indicators/indeterminate_progress_bar.hpp>
#include <indicators/cursor_control.hpp>
#include <atomic>
#include <filesystem>
#include <thread>
#include <chrono>
namespace fs = std::filesystem;

int main() {

  // Configure an indeterminate progress bar
  indicators::IndeterminateProgressBar bar{
      indicators::option::BarWidth{40},
      indicators::option::Start{"["},
      indicators::option::Fill{"·"},
      indicators::option::Lead{"<==>"},
      indicators::option::End{"]"},
      indicators::option::PostfixText{"Copying file..."},
      indicators::option::ForegroundColor{indicators::Color::yellow},
      indicators::option::FontStyles{
          std::vector<indicators::FontStyle>{indicators::FontStyle::bold}}
  };

  indicators::show_console_cursor(false);

  // Setup a file copy job to run in a separate thread
  auto copyfile_job = [&bar]() {
    const std::string src = "/home/marcos/5GB.iso";
    const std::string dst = "/home/marcos/Downloads/5GB.iso";

    try {
        auto done = fs::copy_file(src, dst, fs::copy_options::overwrite_existing);
        if (done) {
            std::cout << termcolor::bold << termcolor::green 
                << "Copy completed\n" << termcolor::reset;
        } 
        else {
            std::cout << termcolor::bold << termcolor::red 
                << "Copy failed\n" << termcolor::reset;
        }
    }
    catch (std::exception& e) {
        std::cout << e.what() << "\n";
    }

    // When the job is done, mark the progress bar as completed
    bar.mark_as_completed();
  };
  std::thread copyfile_job_completion_thread(copyfile_job);

  // Update bar state and wait for copy to complete
  while (!bar.is_completed()) {
    bar.tick();
    std::this_thread::sleep_for(std::chrono::milliseconds(100));
  }

  copyfile_job_completion_thread.join();
  
  indicators::show_console_cursor(true);  
  return 0;
}
// 
{% endhighlight %}

# Instalando o `indicators` e compilando seu código
Basta clonar e usar o [CMake](https://terminalroot.com.br/2019/12/como-compilar-seus-programas-com-cmake.html) [Make]()

{% highlight bash %}
igit clone https://github.com/p-ranav/indicators
cd indicators
mkdir build && cd build
cmake -DINDICATORS_SAMPLES=ON -DINDICATORS_DEMO=ON ..
make
cd
vim copia.cpp
g++ -pthread -std=c++17 copia.cpp
{% endhighlight %}

---

## Para mais exemplos e com o código pronto visite o repositório oficial do Indicators:
### <https://github.com/p-ranav/indicators/>


