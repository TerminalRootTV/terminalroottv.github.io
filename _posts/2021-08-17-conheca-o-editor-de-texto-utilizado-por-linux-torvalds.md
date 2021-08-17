---
layout: post
title: "Conheça o Editor de Texto utilizado por Linux Torvalds"
date: 2021-08-17 10:39:39
image: '/assets/img/editores/em.jpg'
description: 'Disponível no GitHub e em kernel.org'
icon: 'ion:terminal-sharp'
iconname: 'Editores de Texto'
tags:
- editores
---

![Conheça o Editor de Texto utilizado por Linux Torvalds](/assets/img/editores/em.jpg)

A maioria das pessoas gostam de saber o que os gênios utilizam para tentar ficar mais próximo dos mestres. Nós já publicamos um artigo no <https:news.terminalroot.com.br/> sobre o hardware do Linus Torvalds, caso você tenha interesse dá uma olhada nessa postagem: [Conheça todos os componentes do PC de Linus Torvalds](https://news.terminalroot.com.br/conheca-todos-os-componentes-do-pc-de-linus-torvalds.html).

Mas se tratando de [editor de texto](https://terminalroot.com.br/tags/#editores) Linus Torvalds utiliza algo do meio da famíla [Emacs]() mais precisamente uma versão modificada com linhas específicas(e privadas) do seu gosto. Uma versão modificada do [MicroEmacs](https://www.emacswiki.org/emacs/MicroEmacs) que ele demonimou de **uEmacs** .

# Introdução
A licença do uEmacs é **free-noncomm**, ou seja, gratuita, mas não pode utilizar para fins comerciais. Ele é chamado de uEmacs/PK , eu não sei o porque desse PK no nome, mas eu li que foi incorporado por Petri H. Kutvonen, Universidade de Helsinque, Finlândia. Talvez essa sigla PK seja as iniciais dos nomes desse cara que foi citado.

Segundo o próprio Linus Torvalds, ele decidiu modificar porque o MicroEmacs teve uma atualização e modificou algumas coisas que ele gostava da versão 3.9("O melhor MicroEmacs que já existiu" — Linus Torvalds), logo, criou sua própria versão que possui muitos dos recursos dessa versão(3.9) com mais algumas coisas adicionadas por ele.


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
O uEmacs está disponível no **GitHub** e também no **kernel.org** . Eu não sei dizer se sua distribuição possui ele no repositório, a menos que você possua um [Gentoo]() que tem praticamente tudo no repositório quando o assunto é *ferramentas para programadores*!

Logo, para instalar usando o [Portage](https://terminalroot.com.br/2020/03/10-dicas-fundamentais-para-seu-gentoo-linux.html), basta rodar o comando:
{% highlight bash %}
sudo emerge app-editors/uemacs-pk
{% endhighlight %}

Para outras distribuições você pode clonar o repositório do uEmacs e compilar, mas antes lembre-se de possuir a biblioteca de desenvolvimento do [Ncurses](https://terminalroot.com.br/ncurses). Exemplos:
{% highlight bash %}
sudo apt install ncurses-dev # Debian, Ubuntu, Mint e derivados
sudo dnf install ncurses-devel # Fedora, Red Hat e derivados
sudo pacman -S ncurses # Arch, Manjaro, ...
{% endhighlight %}

Após isso clone o repositório, pode ser:

> Via GitHub
{% highlight bash %}
git clone https://github.com/torvalds/uemacs
{% endhighlight %}

> Ou via kernel.org
{% highlight bash %}
git clone https://git.kernel.org/pub/scm/editors/uemacs/uemacs.git
{% endhighlight %}

Agora é só compilar e instalar, é tão simples que só vem com um [Makefile](https://terminalroot.com.br/2019/12/como-criar-um-makefile.html)

{% highlight bash %}
cd uemacs
make
sudo make install
{% endhighlight %}
> Observação: Se houver erro ao compilar, veja o passo adicional, senão, passe direto!


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

# Passo adicional se houver erro
Para quem entende de [termcap](https://terminalroot.com.br/shell) e de [ncurses](https://terminalroot.com.br/ncurses) sabe que haverá erro se não passarmos os parâmetros corretos para compilar.

Eu, apesar de estar usando o pacote compilado pelo Portage, tentei compilar e obtive o erro:
{% highlight bash %}
  CC       tcap.o
  LINK     em
/usr/lib/gcc/x86_64-pc-linux-gnu/9.3.0/../../../../x86_64-pc-linux-gnu/bin/ld: tcap.o: referência indefinida a símbolo "tgoto"
/usr/lib/gcc/x86_64-pc-linux-gnu/9.3.0/../../../../x86_64-pc-linux-gnu/bin/ld: /lib64/libtinfo.so.6: erro ao adicionar símbolos: DSO em falta da linha de comandos
collect2: error: ld returned 1 exit status
make: *** [Makefile:62: em] Erro 1
{% endhighlight %}

Assim que eu li o nome desse arquivo e uma palavra da [curses.h](https://linux.die.net/man/3/tgoto): `tgoto` , já sabia do que o erro se tratava e resolvi. Se você tiver esse mesmo erro, faça isso:

+ Abra o arquivo `Makefile` com seu editor
+ Edite a linha que começa com com a palavra `LIBS` que tem esse conteúdo:
{% highlight makefile %}
LIBS=-lcurses
{% endhighlight %}

E adicione o `-ltinfo`, deixando assim:
{% highlight makefile %}
LIBS=-lcurses -ltinfo
{% endhighlight %}

Eu até fiz um [pull request](https://terminalroot.com.br/2017/12/como-criar-um-pull-request-no-github.html) se ele aceitar será daqui há uns 10 anos 😃 .

E então compile de novo: `make && sudo make install`, o binário é o `em`.

# Utilização
O comando para abrir o editor sem nenhum arquivo é:
{% highlight bash %}
em
{% endhighlight %}

Para obter uma ajuda, rode `em --help`, a saída será essa:
{% highlight bash %}
Usage: em filename
   or: em [options]

      +          start at the end of file
      +<n>       start at line <n>
      -g[G]<n>   go to line <n>
      --help     display this help and exit
      --version  output version information and exit
{% endhighlight %}
> Já dá pra sentir que a parada é bem *basicona*, né?! 😃 

### Alguns comandos
Nos editor estilo Emacs não precisa de comando de inserção, é só começar a digitar que o texto já aparece no arquivo!

+ `em [nome-do-arquivo]` - Abre o arquivo indicado em [nome-do-arquivo], exemplo: `em main.cpp`;
+ **Alt + z** - Salva e sai ;
+ **Ctrl + x d**(digite rapidamente o **x** e depois **d**) - Sai sem salvar se você teclar **y** para a pergunta: `Modified buffers exist. Leave anyway (y/n)?`;

E entre diversos outros comandos que você pode consultar na [Wiki do MicroEmacs](https://www.stsci.edu/~strolger/docs/emacs_guide.html) que também servem para o uEmacs.
> Lembrando que `^X` siginifica **Ctrl + x** e `M` siginifica **Alt** .

Até mais!

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

# Referências
+ <https://github.com/torvalds/uemacs>
+ <https://git.kernel.org/pub/scm/editors/uemacs/uemacs.git/>
+ <https://en.wikipedia.org/wiki/MicroEMACS>
+ <https://wiki.michaelhan.net/UEmacs/PK>
+ <https://www.stsci.edu/~strolger/docs/emacs_guide.html>
+ <https://terminalroot.com.br/ncurses>
+ <https://www.emacswiki.org/emacs/MicroEmacs>
+ <https://linux.die.net/man/3/tgoto>
+ <https://www.gnu.org/software/termutils/manual/termcap-1.3/html_node/termcap_16.html>
