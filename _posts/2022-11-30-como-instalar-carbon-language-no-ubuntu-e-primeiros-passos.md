---
layout: post
title: "Como Instalar Carbon Language no Ubuntu e Primeiros Passos"
date: 2022-11-30 15:40:21
image: '/assets/img/carbon/carbon.jpg'
description: 'Carbon é a nova linguagem de programação do Google, Open Source que pretende ser o sucessor do C++.'
icon: 'ion:terminal-sharp'
iconname: 'Carbon'
tags:
- carbon
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

[Carbon](https://github.com/carbon-language/carbon-lang) é a nova linguagem de programação do Google, Open Source que pretende ser o sucessor do C++. Apesar de ainda estar em fase experimental e em desenvolvimento, vale à pena aprendê-la desde cedo para começar a entender o quanto antes e aumentar as chances de facilidade de adaptação futura.

Nós já fizemos um vídeo anterior sobre a linguagem de programação Carbon, caso você queira assistir, basta [clicar neste link](https://www.youtube.com/watch?v=qyLoFVZbzqc).

---

# Assista ao Vídeo

<iframe width="1253" height="705" src="https://www.youtube.com/embed/dTuPFgAh_sQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

# Comandos utilizados no Vídeo

### 01. Atualizar o sistema:
> [Ubuntu](https://terminalroot.com.br/tags#ubuntu)

{% highlight bash %}
sudo apt update
{% endhighlight %}

### 02. Instalar as dependências necessárias:
{% highlight bash %}
sudo apt install sudo apt install build-essential curl git zlib1g-dev
{% endhighlight %}

### 03. Instalar o [Homebrew](https://terminalroot.com.br/2021/07/homebrew-o-gerenciador-de-pacotes-do-macos-no-gnu-linux.html):
{% highlight bash %}
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
{% endhighlight %}

### 04. Carregar o ambiente do Homebrew:
{% highlight bash %}
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
{% endhighlight %}

### 05. Instalar os pacotes com o Homebrew:
{% highlight bash %}
brew install gcc python@3.9 bazelisk llvm
{% endhighlight %}

### 06. Atualizar o [PIP](https://terminalroot.com.br/tags#python) e adicionar o `llvm` à variável `$PATH`:
{% highlight bash %}
pip3.9 install -U pip
export PATH="$(brew --prefix llvm)/bin:${PATH}"
{% endhighlight %}

---


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

### 07. Clonar e rodar o Carbon:
{% highlight bash %}
git clone https://github.com/carbon-language/carbon-lang
cd carbon-lang
bazel run //explorer -- ./explorer/testdata/print/format_only.carbon
{% endhighlight %}

### 08. 'Hello, World!' em Carbon
> `vim ./explorer/testdata/prefix/sandbox.carbon`

{% highlight rust %}
package sample api;

fn Main() -> i32 {
  Print("Hello, World!");
  return 0;
}
{% endhighlight %}
> Para compilar, rode: `bazel run //explorer -- ./explorer/testdata/print/sandbox.carbon`

### 09. Declarando variáveis:
{% highlight rust %}
package sample api;

fn Main() -> i32 {
  var s: auto = "Olah, Carbon";
  Print(s);
  return 0;
}
{% endhighlight %}

### 10. Básico para condições `if..else`
{% highlight rust %}
package sample api;

fn Main() -> i32 {
    let x: i32 = 42;
    if( x == 6 ){
      Print("x nao eh igual a 6!");
    }else{
      Print("x eh igual a {0}", x);
    }
    return 0;
}
{% endhighlight %}

### 11. Criando funções sem parâmetros:
{% highlight rust %}
package sample api;

fn olahMundo() -> String {
  return "Olah, mundo via funcao!";
}

fn Main() -> i32 {
  Print( olahMundo() );
  return 0;
}
{% endhighlight %}

### 12. Declarando funções com parâmetros
{% highlight rust %}
package sample api;

fn mySum(var x: i32, var y: i32) -> i32 {
  return x + y;
}

fn Main() -> i32 {
  Print("A soma de x + y: {0}", mySum(9, 3) );
  return 0;
}
{% endhighlight %}

---

Para mais informações consulte os exemplos no diretório [explorer/testdata](https://github.com/carbon-language/carbon-lang/tree/trunk/explorer/testdata) e a [documentação](https://github.com/carbon-language/carbon-lang/).

Caso queira, tente usar Carbon online através do endereço: <https://carbon.godbolt.org/>.


