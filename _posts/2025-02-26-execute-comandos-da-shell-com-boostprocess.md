---
layout: post
title: "Execute Comandos da Shell com Boost.Process"
date: 2025-02-26 09:31:37
image: '/assets/img/cppdaily/boost-process.jpg'
description: "🚀 Mais segurança, portabilidade e controle do que a std::system."
icon: 'ion:terminal-sharp'
iconname: 'Shell/C++'
tags:
- shell
- terminal
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

[Boost.Process](https://www.boost.org/doc/libs/1_84_0/doc/html/process/reference.html) é uma biblioteca [C++](https://terminalroot.com.br/tags#cpp) da [Boost](https://terminalroot.com.br/2024/07/conceito-instalacao-e-exemplos-de-uso-da-biblioteca-boost.html) que facilita a criação e gerenciamento de processos externos, permitindo **executar programas**, capturar saídas e manipular entradas e erros de forma eficiente. 

Ela oferece uma interface moderna e flexível para trabalhar com processos, encapsulando detalhes de implementação de sistemas operacionais e fornecendo funcionalidades como execução assíncrona, comunicação entre processos(IPC), controle de saída de streams e gerenciamento de ambiente de execução. 

É ideal para aplicações que necessitam interagir com programas externos ou executar comandos do sistema de forma controlada e segura.

A Boost.Process foi criada para oferecer uma **alternativa mais segura e flexível** ao `std::system()`, que tem várias limitações. 

---

## Comparação com a `std::system`
### 1. **Mais Controle sobre o Processo**  
Com `boost::process`, você pode:  
- Capturar saída e entrada (`std::system` não permite isso diretamente).  
- Definir variáveis de ambiente.  
- Trabalhar com processos assíncronos (`std::system` é sempre bloqueante).  
- Especificar diretórios de trabalho.  

### 2. **Segurança**  
O `std::system()` executa comandos via um **shell**, o que pode ser perigoso se você estiver passando strings dinâmicas (risco de **injeção de comandos**).  
Exemplo perigoso com `std::system()`:
{% highlight cpp %}
std::string user_input = "ls && rm -rf /"; // Se for injetado, pode ser catastrófico!
std::system(user_input.c_str());  
{% endhighlight %}
Com Boost.Process, você passa argumentos separadamente, evitando problemas de injeção:
{% highlight cpp %}
boost::process::child c("ls", "-l");
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

### 3. **Portabilidade**  
- `std::system()` depende do shell do sistema (`cmd.exe` no Windows, `/bin/sh` no Linux).  
- `boost::process` funciona de forma **portável**, sem depender do shell subjacente.  

### 4. **Execução Assíncrona**  
- `std::system()` **bloqueia** a execução até que o processo termine.  
- Com Boost, você pode rodar processos em paralelo sem travar seu programa:
{% highlight cpp %}
boost::process::child c("long_task");
c.detach(); // Continua a execução sem esperar
{% endhighlight %}

### 5. **Manipulação Direta de Entrada/Saída**  
Com `boost::process`, você pode redirecionar entrada/saída facilmente:
{% highlight cpp %}
boost::process::ipstream out;
boost::process::child c("ls", boost::process::std_out > out);
std::string line;
while (std::getline(out, line)) {
    std::cout << line << std::endl;
}
{% endhighlight %}
Com `std::system()`, você precisaria de **pipes manuais**, o que é mais trabalhoso.

### **Quando Usar Cada Um?**
✅ Use **Boost.Process** se precisar de **portabilidade, segurança, manipulação de I/O ou execução assíncrona**.  
⚠️  Use `std::system()` **apenas para comandos simples e rápidos** onde segurança e controle não são problemas.

---

## Instalação e Exemplos de Uso
Para instalar a Boost.Process você pode seguir este artigo que nós fizemos que mostra tanto usando gerenciadores de pacotes, como também fazendo o download direto do endereço oficial da LibBoost: [Conceito, Instalação e Exemplos de uso da biblioteca Boost](https://terminalroot.com.br/2024/07/conceito-instalacao-e-exemplos-de-uso-da-biblioteca-boost.html)

### Exemplo básico
Nesse exemplo, mostra como rodar o comando `ls` usando a Boost.Process:
> Exemplo: `main.cpp`

{% highlight cpp %}
#include <boost/process.hpp>
#include <iostream>
#include <string>

namespace bp = boost::process;

int main() {
    std::string output;
    bp::ipstream pipe_stream; // Stream para capturar a saída
    
    // Executa o comando "ls" e redireciona a saída para pipe_stream
    bp::child c("ls", bp::std_out > pipe_stream);
    
    // Lê a saída do comando linha por linha
    std::string line;
    while (std::getline(pipe_stream, line)) {
        std::cout << line << std::endl;
    }
    
    c.wait(); // Aguarda o término do processo
    return 0;
}
{% endhighlight %}
Para compilar não precisa de nenhuma flag adicional, basta compilar normalmente e rodar:
{% highlight bash %}
g++ main.cpp
./a.out
{% endhighlight %}

Se quiser usar com argumentos, substitua a linha: `bp::child` por essa abaixo:
{% highlight cpp %}
//bp::child c("ls", bp::std_out > pipe_stream);
bp::child c("ls", "-l", "*.md", bp::std_out > pipe_stream);
{% endhighlight %}

Em [Shells](https://terminalroot.com.br/tags#shell) que faz o uso de [glob](https://en.wikipedia.org/wiki/Glob_(programming)) pode ser que você tenha um problema ao utilizar [curingas](https://en.wikipedia.org/wiki/Wildcard_character), então use a `bp::child` assim:
{% highlight cpp %}
//bp::child c("ls", bp::std_out > pipe_stream);
bp::child c("/bin/sh", "-c", "ls -l *.md", bp::std_out > pipe_stream);
{% endhighlight %}
> Isso lista com detalhes todos os arquivos com extensão [Markdown](https://terminalroot.com.br/tags#markdown) no diretório que você executar o binário.


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

## Outro exemplo
Esse exemplo exibe a versão do [GNU GCC](https://terminalroot.com.br/tags#gcc), caso você possua instalado no seu sistema, mas com um tratamento de falha mais adequado para o uso.

{% highlight cpp %}
#include <boost/process.hpp>
#include <iostream>
#include <stdexcept>

using namespace boost::process;

int main() {
    ipstream pipe_stream;
    std::string line;
    
    try {
        child c("/usr/bin/gcc", args = { "--version" }, std_out > pipe_stream);
        
        while (pipe_stream && std::getline(pipe_stream, line)) {
            std::cerr << line << std::endl;
        }

        c.wait();

        // Verifica se o processo foi bem sucedido
        if (c.exit_code() != 0) {
            throw std::runtime_error("Process failed with error code: " + std::to_string(c.exit_code()));
        }
    } catch (const std::exception& e) {
        std::cerr << "Failed to execute command: " << e.what() << std::endl;
        return 1;
    }

    return 0;
}
{% endhighlight %}

O ideal é informar o caminho completo do programa: `/usr/bin/gcc` em vez de somente: `gcc`, tente alterar e coloque só o comando do programa e veja que dará erro.

---

## Limitações
Assim como qualquer outra lib de subprocesso, alguns poucos comandos não funcionarão como esperado, pois pode ser um [comando](https://terminalroot.com.br/tags#comandos) EMBUTIDO da Shell, como por exemplo: `history`.

Nós já abordamos sobre isso nesse artigo: [Usando C++ como Shell Script](https://terminalroot.com.br/2024/06/usando-cpp-como-shell-script.html).

Apesar dele pode exibir o histórico, se você tentar limpar a sessão isso, com certeza, não vai funcionar. Isso acontece porque ele não é um executável separado. Quando você executa `history -c` em um subprocesso, ele está em um novo shell que não compartilha o histórico da sua sessão principal.

Esse código abaixo não resulta em uma ação esperada:

{% highlight cpp %}
#include <boost/process.hpp>
#include <iostream>

namespace bp = boost::process;

int main() {
    std::string output;
    bp::ipstream pipe_stream;
    
    bp::child c("/bin/bash", "-c", "history -c && history -w", bp::std_out > pipe_stream);
    
    std::string line;
    while (std::getline(pipe_stream, line)) {
        std::cout << line << std::endl;
    }
    
    c.wait();
    return 0;
}
{% endhighlight %}
Caso ainda queira executar o comando, o código está correto(pode melhorar com tratamento de falhas como vimos), mas a saída não mostrará nada relevante, pois `history -c` não gera saída e afeta **apenas o subprocesso**.

> O comando [history](https://www.gnu.org/software/bash/manual/html_node/Bash-History-Builtins.html) é um recurso embutido da Shell, e não um executável separado. Quando você executa `history -c` em um subprocesso, ele está em um novo shell que não compartilha o histórico da sua sessão principal.

---

Para mais informações consulte a documentação: <https://www.boost.org/doc/libs/1_84_0/doc/html/process/reference.html>.

