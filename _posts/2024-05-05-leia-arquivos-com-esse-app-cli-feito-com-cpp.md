---
layout: post
title: "Leia arquivos com esse App CLI feito com C++"
date: 2024-05-05 20:56:03
image: '/assets/img/cpp/ftx-file-reader.jpg'
description: "Substitui o comando 'less' para paginação. E mais dicas de como controlar o cursor padrão do seu terminal via C++ e FTXUI!"
icon: 'ion:terminal-sharp'
iconname: 'C++ App'
tags:
- cpp
- dicas
- comandos
- tui
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Se você quer uma boa alternativa ao comando `less` do [Unix](https://terminalroot.com.br/tags#unix)/[GNU](https://terminalroot.com.br/tags#gnu), o **ftxuiFileReader** é uma boa alternativa.

É um software simples feito com [C++](https://terminalroot.com.br/tags#cpp) e a biblioteca [FTXUI](https://terminalroot.com.br/2022/11/crie-programas-graficos-no-terminal-com-ftxui.html) que nós já fizemos um vídeo que pode ser assistido no link abaixo:
## ▶️  [Crie Programas Gráficos no Terminal com FTXUI](https://youtu.be/OWJhDj-qgDk)

---

# Compilando e instalando o ftxuiFileReader
Para instalar, lógico, você precisará das dependências básicas, são elas:
+ [Git](https://terminalroot.com.br/tags#git)
+ [G++](https://terminalroot.com.br/tags#gcc) ou [Clang++](https://terminalroot.com.br/tags#clang)
+ [GNU Make](https://terminalroot.com.br/tags#make)
+ e o [CMake](https://terminalroot.com.br/tags#cmake)
> A biblioteca FTXUI é clonada automaticamente como dependência ao rodar o CMake!

Basta clonar, compilar e rodar:
{% highlight bash %}
git clone https://github.com/J0sephDavis/ftxuiFileReader
cd ftxuiFileReader
cmake -B build .
cd build && make
{% endhighlight %}

Após isso haverá dentro do diretório `build/`, que você rodou o `make`, um binário com o mesmo nome do programa: `ftxuiFileReader`. Basta rodá-lo e passar como argumento o caminho do arquivo que você deseja ler, exemplo:
{% highlight bash %}
./ftxuiFileReader /caminho/para/main.cpp
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

### O resultado será similar ao GIF abaixo:

![ftxuiFileReader GIF](https://github.com/ArthurSonzogni/ftxuiFileReader/assets/4759106/2dd434a1-7969-4d0b-b94c-ab635cd163ae) 

---

# Instalação com dicas adicionais
Ainda dentro do diretório que você construiu: `build/` você pode instalar no local desejado do seu sistema. 

Mas, antes disso recomendo algumas alterações para uma melhor usabilidade do **ftxuiFileReader**, pois há alguns problemas que eu detectei, são eles:

#### Primeiro: Há um *bug* no cursor do terminal ao terminar a execução do programa
Quando você executa e sai do programa, o cursor do seu terminal é modicado para **sublinhado piscante**(`_`). No meu caso eu uso(e está definido por padrão) a **linha vertical**(`|`) e não ficou legal.

Para solucionar isso, ainda dentro de `build/`, eu editei o arquivo fonte `main.cc`:
{% highlight bash %}
vim ../src/main.cc
{% endhighlight %}

E antes do `return EXIT_SUCCESS;` na função `main()` que fica na linha **250** eu adicionei esse `std::cout << "\x1b[\x35 q";`, ficando assim:
{% highlight cpp %}
std::cout << "\x1b[\x35 q";
return EXIT_SUCCESS;
{% endhighlight %}

Isso serve para mim, pois esse `x35` é justamente para retornar ao meu cursor *linha vertical piscante*. Você pode alterar conforme seja seu cursor, as alternativas são:
+ `std::cout << "\x1b[\x31 q";` → Muda para *bloco piscante*;
+ `std::cout << "\x1b[\x32 q";` → Muda para *bloco constante*;
+ `std::cout << "\x1b[\x33 q";` → Muda para *sublinhado piscante*;
+ `std::cout << "\x1b[\x34 q";` → Muda para *sublinhado constante*;
+ `std::cout << "\x1b[\x35 q";` → Muda para *linha vertical piscante*;
+ `std::cout << "\x1b[\x36 q";` → Também muda para *linha vertical constante*;
> As numerações, na veradade começam do `30` e podem ir até mais, no entanto, as modificações serão similares à essas! Caso queira, pode até declarar um: `std::system("reset");`.

#### Use a modificação conforme é o **cursor padrão do seu terminal**, aquele que você escolheu!

Feito isso, basta recompilar:
> Lembrando que a recompilação demora bem menos, pois modificamos só um arquivo!
{% highlight bash %}
make
{% endhighlight %}

E para instalar, por exemplo, em: `/usr/local/bin`, mais recomendado, também sugiro instalar com um nome mais **Unix style**(só com minúsculas e separado por traços em vez de capitalizações), exemplo: `ftx-file-reader`:

{% highlight bash %}
sudo install -v ftxuiFileViewer /usr/local/bin/ftx-file-reader
{% endhighlight %}

Agora já pode até remover o repositório clonado, ex.: `cd ../.. && rm -rf ftxuiFileViewer` e usar o comando `ftx-file-reader` modificado ou o padrão(`ftxuiFileReader`), se você modificou, exemplo lendo um arquivo `main.cpp`:

{% highlight bash %}
ftx-file-reader main.cpp
{% endhighlight %}

> **Observação**: Você pode sair do programa teclando a letra `q`, por exemplo, mas há um pequeno *bug* que pode exibir o caractere digitado ao sair, mas em forma de *input detectável*, exemplo para o `q`: `1R`. Para resolver isso, basta rolar pelo menos duas vezes a linha teclado a seta para baixo. Em resumo, para sair tecle a combinação de teclas: `↓ ↓ q`.

Qualquer dúvida ou dica de melhoria(pegar o cursor padrão automaticamente e redefinir ao sair, por exemplo) acesse o [repositório oficial](https://github.com/J0sephDavis/ftxuiFileReader).

Há outros softwares feitos com FTXUI que já publicamos aqui no blog, você pode ler clicando nos links abaixo:
+ [Escute Músicas no Terminal com Spectrum](https://terminalroot.com.br/2023/04/escute-musicas-no-terminal-com-spectrum.html)
+ [Visualize JSON de forma interativa pelo terminal](https://terminalroot.com.br/2022/01/visualize-json-de-forma-interativa-pelo-terminal.html)
+ [Selecione Cores no Terminal com RGB-TUI C++](https://terminalroot.com.br/2021/12/selecione-cores-no-terminal-com-rgb-tui-cpp.html)
+ [Crie Programas Gráficos no Terminal com FTXUI](https://terminalroot.com.br/2022/11/crie-programas-graficos-no-terminal-com-ftxui.html)



