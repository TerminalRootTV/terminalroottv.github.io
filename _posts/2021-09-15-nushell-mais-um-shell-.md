---
layout: post
title: "NuShell, mais um shell"
date: 2021-09-15 13:09:26
image: '/assets/img/rust/nushell.jpg'
description: 'Seu ambiente SHELL'
icon: 'ion:terminal-sharp'
iconname: 'Rust'
tags:
- shellscript
---

![NuShell - O Shell Nutella](/assets/img/rust/nushell.jpg)

O **NuShell** é um novo tipo de [shell](http://terminalroot.com.br/shell) com saídas **TUI**. Escrito com a linguagem de programação Rust é mais uma opção moderna e veloz para seu ambiente no [terminal](http://terminalroot.com.br/tags/#terminal) .

**Nu** possui um conjunto de comandos integrados. Se um comando for desconhecido, o comando irá utilizar o shell-out e executá-lo passando corretamente por `stdin`, `stdout` e `stderr`, Ferramentas como seus fluxos de trabalho diários do [git](https://terminalroot.com.br/git) e do [vim](https://terminalroot.com.br/vim) funcionarão bem.

# Instalação
Você pode usar o gerenciador de pacotes da sua [distribuição](https://terminalroot.com.br/tags#distros) [Linux](https://terminalroot.com.br/linux) ou do seu sistema operacional, ele está disponível também para [Windows](https://terminalroot.com.br/tags#windows), [macOS](https://terminalroot.com.br/tags#macos) e entre outros. Exemplos:

{% highlight sh %}
emerge app-shells/nushell # Gentoo, Funtoo,...
cave app-shells/nu # Exherbo
pacman -S nushell # Arch Linux
winget install nu # Windows
docker run -it quay.io/nushell/nu:latest # Docker
{% endhighlight %}


<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Para a lista completa de todos os sistemas e/ou distros que já possuem o NuShell nos repositórios clique [aqui](https://repology.org/project/nushell/versions)

No entanto, a forma mais eficaz com certeza é via [Cargo](https://terminalroot.com.br/2021/07/como-criei-meu-primeiro-programa-em-rust.html) que foi justamentamente assim que eu instalei:

{% highlight sh %}
cargo install nu
{% endhighlight %}


Após instalado o binário será copiado para o diretório: `$HOME/.cargo/bin/nu` . Se quiser mover para seu sistema rode:

{% highlight sh %}
sudo mv $HOME/.cargo/bin/nu /usr/local/bin
{% endhighlight %}

Para começar a utilizar o NuShell, basta rodar o comando:

{% highlight sh %}
nu
{% endhighlight %}

# Configurações e Utilização
Se você quiser que o NuShell seja seu shell padrão primeiramente inclua ele ao seus shells. Edite o arquivo: `/etc/shells` e adicione a linha do caminho do `nu`, exemplo:

{% highlight sh %}
/usr/local/bin/nu
{% endhighlight %}

Depois rode o comando:

{% highlight sh %}
chsh -s /usr/local/bin/nu
{% endhighlight %}
> Para que as alterações tenham efeito, deslogue e logue novamente.

---

Como eu havia dito as saídas do `nu` são na maioria **TUI**, veja abaixo a saída do comando [ls](https://terminalroot.com.br/2021/08/exa-uma-alternativa-ao-ls-escrita-em-rust.html) e entre outros:

![ls NuShell](https://github.com/nushell/nushell/raw/main/images/nushell-autocomplete5.gif)


O NuShell não existe arquivos de configuração estilo: `.bashrc`, `.zshrc`,... para você configurar você deve editar o arquivo:

{% highlight sh %}
$HOME/.config/nu/config.toml
{% endhighlight %}

Existem diversas possibilidades, para uma documentação completa sugiro [esse link](https://www.nushell.sh/book/configuration.html#nushell-configuration-with-config-toml).

Para mais informações consulte o site oficial e o repositório:
### Site: <https://www.nushell.sh/>
### Repositório: <https://github.com/nushell/nushell>

---

### Veja também
+ [Xonsh - Um Shell para os Amantes de Python](https://terminalroot.com.br/2019/06/xonsh-um-shell-para-os-amantes-de-python.html)
+ [Customize seu prompt com Starship escrito em Rust](https://terminalroot.com.br/2021/05/customize-seu-prompt-com-starship-escrito-em-rust.html)
+ [#Rust](https://terminalroot.com.br/tags#rust)


<!-- RETANGULO LARGO 2 -->
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
