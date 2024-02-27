---
layout: post
title: "Conheça a linguagem de programação: Vala"
date: 2024-02-27 12:13:18
image: '/assets/img/gnome/vala.jpg'
description: 'Muito veloz e especialista para construir interfaces gráficas!'
icon: 'ion:terminal-sharp'
iconname: 'Vala'
tags:
- gnome
- vala
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**Vala** é uma [linguagem de programação](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html) orientada a objetos, com sintaxe inspirada em [C#](https://terminalroot.com.br/tags#csharp). 

Com um compilador auto-hospedado que gera código em [C](https://terminalroot.com.br/c) que usa *GObject*, foi criada para ser usada no desenvolvimento de aplicações para [GNOME](https://terminalroot.com.br/tags#gnome), e posteriormente foi adotada pelo Elementary OS.

Em um dos vídeos que fizemos os [Testes de Desempenho com Linguagens de Programação](https://github.com/terroo/langs-test-loop), Vala ficou na **1º Colocação** como a mais rápida no [Round 2](https://terminalroot.com.br/2022/05/testei-o-desempenho-de-10-linguagens-de-programacao-com-ranking-parte-2.html) e na [3º Colocação no ranking final](https://terminalroot.com.br/2023/01/testei-o-desempenho-de-10-linguagens-de-programacao-ranking-final.html) perdendo somente para [C++](https://terminalroot.com.br/tags#cpp) e [C](https://terminalroot.com.br/c), mas ficou na frente de linguagens como: [Perl](https://terminalroot.com.br/tags#perl) e [Rust](https://terminalroot.com.br/tags#rust).

---

# Instalação
Para instalar a linguagem de programação Vala você pode usar o gerenciador de pacotes do seu sistema operacional. Exemplo no [Ubuntu](https://terminalroot.com.br/tags#ubuntu):

{% highlight bash %}
sudo apt install valac
{% endhighlight %}
> A letra **c** no final é referente ao compilador!


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

# Criando um `Hello, World!` em Vala
Após devidamente instalado o compilador Vala, você pode testar um *Hello, World!* com o código abaixo:

Crie um arquivo de nome(exemplo): `main.vala`
> Note que a extensão do arquivo é `.vala`

E inclua o código abaixo:
{% highlight csharp %}
void main () {
    print ("Hello, World!\n");
}
{% endhighlight %}

Para compilar use o comando `valac`, mas pode ser que no seus sistema só esteja disponível esse compilador junto com a versão, exemplo: `valac-0.56`. Logo, esse seria o comando para você compilar:

{% highlight bash %}
valac-0.56 main.vala
{% endhighlight %}
> Caso seu sistema haja outra versão, digite `valac` e depois pressione a tecla TAB para o auto-complete do seu terminal mostrar a versão disponível.

Automaticamente ele irá compilar o binário: `main`, então para rodar basta usar um `./`:
{% highlight bash %}
./main
{% endhighlight %}

---

Para mais informações sobre Vala acesse o [site oficial](https://vala.dev/).

