---
layout: post
title: "Crie Comandos REPL facilmente"
date: 2025-01-31 20:30:21
image: '/assets/img/cppdaily/repl.jpg'
description: "🚀 Somente com um arquivo cabeçalho!"
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
- boost
- repl
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**Command Interpreter** é um `header-only` escrito em [C++](https://terminalroot.com.br/tags#cpp) que serve para você criar um *shell repl* com comandos personalizados para você usar conforme desejar. Nesse artigo vamos ver: dependências, utilização e exemplos.


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

## Dependências
Para usar o Command Interpreter você precisará da biblioteca: [Boost](https://terminalroot.com.br/2024/07/conceito-instalacao-e-exemplos-de-uso-da-biblioteca-boost.html)

Use o seu gerenciador de pacotes para instalar a `libboost`, exemplo no [Ubuntu](https://terminalroot.com.br/tags#ubuntu):
{% highlight bash %}
sudo apt install libboost-all-dev
{% endhighlight %}

---

## Baixar o Command Interpreter
Como trata-se de somente um `header-only` você pode baixar direto do navegador ou usar um utilitário para isso, exemplos:

[GNU/wget](https://terminalroot.com.br/2019/05/aprenda-a-explorar-o-comando-wget.html) em distros [GNU/Linux](https://terminalroot.com.br/tags#gnulinux)
{% highlight bash %}
wget https://raw.githubusercontent.com/empirical-soft/command-interpreter/refs/heads/master/command_interpreter.hpp
{% endhighlight %}

[cURL](https://terminalroot.com.br/tags#curl) para [macOS](https://terminalroot.com.br/tags#macos) ou [BSD](https://terminalroot.com.br/tags#bsd)
{% highlight bash %}
curl -LO https://raw.githubusercontent.com/empirical-soft/command-interpreter/refs/heads/master/command_interpreter.hpp
{% endhighlight %}

[PowerShell](https://terminalroot.com.br/tags#powershell) no [Windows](https://terminalroot.com.br/tags#windows)
{% highlight bash %}
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/empirical-soft/command-interpreter/refs/heads/master/command_interpreter.hpp"
{% endhighlight %}

---

## Exemplo de código
Vamos criar um REPL que há 2 comandos:
1. `add` que incrementa, exemplo: `add 3 6` que exibirá: **9**;
2. `inc` que incrementa, exemplo: `inc 9` que exibirá: **10**.

> `main.cpp`
{% highlight cpp %}
#include <iostream>
#include <memory>
#include "command_interpreter.hpp"

class Arithmetic : public CommandInterpreter {
  constexpr static int add(int x, int y) {
    return x + y;
  }

  constexpr int inc(int x) {
    return x + 1;
  }

  void register_commands() override {
    register_command(add, "add", "Add two numbers");
    register_command(&Arithmetic::inc, "inc", "Increment a number");
  }
};

int main(){
  auto a = std::make_unique<Arithmetic>();
  std::string comm;
  std::cout << ">>> ";
  for(;;){
    if(!std::getline(std::cin, comm) || comm == "exit"){
      break;
    }
    std::cout << a->eval(comm) << std::endl;
    std::cout << ">>> ";
  }
  return EXIT_SUCCESS;
}
{% endhighlight %}

Após compilar e rodar:
{% highlight bash %}
g++ main.cpp -o repl
./repl
{% endhighlight %}

Exemplo de saída:
> Digitar `exit` sai do REPL
{% highlight bash %}
>>> add 3 6
9
>>> inc 9
10
>>> exit
{% endhighlight %}

---

Para mais informações acesse o repositório: <https://github.com/empirical-soft/command-interpreter>.

