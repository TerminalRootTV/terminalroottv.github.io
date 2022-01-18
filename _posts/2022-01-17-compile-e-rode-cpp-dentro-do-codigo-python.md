---
layout: post
title: "Compile e rode C++ dentro do código Python"
date: 2022-01-17 18:40:55
image: '/assets/img/python/python-cpp.jpg'
description: 'Aprenda a usar sub processos em Python'
icon: 'ion:terminal-sharp'
iconname: 'Python'
tags:
- python
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

O módulo `subprocess` permite gerar novos processos, conectar-se aos seus pipes de *entrada/saída/erro* e obter seus códigos de retorno. Este módulo pretende substituir vários módulos e funções mais antigas, tais como: `os.system` e `os.spawn*` .

---

# Usando o `subprocess` para compilar e rodar código [C++](https://terminalroot.com.br/cpp)
Nese caso, vamos usar métodos mais antigos por questões de compatibilidade, algumas funções só estão disponíveis a partir do **Python 3.5**, por exemplo a função `run()`.

Suponhamos que você possua esse código exemplo em [C++](https://terminalroot.com.br/cpp)

> `main.cpp`
{% highlight cpp %}
#include <iostream>
#include <vector>

class Code {
  std::string m_first{};
  std::string m_last{};
  int         m_sid{};  
  int         m_month{};
  public:
  Code(){}
  Code(std::string first,std::string last,int sid,int month)
    : m_first(first)
      , m_last(last)
      , m_sid(sid)
      , m_month(month) {
      }
  void show(){
    std::cout << m_first << " "
      << m_last  << " "
      << m_sid   << " "
      << m_month << '\n';
  }
};

int main( int argc , char **argv ){
  std::vector<Code> codes;
  Code code1("Marcos", "Oliveira", 2022, 01);
  Code code2("Bjarne", "Stroustroup", 1979, 04);
  codes.push_back(code1);
  codes.push_back(code2);
  for( Code c : codes){
    c.show();
  }
  return EXIT_SUCCESS;
}
{% endhighlight %}
> Ele exibe somente dados de cadastrados.


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

Agora vamos compilar e rodar o código via [Python](https://terminalroot.com.br/tags#python):
+ Criaremos o arquivo `main.py` e importamos o módulo `subprocess`
{% highlight python %}
import subprocess 
{% endhighlight %}

+ Agora vamos usar a função `call()` para compilarmos o código:
{% highlight python %}
subprocess.call(["g++", "main.cpp"]) 
{% endhighlight %}

+ Agora vamos rodar o binário:
{% highlight python %}
subprocess.call("./a.out") 
{% endhighlight %}

O código completo seria de 3 básicas linhas:
{% highlight python %}
import subprocess
subprocess.call(["g++", "main.cpp"]) 
subprocess.call("./a.out") 
{% endhighlight %}

Agora rode:
{% highlight python %}
python main.py
{% endhighlight %}

E vai parecer que o código C++ rodou em tempo de execução.

Agora você percebeu que C++ foi só um exemplo e que o `subprocess` você pode usar para outras linguagens e situações também, né?!

Para mais informações acesse: <https://docs.python.org/3/library/subprocess.html> .



