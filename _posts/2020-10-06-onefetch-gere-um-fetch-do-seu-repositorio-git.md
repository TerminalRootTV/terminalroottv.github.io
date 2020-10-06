---
layout: post
title: "Onefetch - Gere um fetch do seu repositório Git"
date: 2020-10-06 08:19:44
image: '/assets/img/rust/aesthetic.png'
description: 'Obtenha informação do seu repositório Git via linha de comando.'
icon: 'cib:git'
iconname: 'git'
tags:
- rust
- git
- terminal
---

![Obtenha informação do seu repositório Git via linha de comando](/assets/img/rust/aesthetic.png)

**Onefetch** é uma ferramenta de informação via linha de comando que exibe informações sobre seu repositório Git diretamente em seu terminal.

Onefetch fornece ao usuário estatísticas de código e informações de projeto com recursos como detecção de licença. Onefetch mostrará a:
+ A linguagem de programação, bem como as integrantes do projeto;
+ LOC (linhas de código);
- Tamanho no disco;
- Contribuidores
- Versão;
- etc.

Você pode configurar ainda mais o Onefetch para exibir exatamente o que você deseja. Por meio do uso de parâmetros via linha de comando.

Onefetch oferece suporte a mais de 50 linguagens de programação diferentes.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# Instalação
O onefetch é escrito em [Rust](https://www.rust-lang.org/). Mas diversos sistemas operacionais já possuem em seu repositórios, são eles:
{% highlight bash %}
brew update && brew install onefetch # macOS
sudo nix-env -i onefetch # NixOS
sudo zypper install onefetch # OpenSUSE
{% endhighlight %}

Para qualquer distro [Linux](https://terminalroot.com.br/tags#linux) basta instalar o Rust via seu gerenciador de pacotes de pacotes e adicionar o [binário pré-compilado](https://github.com/o2sh/onefetch/releases) à sua variavel `$PATH`, exemplo para `/usr/local/bin` com a versão mais atual de acordo com a data da publicação desse artigo:
{% highlight bash %}
git clone https://github.com/o2sh/onefetch/releases/download/v2.4.0/onefetch-linux.tar.gz
tar zxvf onefetch-linux.tar.gz
cd onefetch-linux/
sudo mv onefetch /usr/local/bin/
{% endhighlight %}

Para [Windows](https://terminalroot.com.br/tags#windows) há um executável também disponível em [releases](https://github.com/o2sh/onefetch/releases/) e para outros sistemas, você pode construir o binário a partir do código fonte.

# Utilização
Após instalado basta entrar em um repositório [git](https://terminalroot.com.br/git/) e rodar o comando `onefetch`, exemplo para o repositório do [Wallset](https://github.com/terroo/wallset)
{% highlight bash %}
git clone  https://github.com/terroo/wallset
cd wallset
onefetch
{% endhighlight %}
![Wallset Onefetch](/assets/img/rust/wallset-onefetch.png)

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

As informações do repo são exibidas ao lado do logotipo ASCII do idioma dominante. Você pode ainda configurar o Onefetch para usar uma imagem (png, jpeg ...) nos terminais suportados com o parâmetro `-i` e indicando o endereço da imagem, exemplo:
> Lembrando que somente os [emuladores de terminais](https://terminalroot.com.br/2019/08/os-10-melhores-emuladores-de-terminal-para-seu-linux.html): [xterm](https://terminalroot.com.br/2019/08/os-10-melhores-emuladores-de-terminal-para-seu-linux.html), [mlterm](https://sourceforge.net/projects/mlterm/) e [Kitty](https://github.com/kovidgoyal/kitty/) são suportados

{% highlight bash %}
onefetch -i path/to/image.jpg
{% endhighlight %}
![Exemplo de suporte de imagem](/assets/img/rust/r.png)

---

Para mais informações consulte o [repositório do projeto](https://github.com/o2sh/onefetch/).

# Fui!
