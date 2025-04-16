---
layout: post
title: "Como Instalar o GCC 14 e usar o C++23"
date: 2025-04-15 14:25:46
image: '/assets/img/gcc/23-gcc-14.jpg'
description: "🚀 Diversos novos recursos como: std::print, std::println e entre outros."
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- gcc
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

O **[GCC](https://terminalroot.com.br/tags#gcc) 14** há diversas novas melhorias de usabilidade. Apesar do *GCC 15* já está disponível, muitos sistemas ainda não possui disponibilidade nos repositórios dos gerenciadores de pacotes, mas o GCC 14 sim! Como no [Ubuntu](https://terminalroot.com.br/tags#ubuntu), por exemplo.

Se você só atualiza seu sistema, mas mesmo assim ainda não atualizações disponível, deve ser porque ele ainda não é o padrão, mas você pode instalar e definí-lo como padrão para seu sistema.

Vamos ver como fazer isso.


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
Para instalar, no [Ubuntu](https://terminalroot.com.br/tags#ubuntu), por exemplo, basta usar o APT:

Antes atualize a lista de repositório:
{% highlight bash %}
sudo apt update && sudo apt upgrade
{% endhighlight %}

Agora é só instalar o [GCC 14](https://gcc.gnu.org/gcc-14/changes.html), nesse caso só o `g++`:
{% highlight bash %}
sudo apt install g++-14
{% endhighlight %}

Pode ser que depois de instalado a versão ainda não esteja atualizada:
{% highlight bash %}
g++ --version
g++-13 (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
{% endhighlight %}

Mas, ele já estará disponível através do comando `g++-14`:
{% highlight bash %}
g++-14 --version
g++-14 (Ubuntu 14.2.0-4ubuntu2~24.04) 14.2.0
{% endhighlight %}

---

## Definir como padrão para seu sistema
Para torná-lo padrão ao utilizar somente o comando `g++`, siga esses passos:

+ **1. Adicione o GCC 14 como alternativa**:
{% highlight bash %}
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-14 100
{% endhighlight %}

+ **2. Agora seleciona interativamente**:
{% highlight bash %}
sudo update-alternatives --config g++
{% endhighlight %}
> Escolha o *número* relativo ao g++14, geralmente o `2`, pode ser que ambos seja o mesmo, mas forçe escolhendo o **2**.

Após isso agora é só rodar o comando `g++` sem especificação:
{% highlight bash %}
g++ --version
g++ (Ubuntu 14.2.0-4ubuntu2~24.04) 14.2.0
Copyright (C) 2024 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
{% endhighlight %}

Vantagens de fazer da forma acima em vez de só alterar o *link simbólico*:
+ Não quebra o sistema.
+ Pode alternar facilmente entre versões.
+ Evita conflitos com o `apt/dpkg`.


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

## Adicionais
Se tiver tendo problema com o seu [LSP](https://terminalroot.com.br/2021/11/lsp-autocomplete-e-machine-learning-neovim-com-lua.html) `clangd` instale também essas bibliotecas para compatibiliadade com o [Clang](https://terminalroot.com.br/tags#clang):

{% highlight bash %}
sudo apt install libstdc++-14-dev libc++-dev libc++abi-dev 
{% endhighlight %}

---

## Testando
Se você criar esse código você precisará usar a flag `-std=c++23` para conseguir compilar, exemplo:

> `print.cpp`
{% highlight cpp %}
#include <print>

int main(){
  const std::string var{"All"};
  std::println("Olá, {}", var);
}
{% endhighlight %}

Compilando:
{% highlight bash %}
g++ -std=c++23 print.cpp
{% endhighlight %}

Se quiser acidionar o `-std=c++23` como padrão e não percisar invocá-lo ao compilar, você adicionar um `alias ` ao `~/.bashrc`, exemplo:
> Para obter o caminho completo do seu `g++` use o comando `which`, ex.: `which c++`

{% highlight bash %}
echo 'alias g++="/usr/bin/g++ -std=c++23"' >> ~/.bashrc
source ~/.bashrc
{% endhighlight %}

Pronto, agora nem precisa mais do `-std=c++`, basta rodar: `g++ print.cpp`.

Outra forma é usar o `specs`, exemplo:

Gere o `specs`:
{% highlight bash %}
g++ -dumpspecs > ~/.config/specs
{% endhighlight %}

Edite o `specs` e altere a linha relativa e abaixo do conteúdo: `*cpp:`, substitua tudo que houver e deixe assim:
{% highlight bash %}
*cpp:
%{posix:-D_POSIX_SOURCE} -std=c++23
{% endhighlight %}

E depois adicione isso ao seu `~/.bashrc`:
{% highlight bash %}
export GCC_SPEC_FILE="${HOME}/.config/specs"
alias g++="g++ -specs=$GCC_SPEC_FILE"
{% endhighlight %}

---

Você pode usar a mesma lógica para o comando: `gcc` para a [Linguagem C](https://terminalroot.com.br/tags#linguagemc).

Para mais informações acesse os links abaixo:
+ <https://gcc.gnu.org/gcc-14/changes.html>
+ <https://en.cppreference.com/w/cpp/io/println>
+ <https://developers.redhat.com/articles/2025/04/10/6-usability-improvements-gcc-15#>
+ <https://en.cppreference.com/w/cpp/compiler_support>


