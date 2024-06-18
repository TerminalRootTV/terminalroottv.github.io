---
layout: post
title: "Cling, rode C/C++ como script"
date: 2022-02-04 10:42:43
image: '/assets/img/c/cling.jpg'
description: 'Baseado em Clang e com a estrutura do LLVM'
icon: 'ion:terminal-sharp'
iconname: 'C/C++'
tags:
- cpp
- cppdaily
- linguagemc
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Como o IntelliSense do seu [IDE/Editor](https://terminalroot.com.br/2021/12/os-32-melhores-ides-editores-de-texto-para-cpp.html) consegue saber se o código está certo sem nem compilar ? Isso é possível graças à tecnologia estilo **cling**.

**Cling** é um interpretador [C++](https://terminalroot.com.br/cpp) interativo, construído com base nas bibliotecas [LLVM](https://terminalroot.com.br/tags#llvm) e [Clang](https://terminalroot.com.br/tags#clang). Suas vantagens sobre os intérpretes padrão são que ele tem prompt de linha de comando e usa o compilador just-in-time (JIT) para compilação. Muitos dos desenvolvedores desse tipo de aplicativos de software os chamam de compiladores interativos.

Um dos principais objetivos da Cling era fornecer uma alternativa contemporânea e de alto desempenho do primeiro interpretador [C++](https://terminalroot.com.br/tags#cpp) no projeto *ROOT - CINT*. A retrocompatibilidade com o **CINT** foi a principal prioridade durante o desenvolvimento.

---

# Instalação
Basta fazer o download do script [Python](https://terminalroot.com.br/tags#python), dar permissão de execução e rodar:
{% highlight sh %}
wget https://raw.githubusercontent.com/root-project/cling/master/tools/packaging/cpt.py
chmod +x cpt.py
./cpt.py --check-requirements && ./cpt.py --create-dev-env Debug --with-workdir=./cling-build/
{% endhighlight %}
> A verdade é que esse processo de construção vai demorar muito, o **cling** é gigante! Então veja como instalar o binário abaixo.


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

Existe binário para diversos sistemas operacionais incluindo o [Linux](https://terminalroot.com.br/tags#linux) . Se você quer instalar rapidamente no [Ubuntu](https://terminalroot.com.br/tags#ubuntu), por exemplo, faça da seguinte maneira:

> De acordo com a data de publicação desse artigo essa é a versão mais recente, para outras versões e binários [veja aqui](https://root.cern.ch/download/cling/) .
{% highlight sh %}
wget https://root.cern.ch/download/cling/cling_2020-11-05_ROOT-ubuntu2004.tar.bz2
tar xvjf cling_2020-11-05_ROOT-ubuntu2004.tar.bz2
sudo mv cling_2020-11-05_ROOT-ubuntu2004/ /opt/cling
sudo ln -s /opt/cling/bin/cling /usr/local/bin/cling
{% endhighlight %}

Testando, rode:
{% highlight sh %}
cling '#include <stdio.h>' 'printf("Hello World!\n")'
{% endhighlight %}

Se quiser omitir o `stderr`, rode:
{% highlight sh %}
cling '#include <stdio.h>' 'printf("Hello World!\n")' 2>/dev/null
{% endhighlight %}

Ou ainda:
{% highlight bash %}
cling '#include <stdio.h>' 'printf("Hello World!\n")' 2>/dev/null | sed '$d'
{% endhighlight %}

Você também pode entrar num subshell rodando somente:
{% highlight sh %}
cling
{% endhighlight %}

---

Para mais dicas de utilização acesse os endereços:
+ <https://github.com/root-project/cling>
+ <https://root.cern/cling/>



