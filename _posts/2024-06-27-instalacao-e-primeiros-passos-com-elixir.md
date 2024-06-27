---
layout: post
title: "Instalação e primeiros passos com Elixir"
date: 2024-06-27 09:44:42
image: '/assets/img/programacao/elixir.jpg'
description: "🔮 Uma linguagem de programação funcional criada por um brasileiro."
icon: 'ion:terminal-sharp'
iconname: 'Elixir'
tags:
- elixir
- programacao
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**Elixir** é uma linguagem de programação funcional e concorrente, foi escrito originalmente em [Erlang](https://www.erlang.org/). 

A escolha de Erlang foi natural, dado que Elixir aproveita a robustez, a concorrência e as capacidades de distribuição que o ecossistema Erlang/OTP (Open Telecom Platform) oferece. 

Além disso, a interoperabilidade com o código Erlang é um dos principais pontos fortes do Elixir, permitindo que ele utilize a vasta biblioteca existente de módulos Erlang.


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
No Windows você pode fazer download do executável(versão 27) e instalar dando um duplo clique no arquivo:
<a href="https://github.com/elixir-lang/elixir/releases/download/v1.17.1/elixir-otp-27.exe" class="btn btn-danger btn-lg">Download elixir-otp-27.exe</a>

Ou também você pode usar o Chocolatey ou o Scoop:
{% highlight bash %}
scoop install elixir
choco install elixir
{% endhighlight %}

Para distros [GNU/Linux](https://terminalroot.com.br/tags#gnulinux), [macOS](https://terminalroot.com.br/tags#macos), [FreeBSD](https://terminalroot.com.br/tags#freebsd) e outros, use o gerenciador de pacotes do sistema. Exemplos:

{% highlight bash %}
brew install elixir # macOS
sudo apt install elixir # Ubuntu, Debian, Mint
pacman -S elixir # Arch
apk add elixir # Alpine
sudo dnf install elixir erlang # Fedora
emerge elixir # Gentoo
guix package -i elixir # GNU/Guix
xbps-install -S elixir # Void
{% endhighlight %}

---

## Utilização
### Criando um básico "*Hello, World!*"
> vim `main.exs`

{% highlight elixir %}
IO.puts("Hello, World!")
{% endhighlight %}

Para rodar:
{% highlight bash %}
elixir main.exs
{% endhighlight %}

### Criando variável
Em Elixir não existe diretamente uma "variável de imprimir" como em algumas linguagens de programação onde se define uma variável para segurar um valor de saída para impressão posterior. No entanto, é possível alcançar esse feito dependendo do contexto. Exemplo:
{% highlight elixir %}
valor = "Olá, mundo!"
IO.puts(valor)
{% endhighlight %}
> Rode: `elixir main.exs`


### Definindo e chamando função
{% highlight elixir %}
defmodule MinhaFuncao do
  def minha_funcao(parametro1, parametro2) do
    resultado = parametro1 + parametro2
    IO.puts("Resultado da soma: #{resultado}")
  end
end

MinhaFuncao.minha_funcao(3, 5)
{% endhighlight %}

---

Para mais informações sobre Elixir: livros, documentação e entre outros, consulte os links abaixo:

+ [Endereço oficial no Web](https://elixir-lang.org/)
+ [Documentação](https://elixir-lang.org/docs.html)
+ [Guia de aprendizado](https://hexdocs.pm/elixir/introduction.html)
+ [Entrevista com José Valim, criador da Liguagem de Programação Elixir](https://www.youtube.com/watch?v=KiF10RgaC5k)



