---
layout: post
title: "V , a linguagem de programação que Vem fazendo muito sucesso"
date: 2022-01-18 13:47:43
image: '/assets/img/programacao/v.jpg'
description: 'Vlang é indicada para Desenvolvimento Web, Desenvolvimento de Games, Interfaces Gráficas, Mobile, Ciência, Sistemas embarcados, Ferramentas e etc.'
icon: 'ion:terminal-sharp'
iconname: 'Vlang'
tags:
- programacao
- vlang
- go
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**V** ou **Vlang** é uma [linguagem de programação](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html) : compilada, de uso geral e tipada estaticamente . Lançada como um projeto de código aberto em junho de 2019 por Alex Medvedniko.

Projetado para desempenho, segurança e compilação rápida. O compilador é escrito em **V** e tem menos de 1MB, é capaz de compilar em menos de um segundo cerca de 1 milhão de linhas de código com zero dependências de biblioteca.

Você pode aprender tudo sobre a linguagem somente lendo a documentação em uma hora e, na maioria dos casos, há apenas uma maneira de fazer algo.

Isso resulta em código simples, legível e de fácil manutenção.

Apesar de simples, V dá muito poder ao desenvolvedor e pode ser usado em praticamente todos os campos, incluindo programação de sistemas: [Desenvolvimento Web](https://terminalroot.com.br/tags#desenvolvimentoweb), [Desenvolvimento de Games](https://terminalroot.com.br/tags#games), [Interfaces Gráficas](https://terminalroot.com.br/tags/#gui), Mobile, [Ciência](https://terminalroot.com.br/tags/#ciencia), Sistemas embarcados, Ferramentas, etc.


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

# Instalação
Você pode instalar usar o V em quase todos os sistemas operacionais possíveis, tais como: [Linux](https://terminalroot.com.br/linux), [macOS](https://terminalroot.com.br/tags#macos), [Windows](https://terminalroot.com.br/tags#windows), [\*BSD](https://terminalroot.com.br/tags#bsd), Solaris, WSL, Android, Raspbian, ...
> Você precisará do: [Git](https://terminalroot.com.br/tags#git), [gcc](https://terminalroot.com.br/tags#gcc) e [Make](https://terminalroot.com.br/tags#make) .

Para instalar utilize os comandos abaixo na ordem:
{% highlight sh %}
git clone --depth=1 https://github.com/vlang/v
cd v
make
rm -rf .git*
cd ..
sudo mv v/ /opt
cd /opt/v/
sudo ./v symlink
{% endhighlight %}

Depois você já pode testar a Vlang:
{% highlight sh %}
v version
{% endhighlight %}
> Possível e similar saída: `V 0.2.4 d826317` .

---

# Olá, Vlang!
Vamos testar um [Hello, World!](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html) . Crie um arquivo de extensão `.v`, ex.: `nvim hello.v` e insira esse código:
{% highlight vlang %}
fn main() {
	println('Olá, Vlang!')
}
{% endhighlight %}

Agora para executar, rode:
{% highlight sh %}
v run hello.v
{% endhighlight %}
> Provável saída: `Olá, Vlang!` .

Você também pode compilar e rodar após gerar o binário:
{% highlight sh %}
v hello.v
./hello
{% endhighlight %}

---

# Customizando seu IDE/Editor com Highlight para Vlang
+ Para o [Vim](https://terminalroot.com.br/vim) ou [Neovim](https://terminalroot.com.br/tags#neovim) instale [esse plugin](https://github.com/ollykel/v-vim);
+ Para [VSCode](https://terminalroot.com.br/tags#vscode) use [essa](https://marketplace.visualstudio.com/items?itemName=vlanguage.vscode-vlang) extensão;
+ E também para [Emacs](https://github.com/damon-kwok/v-mode) e para [Sublime](https://github.com/elliotchance/vlang-sublime).


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

# Traduzindo de acordo com outras linguagens
Se você está acostumado com [C++](https://terminalroot.com.br/cpp) essa mini tabela mostra operações em Vlang similar à C++:

| C++ | Vlang |
|---|---|
| `std::vector s;` | `mut s := []` |
| `s.push_back("V is ");` | `s << 'V is '` |
| `s.push_back("awesome");` | `s << 'awesome'` |
| `std::cout << s.size();` | `println(s.len)` |

Você pode notar que Vlang é muito parecida com [Go/Golang](https://terminalroot.com.br/tags#go) . Veja [essa tabela](https://github.com/vlang/v/wiki/V-for-Go-developers) comparativa.

---

Para mais informações e documentação consulte os links abaixo:
{% highlight sh %}
v help
{% endhighlight %}
+ <https://vlang.io/>
+ <https://github.com/vlang/v>
+ <https://github.com/vlang/v/blob/master/doc/docs.md>
+ <https://github.com/vlang/v/wiki>


