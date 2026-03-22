---
layout: post
title: "Como Mapear o 'Ctrl + c' com C++"
date: 2024-05-18 20:48:35
image: '/assets/img/cpp/signal.jpg'
description: 'Com Shorts, TikTok e conteúdo escrito.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- shorts
- tiktok
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

# Shorts

<iframe width="436" height="775" src="https://www.youtube.com/embed/ypHKQoUpUIU" title="Como Mapear o &#39;Ctrl+ c&#39; em C++" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

---

# TikTok

<blockquote class="tiktok-embed" cite="https://www.tiktok.com/@terminalroot/video/7370495717820960005" data-video-id="7370495717820960005" style="max-width: 605px;min-width: 325px;" > <section> <a target="_blank" title="@terminalroot" href="https://www.tiktok.com/@terminalroot?refer=embed">@terminalroot</a> Como Mapear o &#39;Ctrl + c&#39; com C++ <a title="cpp" target="_blank" href="https://www.tiktok.com/tag/cpp?refer=embed">#cpp</a> <a title="cplusplus" target="_blank" href="https://www.tiktok.com/tag/cplusplus?refer=embed">#cplusplus</a> <a title="programacao" target="_blank" href="https://www.tiktok.com/tag/programacao?refer=embed">#programacao</a> <a title="programming" target="_blank" href="https://www.tiktok.com/tag/programming?refer=embed">#programming</a> <a title="code" target="_blank" href="https://www.tiktok.com/tag/code?refer=embed">#code</a> <a target="_blank" title="♬ original sound  - terminalroot" href="https://www.tiktok.com/music/original-sound-terminalroot-7370496234436545286?refer=embed">♬ original sound  - terminalroot</a> </section> </blockquote> <script async src="https://www.tiktok.com/embed.js"></script>

---

# Conteúdo escrito

Ás vezes precisamos *devolver* algo ao sistema quando finalizamos um programa, mas pode ser que o usuário *matou o processo* antes do fim do mesmo sem ser de uma maneira esperada.

Acontece muito em programas que possuem um *loop* `while` com tarefas a serem executadas para o final esperado!

Suponhamos que vc possua esse código que emite um aviso no início do programa e após 5 segundos o programa termina e emite outro aviso:

{% highlight cpp %}
#include <iostream>
#include <memory>
#include <chrono>
#include <thread>

void msgOut(){
  std::cout << "Terminou a contagem dos 5 segundos." << '\n';
}

class CountTime {

  void m_start_count(){
    std::this_thread::sleep_for(std::chrono::seconds(5));
  }

  public:
    CountTime(){
      std::cout << "Começou a contagem dos 5 segundos!" << '\n';
      this->m_start_count();
    }

    ~CountTime(){
      msgOut();
    }
};

int main(){
  auto ct = std::make_unique<CountTime>();
  return 0;
}

{% endhighlight %}

Após você compilar e rodar, após 5 segundos apareceram essas duas mensagens na saída:
{% highlight bash %}
Começou a contagem dos 5 segundos!
Terminou a contagem dos 5 segundos.
{% endhighlight %}

Agora suponhamos que antes do fim dos 5 segundos, você pressione `Ctrl + c`, a segunda mensagem não aparecerá e a saída ficará assim:
{% highlight bash %}
Começou a contagem dos 5 segundos!
^C
{% endhighlight %}

Ou seja, se seu programa tem uma <u>função para ser executada sempre que o programa terminar</u>, logo, ele gerará um bug silencioso.

Para resolver isso, podemos *mapear* o sinal enviado e executar determinada tarefa mesmo que o programa seja interrompido antes do seu fim esperado de forma comum.

---

# Utilizando o `std::signal`
Primeiramente vamos incluir o cabeçalho:
{% highlight cpp %}
#include <csignal>
{% endhighlight %}

Criar uma função de *callback* que tratará o signal, fora da *execução* da nossa classe:
{% highlight cpp %}
void signal_handler(int signal) {
  if (signal == SIGINT) {
    msgOut();
    std::exit(EXIT_SUCCESS);
  }
}
{% endhighlight %}

E *startar* ele no construtor, ou antes do início de um suposto `loop` que executaremos!
{% highlight cpp %}
std::signal(SIGINT, signal_handler);
{% endhighlight %}

---

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

O código final será:
{% highlight cpp %}
#include <iostream>
#include <memory>
#include <chrono>
#include <thread>
#include <csignal> // incluir

void msgOut(){
  std::cout << "Terminou a contagem dos 5 segundos." << '\n';
}

// Nossa função para tratamento do signal
void signal_handler(int signal) {
  if (signal == SIGINT) {
    msgOut();
    std::exit(EXIT_SUCCESS);
  }
}

class CountTime {

  void m_start_count(){
    std::this_thread::sleep_for(std::chrono::seconds(5));
  }

  public:
    CountTime(){
      std::signal(SIGINT, signal_handler); // Configurando o tratamento do signal
      std::cout << "Começou a contagem dos 5 segundos!" << '\n';
      this->m_start_count();
    }

    ~CountTime(){
      msgOut();
    }
};

int main(){
  auto ct = std::make_unique<CountTime>();
  return 0;
}
{% endhighlight %}

Após compilar e rodar, após teclar `Ctrl + c`, agora a saída será:
{% highlight bash %}
Começou a contagem dos 5 segundos!
^CTerminou a contagem dos 5 segundos.
{% endhighlight %}

Note que após o `Ctrl + c`(`^C`) a mensagem apareceu normalmente!

---

# Outro exemplo sem Orientação a Objetos e com `while`
{% highlight cpp %}
#include <iostream>
#include <csignal>

void signal_handler(int signal) {
  if (signal == SIGINT) {
    std::cout << "Você pressinou: Ctrl + C\n";
    std::exit(EXIT_SUCCESS);
  }
}

auto main() -> int {
  std::signal(SIGINT, signal_handler);
  while (true){}
}
{% endhighlight %}
> Saída após `Ctrl + c`:
{% highlight bash %}
^CVocê pressinou: Ctrl + C
{% endhighlight %}

---

Espero que tenha ajudado, para mais informações acesse uma [documentação sobre o `std::signal`](https://en.cppreference.com/w/cpp/utility/program/signal).



