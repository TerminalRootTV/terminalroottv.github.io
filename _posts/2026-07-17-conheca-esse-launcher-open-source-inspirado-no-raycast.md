---
layout: post
title: "Conheça esse launcher Open Source inspirado no Raycast"
date: 2026-07-17 19:16:39
image: '/assets/img/qt/vicinae.jpg'
description: "🔳 Escrito em C++ e Qt"
icon: 'ion:terminal-sharp'
iconname: 'C++/Qt'
tags:
- cpp
- qt
- gnulinux
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Se você gosta da experiência do Raycast, mas utiliza Linux, provavelmente já procurou uma alternativa realmente rápida, moderna e extensível. O **Vicinae** surgiu justamente com essa proposta.

Vicinae é um launcher escrito em [C++](https://terminalroot.com.br/tags#cpp) e [Qt](https://terminalroot.com.br/qt), oferecendo desempenho nativo, baixo consumo de recursos e compatibilidade com diversas extensões do ecossistema Raycast disponível para [GNU/Linux](https://terminalroot.com.br/tags#gnulinux).

Entre os recursos disponíveis estão:

+ Pesquisa e abertura de aplicativos
+ Histórico da área de transferência
+ Pesquisa de arquivos
+ Calculadora integrada
+ Seletor de emojis
+ Troca rápida entre janelas
+ Controle de volume
+ Pesquisa de abas do navegador
+ Expansão de textos (snippets)
+ Navegação por fontes instaladas


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
Existem várias formas de instalação.

+ AppImage

Baixe o AppImage na página de Releases do projeto:

[GitHub Releases do Vicinae](https://github.com/vicinaehq/vicinae/releases)

Depois(exemplo para `x86_64`):
{% highlight bash %}
chmod +x vicinae-vX.Y.Z.AppImage
./vicinae-vX.Y.Z.AppImage server
{% endhighlight %}

+ Caso o sistema não possua suporte ao FUSE:

{% highlight bash %}
./vicinae-vX.Y.Z.AppImage --appimage-extract
cd squashfs-root
./AppRun
{% endhighlight %}

+ Também é possível baixar o arquivo:

{% highlight bash %}
vicinae-linux-x86_64-vX.Y.Z.tar.gz
{% endhighlight %}

Depois:

{% highlight bash %}
tar -xzf vicinae-linux-x86_64-vX.Y.Z.tar.gz
{% endhighlight %}

Copie o executável para algum diretório presente no `PATH`, como:

{% highlight bash %}
~/.local/bin
{% endhighlight %}

---

## Utilizando

Depois da instalação, o primeiro passo é iniciar o serviço:

{% highlight bash %}
vicinae server
{% endhighlight %}

Caso já exista uma instância aberta:

{% highlight bash %}
vicinae server --replace
{% endhighlight %}

Depois que o servidor estiver rodando, basta utilizar o atalho configurado (ou criar um no ambiente gráfico) para abrir a interface.

Também é possível controlar o launcher via linha de comando:

{% highlight bash %}
vicinae open
{% endhighlight %}

Fechar:

{% highlight bash %}
vicinae close
{% endhighlight %}

Alternar entre aberto e fechado:

{% highlight bash %}
vicinae toggle
{% endhighlight %}

### Calculadora

Digite uma expressão:

{% highlight bash %}
125 * 48
{% endhighlight %}

ou

{% highlight bash %}
sqrt(144)
{% endhighlight %}

O resultado aparece imediatamente. Além de outros recursos como: emoji, snippets,...

---

Para mais informações acesse: [o repositório](https://github.com/vicinaehq/vicinae).


