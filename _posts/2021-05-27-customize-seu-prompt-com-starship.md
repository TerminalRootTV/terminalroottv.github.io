---
layout: post
title: "Customize seu prompt com Starship"
date: 2021-05-27 00:53:41
image: '/assets/img/rust/startship.jpg'
description: 'Minimalismo.'
icon: 'ion:terminal-sharp'
iconname: 'Shell'
tags:
- shellscript
---

![Customize seu prompt com Starship escrito em Rust](/assets/img/rust/startship.jpg)

**Starship** é um prompt minimalista, extremamente rápido e infinitamente personalizável para qualquer shell!

# Características
+ Customizável: configure todos os aspectos do seu prompt.
+ Universal: funciona em qualquer shell, em qualquer sistema operacional.
+ Inteligente: mostra informações relevantes rapidamente.
+ Rico em recursos: suporte para todas as suas ferramentas favoritas.
+ Fácil: rápido de instalar - comece a usar em minutos.

# Como instalar
Antes de qualquer coisa você precisará ter a [fonte Fira Code instalada](https://github.com/terroo/fonts). Depois basta rodar esse comando no seu terminal:
{% highlight bash %}
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
{% endhighlight %}

A saída será algo do tipo:

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


![Starship instalação](/assets/img/rust/startship-instalation.jpg)
> Perceba que foi solicitada a senha de `sudo`

Após isso, como na mesma saída da imagem acima apresenta, basta rodar o comando:
{% highlight bash %}
eval "$(starship init [NOME DO SEU SHELL])"
{% endhighlight %}

Exemplo para [ZSH](https://terminalroot.com.br/2018/02/como-instalar-e-usar-o-shell-zsh-e-o-oh-my-zsh.html):
{% highlight bash %}
eval "$(starship init zsh)"
{% endhighlight %}

Para carregar o Starship automaticamente ao abrir o shell insira no arquivo de configuração do seu shell, exemplo para o `~/.zshrc`:
{% highlight bash %}
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
{% endhighlight %}

Ele está disponível para [Bash](https://terminalroot.com.br/shell), [FISH](https://terminalroot.com.br/2018/01/fish-shell-mais-produtividade-no-seu-shell-script.html), [PowerShell](https://pt.wikipedia.org/wiki/PowerShell), Ion, TCSH e entre outros.

Caso queira configurar o prompt de acordo como deseja, veja [esse link](https://starship.rs/config/)

Abaixo um gif de exemplo do [Starship](https://starship.rs/)

![Starship GIF](/assets/img/rust/startship.gif)
