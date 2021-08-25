---
layout: post
title: "Entendendo como utilizar std::async em C++"
date: 2021-08-25 10:59:49
image: '/assets/img/cpp/async.png'
description: 'Um exemplo com e sem std::async para notarmos as diferenças.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![Entendendo como utilizar async em C++](/assets/img/async.png)

---

`std::async` foi introduzido no [C++11](https://terminalroot.com.br/cpp). Ele é um template de função que aceita funções de callback como argumento e potencialmente os executa de forma assíncrona.

Ou seja, utilizando-o você pode melhorar a velocidade de uma aplicação, pois o tempo de retorno é usado de forma paralela.

Podemos criar `std::async` com 3 políticas de inicialização diferentes:

+ `std::launch::async` - Ele garante o comportamento assíncrono, ou seja, a função passada será executada em uma *thread* separada.
+ `std::launch::deferred` - Comportamento não assíncrono, a função será chamada quando outro *thread* chamar `get()` no *futuro* para acessar o estado compartilhado.
+ `std::launch::async | std::launch::deferred` - É o comportamento padrão. Com esta política de inicialização, ele pode ser executado de forma assíncrona ou não.

Se não especificarmos uma política de inicialização, `std::launch::async | std::launch::deferred` será utilizado.

No exemplo desse artigo vamos utilizar `std::launch::async`.

Podemos passar qualquer tipo de função de callback em `std::async`:
+ Ponteiro de Função
+ Objeto de Função(functors)
+ Função [Lambda](https://terminalroot.com.br/2021/04/10-exemplos-de-uso-de-funcoes-lambda-em-cpp.html)


<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# Exemplo de uso
Suponhamos que estamos desenvolvendo uma aplicação que precisa consumir 2 [APIs](https://terminalroot.com.br/2021/04/como-criar-uma-api-com-laravel-8.html) diferentes e os dados retornados dessas APIs precisamos concatenar com dados que possuímos para gerar um novo nome.

Sem usar `std::async` faríamos mais ou menos assim:
> Vamos ustilizar [std::chrono](https://terminalroot.com.br/2021/08/quatro-formas-diferentes-de-usar-sleep-em-cpp.html) para criar um `sleep` para dar impressão que seria o tempo de demora do retorno dos dados.

### SEM `std::async`
> `vim exemplo-sem-async.cpp`

{% highlight cpp %}
#include <iostream>
#include <string>
#include <chrono>
#include <thread>

// Obter os dados da 1º API, tem um tempo de 2 segundos
std::string get_first_data_api(std::string ret_data){
  // sleep de 2 segundos
  std::this_thread::sleep_for( std::chrono::seconds(2));
  return "FIRST_" + ret_data;
}


// Obter os dados da 2º API, tem também um tempo de 2 segundos
std::string get_second_data_api(std::string ret_data){
  // sleep de 2 segundos
  std::this_thread::sleep_for( std::chrono::seconds(2));
  return "SECOND_" + ret_data;
}

int main(){
  // Obtém o início do tempo para a contagem
  std::chrono::system_clock::time_point start = 
    std::chrono::system_clock::now();

  // Solicita os dados da primeira API
  std::string first_api = get_first_data_api("NUMERO_UM");

  // Solicita os dados da segunda API
  std::string second_api = get_second_data_api("NUMERO_DOIS");

  // Obtém o final do tempo
  auto end = std::chrono::system_clock::now();

  // Diferença do tempo para saber quanto tempo foi gasto
  auto diff = 
    std::chrono::duration_cast<std::chrono::seconds>(end - start).count();

  // Imprime o temp gasto
  std::cout << "Tempo gasto para a requisição: " << 
    diff << " Segundos" << '\n';

  // Imprime a saída
  std::cout <<
    "Primeira API: "<< first_api <<
    "\nSegunda  API: " << second_api << '\n';

  return 0;
}
{% endhighlight %}

A saída desse exemplo será **4 segundos**, pois será somado o tempo da 1º API(2 segundos) mais o tempo da 2º API(2 segundos).
{% highlight bash %}
Tempo gasto para a requisição: 4 Segundos
Primeira API: FIRST_NUMERO_UM
Segunda  API: SECOND_NUMERO_DOIS
{% endhighlight %}


Ou seja, um foi executado após o outro.

Agora vamos utilizar o mesmo código, mas vamos incluir somente **TRÊS** linhas para usar o `std::async`:

+ **1.** Vamos incluir o cabeçalho: `#include <future>`
+ **2.** Após o comentário: `// Solicita os dados da primeira API`, vamos alterar a linha para essa linha:
{% highlight cpp %}
std::future<std::string> result_api_one = std::async(std::launch::async, get_first_data_api, "NUMERO_UM");
{% endhighlight %}
+ **3.** E após a solicitação da segunda API vamos adicionar essa linha:
{% highlight cpp %}
std::string first_api = result_api_one.get();
{% endhighlight %}

Perceba que estamos agora utilizando `std::future` para obter os dados via a função `get()`.

### COM `std::async`
> `vim exemplo-com-async.cpp`

O código final com uso de `std::async` ficaria assim:
{% highlight cpp %}
#include <iostream>
#include <string>
#include <chrono>
#include <thread>
#include <future>

std::string get_first_data_api(std::string ret_data){
  // sleep de 2 segundos
  std::this_thread::sleep_for( std::chrono::seconds(2));
  return "FIRST_" + ret_data;
}

std::string get_second_data_api(std::string ret_data){
  // sleep de 2 segundos
  std::this_thread::sleep_for( std::chrono::seconds(2));
  return "SECOND_" + ret_data;
}

int main(){
  // Obtém o início do tempo para a contagem
  std::chrono::system_clock::time_point start = 
    std::chrono::system_clock::now();

  // Solicita os dados da primeira API
  std::future<std::string> result_api_one = std::async(std::launch::async, get_first_data_api, "NUMERO_UM");

  // Solicita os dados da segunda API
  std::string second_api = get_second_data_api("NUMERO_DOIS");

  // Bloqueará até que os dados estejam disponíveis no objeto future<std::string>.
  std::string first_api = result_api_one.get();

  // Obtém o final do tempo
  auto end = std::chrono::system_clock::now();

  auto diff = 
    std::chrono::duration_cast<std::chrono::seconds>(end - start).count();

  std::cout << "Tempo gasto para a requisição: " << 
    diff << " Segundos" << '\n';

  // Imprime a saída
  std::cout <<
    "Primeira API: "<< first_api <<
    "\nSegunda  API: " << second_api << '\n';

  return 0;
}
{% endhighlight %}

Para compilar precisamos utilizar a flag: `-pthread`, exemplo:
```sh
g++ -pthread exemplo-com-async.cpp
```

Agora note que a saída foram gastos somente **2 segundos**, ou seja, a primeira API foi executada de forma paralela à segunda API, a saída será:
{% highlight bash %}
Tempo gasto para a requisição: 2 Segundos
Primeira API: FIRST_NUMERO_UM
Segunda  API: SECOND_NUMERO_DOIS
{% endhighlight %}

Agora ficou mais fácil de entender, né?

---

Por hoje é só, são pequenas doses diárias que farão sempre nos manter antenado com o [C++](https://terminalroot.com.br/cpp/) !

## Acompanhe o [cpp::daily](https://terminalroot.com.br/tags#cppdaily)

# Deseja aprender [C++](https://terminalroot.com.br/cpp/) e criar seus programas Gráficos e para Terminal com portabilidade para Linux e Windows?
Então se inscreva nos nossos [Cursos de C++ Moderno](https://terminalroot.com.br/cpp/) . Você aprender criar:
- [Games](https://terminalroot.com.br/tags#games)
- [Ncurses](https://terminalroot.com.br/2021/02/crie-programas-graficos-no-terminal-com-cpp-e-ncurses.html)
- Interface Gráfica: [GTK+](https://terminalroot.com.br/2020/08/anjuta-o-melhor-ide-para-c-com-gtkmm.html) e [Qt](https://terminalroot.com.br/2021/02/gerencie-suas-contas-financeiras-pessoais-com-terminal-finances.html)
- Acesso à Banco de Dados([MySQL](https://terminalroot.com.br/mysql/) e SQLite) via [C++](https://terminalroot.com.br/cpp/)
- Padronização
- E muito mais!

Acesse o endereço:
# <https://terminalroot.com.br/cpp/> e saiba mais!


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

---

# Referências
+ <https://en.cppreference.com/w/cpp/thread/async>
+ <https://stackoverflow.com/questions/17963172/why-should-i-use-stdasync>
+ <https://thispointer.com/c11-multithreading-part-9-stdasync-tutorial-example/>


