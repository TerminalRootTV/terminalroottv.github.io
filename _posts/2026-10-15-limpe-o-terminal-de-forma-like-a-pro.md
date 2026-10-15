---
layout: post
title: "Limpe o Terminal de forma Like a Pro"
date: 2026-10-15 19:18:54
image: '/assets/img/cpp/sclide.jpg'
description: "🔳 Um aplicativo feito com C++ com um efeito incrível!"
icon: 'ion:terminal-sharp'
iconname: 'Terminal/C++'
tags:
- cpp
- terminal
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

O **sclide** é uma implementação de um efeito de *wipe* para terminais. Ele desenha uma linha horizontal que atravessa a tela, acompanhada por um rastro de quatro níveis de sombreamento. Em seguida, quando solicitado, utiliza o mesmo efeito para limpar o terminal progressivamente, linha por linha.

O projeto foi desenvolvido para ser pequeno, direto e fácil de integrar a outros programas em [C++](https://terminalroot.com.br/tags#cpp).

Principais recursos:

- **Cores RGB de 24 bits:** personalize as cores da linha e do rastro usando valores RGB ou códigos hexadecimais.
- **Rastro com quatro níveis:** utiliza os caracteres `█`, `▓`, `▒` e `░` para criar um gradiente visual.
- **Velocidade configurável:** controle o intervalo entre as etapas da animação.
- **Limpeza animada:** apague o conteúdo do terminal com uma transição vertical.
- **Personalização dos caracteres:** substitua os símbolos utilizados no rastro.
- **Implementação enxuta:** não depende de bibliotecas externas e pré-calcula as sequências de animação para reduzir o trabalho durante a renderização.

Em funcionamento:

![sclide](https://github.com/intriXlabs/sclide/raw/main/demoGifs/simpleDemo.gif) 


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

## Instalação
O sclide é distribuído como código-fonte [C++](https://terminalroot.com.br/cpp), e sua instalação consiste basicamente em obter o arquivo `sclide.cpp` e incorporá-lo ao seu projeto. Não é necessário instalar uma biblioteca adicional.

### [Windows](https://terminalroot.com.br/tags#windows)
O caminho recomendado é utilizar o WSL (Windows Subsystem for Linux), pois o projeto utiliza chamadas POSIX para consultar as dimensões do terminal e escrever a saída.

1\. Instale o WSL, caso ainda não esteja disponível, pelo PowerShell executado como administrador:

{% highlight bash %}
wsl --install
{% endhighlight %}

2\. Abra a distribuição Linux instalada e instale as ferramentas de compilação:

{% highlight bash %}
sudo apt update
sudo apt install git g++ build-essential
{% endhighlight %}

3\. Clone o repositório:

{% highlight bash %}
git clone https://github.com/intriXlabs/sclide.git
cd sclide
{% endhighlight %}

4\. Copie o arquivo `sclide.cpp` para o diretório do seu projeto C++ e siga o exemplo de uso apresentado na próxima seção.

Você também pode compilar projetos C++ nativamente no Windows com outras ferramentas, mas o funcionamento do sclide nesse ambiente não é garantido pelo projeto original.

### [macOS](https://terminalroot.com.br/tags#macos)
No macOS, você pode utilizar o [Clang](https://terminalroot.com.br/tags#clang) fornecido pelas ferramentas de linha de comando da Apple.

1\. Instale as ferramentas de desenvolvimento, se necessário:

{% highlight bash %}
xcode-select --install
{% endhighlight %}

2\. Clone o repositório:

{% highlight bash %}
git clone https://github.com/intriXlabs/sclide.git
cd sclide
{% endhighlight %}

3\. Copie o arquivo `sclide.cpp` para o diretório do seu projeto.

4\. Compile sua aplicação utilizando `clang++` ou `g++`, com suporte a C++11 ou superior.

### [GNU/Linux](https://terminalroot.com.br/tags#gnulinux)
Em distribuições baseadas no [Debian](https://terminalroot.com.br/tags#debian) ou [Ubuntu](https://terminalroot.com.br/tags#ubuntu), instale o [Git](https://terminalroot.com.br/tags#git) e o compilador:

{% highlight bash %}
sudo apt update
sudo apt install git g++
{% endhighlight %}

Depois, obtenha o código-fonte:

{% highlight bash %}
git clone https://github.com/intriXlabs/sclide.git
cd sclide
{% endhighlight %}

Copie `sclide.cpp` para o seu projeto e compile a aplicação conforme o exemplo a seguir.

Em outras distribuições, instale o compilador C++ e o Git usando o gerenciador de pacotes correspondente.


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

## Primeiros passos
A API do sclide é simples: crie um objeto, configure as cores e a velocidade e chame `clean()` para executar a animação.

Crie um arquivo chamado `main.cpp` no mesmo diretório de `sclide.cpp`:

{% highlight cpp %}
#include "sclide.cpp"

int main(){
    // Define a linha inicial da animação.
    sclide wipe(5);

    // Cor principal: verde-água.
    wipe.setSclideColor("#00FFAA");

    // Cor para a qual o rastro irá desaparecer.
    wipe.setShadeDegradingColor("#001111");

    // Tempo entre as etapas, em segundos.
    wipe.setSpeed(0.05);

    // Executa a animação e limpa o terminal.
    wipe.clean();

    return 0;
}
{% endhighlight %}

Compile o programa no terminal:

{% highlight bash %}
g++ -O3 -std=c++11 main.cpp -o exemplo
{% endhighlight %}

Execute no macOS ou [GNU/Linux](https://terminalroot.com.br/tags#gnulinux):

{% highlight bash %}
./exemplo
{% endhighlight %}

No Windows, execute o binário dentro do ambiente WSL:

{% highlight bash %}
./exemplo
{% endhighlight %}

O resultado é uma linha animada com um rastro colorido, seguida pela limpeza progressiva da tela. Como `clean()` apaga o conteúdo do terminal, execute o exemplo em uma sessão de teste.

### Personalizando a animação
O sclide disponibiliza métodos para ajustar o efeito durante a execução.

| Método                     | Finalidade                                |
| -------------------------- | ----------------------------------------- |
| `setSclideColor()`         | Define a cor principal da linha.          |
| `setShadeDegradingColor()` | Define a cor final do gradiente.          |
| `resetSclideColor()`       | Restaura a cor principal branca.          |
| `setSpeed()`               | Ajusta o intervalo entre as etapas.       |
| `changeShades()`           | Substitui os quatro caracteres do rastro. |
| `clean()`                  | Executa a animação e limpa o terminal.    |

As cores podem ser configuradas com códigos hexadecimais, como `"#FF6600"`, ou com componentes RGB. Para criar diferentes estilos, experimente combinar uma cor principal vibrante com uma cor de degradação escura ou próxima da cor de fundo do terminal.

---

Para mais informações acesse: o [repositório](https://github.com/intriXlabs/sclide)


