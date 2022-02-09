---
layout: post
title: "Como instalar a linguagem de programação Swift no Ubuntu"
date: 2022-02-09 08:45:29
image: '/assets/img/programacao/swift.jpg'
description: 'O Swift está para o iOS assim como o Java está para o Android.'
icon: 'ion:terminal-sharp'
iconname: 'Swift'
tags:
- macos
- programacao
- desenvolvimento
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

[Swift](https://www.swift.org/) é uma linguagem de programação compilada de propósito geral , multiparadigma , desenvolvida pela **Apple Inc.** e pela comunidade de código aberto(*somente a partir da versão 2.2*) .

Foi lançado pela primeira vez em 2014, o Swift foi desenvolvido como um substituto para a linguagem de programação anterior da Apple, Objective-C , já que Objective-C permaneceu praticamente inalterado desde o início dos anos 80 e não possuía recursos de linguagem modernos.

O desenvolvimento do Swift começou em julho de 2010 por [Chris Lattner](http://nondot.org/sabre/)(mesmo criador do [LLVM](https://terminalroot.com.br/tags#llvm) e do [clang](https://terminalroot.com.br/tags#clang)) , com a eventual colaboração de muitos outros programadores da Apple . Swift se baseou em ideias de linguagens como: Objective-C , [Rust](https://terminalroot.com.br/tags#rust) , [Haskell](https://terminalroot.com.br/tags#haskell) , [Ruby](https://terminalroot.com.br/tags#ruby) , [Python](https://terminalroot.com.br/tags#python) , C# , CLU e muitos outros .

O Swift está para o iOS assim como o [Java](https://terminalroot.com.br/tags#java) está para o Android. O compilador foi escrito em [C++](https://terminalroot.com.br/cpp) .

---

# Instalação
Todo esse procedimento funciona a partir do [Ubuntu](https://terminalroot.com.br/tags#ubuntu) 20.04, mas foi realmente testado no **Ubuntu 21.04** . Mas eu também consegui instalar com esse procedimento no [Gentoo](https://terminalroot.com.br/tags#gentoo)(somente alterando o nome dos pacotes para o *Portage*) e funcionou, ou seja, com pequenas alterações você pode tentar no seu [sistema operacional](https://terminalroot.com.br/tags#so) ou [distribuição](https://terminalroot.com.br/tags#distro) [Linux](https://terminalroot.com.br/tags#linux).

Mas se quiser para versões e procedimentos específicos, há para [macOS](https://terminalroot.com.br/tags#macos), [Windows 10](https://terminalroot.com.br/tags#windows), [CentOS{7,8}](https://terminalroot.com.br/tags#centos), Amazon Linux e versões anteriores do Ubuntu, para isso veja [essa página](https://www.swift.org/download/) de download do Swift.

#### 01. Antes de qualquer coisa instale as dependências:
{% highlight sh %}
sudo apt install binutils git gnupg2 libc6-dev libcurl4 libedit2 libgcc-9-dev libpython2.7 libsqlite3-0 libstdc++-9-dev libxml2 libz3-dev pkg-config tzdata uuid-dev zlib1g-dev
{% endhighlight %}

#### 02. Faça download do arquivo compactado:
{% highlight sh %}
wget -q https://download.swift.org/swift-5.5.2-release/ubuntu2004/swift-5.5.2-RELEASE/swift-5.5.2-RELEASE-ubuntu20.04.tar.gz
{% endhighlight %}

#### 03. Importe a chave PGP
{% highlight sh %}
gpg --keyserver hkp://keyserver.ubuntu.com \
      --recv-keys \
      '7463 A81A 4B2E EA1B 551F  FBCF D441 C977 412B 37AD' \
      '1BE1 E29A 084C B305 F397  D62A 9F59 7F4D 21A5 6D5F' \
      'A3BA FD35 56A5 9079 C068  94BD 63BC 1CFE 91D3 06C6' \
      '5E4D F843 FB06 5D7F 7E24  FBA2 EF54 30F0 71E1 B235' \
      '8513 444E 2DA3 6B7C 1659  AF4D 7638 F1FB 2B2B 08C4' \
      'A62A E125 BBBF BB96 A6E0  42EC 925C C1CC ED3D 1561' \
      '8A74 9566 2C3C D4AE 18D9  5637 FAF6 989E 1BC1 6FEA' \
      'E813 C892 820A 6FA1 3755  B268 F167 DF1A CF9C E069'
{% endhighlight %}


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

#### 04. Extraia o arquivo
{% highlight sh %}
tar zxvf swift-*
{% endhighlight %}

#### 05. Remova o arquivo compactado
{% highlight sh %}
rm swift-*.tar.gz
{% endhighlight %}

#### 06. Altere o nome do diretório para *swift* somente
{% highlight sh %}
mv swift-5.5.2-RELEASE-ubuntu20.04/ swift
{% endhighlight %}

#### 07. Mova-o para o diretório opcional
{% highlight sh %}
sudo mv swift/ /opt/
{% endhighlight %}

#### 08. Inclua a localização na sua `$PATH`
{% highlight sh %}
echo 'export PATH=/opt/swift/usr/bin:"${PATH}"' >> ~/.bashrc
{% endhighlight %}

#### 09. Torne possível acessá-lo imediatamente
{% highlight sh %}
source ~/.bashrc
exec $SHELL
{% endhighlight %}

#### 10. Verifique se está tudo certo
{% highlight sh %}
swift -version
{% endhighlight %}

#### 11. Teste um [Hello, World!](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html)
> `vim hello.swift`
{% highlight swift %}
print("Hello, World!")
{% endhighlight %}

Teste em tempo de execução:
{% highlight sh %}
swift hello.swift
{% endhighlight %}

Ou compile seu código e rode o binário:
{% highlight sh %}
swiftc hello.swift
./hello
{% endhighlight %}

---

# Links Úteis
+ <https://www.swift.org/>
+ <https://www.swift.org/download/>
+ <https://en.wikipedia.org/wiki/Swift_(programming_language)>
+ <https://github.com/apple/swift>

