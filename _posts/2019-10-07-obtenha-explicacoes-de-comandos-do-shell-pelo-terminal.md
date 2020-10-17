---
layout: post
title: "Obtenha Explicações de Comandos do Shell pelo Terminal"
date: 2019-10-07 11:50:03
image: '/assets/img/comandos/kdmr-cheat.jpg'
description: 'Ferramentas ainda mais completas e que estão disponíveis para ainda mais ambientes como Docker, Git e outros.'
tags:
- comandos
- shell
- cheat
---

![Obtenha Explicações de Comandos do Shell pelo Terminal](/assets/img/comandos/kdmr-cheat.jpg "Obtenha Explicações de Comandos do Shell pelo Terminal")

Além do [Explain Shell](https://terminalroot.com.br/2017/04/obtenha-explicacoes-dos-comandos-do-shell.html) e também o [Bash Snippets](https://terminalroot.com.br/2018/07/colecao-de-shell-script-bash-para-seu-linux.html) que nós já abordamos aqui. Existe algumas ferramentas ainda mais completas e que estão disponíveis para ainda mais ambientes como: [Docker](https://terminalroot.com.br/2019/08/tutorial-definitivo-de-docker-para-iniciantes-ubuntu.html), [Git](https://terminalroot.com.br/git) e entre diversos outros.

Estou me referindo ao [KMDR](https://github.com/ediardo/kmdr-cli) e alternativamente também ao [Cheat](https://github.com/cheat/cheat).

## Instalando o KMDR

O **kmdr** fornece explicações de comando para centenas de programas, incluindo git, docker, kubectl, npm, go e programas mais diretos, como os incorporados ao bash.

Para instalar você primeiramente precisa do [npm](https://www.npmjs.com/) que é o gerenciador de pacotes do [Node.js](https://terminalroot.com.br/2018/07/monitore-seu-linux-com-graficos-pelo-terminal.html) . Na sua distro você pode instalar assim:

{% highlight bash %}
emerge nodejs # Gentoo, Funtoo e similares
apt install nodejs # Debian, Ubuntu e Linux Mint
pkg install nodejs # FreeBSD
pacman -S nodejs # Arch Linux, Manjaro e similares
yum install nodejs # Red Hat, CentOS, Fedora(dnf tb)
{% endhighlight %}

O *npm* é automáticamente disponibilizado quando você instala o [Node.js](https://nodejs.org/) . Agora basta instalar o KMDR com o seguinte comando:
{% highlight bash %}
sudo npm install kmdr@latest --global
{% endhighlight %}

## Utilizando

Se você rodar o comando *puro* `kmdr` você já obterá uma *ajuda rápida* de utilização, mas a utilização básica seria mais ou menos assim:

> Suponhamos que você deseja saber o que o comando extenso: `find $HOME -type f -iname "*.txt" -exec cp {} . \;` faz e o que cada parte desse comando representa.

Então você rodaria o comando `kmdr explain` e em seguinda *colaria/digitaria* o comando, a saída seria similar a imagem abaixo:

![kmdr explain](/assets/img/comandos/kmdr-exemplo-1.png)

Caso queira mais detalhes e em português você pode traduzir as saídas com o comando [trans](https://terminalroot.com.br/2019/10/traduza-rapidamente-textos-via-linha-de-comando.html) → <https://terminalroot.com.br/2019/10/traduza-rapidamente-textos-via-linha-de-comando.html> . Exemplo abaixo:

{% highlight bash %}
kmdr | trans -b
Uso: kmdr [opções] [comando]

O cliente CLI para explicar comandos complexos do shell.

O kmdr fornece explicações de comando para centenas de programas, incluindo git, docker, kubectl, npm, go e programas mais diretos, como os incorporados ao bash.

Opções:
-v, --version gera o número da versão
-h, --help informações de uso da saída

Comandos:
Explique | e Explique um comando shell
{% endhighlight %}

Se quiser testar online clique nesse link → <http://demo.kmdr.sh/>

<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Informat -->
<ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-2838251107855362"
     data-ad-slot="2327980059"
     data-ad-format="auto"
     data-full-width-responsive="true"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

## Cheat como mais uma alternativa

Assim como o KMDR , você também pode usar o [Cheat](https://github.com/cheat/cheat), ele é instalável via [pip](https://pypi.org/project/pip/) que por sua vez também é uma ferramenta de gerenciamento de pacotes [Python](https://terminalroot.com.br/2019/10/script-basico-de-python-para-aprendizado.html) , você pode instalar o *pip* assim na sua distro:

{% highlight bash %}
emerge dev-python/pip # Gentoo, Funtoo e similares
apt install python-pip # Debian, Ubuntu e Linux Mint
pkg install python-pip # FreeBSD
pacman -S python-pip # Arch Linux, Manjaro e similares
yum install python-pip # Red Hat, CentOS, Fedora(dnf tb)
{% endhighlight %}

Após instaldo você pode instalar o Cheat com o comando:

{% highlight bash %}
sudo pip install cheat
{% endhighlight %}

> *Observação*: Tanto o *npm* quanto o *pip* podem ser ignorados o *sudo* , desde que seu sistema esteja configurado para isso, verifique as configurações de permissão do seu sistema para mais informações. Exemplo:

{% highlight bash %}
pip3 install cheat --user
{% endhighlight %}

> *Note*: que utilizei o comando `pip3` , ou seja, o pacote na sua distro pode ser: `python-pip3` ou algo do tipo.

## Utilizando o Cheat

Supondo que você deseja dicas de como extrair, compactar ... pacotes `tar` , rode assim: `cheat tar`, a saída será mais ou menos a abixo

{% highlight bash %}
marcos@gentoo ~ $ cheat tar
# To extract an uncompressed archive:
tar -xvf /path/to/foo.tar

# To create an uncompressed archive:
tar -cvf /path/to/foo.tar /path/to/foo/

# To extract a .gz archive:
tar -xzvf /path/to/foo.tgz

# To create a .gz archive:
tar -czvf /path/to/foo.tgz /path/to/foo/

# To list the content of an .gz archive:
tar -ztvf /path/to/foo.tgz

# To extract a .bz2 archive:
tar -xjvf /path/to/foo.tgz

# To create a .bz2 archive:
tar -cjvf /path/to/foo.tgz /path/to/foo/

# To extract a .tar in specified Directory:
tar -xvf /path/to/foo.tar -C /path/to/destination/

# To list the content of an .bz2 archive:
tar -jtvf /path/to/foo.tgz

# To create a .gz archive and exclude all jpg,gif,... from the tgz
tar czvf /path/to/foo.tgz --exclude=\*.{jpg,gif,png,wmv,flv,tar.gz,zip} /path/to/foo/

# To use parallel (multi-threaded) implementation of compression algorithms:
tar -z ... -> tar -Ipigz ...
tar -j ... -> tar -Ipbzip2 ...
tar -J ... -> tar -Ipixz ...
marcos@gentoo ~ $ 
{% endhighlight %}

Ou seja, é bem simples o uso, mas se quiser mais exemplos, recomendo você rodar o `cheat --help` e visitar a página do mesmo: <https://github.com/cheat/cheat>

## Dicas adicionais

Há um tempo atrás nós abordamos sobre o [Bash Snippets](https://terminalroot.com.br/2018/07/colecao-de-shell-script-bash-para-seu-linux.html) como informamos no início e o mesmo possui também um *cheat*, além de diversaaaaas outras ferramentas, para mais informações, assista o vídeo abaixo:

<iframe width="920" height="400" src="https://www.youtube.com/embed/Nm1OPSCDBpI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Links úteis:

+ <https://github.com/ediardo/kmdr-cli>
+ <http://demo.kmdr.sh/>
+ <https://github.com/cheat/cheat>
+ <https://terminalroot.com.br/2017/04/obtenha-explicacoes-dos-comandos-do-shell.html>
+ <https://terminalroot.com.br/2018/07/colecao-de-shell-script-bash-para-seu-linux.html>
+ <https://www.ostechnix.com/kmdr-display-cli-commands-explanation-in-terminal/>

E você curtiu ? Vai instalar ? Já está utilizando ? O que achou ??? Comente!

Abraços!
    


