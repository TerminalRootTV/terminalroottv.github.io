---
layout: post
title: "Zig Série: A linguagem do futuro"
date: 2025-05-08 18:34:37
image: '/assets/img/zig/zig-series-01.jpg'
description: "⚡ Introdução, Preparando o Ambiente e Olá, Zig!"
icon: 'ion:terminal-sharp'
iconname: 'Zig'
tags:
- zig
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Hoje vamos iniciar também uma série sobre a linguagem de progração: [Zig](https://terminalroot.com.br/tags#zig). Trata-se de conteúdos que fui criando ao longo de um tempo e decidi transformar em postagens por fins de registro das coisas que eu fiz. Lógico, que existem inúmeras maneiras de se aprender Zig, mas aqui com pequenas doses semanais fica mais divertido! 

Nesse artigo veremos:
+ Introdução
+ Preparando o Ambiente
+ Olá, Zig!


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

## 01. Introdução
Zig é uma linguagem de programação de baixo nível, focada em desempenho, segurança e controle explícito do desenvolvedor sobre o sistema. É uma alternativa moderna ao C, com compilação cruzada embutida, ausência de *hidden control flow* e sem coleta de lixo, utiliza LLVM/C++ como backend para o compilador.

Criada por Andrew Kelley em 2015, o desenvolvimento do Zig começou como resposta às limitações do C e C++, buscando uma linguagem mais segura e previsível para sistemas e ferramentas. A linguagem cresceu com apoio da comunidade, com forte ênfase em interoperabilidade com C e uso no ecossistema LLVM.

* O compilador Zig pode compilar código C(e também C++) diretamente.
* É possível compilar Zig sem `glibc`, facilitando builds estáticos.
* Zig pode substituir `make`, `cmake` e scripts bash como sistema de build.
* Usado por desenvolvedores de games, sistemas embarcados e ferramentas de sistema.

**Detalhes Técnicos:**

* **Sem *null* ou *undefined* implícitos**: tipos opcionais e erros são explícitos.
* **Controle manual de alocação**: sem GC ou ARC.
* **Erros são valores**: tratamento via `try` e `catch`, sem exceções ocultas.
* **Compilador self-hosted (em Zig)** desde 2023.
* **Compilação cruzada nativa**: `zig build-exe --target`.

Zig não possui macros nem metaprogramação, mas ainda assim é poderoso o suficiente para expressar programas complexos de uma forma clara e não repetitiva.

Zig é ideal para quem quer controle absoluto do hardware, sem abrir mão de segurança e modernidade.

**Software desenvolvido em Zig**
+ **Tigerbeetle** – É um banco de dados distribuído focado em transações financeiras.
+ **Sig** – É uma implementação do validador Solana otimizada de forma inteligente e escrita em Zig.
+ **MicroZig** – É um framework para desenvolvimento de sistemas embarcados.
+ **ZML** – É uma plataforma de inferência de IA de alto desempenho, projetada para simplificar o serviço de modelos, garantindo desempenho máximo e manutenibilidade em produção.

Mais sobre Zig:
+ <https://pt.wikipedia.org/wiki/Zig_(linguagem_de_programação)>
+ <https://en.wikipedia.org/wiki/Zig_(programming_language)>

---

## 02. Preparando o Ambiente para Zig
Para instalar o Zig no seu sistema operacional, você pode(e deve) fazer download direto do site: <https://ziglang.org/download/> de acordo com seu sistema. 


+ No Windows `x86_64`(não utilize a *branch master* e sim a útima versão):
1. Acesse: [https://ziglang.org/download](https://ziglang.org/download)
2. Baixe o `.zip` da versão *Stable* ou *Master* para Windows.
3. Extraia o conteúdo em uma pasta (ex: `C:\zig`).
4. (Opcional) Adicione o caminho `C:\zig` à variável de ambiente `PATH`:
   * `Win + S` → "Variáveis de ambiente"
   * Em "Path", adicione `C:\zig`
5. Teste no terminal (cmd/powershell):
{% highlight sh %}
zig version
{% endhighlight %}

Você também pode tentar com gerenciadores de pacotes(não recomendado):
{% highlight bash %}
choco install zig # Utilizando Chocolatey
scoop install zig # Utilizando o Scoop
pacman -S mingw-w64-x86_64-zig # Utilizando o msys2
{% endhighlight %}

+ Em distros GNU/Linux `x86_64`(não utilize a *branch master* e sim a útima versão):
{% highlight bash %}
wget -q https://ziglang.org/builds/zig-linux-x86_64-*.tar.xz
tar Jxvf zig-linux-x86_64-*.tar.xz
mkdir -p ~/.local/bin
mv zig-linux-x86_64-*/ ~/.local/bin/zig
echo 'export PATH="${PATH}:${HOME}/.local/bin/zig"' >> ~/.bashrc
source ~/.bashrc
zig version
{% endhighlight %}

+ No macOS você pode também fazer o download ou usar o gerenciador de pacotes ou Ports:
{% highlight bash %}
brew install zig # Utilizando o Homwbrew
port install zig # Utilizando o MacPorts
{% endhighlight %}

Para desenvolvimento utilize qualquer editor de códigos, aquele que você melhor se adapta, dentre eles:
+ VSCode
+ Vim
+ Neovim
Entre outros.

Aqui há uma lista que apesar de o tópico apontar C++, quese todos servem para Zig:
+ [Os 32 Melhores IDEs/Editores de Texto para C++](https://terminalroot.com.br/2021/12/os-32-melhores-ides-editores-de-texto-para-cpp.html)


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


## 03. Olá, Zig!
{% highlight zig %}
const std = @import("std");

pub fn main() void {
    std.debug.print("Olá, {s}!\n", .{"Zig"});
}
// Compilar e Rodar: zig run main.zig
// Compilar: zig build-exe main.zig
// Rodar: ./main
{% endhighlight %}

Ou

{% highlight zig %}
const print = @import("std").debug.print;

pub fn main() void {
    print("Hello, world!\n", .{});
}
{% endhighlight %}
Compile: `zig build-exe main.zig && mv main a.out && rm main.o`

Ou ainda:
{% highlight zig %}
const print = @import("std").debug.print;

pub fn main() void {
    const hello: []const u8 = "Olá, Zig!⚡";
    print("{s}\n", .{hello});
}
{% endhighlight %}

Linha a linha do código Zig:
{% highlight zig %}
const std = @import("std");
{% endhighlight %}

* Importa a biblioteca padrão do Zig e associa à constante `std`.
* `@import` é uma *builtin* usada para incluir módulos.

{% highlight zig %}
pub fn main() void {
{% endhighlight %}

* Define a função `main`, ponto de entrada do programa.
* `pub` torna a função pública (necessário para que o linker a encontre).
* `void` indica que a função não retorna valor.

{% highlight zig %}
std.debug.print("Olá, {s}!\n", .{"Zig"});
{% endhighlight %}

* Chama a função `print` do módulo `debug` da biblioteca padrão.
* `"Olá, {s}!\n"` é o *format string*. `{s}` será substituído por uma string.
* `.{"Zig"}` é um *tuple literal* com o valor a ser inserido no `{s}`.
* `\n` quebra a linha.

É um equivalente direto a `printf("Olá, %s!\n", "Zig");` em C.

---
